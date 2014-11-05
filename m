Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B95D165CA0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Nov 2014 10:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5AmH7X003346; Wed, 5 Nov 2014 10:48:17 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F9_v65FI4Tlf; Wed,  5 Nov 2014 10:48:16 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA5AmBDB003343
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Nov 2014 10:48:13 GMT
Message-ID: <1415184526.23396.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>
Date: Wed, 05 Nov 2014 10:48:46 +0000
In-Reply-To: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
References: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] lsb 4.1: Deal with "make clean" breakage
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
X-List-Received-Date: Wed, 05 Nov 2014 10:49:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-11-04 at 14:40 +0100, Koen Kooi wrote:
> LSB can't cope with a "make clean" so disable that
> newly enabled functionality.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-extended/lsb/lsb_4.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)

In the interests of being clear and transparent, there are issues with
the clean change and I think we need a better mechanism for controlling
this. I've a patch in progress which introduces a CLEANBROKEN variable
which can be set in recipes where "make clean" is broken.

I have a list of several other recipes with the issue and am working on
pulling together a list/patch.

Cheers,

Richard


> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index d265731..34a70d0 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -21,6 +21,12 @@ SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
>  SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
>  S = "${WORKDIR}/lsb-release-1.4"
>  
> +# 'make clean' isn't supported
> +
> +do_configure() {
> +	:
> +}
> +
>  do_install(){
>  	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
>  
> -- 
> 1.9.3
> 



