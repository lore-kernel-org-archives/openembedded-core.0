Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3587C54EFC
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 12:50:50 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29945.1785156648522930694
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 05:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DA2WNxBd;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1923129b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 05:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785156648; cv=none;
        d=google.com; s=arc-20260327;
        b=A4Z2hXgHbyiZPyrMVQnfildA7xz7pjKTpX1l3hx9v7M2DqND3TPabyt47JylAFMDKU
         PkyrTVIjuV8OYmNw1TyqRMsqarOb3L1xA2qcVYX/8/O69mKiQDbja25Keq+KMJN2JAgp
         RtLW9nCgBOVd9VPIePTCO8mJr6O2eN/OXXXeUNxrgvKV7SBXZ7gNjh7nnAmbpwheZr6+
         6sFnfaNxfFQZwvwLMAYP8/ve6ybfRARdHwpMIllVNd1rXOO08hW3ZIQLZK84tAv8JKH6
         vQACNpPA4LJY1DMR+A/V9fOspLBasSsbT2Dkq571vEA6aX7POY+5t/n8TeUnQJFMoEMg
         ZmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O45iZEEbszyKQXN0q+rJYvc25r9Aum03RVHgyH470OQ=;
        fh=CX5ioTUqqyrYNft53JHlvKeYk3PL8ts2mEH54m4wsxg=;
        b=mIWbTlfShDX18VEViDQe1ugSMbMxJqxx/xuKLHfi8HoJtltHdjTHo1kK3mu4pJaKSc
         rHbI5O5XCdd4ZJOojeTWojAsXsVjeMYIB1+RnclXXopc1S4hfx8Vz9ySAvOkqr8d2Hv+
         xQTfYMLYcW2t2GxC4q9Sh9G4Ytf2j+B7EP4BiPh2iP6qL0LIUZEze6JjxxFlkaQJARZL
         0CJOEeuju/xt25j1NvEfprHqckkEMUumPWyb5UJN8czl0j9T7sK32BN839iF29I76wnT
         dFH3EJPCS//Sjo/mh4fa+AeeL7yibJvO474ex2Wz+Rd/VQgAWv+LnhZDRGNVdxcrYA16
         lHkQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785156648; x=1785761448; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O45iZEEbszyKQXN0q+rJYvc25r9Aum03RVHgyH470OQ=;
        b=DA2WNxBd8K5CnXj59RPMV999jhQOdbcYtLiKLKAHrGO+MNKwFBsw2qmre8cEAR+utb
         5/Yaf2OWja0pXxpcJAfQy32BB52JvxEGhmjjn4FZUBXBlCrN6tgJfgLxYha62pg6lKT+
         35LkUh4Ir29AtFOFBc/tCrTpPXqb83IEL9ELrh6Md5CJRdPruPZouxBMrdMx4vuw5B6a
         b5mRWoaH6XLWJrzP+z6lHtcA1O8/EiZXk/yoediZ8vjgap0znULegOPlwcqtUx5Cqvtq
         A+f7P6N8WzmtKJDf8Q5eq+wbEI4GgxyJ1wJ+tOKgImEZIYzcVYQdpXSfA2SJ2ylxGn0U
         Wxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785156648; x=1785761448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O45iZEEbszyKQXN0q+rJYvc25r9Aum03RVHgyH470OQ=;
        b=qJLSFqSof5tQI/F8PwspneFFzM0jw869zmLLg/kw0Z0OjpW8p2I5Z0rYPVkugE0BWa
         Oz5F9MIV+q+VzoDX4D3rMr1Uc+bvDZDWnAFr6bs8Am3L75lIWZPpbjpjPv5Xy2Vgo5Vz
         QpWSckK2byZDqeQWerUGk+c/SVRcamFUacy2kn2EcxBbYq37inq21ZGGIRNATucmM6Is
         ToqobNNdmbEBKH11B/qZ3hiTDgCvM5ZrexAyeNCGzDmXDDwQ5/NTxK+Ioea5NuDJS+HM
         aogOWpKWSj/ad6LJKDiGZil6EcTWvHYGPjzKeHe9mTzzTuG6EkihlX+EXi2zpCLJvKN1
         bSHg==
X-Forwarded-Encrypted: i=1; AHgh+Rqe7cGuIl4smCL6VBZt8BpZ/eJ9xreI0YWKVPHgZVzGAy+K73ej+pD2TTcQX2BNb5rzMlUGniTk/ujsQ3FOiDBrSQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxEz8Gk2r30+aZtzBLn6OSFPte9l19bdZDsQKJYk6UTF22mAwsq
	LXN6TGw8XdL8ahHXmkIV6muUYrvRehebpn0GtHX7gf/l0bTH2uDDY3IOu5eA+g1+g5pY0n9fR5Y
	PWpefirEusIhzeZ6ZOtXwMJQ7Xt6si6c=
X-Gm-Gg: AR+sD12wAqv4ehc+nTeH86ngUyfu+g3yAL+3Ou1ykb9BzlHU+T81CmsLmxqF/jwwmIE
	ZX6pJX0MMWUkmi1/7HPsk68oTzj5zM6yI2UzgRHgUf5VpqtmgmEjKBI4wDr7z9TsP4j6+etcD7S
	cmyRP2KJJSBgKuwNpvNwkSnZTzzsHsw3F0X9TMyGvT938rute3FS39LFRj+KyT5V8ELUN1XN7QI
	OZ8E/5z/lbd1SGBS5HwH2o4MV21qv9Ra26v5txVJdvyNa/KjvUKbHey4gLzcrNYAKxQjB2ni4zH
	HWe6f9K4PsyvCu+oavfmZXIyLmvrhSklo+otN1ks2zQ9mGZDxupAOSvepRurPHLf0EBuOfufDB0
	piFA/H88TkNGjb7E=
X-Received: by 2002:a05:6a00:4395:b0:848:3e03:bfdf with SMTP id
 d2e1a72fcca58-84e59564a42mr6742860b3a.46.1785156647790; Mon, 27 Jul 2026
 05:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260727100926.3137215-1-f.pflug@pengutronix.de> <b2fc660395cb8abbd8c037615a30f87eef3dbbcb.camel@pbarker.dev>
In-Reply-To: <b2fc660395cb8abbd8c037615a30f87eef3dbbcb.camel@pbarker.dev>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 27 Jul 2026 08:50:35 -0400
X-Gm-Features: AUfX_mw9MoxG_bJ5glp0diFeNZvWtWeLlCDzcxMtO79tco_hWpCFFa9NWFed530
Message-ID: <CADkTA4POzkSU8eewLfYfPL4skrn=0ednQ5XxpK4JbtzMRy2K+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: add watchdog device
To: paul@pbarker.dev
Cc: Fabian Pflug <f.pflug@pengutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 12:50:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242097

On Mon, Jul 27, 2026 at 8:45=E2=80=AFAM Paul Barker via lists.openembedded.=
org
<paul=3Dpbarker.dev@lists.openembedded.org> wrote:
>
> On Mon, 2026-07-27 at 12:08 +0200, Fabian Pflug wrote:
> > Some systems may have multiple watchdogs and want systemd to manage a
> > different one. This patch allows to set the WatchdogDevice setting in
> > system.conf
> >
> > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > ---
> >  meta/recipes-core/systemd/systemd_259.5.bb | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-=
core/systemd/systemd_259.5.bb
> > index f3ec0edae7..8cb523a330 100644
> > --- a/meta/recipes-core/systemd/systemd_259.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_259.5.bb
> > @@ -253,6 +253,11 @@ WATCHDOG_TIMEOUT ??=3D "60"
> >  # and the watchdog is enabled. (defaults is no hardware watchdog use)
> >  WATCHDOG_RUNTIME_SEC ??=3D ""
> >
> > +# If a different device, other then /dev/watchdog0 should be used, set
> > +# WATCHDOG_DEVICE_PATH to the full path to the watchdog device.
> > +# (Will set the WatchdogDevice=3D option in /etc/systemd/system.conf)
> > +WATCHDOG_DEVICE_PATH ??=3D ""
> > +
> >  do_install() {
> >       meson_do_install
> >
> > @@ -368,6 +373,11 @@ do_install() {
> >                       ${D}/${sysconfdir}/systemd/system.conf
> >       fi
> >
> > +     if [ -n "${WATCHDOG_DEVICE_PATH}" ]; then
> > +             sed -i -e 's|#WatchdogDevice=3D|WatchdogDevice=3D${WATCHD=
OG_DEVICE_PATH}|' \
> > +                     ${D}/${sysconfdir}/systemd/system.conf
> > +     fi
> > +
> >       # Actively disable Predictable Network Interface Names
> >       if ! ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', '=
false', d)}; then
> >               sed -i 's/^NamePolicy=3D.*/NamePolicy=3D/;s/^AlternativeN=
amesPolicy=3D.*/AlternativeNamesPolicy=3D/' ${D}${nonarch_libdir}/systemd/n=
etwork/99-default.link
>
> Hi Fabian,
>
> I'm not sure we need a new variable for this. If I understand correctly
> you can install a drop-in file in ${sysconfdir}/systemd/system.conf.d to
> set WatchdogDevice. That can easily be done from a bbappend or a new
> recipe without needing any changes in OE-core.

+1 on the suggestion.

That was the first thing that came to mind when I read the patch as well.

Bruce

>
> Thanks,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#242095): https://lists.openembedded.org/g/openembedde=
d-core/message/242095
> Mute This Topic: https://lists.openembedded.org/mt/120464520/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

