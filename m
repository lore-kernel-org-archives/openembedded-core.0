Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 77E977653B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 21:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QLjlTT007411; Sat, 26 Sep 2015 22:45:47 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id isovYVv6G03F; Sat, 26 Sep 2015 22:45:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QLjWuc007393
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 26 Sep 2015 22:45:44 +0100
Message-ID: <1443303932.19044.221.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wenzong.fan@windriver.com
Date: Sat, 26 Sep 2015 22:45:32 +0100
In-Reply-To: <1443092669-215894-1-git-send-email-wenzong.fan@windriver.com>
References: <1443092669-215894-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] curl: cleanup buildpaths from curl-config
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
X-List-Received-Date: Sat, 26 Sep 2015 21:45:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-24 at 07:04 -0400, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
> 
> * curl-config:
>   -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -> -L/usr/lib64
>   --sysroot=/path/to/tmp/sysroots/qemux86-64'  -> --sysroot=
> 
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  meta/recipes-support/curl/curl_7.44.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
> index b293303..b0cf700 100644
> --- a/meta/recipes-support/curl/curl_7.44.0.bb
> +++ b/meta/recipes-support/curl/curl_7.44.0.bb
> @@ -43,6 +43,9 @@ EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_siz
>  
>  do_install_append() {
>  	oe_multilib_header curl/curlbuild.h
> +
> +	# cleanup buildpaths from curl-config
> +	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${bindir}/curl-config
>  }

https://autobuilder.yoctoproject.org/main/builders/nightly-deb-non-deb/builds/162

Seems curl-native doesn't build since STAGING_DIR_HOST == "".

Cheers,

Richard


 




