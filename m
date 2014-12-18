Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6529F727AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 12:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBIC3FJO016930; Thu, 18 Dec 2014 12:03:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yr3WFEE3qAie; Thu, 18 Dec 2014 12:03:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBIC30gD016905
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Dec 2014 12:03:11 GMT
Message-ID: <1418904217.5106.24.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Thu, 18 Dec 2014 12:03:37 +0000
In-Reply-To: <1418900663-20985-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1418900663-20985-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1418900663-20985-3-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] pkgconfig.bblcass: remove PKG_CONFIG_SYSROOT_DIR from installed .pc files
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
X-List-Received-Date: Thu, 18 Dec 2014 12:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-12-18 at 12:04 +0100, Enrico Scholz wrote:
> Having ${PKG_CONFIG_SYSROOT_DIR} in installed .pc files is nearly
> everytime an error because it next 'pkgconfig' call will prepend
> ${PKG_CONFIG_SYSROOT_DIR} environment variable again resulting into a
> duplication and invalidation of paths.
> 
> Patch removes this string from installed .pc files.
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  meta/classes/pkgconfig.bbclass | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbclass
> index ad1f84f..459a871 100644
> --- a/meta/classes/pkgconfig.bbclass
> +++ b/meta/classes/pkgconfig.bbclass
> @@ -1,2 +1,19 @@
>  DEPENDS_prepend = "pkgconfig-native "
>  
> +PKGCONFIG_FILE_PATTERN ?= "-path '*/pkgconfig/*' -name '*.pc' -type f"
> +PKGCONFIG_FILE_PATTERN[doc] = "Options given to the 'find' utility to \
> + iterate over pkgconfig files"
> +
> +pkgconfig_mangle_pc() {
> +    if test -n '${PKG_CONFIG_SYSROOT_DIR}'; then
> +	# find .pc files, check and give out whether they contain
> +	# the sysroot dir and remove this string
> +	find '${D}' ${PKGCONFIG_FILE_PATTERN} \
> +	     -exec grep '${PKG_CONFIG_SYSROOT_DIR}' '{}' \; \
> +	     -printf "NOTE: removing PKG_CONFIG_SYSROOT_DIR from %P\n" \
> +	     -exec sed -i \
> +	               -e 's!${PKG_CONFIG_SYSROOT_DIR}!!g' \
> +	           '{}' \;
> +    fi
> +}
> +do_install[postfuncs] += "pkgconfig_mangle_pc"

We are *not* going down this route. We should fix the problematic .pc
files which are by definition broken if they're doing this, not start
mangling the .pc files.

The binconfig class is near unmaintainable due to these kinds of
problems, we have no idea which things we need to map and so on. With
pkgconfig, we used to have this madness, we got rid of most of it with
the inclusion of sysroot support in pkgconfig itself.

Cheers,

Richard



