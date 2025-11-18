Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D1ECCED240
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 04:16:37 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4741.1763439392561016791
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 20:16:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RXvM5Bt1;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3e3dac349easo2891549fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 20:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763439392; x=1764044192; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBJuoFMz1ogS6zZq2j1ngfUxjgz9EWEIeK5/B52LrQA=;
        b=RXvM5Bt1ZKti9RkMFIakBIo3PdmnR8Fc3wWdVyGQc4OfVKLbHog5VONwdP5Vv7rjif
         PZSzd9yuVn5r481Y/dzTo/yDa0h5IrX5iUos8CkVx8vLULrhHOZKAsdyAkbueh9zjvUh
         MYGX0azfPf/Pd4fboOqC/lnaRSRwpm2HDAIw+70NbgGwB0qrLNG8sF+dAfUun7aLH/0n
         zWZlROQ8PtSEtPoCrjRe19af+ikBZdl0AXtJFyaAtPPHPtHxicTEpnN6Jep30EFRr2ch
         YyDp8oClAm+Sy4/f3vTZ46b/5vKD9yuW5WajuRUPlIoyzjKTEGp1HDdADBDEEE8jPkH3
         FquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763439392; x=1764044192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fBJuoFMz1ogS6zZq2j1ngfUxjgz9EWEIeK5/B52LrQA=;
        b=SdRtTsJPnuWNoTyQGg/bWZGZxyzS6/PN7A4NwzM2U7wSLTMIQddiKQ/HyUCZF/luMU
         pxlg4UIXbAXlEtHVwEVAaseBWnykKGHEZebachCsX7D7PPJKzTj/Gm6UGUNA+FCcJlQe
         e+wjz3L3z8Z/U1sh75GFZQxGrlwSSkXhQhsjit+a6/4jPDPfBd93KbIZZsCWtWsw/LIS
         zkp2DkP6HLAz+KkyfdaB8FgKt8nDNX/+GxPvR97jxJ+RyOl2KwkpWqnS+czvclu2ks5X
         /mv2udijNDELH5aibvvErxVpHdHBdMs3Wvfo1Tx87S5ul5ptVCByh7Ui7fkOTpmwIGIQ
         OIvQ==
X-Gm-Message-State: AOJu0YzGIZN5JWd1Q+Yq7W534U2hwrdpqh8YEtXns0piScTrOCC/WXbH
	QGaI+i1ehEgSw+IDWa75DEQIs4i/cejbpTnCZiCoDIeHCzKqMlxLAWKatz13ynxf1lkjur2IscY
	1AuuAOG1pLPzeNqsyiyhs3euKF0wH32I=
X-Gm-Gg: ASbGncswZtSYCiPBiuCjau47FpCIuzetHD1WGy/3IJewguFE+LZsF4KdHm/Crl39iP5
	NyWPd2Mbb/hzl82T+FID2oKjqBkJRoJhaEhCZJA6dc6VciOGpIveecZKD36JXtSLTU92UaSC24D
	Y18b9DwiNZlZ/jnxu4HZRSHaM2k2nyCfG5xf8QaacT40k4CkTv/5JSu4SLXkvGbyMw5c6tWVhzV
	kAjlt/dOasa33UGdYJVBC+AL4GIcL3zuF5a43ocmID6/bhXzeZNV10OPHye101yMutDEwF3L4oS
	f+8yWZBTJ0RZflcPxA==
X-Google-Smtp-Source: AGHT+IF3fK/P6rK3KRD6znYIKrv1YeRLBEJX7sJcppQWcTPIZHmFjNge+SRwIIz/pp3a5kGpXvlCiUfPaSS4XkycWRA=
X-Received: by 2002:a05:6870:41d0:b0:3d3:4338:bbab with SMTP id
 586e51a60fabf-3e868efabe9mr6032355fac.18.1763439391688; Mon, 17 Nov 2025
 20:16:31 -0800 (PST)
MIME-Version: 1.0
References: <0101019a88621386-99534d34-9ca8-423f-9c7a-5e49665a5307-000000@us-west-2.amazonses.com>
 <B65A887C-3297-4262-94DE-232FA1C396F4@arm.com>
In-Reply-To: <B65A887C-3297-4262-94DE-232FA1C396F4@arm.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 18 Nov 2025 17:16:20 +1300
X-Gm-Features: AWmQ_bl8CvWHbc8AHvToEwbwBtfVNv1ZWpCz5zNA48vaw9PpMuPQdo_OVdWJGk4
Message-ID: <CADySD0EWNpDpYyG-PeoDUt0SZ=ePwaGhXgKk39KRSbStUaN-gQ@mail.gmail.com>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.01 FAILED
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 04:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226510

Hi Ross,

I have submitted a patch
https://lists.openembedded.org/g/openembedded-core/message/226509 to
upgrade.
Let me know if you encounter any issues and I will try to fix them.

cheers
Ankur

On Tue, Nov 18, 2025 at 6:33=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 15 Nov 2025, at 16:38, Auto Upgrade Helper via lists.openembedded.org =
<auh=3Dyoctoproject.org@lists.openembedded.org> wrote:
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe(s) *nasm* to *3.01* ha=
s Failed (devtool error).
>
> I had a quick look at this, and the patches that we carry are still neede=
d for reproducible builds.
>
> Upstream is moving to GitHub so I filed a new ticket (https://github.com/=
netwide-assembler/nasm/issues/173) but someone rebasing our patches to 3.01=
 would be much appreciated.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226506): https://lists.openembedded.org/g/openembedde=
d-core/message/226506
> Mute This Topic: https://lists.openembedded.org/mt/116309731/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

