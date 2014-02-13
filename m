Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8E8346EA03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:32:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DBWigS025935; Thu, 13 Feb 2014 11:32:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nWucCALfmYvL; Thu, 13 Feb 2014 11:32:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DBWgkx025924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 11:32:43 GMT
Message-ID: <1392291156.14081.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 13 Feb 2014 11:32:36 +0000
In-Reply-To: <cc9a8b3a006120ba793051f1a790c3cb3681c28e.1392230968.git.laurentiu.palcu@intel.com>
References: <cover.1392230968.git.laurentiu.palcu@intel.com>
	<cc9a8b3a006120ba793051f1a790c3cb3681c28e.1392230968.git.laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 13 Feb 2014 11:32:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-02-12 at 20:54 +0200, Laurentiu Palcu wrote:
> For some odd reason (at least I couldn't find an explanation to this,
> yet), if a multilib version of a package is installed after the main one
> (that is: in a different smart session), the main package binaries are
> not overwritten.
> 
> This commit restores the functionality to the original one, before
> migrating to python: feed all the packages to smart, apart from attempt
> only ones which are installed separately.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/lib/oe/rootfs.py |   16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b6baf77..9162e52 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -317,10 +317,18 @@ class RpmRootfs(Rootfs):
>  
>          self.pm.update()
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

Should this be a += ?

This might be clearer as an if: else:

> +                continue
> +
> +            pkgs += pkgs_to_install[pkg_type]
> +
> +        self.pm.install(pkgs)
> +
> +        self.pm.install(pkgs_attempt, True)
>  
>          self.pm.install_complementary()
>  



