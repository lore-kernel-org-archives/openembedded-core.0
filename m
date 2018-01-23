Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1E1160125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 20:11:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g1so4204719wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 12:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=66d0moyX85tRNQstcQvEXrhzv4Xrzkn+RKsd8lv+MlI=;
	b=YiNh1qK7MAyz9rjActlL5VarUMr1NSXUbFnAnnFJ4vpgQnj6ZkVCS7mAtIClt+tGry
	3BiywdrbuubFn7TE+D2k5CVcK4WY+Dnux61+mHo7HkpdBBfkDpO8U71iWM6piDnwnCXe
	KEMdmrLAZVnSamB73o3RYxeyyYF2mzflpvCaGgLA3BsmuG1d5267TW2HGsRpUHFqWjng
	jNBUBVhJCoSBzMXiiis5W1j7pxlM0l8c9p1N5DTgX39lEnUWtzZiAmYsEzypu35PxhCD
	GPao99gXJ1DAHD/L8F0ZN2VEjDbb/Nzuk4ZrHGRJxX5h91gJ7Iqoy7PxXvPUSvA+3FpV
	hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=66d0moyX85tRNQstcQvEXrhzv4Xrzkn+RKsd8lv+MlI=;
	b=NrHwR/5SK/ejyd30eOTLg+cdepBkySuX8hNtli+vn3edT6lISTyzs80oYqRuqziSqt
	3vxU72mhiEKrrO3/dcqvz1Mw8zGgIxPZSlcCCAIyZ4AsXS0S9JzmHulBh70kaoco3mrE
	5ZxRYUCo2EfnwwWGrZouj1dNrILWtyzB+4OC3fh9QOVTPbQzu/my+f9mpdvIdSj7AyRm
	MbvuqtwXVhK2321g32crvdTsYFfDjA5p1XqexCZNJQtSMu4XIys7NSW37rRODJbrl7Fb
	CEqdHdoguvTQvBKIJrrnh/xG5y7gMxFKKsIwuNt2avlzhzyB66yVoAXeR1vD2hrkgSpd
	90vA==
X-Gm-Message-State: AKwxytckbrNxSZp+CmelBKqud1gPMfUS3suw4nmt8YaMTpPpBIgPhPxf
	aHj7YcW8nMBdlmkl17VLjjzpdOkmFNiTGkz3rBk=
X-Google-Smtp-Source: AH8x226NEbbV28rmCJcQBhdTj0qKemySz3yhfsSR7FotEo2ldJkoXF9G3DtRIpecqlfrAA5aTGwgYE/yFuKJHQ1OSnQ=
X-Received: by 10.28.114.6 with SMTP id n6mr2648116wmc.87.1516738307211; Tue,
	23 Jan 2018 12:11:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.129 with HTTP; Tue, 23 Jan 2018 12:11:46 -0800 (PST)
In-Reply-To: <20180123162136.11518-1-alex.stewart@ni.com>
References: <20180123162136.11518-1-alex.stewart@ni.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 23 Jan 2018 12:11:46 -0800
Message-ID: <CAJ86T=XJTe6KWY0ABO5daL4WH7jgRe8KOjFGdAS+FA=8O+jAtA@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Tue, 23 Jan 2018 20:11:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 8:21 AM, Alex Stewart <alex.stewart@ni.com> wrote:
> * Move the hwclock.sh initscript from busybox into its own package and
>   recipe (hwclock-init). This script is generally useful for distros
>   that get their hwclock implementation from sources other than
>   busybox (like util-linux).
>
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>   RDEPEND on hwclock-init.
>
> :util-linux/*
> * util-linux-hwclock RDEPENDS on hwclock-init for its initscript.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>  meta/recipes-core/busybox/busybox.inc              | 16 +++--
>  meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
>  meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
>  meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 ++++++++++++++++++++++
>  meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
>  meta/recipes-core/util-linux/util-linux.inc        |  1 +
>  6 files changed, 124 insertions(+), 91 deletions(-)
>  delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
>  create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
>  create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 4012f921c6..bfcc6ba31a 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -377,6 +372,13 @@ python do_package_prepend () {
>      else:
>          set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
>          set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
> +
> +    # If busybox is configured to provide a hwclock implementation, add a
> +    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
> +    # initscript.
> +    with open(d.getVar('B', expand=True) + '/.config', 'r') as fp_conf:

Typical style is to not include expand=True in calls to getVar().

> +        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
> +            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')
>  }
>
>  pkg_postinst_${PN} () {

