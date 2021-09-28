Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Subject: Re: [meta-security][PATCH] clamav: Set clamav:clamav ownership on /var/lib/clamav in do_install
References: <20210926050321.314479-1-zboszor@pr.hu>
 <20210926122553.387448-1-zboszor@pr.hu>
 <20210926122553.387448-2-zboszor@pr.hu>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <2eca1502-5de6-0627-342d-36210bdf1d6e@gmail.com>
Date: Tue, 28 Sep 2021 16:30:28 -0700
MIME-Version: 1.0
In-Reply-To: <20210926122553.387448-2-zboszor@pr.hu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-id: <openembedded-core.lists.openembedded.org>
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@pr.hu>, yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>

merged.


On 9/26/21 5:25 AM, Zoltán Böszörményi wrote:
> From: Zoltán Böszörményi <zboszor@gmail.com>
>
> Also, rearrange the runtime-dependencies a little so
> clamav-freshclam is installed later than clamav.
>
> The issue is that clamav-freshclam ships /var/lib/clamav
> and the main clamav package uses chown in pkg_postinst to set
> the ownership of this directory. But pkg_postinst is not
> marked as "ontarget" so this chown only took effect when
> upgrading or reinstalling the package.
>
> So when clamav is part of an OS image out of the box, freshclamd
> cannot populate this directory since it's running under the clamav
> user.
>
> Fix this by creating /var/lib/clamav with the proper ownership
> in do_install and rearrange runtime-dependencies, so clamav-freshclam
> RDEPENDS on clamav and clamav relaxes its runtime-dependency into
> RRECOMMENDS so clamav-freshclam is installed later than clamav,
> avoiding these warnings:
>
>   Installing       : clamav-freshclam-...            487/1954
> warning: user clamav does not exist - using root
> warning: group clamav does not exist - using root
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>  recipes-scanners/clamav/clamav_0.104.0.bb | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-scanners/clamav/clamav_0.104.0.bb b/recipes-scanners/clamav/clamav_0.104.0.bb
> index 0d3a678..25123dc 100644
> --- a/recipes-scanners/clamav/clamav_0.104.0.bb
> +++ b/recipes-scanners/clamav/clamav_0.104.0.bb
> @@ -54,7 +54,7 @@ export OECMAKE_C_FLAGS += " -I${STAGING_INCDIR} -L ${RECIPE_SYSROOT}${nonarch_li
>  
>  do_install:append () {
>      install -d ${D}/${sysconfdir}
> -    install -d ${D}/${localstatedir}/lib/clamav
> +    install -d -o ${CLAMAV_UID} -g ${CLAMAV_GID} ${D}/${localstatedir}/lib/clamav
>      install -d ${D}${sysconfdir}/clamav ${D}${sysconfdir}/default/volatiles
>  
>      install -m 644 ${WORKDIR}/clamd.conf ${D}/${prefix}/${sysconfdir}
> @@ -83,7 +83,6 @@ pkg_postinst:${PN} () {
>          elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>              ${sysconfdir}/init.d/populate-volatile.sh update
>          fi
> -        chown -R ${CLAMAV_UID}:${CLAMAV_GID} ${localstatedir}/lib/clamav
>      fi
>  }
>  
> @@ -149,5 +148,7 @@ SYSTEMD_PACKAGES  = "${PN}-daemon ${PN}-freshclam"
>  SYSTEMD_SERVICE:${PN}-daemon = "clamav-daemon.service"
>  SYSTEMD_SERVICE:${PN}-freshclam = "clamav-freshclam.service"
>  
> -RDEPENDS:${PN} = "openssl ncurses-libncurses libxml2 libbz2 ncurses-libtinfo curl libpcre2 clamav-freshclam clamav-libclamav"
> -RDEPENDS:${PN}-daemon = "clamav"
> +RDEPENDS:${PN} = "openssl ncurses-libncurses libxml2 libbz2 ncurses-libtinfo curl libpcre2 clamav-libclamav"
> +RRECOMMENDS:${PN} = "clamav-freshclam"
> +RDEPENDS:${PN}-freshclam = "clamav"
> +RDEPENDS:${PN}-daemon = "clamav clamav-freshclam"

