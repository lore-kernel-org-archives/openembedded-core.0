Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF73731EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 11:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CBWUdk030079; Tue, 12 Jan 2016 11:32:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OivVkVRYwKXu; Tue, 12 Jan 2016 11:32:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0CBWP0t030076
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Jan 2016 11:32:26 GMT
Message-ID: <1452598345.28375.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Li Xin <lixin.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 11:32:25 +0000
In-Reply-To: <1452574934-2053-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1452574934-2053-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] net-tools_1.60-26.bb: Error fix
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
X-List-Received-Date: Tue, 12 Jan 2016 11:32:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-01-12 at 08:02 +0300, Li Xin wrote:
> when set PATCHTOOL = "patch" in conf/local.conf,error will occur
> in the step of do_patch.
> The error is: "quilt: command not found",so fix it.
> 
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> index 923d048..e173f54 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
> @@ -30,6 +30,7 @@ SRC_URI[patch.sha256sum] =
> "aeeeafaff68866a446f01bb639d4e0146a60af34dcd20e31a3e4
>  UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/net-tools/"
>  
>  inherit gettext
> +DEPENDS = "quilt-native"


DEPENDS works against do_configure and you need this in do_patch so
this is incorrect. You need something like:

do_patch[depends] = "quilt-native:do_populate_sysroot"

Cheers,

Richard

>  
>  # The Makefile is lame, no parallel build
>  PARALLEL_MAKE = ""
> @@ -40,7 +41,7 @@ PARALLEL_MAKE = ""
>  # up all previously applied patches in the start
>  nettools_do_patch() {
>  	cd ${S}
> -	quilt pop -a || true
> +	${STAGING_BINDIR_NATIVE}/quilt pop -a || true
>  	if [ -d ${S}/.pc-nettools ]; then
>  		rm -rf ${S}/.pc
>  		mv ${S}/.pc-nettools ${S}/.pc
> -- 
> 1.8.4.2
> 
> 
> 

