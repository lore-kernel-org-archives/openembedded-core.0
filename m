Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747BAC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 19:28:55 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.7151.1744313330063834805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 12:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apQW6O37;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c5b2472969so124268985a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744313329; x=1744918129; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qVEiK+AjGd/wDaQL/431PHajvKKRbpkhysDU1tQGkps=;
        b=apQW6O37cayBhjz8BR3KzCNP6OIfMCtixWWF3gMtdncOVXK3Go5u7yBcmMowWLZGMp
         AbXrUK5T5jLOWnwHVR0ac/xrFOtpjbAfbEEKpgemf7m142PWHpkmM7a7hkyqs0MEEgZV
         NgXVuqGEDiZxoEV9dbt0WSTulAOzQiGfDXi+fbl5oF0gfgu4PslfWR5hkOt2eqgnGypw
         ZC/j2PiW31pKTvcHA7kEjvstZ8EgEOK7Ziv+yDrmTuQPKJKPxDxwFico/PWgrhFizXbx
         lFi2GpkwRhsb4Qj+hbNexUdFy0RtFyyxmXmiDpI9BxTWT5old/uRpCeCf1ZrEqe/PBlA
         G4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744313329; x=1744918129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVEiK+AjGd/wDaQL/431PHajvKKRbpkhysDU1tQGkps=;
        b=I6vWUvvd9adIcVycwLpK6BrrFg2ghhHmj5NCVyYSPqvD1MZKZJUvskFVE49RnohuDu
         c6d861UorR6StEaFbXo5WyXMCPY0jDHIZkjvP/0zU0b7fSRhTFxghE7YWuiAjZZAKryt
         1BfriI7IupwqabZ9R2JdjUegAYfhVicCidu+7K7tUkEPuuuIo1t8rfMd28o6ehng19Ft
         s7l6FM+AdawRbA0CMb8n1WICzIzwdEoS+sM3atk4Ypx0RBiETSQHLK9p8BiM5PTfkfo/
         PGMOL7Ep73i8gaXaJyKKfsGpsmae+2E9Yrlj5EXh1GcRY3zC2i9gc2eeCrU1Mj/rY7MN
         4l9w==
X-Gm-Message-State: AOJu0Yz99JrmNhu7ga0czv78S01NP0unnhO9/47gsv3aXi9anscwMyrD
	R+P5tcMp7PPSK3sYZPff8LxlOMFv8bXLqpUlNqsvP0/3oivvIpjEGJH+DPumxyLfNzUfy0YQWl6
	qQbDgRJLBOaAw+mNZk8H+b0smoJ0=
X-Gm-Gg: ASbGncvpaVz3NQ+YbeiGA7dvB+hgkUeMppz1RcolLdmnlCdoPKu2v0uxzdqcYO7MXUq
	wvZCFwWArXYqkOldH/NuofFUa8KRraowygj9Rv6gBDkJTMvVscLJAYfmIeAdgveQKi67OWFZoqE
	DUa/gMDZ1xahTQLShTMVhwt6LiqjdgiNY8YvZkf4DPBsZ1H8occOYqs0/j
X-Google-Smtp-Source: AGHT+IFpi3V0iQFZ4GRo4PkJ2Sf9XOMw5lOcImUC5VVlnGKg3VoUTmsLnunLipoAECk5EvRBAu49Mfqn97QZ51inYUE=
X-Received: by 2002:a05:620a:3914:b0:7c5:5596:8457 with SMTP id
 af79cd13be357-7c7af20e6b1mr21825785a.57.1744313329035; Thu, 10 Apr 2025
 12:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250410192632.2818966-1-ecordonnier@snap.com> <20250410192632.2818966-2-ecordonnier@snap.com>
In-Reply-To: <20250410192632.2818966-2-ecordonnier@snap.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 10 Apr 2025 21:28:36 +0200
X-Gm-Features: ATxdqUEysPK7_aW0j9LfaY73JL4CDY0LTbrK5l3cYu20eeyVV_h7Uw1cRY42DY0
Message-ID: <CANNYZj--gFysZHiNLijg-kNCvr-xFtkjUBMVByP8aROYMz=-1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] source-highlight: re-add recipe
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 19:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214703

Unless you want to enable it by default in gdb (and the other patch
shows that is not the case), source-highlight does not have to be in
core. We have plenty of recipes in core with options that require
items from meta-oe or other layers.

Alex

On Thu, 10 Apr 2025 at 21:26, Etienne Cordonnier via
lists.openembedded.org <ecordonnier=snap.com@lists.openembedded.org>
wrote:
>
> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> source-highlight version 3.1.8 was removed in https://web.git.yoctoproject.org/poky/commit/?id=6560db9ddfd39a2715ede96430228306b00f53dd in June 2019 because the was no user left,
> however there is now a gdb PACKAGECONFIG option which uses it. Since the last release was in 2019, let's rather use the latest git version.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../source-highlight/source-highlight_git.bb  | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-support/source-highlight/source-highlight_git.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 2b47d3103c0..831494312b6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -777,6 +777,7 @@ RECIPE_MAINTAINER:pn-shutdown-desktop = "Unassigned <unassigned@yoctoproject.org
>  RECIPE_MAINTAINER:pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>  RECIPE_MAINTAINER:pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
>  RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER:pn-source-highlight = "Etienne Cordonnier <ecordonnier@snap.com>"
>  RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
>  RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
>  RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
> diff --git a/meta/recipes-support/source-highlight/source-highlight_git.bb b/meta/recipes-support/source-highlight/source-highlight_git.bb
> new file mode 100644
> index 00000000000..ad5085250cb
> --- /dev/null
> +++ b/meta/recipes-support/source-highlight/source-highlight_git.bb
> @@ -0,0 +1,36 @@
> +SUMMARY = "Syntax highlight utility"
> +DESCRIPTION = "Source-highlight converts source code to formatted text with syntax highlighting."
> +HOMEPAGE = "https://www.gnu.org/software/src-highlite/"
> +LICENSE = "GPL-3.0-only"
> +SECTION = "libs"
> +LIC_FILES_CHKSUM = "file://COPYING;;md5=ff95bfe019feaf92f524b73dd79e76eb"
> +
> +SRCREV = "894cacd0799ca60afa359a63782729dec76cbb79"
> +PV = "3.1.9+git"
> +SRC_URI = "git://git.savannah.gnu.org/git/src-highlite.git;protocol=https;branch=master"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS:append = " bison-native boost"
> +
> +DEPENDS:append:class-target = " ${PN}-native"
> +
> +EXTRA_OECONF="--with-boost-regex=boost_regex"
> +
> +BBCLASSEXTEND = "native nativesdk"
> +
> +PACKAGES += "${PN}-tools ${PN}-data"
> +
> +RDEPENDS:${PN} = "boost-regex ${PN}-data"
> +RDEPENDS:${PN}-tools = "${PN} ${PN}-data bash"
> +
> +FILES:${PN}       = "${libdir}/*${SOLIBS}"
> +FILES:${PN}-data  = "${datadir}/source-highlight"
> +FILES:${PN}-tools = "${bindir} ${sysconfdir}/bash_completion.d"
> +
> +# source-highlight is using its own binary from the build tree to make documentation
> +# let's substitute the native binary instead
> +do_configure:prepend:class-target () {
> +     sed -i -e 's,^SRCHILITEEXE = $(top_builddir).*,SRCHILITEEXE = source-highlight,' ${S}/doc/Makefile.am
> +}
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214702): https://lists.openembedded.org/g/openembedded-core/message/214702
> Mute This Topic: https://lists.openembedded.org/mt/112197845/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

