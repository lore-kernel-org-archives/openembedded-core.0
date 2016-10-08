Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 179856059E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Oct 2016 08:19:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u988JL5B023310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Oct 2016 01:19:21 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sat, 8 Oct 2016 01:19:20 -0700
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <d4a635a5-e37c-9ce7-bbf9-4c388e7837d5@windriver.com>
Date: Sat, 8 Oct 2016 16:18:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.234]
Subject: Re: [PATCH] guile: Remove bashisms
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
X-List-Received-Date: Sat, 08 Oct 2016 08:19:38 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Ross,

This one is the latest version for previously reviewed "[OE-core] [PATCH v2] Remove bashisms", but I forgot mentioning it.

Thanks,
Zhe

On 09/26/2016 02:51 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Remove bashisms from do_populate_sysroot task
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-devtools/guile/guile_2.0.12.bb | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb b/meta/recipes-devtools/guile/guile_2.0.12.bb
> index d2fe511..751a035 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.12.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
> @@ -87,22 +87,27 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
>  
>  guile_cross_config() {
>  	# this is only for target recipe
> -	if [ "${PN}" = "guile" ]
> -	then
> -	        # Create guile-config returning target values instead of native values
> -	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> -        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> -			> ${B}/guile-config.cross
> -	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
> +	[ "${PN}" = "${BPN}" ] || return 0
> +
> +	vars=$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
>  			-e 's:",[ \t]*": . ":' \
>  			-e 's:" *}, *\\:"):' \
>  			-e 's:^.*cachedir.*$::' \
>  			-e '/^  (/p' \
> -			< ${B}/libguile/libpath.h >> ${B}/guile-config.cross
> -	        echo '))' >> ${B}/guile-config.cross
> -	        cat ${B}/meta/guile-config >> ${B}/guile-config.cross
> -	        install ${B}/guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
> -	fi
> +			< ${B}/libguile/libpath.h)
> +
> +	# Create guile-config returning target values instead of native values
> +	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
> +	cat <<EOF >${B}/guile-config.cross
> +#!$(which ${BUILD_SYS}-guile) \\
> +--no-auto-compile -e main -s
> +!#
> +(define %guile-build-info '(
> +$vars
> +))
> +EOF
> +	cat ${B}/meta/guile-config >> ${B}/guile-config.cross
> +	install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_crossscripts}/guile-config
>  }
>  
>  # Guile needs the compiled files to be newer than the source, and it won't


