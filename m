Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C77CCFA13
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 15:12:59 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13883.1777475570913125641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 08:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=O3XP5lhs;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8a08fa355a1so181254806d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 08:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777475570; cv=none;
        d=google.com; s=arc-20240605;
        b=Y3R/WGhvXU91BuassilPbA1vQLpU+YTub0Dgl0GYxcaQprWcVRLJJ4OvFQj9vqtQia
         1hYranPewKymdJRPnDwJHQXifPGFeV6hN6M+IcKfLs6+zafYalfatroyGoAH+7t1vDyl
         AtMvZC20cQ4SN+qexksXQaXvAoYYaYg+a3fDeIICbGXj7WCEeT0Gm4Q6aTveFrBfprgJ
         gO0t/UiAv0e1ZZvgYm6RhRCZMUckpkD/y/O90k0FbbYag8AUqwtB+bnOMP0v7BA2ecNc
         ehQz7ayA+VBGPRyq4rPpk596sjbQw/1FjVSQJOukg/njU/ViDG28ngcfd4r0yMzJadX4
         RH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0gU/99YcDBTR+0RWSGqca0QOAhk+5Z7ytcauzFgaPk0=;
        fh=2OgyJC1ocBqP4ZMAeBmOH5g1q4VwpYKdvp6AnKDZOMU=;
        b=T7E+sNMo6w5mFBbqc8LnVhSqVC47hs6YNb/B82rTmSe5qwdWyISuGQK3ieyEyo1hK5
         azWTGkgMKULrtRDe4ONM810dXctjaTdUq05SR4HQc27kPpZ5wy95TQNvlIKxk+kBC3OA
         y8Agr07Q7X4Nfsg+uYNUTEg+nPz0dOAsMvu1FUmNVcmQE8yYipdgPHb1PmB/tMWNS0Xt
         qLMiXDA2tv8s2fjKSSfYujN+5aFQKz6bixGoGMLDShFJ69mKf3Z+a/yDzt0yWO+qG9Nz
         jWoY+c7+kH9DZYkv0UeMjxIxMgFTyDgYV31Le2DaD7BKoORn3xAduxnphr+j9mx3VXao
         fDAg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777475570; x=1778080370; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gU/99YcDBTR+0RWSGqca0QOAhk+5Z7ytcauzFgaPk0=;
        b=O3XP5lhsM4ZUA3pnxBKfVsdZISG12r7ZeE5A2DaX2HBtLi16V/SQ0Fap0sxKdpX+b0
         IhVRyvTwbIxCZIeOlMiaFPZzlWyY4C+lEpEqzaG67un0kGcPUXUeJ1GhBdOJkLk0i+X1
         EQIs5YTPR4arnnE+EtT6+nGWugYN3wLCUvH/ZzzRjkcswgtUlruBfsnJdicrg+LWhxDD
         ImwAalXoGWijnEmHKD/yu+G9khO8pfVHQ33r8wf/MRG70cHAs/jtbDIbPTn+lgltWkn6
         Z3AU4sKqY4IKXid5qoLbW4VmeUMdqV+Ey443SjEl1frj0ktZzUm+ySYl+X/nLZKrRNJ5
         YgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777475570; x=1778080370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gU/99YcDBTR+0RWSGqca0QOAhk+5Z7ytcauzFgaPk0=;
        b=ESe2dqKlHRbVs/6pWesdNho5HF7vIXk+hNTLXSCoAkTj4MhbZxCjZEhV8DhxBkaiiG
         0HfL9+/pYKRrKmTfe3nd+ji5YQ6bLJnWKbbFVVQYJBLiZ1mShzVY6ObqzMiSo0ryQNQo
         2+mG8azJrd+aeJqTTaaX2mNYb2Laz4VsLN0K+SBI+OMkOdptKuxtA5gT+N5l0d2PqxfD
         PXzxAWW0NW7apm7gIRNK8RW+x+lUsq7sj+uvWvoIAuH7sK8colVxAxMCMv9iXYBoijsD
         bLQK+42yZhgkNg2MNNJCD3mZ/EThvAs2RGbKbONmWyEuGUQknv25ksk1Jy7/iw8c41Aw
         nFPg==
X-Gm-Message-State: AOJu0YyW1zhAmKjis+eSmGB3DecXR3wXHDpCWSku31e7A5YGbZ7sX/kV
	qVSfP46807Q2R35rOfhXr7W8Q00LXlTkanNc+K0gDHoW7WWTdF3VA58IxVN4wZ97bi7L9EDPnS9
	k+223SpXbY0oR3xGA4xC55CtxQv7EzRU=
X-Gm-Gg: AeBDiev+DHSEot+VjZh0HFsfbdeDDEYNygWRP4obIRN/mkkOKUP1fXn/6g95wUA1puo
	JENMzSAXkKt+yJx5SIBuIkcX5sar6zN/YHbh876M/vgqlaDe38JrM7kEkEnUbTXUk7XthdKwgyr
	xZlwBtLmw81ohhsuYn63WVvoXO1AUL+BSqlGPpd0E7EUF1l/gwMz0SUupNKSRHumykrhP1TNlDl
	0rrr5yNBx3SxPVhy+4JOOZAQFt4H30210GuUqDYly3oDkqFmOyskcPHf3Y6+dxpq2AC2ioWlzCu
	7/8KZFQZX8njppbGYkM76mp/Yt7SfI1OTPE3jrLHHqxO+rxqWf12
X-Received: by 2002:a05:6214:5781:b0:89c:bcbd:c26e with SMTP id
 6a1803df08f44-8b3e31bbe14mr120938196d6.25.1777475569721; Wed, 29 Apr 2026
 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20260429145136.618168-1-dario.binacchi@amarulasolutions.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Apr 2026 17:12:37 +0200
X-Gm-Features: AVHnY4LvwXih_u-QaX78BtcGTNj6DlOOn5pcyiqRax4vpnjPO9oFjboPYWg0Mw8
Message-ID: <CANNYZj_G3qnevyKhBYzqm=uSTf5T6vGtJPH0AgW5eDBZKTBRUg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libfwumdata: add new recipe
To: dario.binacchi@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org, 
	linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 15:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236111

This should probably go to meta-oe? Oe-core carries essential packages
and toolchains and this doesn't seem like it meets the criteria.

Alex

On Wed, 29 Apr 2026 at 17:05, Dario Binacchi via
lists.openembedded.org
<dario.binacchi=amarulasolutions.com@lists.openembedded.org> wrote:
>
> libfwumdata is a lightweight C library for parsing, validating (CRC32),
> and manipulating Firmware Update (FWU) metadata, allowing tools such as
> RAUC or SWUpdate, and in general any application, to modify the boot
> bank selection.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb | 22 ++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
>
> diff --git a/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> new file mode 100644
> index 000000000000..838b4983c21d
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/libfwumdata_0.1.0.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Library to access Firmware Update (FWU) metadata"
> +
> +DESCRIPTION = "This package contains a library to read and modify FWU \
> +metadata. It provides a minimal API to allow userspace applications, such as \
> +SWUpdate, RAUC or any other OTA update manager, to modify the boot bank \
> +selection."
> +
> +HOMEPAGE = "https://github.com/passgat/libfwumdata"
> +LICENSE = "LGPL-2.1-or-later"
> +LIC_FILES_CHKSUM = "file://LICENSES/LGPL-2.1-or-later.txt;md5=4fbd65380cdd255951079008b364516c"
> +SECTION = "libs"
> +
> +SRC_URI = "git://github.com/passgat/libfwumdata;protocol=https;branch=master"
> +SRCREV = "c6e235d3cf0467211ca6946bd10a2c8bdc0d5053"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake lib_package
> +
> +DEPENDS = "zlib"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236110): https://lists.openembedded.org/g/openembedded-core/message/236110
> Mute This Topic: https://lists.openembedded.org/mt/119065936/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

