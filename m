Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C38256EAB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1CJnRqS022638
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 11:49:28 -0800 (PST)
Received: from msp-dhcp11.wrs.com (172.25.34.11) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 12 Feb 2014 11:46:32 -0800
Message-ID: <52FBCF97.6010405@windriver.com>
Date: Wed, 12 Feb 2014 13:46:31 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1392230968.git.laurentiu.palcu@intel.com>
	<cc9a8b3a006120ba793051f1a790c3cb3681c28e.1392230968.git.laurentiu.palcu@intel.com>
In-Reply-To: <cc9a8b3a006120ba793051f1a790c3cb3681c28e.1392230968.git.laurentiu.palcu@intel.com>
Subject: Re: [PATCH 1/1] lib/oe/rootfs.py: fix RPM multilib issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Feb 2014 19:49:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/12/14, 12:54 PM, Laurentiu Palcu wrote:
> For some odd reason (at least I couldn't find an explanation to this,
> yet), if a multilib version of a package is installed after the main one
> (that is: in a different smart session), the main package binaries are
> not overwritten.

For two packages with the same name, but different architectures -- the non-ELF 
files must be identical (or different file names in each package.)

The ELF files are identified by type and there is a resolution mechanism within 
RPM to determine which is the 'preferred' version.

We do NOT have the resolution mechanism set, so the first package installed 
'wins'.  So if you do two packages in two separate transactions, the first 
version installed will be kept.  If you do it in one transaction, then I believe 
it ends up being the last version [or maybe it's random due to sort order?]

There is a Yocto Project defect to configure the RPM multilib settings, but so 
far it's just sat there, as nobody has either needed it -- or cared enough to 
implement it.  The reality is installed two packages with the same /bin, /sbin 
binaries is rare these days.. it's much more useful to install the libraries.

The code you have below may turn out to be a performance improvement.. (each 
smart/rpm transaction takes setup and cleanup time, so multiple transactions are 
slower then one larger transaction.)  But it's likely not fixing the actual 
problem you have.

#       The default transaction color. This value is a set of bits to
#       determine file and dependency affinity for this arch.
#               0       uncolored (i.e. use only arch as install hint)
#               1       Elf32 permitted
#               2       Elf64 permitted
#               4       MIPS reserved
%_transaction_color     3

(4 BTW is MIPS64 - n32)

_transaction_color of 3 indicates we allow Elf32 and Elf64 to be installed..

There is a second item:

_prefer_color that is used to define which item should be installed when there 
is that ELF conflict.  The numbers above follow there as well.  By default I 
believe it sets itself to '2' when doing a single transaction installed, 
preferring Elf64.

--Mark

> This commit restores the functionality to the original one, before
> migrating to python: feed all the packages to smart, apart from attempt
> only ones which are installed separately.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   meta/lib/oe/rootfs.py |   16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b6baf77..9162e52 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -317,10 +317,18 @@ class RpmRootfs(Rootfs):
>
>           self.pm.update()
>
> -        for pkg_type in self.install_order:
> -            if pkg_type in pkgs_to_install:
> -                self.pm.install(pkgs_to_install[pkg_type],
> -                                [False, True][pkg_type == "aop"])
> +        pkgs = []
> +        pkgs_attempt = []
> +        for pkg_type in pkgs_to_install:
> +            if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
> +                pkgs_attempt = pkgs_to_install[pkg_type]
> +                continue
> +
> +            pkgs += pkgs_to_install[pkg_type]
> +
> +        self.pm.install(pkgs)
> +
> +        self.pm.install(pkgs_attempt, True)
>
>           self.pm.install_complementary()
>
>


