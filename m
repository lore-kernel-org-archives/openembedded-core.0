Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REgTM-0007MW-Ac for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 14:02:44 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EC3aMJ011416 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:03:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IIuilDG0CAHa
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:03:35 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EC3Xr0011412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 13:03:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:56:50 +0100
In-Reply-To: <8110c8b70b1778b7aa9b34a984c7073c800c1a96.1317030097.git.xiaofeng.yan@windriver.com>
References: <cover.1317030097.git.xiaofeng.yan@windriver.com>
	<8110c8b70b1778b7aa9b34a984c7073c800c1a96.1317030097.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318593418.2342.2.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] lsb: Change link of ${baselib} to lib64 for 64bits system
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
X-List-Received-Date: Fri, 14 Oct 2011 12:02:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-10-09 at 15:11 +0800, Xiaofeng Yan wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> Binaries of lsb test suite need ld-linux.so* in /lib64.
> for example:
> Target$ ./lsbcmdchk
> -sh: ./lsbcmdchk: No such file or directory
> Target$ strings lsbcmdchk | grep "ld-"
> /lib64/ld-lsb-x86-64.so.3
> 
> "lsbcmdchk" from lsb test suite is a binary program.
> A new modification to lsb_1.4.bb caused that binaries from lsb test suite can't run
> because binaries of lsb test suite need ld-linux.so* in /lib64.
> But the link is changed due to adding multilib. I changed this link again.
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-extended/lsb/lsb_1.4.bb |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb b/meta/recipes-extended/lsb/lsb_1.4.bb
> index d472012..5df08b8 100644
> --- a/meta/recipes-extended/lsb/lsb_1.4.bb
> +++ b/meta/recipes-extended/lsb/lsb_1.4.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "LSB support for Poky Linux"
>  SECTION = "console/utils"
>  HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
>  LICENSE = "GPLv2+"
> -PR = "r1"
> +PR = "r2"
>  
>  LIC_FILES_CHKSUM = "file://README;md5=12da544b1a3a5a1795a21160b49471cf"
>  
> @@ -69,7 +69,7 @@ do_install_append(){
>         install -m 0755 ${WORKDIR}/init-functions ${D}/${baselib}/lsb
>         if [ "${TARGET_ARCH}" == "x86_64" ];then
>  	       cd ${D}
> -	       ln -sf ${baselib} lib
> +	       ln -sf ${baselib} lib64
>  	       cd ${D}/${baselib}
>                 ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.2
>                 ln -sf ld-linux-x86-64.so.2 ld-lsb-x86-64.so.3
> @@ -82,7 +82,7 @@ do_install_append(){
>   
>         if [ "${TARGET_ARCH}" == "powerpc64" ];then
>    	       cd ${D}
> -	       ln -sf ${baselib} lib
> +	       ln -sf ${baselib} lib64
>                 cd ${D}/${baselib}
>                 ln -sf ld64.so.1 ld-lsb-ppc64.so.2
>                 ln -sf ld64.so.1 ld-lsb-ppc64.so.3

I'm afraid we need to add a bit more logic here. $baselib can be "lib",
"lib64" or anything else the user desires. I'd suggest we do something
like:

if [ "${baselib}" != "lib64" ]; then
	ln -sf ${baselib} lib64
fi

Cheers,

Richard



