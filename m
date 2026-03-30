Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A1B1061B09
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 14:54:41 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53528.1774882478243952895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 07:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YsxvK7B1;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso46142495e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774882476; x=1775487276; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZPl2GhC0+IN7WLqmGQ6Y+M1yq+scf5vY6KAIaeldYU=;
        b=YsxvK7B1HHJIDdfX5fFCaftm7eirTkCSGpvcZqPTtrZtAjoVuEGVkycLh7tZd+6iiY
         5ZDnFqDwFB9J8gUxksV5aFR5duSp0SJ75hbgp75wYaejmctHKJgbjQqaRot6RTl3Irms
         VnIjZ5lfBzM3hWeF4gR3wwSN1AI+3tgm3+uj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882476; x=1775487276;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZPl2GhC0+IN7WLqmGQ6Y+M1yq+scf5vY6KAIaeldYU=;
        b=GvhC8wPoRGOIONieU0rogXEowzCEl5KRqdeGfA+/q5ARf19pP/gSrZnd1WgJ+drXqZ
         3j3GkYwq16C8CkJpSRpCvLKTIrtoR/i2dnI3iOk96UBTeec3Qqh7zn1qZyXy0HBtrH+w
         VG1RB+c3Hg8RIgy4URZAxkELmNog+5xTVDjbrVi29upjEukyrNeLHlTO2ENNIZcSmty6
         pKfypfI75xI6fqCyWgbSN3Pb9i64d1mQJ+xukbnIXo7oPBMkR0M3D9GIM24+0LPH2IkV
         mQ8Ty6gj99u48ChQ4kKMOFdIa4TJgsiilOxXZXFEhKFHH7mxdezIFSglj7XbOnUbC2rM
         83BA==
X-Gm-Message-State: AOJu0YyPxmwFy3m5qIgyxldI6NpV+FeSXDf9aTqzQmrZH9XPui124Vlb
	knqD/6Ir6ArLyuWNj/QfUBKp8NSSi6vFACeT0sHLyxPO8vEe6pQ/UTIoILJ28AJ4BEs=
X-Gm-Gg: ATEYQzwuPC56/r2jxbOSlqnnXrs7YZAh6mIf08djaYqfC2syUlfJ8iGsAXWFOD6uiwo
	pWIYlCh4+CQPHS8K4NUnF8S7FLbkzx5ZFoP4WYJvlBMstXTwA/F35PhNpKrZpF0y1AydwGJMTXg
	NaDd1+f2+uz8CUpmuO/ejcYcc4z9LauSWfXkLCcWsC8UMGten16Hc9zzCJYLg7zYJVS5TECuOz9
	t1km1DrsJbcbRmFI/m8w3Gmad8lz4ENBZ6iNkjaEQp678QzuosOSKzGC/tei2alQVxp/5p36uKG
	uHk7MYczq4hNmsUoZoD5t/vMe8dd7jNsstbJKAYnqRy+K67+Z7dMQrcjy58GPZaD8icFLFwSPxj
	ogEphD7NRKt/48CdBQpvRF7YPuthyTwk/7OByKVLrKzD35c01AbvkJBVOPx6vgDYpV+NlrV+CyP
	MV42GaJZP5GW0QDyLPVsve4EE3DxxGPLAQOjGi9+bhIw7C6pmFVaSjiUoNJQgR+zFExjRnNp1P6
	367R31ekIY=
X-Received: by 2002:a05:600c:c081:b0:485:6e40:5584 with SMTP id 5b1f17b1804b1-48727d5a274mr173472875e9.6.1774882476476;
        Mon, 30 Mar 2026 07:54:36 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48730688605sm300758565e9.10.2026.03.30.07.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:54:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:54:35 +0200
Message-Id: <DHG7BSZDGA4H.2T0AID2DG8ES7@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
Subject: Re: [OE-core][scarthgap 04/11] dtc: backport fix for build with
 glibc-2.43
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
 <58ef52e9ee33c76689a57e6c39e91c00c257c43f.1774824253.git.yoann.congal@smile.fr> <DHG6XYWYS20G.3GXDCN07SKIGJ@smile.fr> <CA+chaQemR2LDxSnBQ++4hWerEzfCkLTLD_g4vq1dCstHV-16Mw@mail.gmail.com>
In-Reply-To: <CA+chaQemR2LDxSnBQ++4hWerEzfCkLTLD_g4vq1dCstHV-16Mw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 14:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234241

On Mon Mar 30, 2026 at 4:43 PM CEST, Martin Jansa wrote:
> On Mon, Mar 30, 2026 at 4:36=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>
>> On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
>> > From: Martin Jansa <martin.jansa@gmail.com>
>> >
>> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-native:
>> > https://errors.yoctoproject.org/Errors/Details/903983/
>> >
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98overla=
y_fixup_phandle=E2=80=99:
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignment di=
scards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len);
>> >       |                     ^
>> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignment di=
scards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=
=3Ddiscarded-qualifiers]
>> >   434 |                 sep =3D memchr(name, ':', fixup_len);
>> >       |                     ^
>> > cc1: all warnings being treated as errors
>> >
>> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.co=
m>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > [YC: upstream commit 28552a7b6c94060c7ab3899619ab8afb74124d02]
>> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> > ---
>>
>> Hello Martin,
>>
>> FYI, while it looked good, this patch and your whole series about glibc
>> 2.43 support:
>> * [scarthgap 04/11] dtc: backport fix for build with glibc-2.43
>> * [scarthgap 05/11] pseudo: Add fix for glibc 2.43
>> * [scarthgap 06/11] yocto-uninative: Update to 5.0 for needed patchelf u=
pdates
>> * [scarthgap 07/11] yocto-uninative: Update to 5.1 for glibc 2.43
>> * [scarthgap 08/11] elfutils: don't add -Werror to avoid discarded-quali=
fiers
>> * [scarthgap 09/11] binutils: backport patch to fix build with glibc-2.4=
3 on host
>> ... will be put on hold until I can test it: So, not until Ubuntu 26.04
>> is released and the autobuilder gain an Ubuntu 26.04 worker (most likely
>> after Wrynose release).
>
> OK, I have similar 7 patch series with additional fix for m4, gettext,
> systemd for whinlatter. Should I send it for review or put it on hold
> as well?

Hold them as well. For the same reason, I won't be able to accept them
before whinlatter EOL.

> I've built images with latest 26.04 snapshot in docker with scarthgap,
> whinlatter, wrynose for rpi - there might be more native recipes used
> for other BSPs (or included only in bitbake world), but build-wise
> these 2 series should cover most of it.

That's good to know, thanks!

> Regards,
--=20
Yoann Congal
Smile ECS


