Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A30ED6207C
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 17:26:31 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web10.27207.1732037186057801207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 09:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bwQ0+AKO;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: danismostlikely@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-514bb6953f4so562544e0c.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 09:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732037185; x=1732641985; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8MtGxEh3LtoXm36ThrnLEQBhurdfCDzl0izCV3DrP4=;
        b=bwQ0+AKOz0U9P2JK/mjbfiiNiSCBJ/vs0X+dOzFqBqu7VH5tJcGPG6Sj1qvgyKbGgs
         TKp5v8zSXQZN0KD0gK6ImwkFnNuE6IhTtlXXGJ9L32xa+0IcUTREy6RMj+yXlxB1kPjU
         /bkaIH7DP3JoMBPFOPji06Zp9TBfa/3jJ8XYRPisGdvaLdy56DJ8rVh9imiL+PxZPzs8
         db+pGtmXUSVtjRRvOljxmjrEGQuj1qFT3izykzrzggyxHC52M5srR5O75pWGFwdCyvIV
         4zloHjmNy86kYcu48z32yZY7Xq34IY0f1QoP7rchRwUxwx7ZTGWJWkEn1Jh1DmU1yvh2
         ZyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732037185; x=1732641985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8MtGxEh3LtoXm36ThrnLEQBhurdfCDzl0izCV3DrP4=;
        b=RwyQWwAzZuIyBtpng4eaQL7l7VhfQqO4Yp662ikyA/tGbss/SjlMofa2KFDJeZU4IS
         w8oiGuEcrj0ejCWs0KdKc0s3Bd0T7GBPLDWNRjhmVDvlnGx+xZTG9/QRoVcxxtQC27O9
         SeZHyj4h1n8uZxJXv3QLz/icxK76DB8hYjJk4szRj7fD2RFWYLzkYfwc59k9iSSgxnp8
         b5ng4+17AYhXjVBB6tMeYatnEMIbic/V3qRPDe+aQ5iNsBLar3+s4FrxRUTYpFfPY9h7
         A5e4eW5xsl+DEPfSYf3lDlnn1u5svMvyxno5hJq0JlY/iFsZFLP9PIrS7ScLmJVPHjus
         c8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9TKvca3RRc7+Guxgau/crO7NGnDZ6a0vQjAZQ0s1Rvhs+FJpZLqHQfpwzaZqOgMt5YjZyPMLSmM7xZjslgCYQUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyTwUA1HoHQYF9NAqH6DhqEsrgYAceP5UTzSdRavPm5u9zVuE3B
	AZZ5aHh9+F5o72Eg/GEbnWz5BOWE9gJK1+LeO6KDyWgF5wvaANaaW+PT+OiY+344AA38wgm20gp
	x3N2qbv4Dui/6VEL4q0uT92UypJQ+1Aw3
X-Google-Smtp-Source: AGHT+IGp1NKIYr0QZ7A/Izio+rk8N048/jFdz9suZ0nMx1ETOHUsrAFLRFsCvrvUFbShQ/0p6/FHWFLXp5342e6VTZA=
X-Received: by 2002:a05:6122:1d09:b0:50c:4efb:835a with SMTP id
 71dfb90a1353d-5147853ff36mr16260091e0c.1.1732037185007; Tue, 19 Nov 2024
 09:26:25 -0800 (PST)
MIME-Version: 1.0
References: <20241112192214.1644312-1-gael.portay+rtone@gmail.com>
 <CANNYZj-TUJahfs4GLfjtcLVJRBOxx4Mf93X8b_9GAu_iToUdgA@mail.gmail.com> <D5LF0PDI4CHU.2UIPB51BV8TJI@gmail.com>
In-Reply-To: <D5LF0PDI4CHU.2UIPB51BV8TJI@gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 19 Nov 2024 11:26:13 -0600
Message-ID: <CACS+7ZQnXcEM=h14pJtNq1ty-w5h1dk0tdW+Q7DxpGunbQZn3A@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] systemd: set better sane time at startup
To: gael.portay@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, =?UTF-8?B?R2HDq2wgUE9SVEFZ?= <gael.portay+rtone@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>, ChenQi <Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 17:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207398

On Wed, 13 Nov 2024 at 16:48, "Ga=C3=ABl PORTAY via lists.openembedded.org
<gael.portay=3Dgmail.com@lists.openembedded.org> wrote:
>
> Alex,
>
> On Tue Nov 12, 2024 at 9:22 PM CET, Alexander Kanavin wrote:
> > I'm sorry, this was probably already covered and I'm just forgetful,
> > but why not do this in do_install?
> >
>
> It was initially performed by a rootfs post-command to mimic what does
> rootfs_update_timestamp() but for systemd. And you argued it is recipe
> specific and should not be a rootfs post-command.
>
> The idea was to create the file at image creation time in order to set a
> better date than the one hardcoded in the systemd binary (taken from the
> date of the tag IIRC).
>
> Also, playing with the variable $REPRODUCIBLE_TIMESTAMP_ROOTFS for the
> reproducible-builds (kirkstone, scarthgap).
>
> Note: Obviously, it is now the variable $SOURCE_DATE_EPOCH_FALLBACK to
> play with on the master branch.
>
> Peter suggested to move it to pkg_postinst:${PN} so the file is created
> at image creation time.

This is partly on me, for not paying enough attention to the mailing
list, but our use case for the
set-time-epoch PACKAGECONFIG (and time-epoch before it) is because we
have a requirement
that the system *always* boot with the time set to the epoch. This
change breaks that case, but
otherwise this seems like a reasonable change. How do people feel
about wrapping the pkg_postinst
append in this patch inside a PACKAGECONFIG check? Something like

pkg_postinst:${PN}:append () {
  if ${@bb.utils.contains('PACKAGECONFIG', 'set-time-epoch', 'true',
'false', d)}; then
    touch $D${libdir}/clock-epoch
  fi
}


>
> > Alex
> >
>
> Regards,
> Ga=C3=ABl
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207136): https://lists.openembedded.org/g/openembedde=
d-core/message/207136
> Mute This Topic: https://lists.openembedded.org/mt/109541328/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [da=
nismostlikely@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

