Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q1msX-0003JK-H3
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 22:43:09 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Q1mqn-0004TK-MX from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Mar 2011 14:41:21 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Mar 2011 14:40:33 -0700
Received: from [172.30.80.248] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 21 Mar 2011 14:41:21 -0700
Message-ID: <4D87C5EA.1040602@mentor.com>
Date: Mon, 21 Mar 2011 14:40:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1300731672.git.raj.khem@gmail.com>
	<c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
In-Reply-To: <c9c4958668d457bef286c0c1e4038db23fc099c2.1300731672.git.raj.khem@gmail.com>
X-OriginalArrivalTime: 21 Mar 2011 21:40:33.0865 (UTC)
	FILETIME=[9BA5DB90:01CBE810]
Subject: Re: [PATCH 1/1] perl-native_5.12.2.bb: Fix compliation on	ubuntu 11.04-alpha
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
X-List-Received-Date: Mon, 21 Mar 2011 21:43:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2011 11:23 AM, Khem Raj wrote:
> Ubuntu has moved eglibc to /usr/lib/${arch}-linux-gnu and
> /lib/${arch}-linux-gnu so we need that to be added to glibpth in
> Configure.
>
> Currently we set LD=ld in environment for recipes inheriting native
> class. This overrides the LD settings in the Makefiles of perl and
> it tries to link by calling ld which does not work since its using
> -l<x>  on commandline and ubuntu linker seems not to look into
> the new location for these libraries. Its better to use gcc for linking
> here anyway
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../perl/files/Configure-multilib.patch            |   10 +++++++---
>   meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    4 +++-
>   2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch b/meta/recipes-devtools/perl/files/Configure-multilib.patch
> index d3948a9..b561b6a 100644
> --- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
> +++ b/meta/recipes-devtools/perl/files/Configure-multilib.patch
> @@ -1,11 +1,15 @@
> ---- perl-5.8.7/Configure.orig	2006-01-30 10:50:04.000000000 +0000
> -+++ perl-5.8.7/Configure	2006-01-30 10:51:18.000000000 +0000
> -@@ -1240,7 +1240,7 @@
> +Index: perl-5.12.2/Configure
> +===================================================================
> +--- perl-5.12.2.orig/Configure
> ++++ perl-5.12.2/Configure
> +@@ -1316,8 +1316,9 @@ loclibpth="/usr/local/lib /opt/local/lib
>    loclibpth="$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
>
>    : general looking path for locating libraries
>   -glibpth="/lib /usr/lib $xlibpth"
>   +glibpth="/lib /usr/lib /lib64 /usr/lib64 $xlibpth"
>    glibpth="$glibpth /usr/ccs/lib /usr/ucblib /usr/local/lib"
> ++test -f /usr/lib/`uname -m`-linux-gnu/libc.so&&  glibpth="/usr/lib/`uname -m`-linux-gnu $glibpth"
>    test -f /usr/shlib/libc.so&&  glibpth="/usr/shlib $glibpth"
>    test -f /shlib/libc.so&&  glibpth="/shlib $glibpth"
> + test -d /usr/lib64&&  glibpth="$glibpth /lib64 /usr/lib64 /usr/local/lib64"
> diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
> index 9af7b06..6776aed 100644
> --- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
> +++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   LICENSE = "Artistic|GPL"
>   LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
> -PR = "r7"
> +PR = "r8"
>
>   LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>                       file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
> @@ -28,6 +28,8 @@ S = "${WORKDIR}/perl-${PV}"
>
>   inherit native
>
> +export LD="${CC}"

We have CCLD for when we want to use CC as our LD (and yes, this usually 
just ends up as CC, but lets be clear please).

-- 
Tom Rini
Mentor Graphics Corporation


