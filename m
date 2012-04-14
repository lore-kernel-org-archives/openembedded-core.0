Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJ09V-0008BC-D0 for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 12:24:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EAExq1012889
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 11:14:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10599-08 for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 11:14:55 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3EAEnGN012883
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2012 11:14:50 +0100
Message-ID: <1334398490.7309.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 14 Apr 2012 11:14:50 +0100
In-Reply-To: <b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
References: <cover.1334390876.git.nitin.a.kamble@intel.com>
	<b903308f5d95b5c7987c251cbf9da62682363149.1334390876.git.nitin.a.kamble@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [v2 1/4] eglibc: fix builds on fedora 17 alpha
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Apr 2012 10:24:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-04-14 at 01:59 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> Generally distros keep perl at /sur/bin/perl
> Fedora 17 alpha also has /bin/perl
> 
> this causes eglibc build on such distros to put perl interpreter path in
> the perl scripts as /bin/perl
> 
> But we set perl location for target as /usr/bin/perl
> 
> This mismatch of perl path causes failure of rootfs image creation
> like this:
> 
> | error: Failed dependencies:
> |       /bin/perl is needed by eglibc-utils-2.13-r23+svnr15508.i586
> NOTE: package core-image-sato-1.0-r0: task do_rootfs: Failed
> ERROR: Task 8
> (/home/nitin/prj/poky.git/meta/recipes-sato/images/core-image-sato.bb,
> do_rootfs) failed with exit code '1'
> 
> This Fixes bug : [YOCTO #2286]
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-core/eglibc/eglibc-package.inc |    5 +++++
>  meta/recipes-core/eglibc/eglibc_2.13.bb     |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.15.bb     |    2 +-
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
> index 9e45fc1..d13cb35 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -76,6 +76,11 @@ do_install_append () {
>  	rm -f ${D}${sysconfdir}/localtime
>  
>  	oe_multilib_header bits/syscall.h
> +	
> +	if [ -f ${D}${bindir}/mtrace ]
> +	then
> +		sed -e "s# /bin/perl# ${bindir}/perl#" -i ${D}${bindir}/mtrace 
> +	fi
>  }

I'd recommend something like:

sed -i -e '1s,#!.*perl,#! ${bindir}/perl,' ${D}${bindir}/mtrace 

which will only match on the first line and matches .*perl rather
than /bin/perl.

Cheers,

Richard





