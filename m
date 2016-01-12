Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 817CC60745
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 04:03:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so29170688wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=apzn7dHpx4UnmtVCDs6IUUtHFqclZR4/xbxusgfHYbI=;
	b=OW6PH8RHrR+2sw0k7xjhU4YsxQRja+ZlGBQp0IJtGJ4fiyXYt2VyIgoU3WgqKItJae
	CoOKdEhO1p8fWcOFgWngBIGfEXybNwsZ/8GSbMJD92Hv4X+B0bKzgBm2uDkVlCdw3myf
	oy9CNtHEwh4EvjoVi6q8xpGv8jqQKTGiWQlheNq3SChkviV9IGMWfurzjhARQSW6KoxR
	yy6vhdvRaxtaVzu/mAKA4KpyJbFyG7LXjy2z2VNnMYP86ifDsImkg0QEb+84qZddW36K
	qQDj5ovhSu88p10UvVPVxjht6QsBd4/DewshAAAy+UeshhV9yf7eEkrtJo3/Q6vLDUa8
	z0xg==
MIME-Version: 1.0
X-Received: by 10.28.178.206 with SMTP id b197mr11227200wmf.72.1452571408873; 
	Mon, 11 Jan 2016 20:03:28 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 20:03:28 -0800 (PST)
In-Reply-To: <1452020669-24036-1-git-send-email-haris.okanovic@ni.com>
References: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
	<1452020669-24036-1-git-send-email-haris.okanovic@ni.com>
Date: Mon, 11 Jan 2016 20:03:28 -0800
Message-ID: <CAJ86T=XLn=tLvxv+aOH4=Z0ma3B7A_fuuESZYUZA=K4KKsLOfg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 12 Jan 2016 04:03:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 5, 2016 at 11:04 AM, Haris Okanovic <haris.okanovic@ni.com> wrote:
> Add INSTALL_TIMEZONE_FILE config variable to enable/disable installation
> of ${sysconfdir}/timezone (/etc/timezone) by tzdata packages. Defaults
> to "1" to maintain previous behavior.
>
> Most libc implementations can be configured to retrieve system's
> defaults timezone from /etc/localtime, and don't need a second file
> (/etc/timezone) to express this configuration. Maintaining this file is
> an unnecessary burden on sysadmins unless there's software using
> /etc/timezone directly (I.e. outside of libc). Some distributions may
> choose not to provide it.
>
> Testing: Built tzdata under default config and verified CONFFILES_tzdata
> still has both /etc/timezone and /etc/localtime and both are in the
> image. Built with INSTALL_TIMEZONE_FILE = "0" and verified /etc/timezone
> is removed from CONFFILES_tzdata and the image. Successfully installed
> package to an x64 target.
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> Reviewed-by: Brad Mouring <brad.mouring@ni.com>
> Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
> Reviewed-by: Ken Sharp <ken.sharp@ni.com>
> Reviewed-by: Ross Burton <ross.burton@intel.com>
> Natinst-ReviewBoard-ID: 121628
> ---
>  meta/recipes-extended/tzdata/tzdata_2015g.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
> index 5b2afa6..a6faa1d 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
> @@ -21,6 +21,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
>  S = "${WORKDIR}"
>
>  DEFAULT_TIMEZONE ?= "Universal"
> +INSTALL_TIMEZONE_FILE ?= "1"
>
>  TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
>           factory etcetera backward systemv \
> @@ -48,7 +49,9 @@ do_install () {
>          # Install default timezone
>          if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
>              install -d ${D}${sysconfdir}
> -            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> +            if [ "${INSTALL_TIMEZONE_FILE}" == "1" ]; then

You lose a style point for == in a shell script...

> +                echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> +            fi
>              ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
>          else
>              bberror "DEFAULT_TIMEZONE is set to an invalid value."
> @@ -205,4 +208,5 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
>                  ${datadir}/zoneinfo/iso3166.tab          \
>                  ${datadir}/zoneinfo/Etc/*"
>
> -CONFFILES_${PN} += "${sysconfdir}/timezone ${sysconfdir}/localtime"
> +CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE', True)) else "" }"
> +CONFFILES_${PN} += "${sysconfdir}/localtime"
> --
> 2.6.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

