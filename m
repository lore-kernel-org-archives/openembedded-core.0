Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E780103E2F0
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 22:56:23 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9479.1773269776012865649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 15:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MQRknAdg;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64c9c8f8783so520984d50.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:56:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773269775; cv=none;
        d=google.com; s=arc-20240605;
        b=ZrI1wsvMSBfVtk9dr4VzXg5/s3+dtXGaa5piY2q+iJqc0/XJpu462vZ28eb7t+X10R
         YfKTOd1XrvRkr1VzuqfW/UNc3AFtJYjXp8icffqJrWA7JhYtYx0dei5y0NnPpyieCxBH
         AICQDI6FlOjYLWt78FKoIS41AP7lil7kWKpx/g0iqmjzrc83kflDeUd6umUUusCBkPGT
         uYe1A+z+E8ktJFbKvpUgY54TYQByEAVDVEq1vTKdmj0TcpKAA7CLZlidiMYJZmIfkpH7
         e/uDpqIh4FTj/VmVzPtmBPmlfYn30nTx489b95bfi9vlHgJzwcx0xUNKag7eGFbG82v8
         6VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MYeBAjYPBZk2YEhkB/BxvemXPwU6dkVe8S1tcoyRPDk=;
        fh=5FeuB6Nh36J1DVYPjKP4u0QVwEi2/Jb/Hh7Dj6M+nzk=;
        b=LVu8boaQI0bmeUmhD253cB0gbceVfANJafjlYmaHtUn89fcp8Jv3m3Xnkprx0LE8Vn
         l6S8F6tpnPR0b4cgY6iDxkNuL4iAFldkGNCQlbPUA8U3nHijpPP3TUP2/WRg4qMUM+Tm
         ycXe048EOjrfS+ydlgne/oKis2J80tBGUWQ6Trh01tGCIhh3WrzFXE3s/uXx5Oxu0Chd
         8uZnboQfIC4pAenbBvtXBVRCsbhQ4buPtggZkPmm5qqmP9IaZulQIMFV3Ml9bYLilOtj
         CqNpSObJ5Q9vnhFSQ8V3PI6ibCTNgF4Adfpbih2Y/Qh/Iu7ZtjDEn0HXE08Tow8k/Ayx
         /rBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773269775; x=1773874575; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYeBAjYPBZk2YEhkB/BxvemXPwU6dkVe8S1tcoyRPDk=;
        b=MQRknAdgazNOb8sFHNOEXmjRupmPOOAKIgztWPRm5+P8seL0xgHrWTT6jx9Apk+tCw
         DSgpcb/DENpm4Be3t5YjSylzJ/IBtGblXU8Y0ROpvbomQNrBq5kmR4xJ3ZFuut9U+IUk
         OcxdoxA4C4Cu3+yYOiHxxtIhx+QvunMzje68qNYQeZFJIZ/UNTBvl5vMpzIw3J0CbOHz
         akyh9Dq+hzgcTmCrJFs8X6huf8MHmK+onJHd2vSswcsOX7voJheteVcHEcoWJR6GwpV4
         JYFb5BHuSi0asyU9j8hPgi5CwxwWu2+01uSX58Yvqoyvlni75FFZ6I8dz4KZvYEnHOsr
         Krbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773269775; x=1773874575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYeBAjYPBZk2YEhkB/BxvemXPwU6dkVe8S1tcoyRPDk=;
        b=DzebkQTKON/6ii18HYGj+sh+M+JlLRuGqS950lDRy3SX/ndHVyO8kZMQ9Y3SieuYDL
         xiaLmM4LWBL7fp948tTmiWyZLOLKHdEWIZtXPbzsnYqR9uj0HG0ct6e8DFmyTYrksP5M
         M85+usENoZu4FC5+wsJL3IWMerW+reM95PbK9o3juk9dJPa1zwKB9yCpK2MFQNltvkFy
         7IXK/qGar+UCicRYyW/mpmsj7nJ6GlHzjfs9c3MWteC3JhDjhPOWr3AcPTWPMR6ktHYm
         vagofVKhGvCfqaIV+M84kUT4NTa7YaXmbr2JaCSW88J7OM9w88iFWW9NMR8HfRz/OYMJ
         7bmA==
X-Gm-Message-State: AOJu0YxVn5ckw3KBPU6zvcquJ+C/LaVZCupYvMCrxTWx6M7Et2YMuyBT
	FZkmi8XkVyHYSVU5vqI5nKWsm4+BsunrrTwH+9C41/i21B+gTjeHICmC3ieaFsAH0MmmWz6YCb3
	iqMih9l8YRWj/EqppzILLrBBgwX8ycMk=
X-Gm-Gg: ATEYQzzJOjUo+PU6uFadlsjrmRq3KPwUMf15i7PaowT6Zo5qFN8SfnMYD89JnrNytHw
	NNE1+3i4GcdBJ9/knzOUNtSsQrKyij5190inASaiBT9qt3T7VV29pRz7z4VrQ3vf4d+ilgJuBhV
	8zMiP5mfAbLDSTi0eGJCQ2obQrP3+YjjTvmoUyCaO1+lzbdwVCxMqHgTCFWUGifV8Nn4FPjAdT7
	e1/wSSihNhr3/En+FmBuh63ilBP9ABqq11IQKwXIyUe0iMenlXVN9zxk5P5t/QcWqaYROVvWQnZ
	IKunYfkOKptKO4xBpxFUyg==
X-Received: by 2002:a05:690e:444b:b0:64c:9c1c:5f6e with SMTP id
 956f58d0204a3-64dc70ba34dmr1006323d50.5.1773269775123; Wed, 11 Mar 2026
 15:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
 <20260310184058.533343-1-JPEWhacker@gmail.com> <DH00629IS6EY.1W6LCNY88LTHL@bootlin.com>
 <CAJdd5GajmhYOAO_+5G5ou0fUMeCcRxzDo0-yYLzmzk1-PHJrNA@mail.gmail.com> <DH07CY9W3KAN.1BJBA53F4F1J5@bootlin.com>
In-Reply-To: <DH07CY9W3KAN.1BJBA53F4F1J5@bootlin.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 11 Mar 2026 16:56:03 -0600
X-Gm-Features: AaiRm522T6doh-ggfKRB_okSGTQ7ncphdo6E2KHM4-vfA4Bj-hy2zHBE1M1Pk6E
Message-ID: <CAJdd5GYDwXg00+tc=yTSzR2wnPPnLsO0HgYn6v3RJFPYwXQzfg@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 00/15] Add SPDX 3 Recipe Information
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 22:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232918

On Wed, Mar 11, 2026 at 1:33=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Wed Mar 11, 2026 at 5:39 PM CET, Joshua Watt wrote:
> > On Wed, Mar 11, 2026 at 7:55=E2=80=AFAM Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> >>
> >> On Tue Mar 10, 2026 at 7:38 PM CET, Joshua Watt via lists.openembedded=
.org wrote:
> >> > Changes the SPDX 3 output to include a "recipe" package that describ=
e
> >> > static information available at parse time (without building). This =
is
> >> > primarily useful for gathering SPDX 3 VEX information about some or =
all
> >> > recipes, enabling SPDX 3 to be used in place of cve_check.bbclass an=
d
> >> > vex.bbclass.
> >> >
> >> > Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> >> > helping work through this.
> >> >
> >> > V2: Fixes a bug where do_populate_sysroot was running when it should=
 not
> >> > be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> >> > incorrect (this is already handled by bitbake in the taskgraph, and
> >> > doesn't need to be manually removed).
> >> >
> >> > V3: Fixes a bug where meta-world-recipe-sbom was reporting a circula=
r
> >> > dependency. meta-world-recipe-sbom also no longer runs in world buil=
ds,
> >> > as there's no reason to this. Finally, fixes a bug where
> >> > NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> >> > (because do_unpack was not run).
> >> >
> >> > V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VE=
X
> >> > information is linked to binary packages, or just recipes. Defaults =
to
> >> > "0" to significantly reduce the size of the SPDX output.
> >> >
> >> > V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
> >> > does funny things with its arch which prevents it from rebuilding SP=
DX
> >> > data properly, and no SPDX data is needed for it anyway
> >> >
> >> > V6: Fixes a bug where SPDX task would not correctly re-run when they
> >> > change, which would cause errors about missing SPDX document. Also
> >> > updates to the latest version of the SPDX bindings which improves
> >> > performance
> >> >
> >>
> >> Hi Joshua,
> >>
> >> Ok, we are almost there!
> >>
> >> I suspect it would work fine on master, but we have a fail on two test=
s
> >> that were recently added by Stefano, and were not merged so far.
> >>
> >> As both series might still evolve or get reviews, I will probably keep
> >> both in my branch, but some changes are needed if we want to merge bot=
h
> >> series.
> >
> > This is actually semi-intentional. I renamed the "recipe-" SPDX files
> > to "build-". The fix is simple, but it either needs to be applied to
> > my changes or Stephanos, depending on the order. Do you have a
> > preference?
> >
>
> I do not have any particular preference, so please do as is easier for
> you.

Stefano has some feedback to address, so please take my patch series
first and Stefano can fix it in the next revision.

Thanks

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

