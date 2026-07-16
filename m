Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D508DC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 08:18:14 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8011.1784189893842027166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 01:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DyrhE5p5;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8efbafa1bacso52832596d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 01:18:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784189893; cv=none;
        d=google.com; s=arc-20260327;
        b=V+zPepORbwL9TR7vR3YZDjyVT/M9iJxoJMaolFhzQmaMpb/hPsWX1iounb5XIIVzn3
         R3IpZJVbj54YOpMNnwQh0o4KoDi1BVn0EjQsQKAWSEZJzui3OdrAskx68ckDoqTxinon
         EsMK5gKy7OzeEW+dH9+GAA4sVSmSqP88u8qWNlHKoV/IKWTumDpPTx2f9bCRqfIbD4vF
         ZMJWPX/Xju9AcLOHLiBqVze/XsNxJ9e1HIpG1lebneE8T6NNap3hSlURJktJKXXyjdUm
         fg2DwQKWZPW3kZBpBoHXyZfNFifUgvDQyu25pGWB6M0dZRf4SgXkVTdvFUIB0p4wny1y
         N9tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/GM7VP2MMcRB2vqMytW3mPkEy/nWeq15AKhBm7NxzLE=;
        fh=7dR4I8jTai6uatR3gxGQXCKVOxcSmDot2B+5Q38XfCE=;
        b=qX6WUkEty0+k5VyLN5AcP/ci+BL3BxsoyZZiz98zMF38xnDH7lYaV0q3ppKtbMyIYr
         ingRwKHpG2aUpw+2XdjrVmz21xlzDY+wTsf6Xos8DwrDgcF5QAUuzAyHu45DXLBHp9in
         BA63nPt0vH7jbR+++Wst2+OECgNyueBqDtoysDvLtG1ClpX1ji0Q1Ctl7rvnbTSI5oCA
         vCEfpB2T0CYprcRGa8G1g0pYRFU9+xXlRXL8hOAoP0c7bbvFTmL9Wuwo5HhJu/Y++uL0
         XDVHzSTtQ6LfOAYarAfmR2+g4bMNtgteerJsube4Rbd+2t2yzDumpTEB0PfL2MoHhPjG
         v4WA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784189893; x=1784794693; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/GM7VP2MMcRB2vqMytW3mPkEy/nWeq15AKhBm7NxzLE=;
        b=DyrhE5p5SYYdiQzSDkK1ZwtFRI3ECsOMulei4KcLVCI5bFMB5Zxv0A5gGIYpJjcbJY
         opz6T6ZWC+Btoh8VpQZROD2ZHDU4X9oXqc9oPqGM9KP5mXLxSmv1MMqIKFgCbzl9oYsn
         Iq9hbrbpNvA8x9dpwKMQN4GoXdCN1Q7ScYoSXE95KZk3bKRolvReV6lYqTbCNgU7hobq
         Xftal+08rVY52L0Z0fvrFzMwc6T22eL13Ev3mIxlfJNq0InLBKMteWfKHepycP6NQ9cY
         vImg4gK38nk22JPEiHGAqCpraG3bVVHcBCLFKOve9mjgUw2uMRjGoFM/FJm+WYz9bHkh
         VoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189893; x=1784794693;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GM7VP2MMcRB2vqMytW3mPkEy/nWeq15AKhBm7NxzLE=;
        b=AmUx6zGqrSMhERn2sECG7uBfaPXaCzsplLKMuUreBl4P2f5rTjTH0AClHyOl4BfBnu
         n97pMcc5gqN1hRkE/0PRby3i1UqjF525N/Fm/0DqxTeNEvs9S/Tvefp5dWZV1NPquhfU
         6qMobQyBgNvNILvE8xm5bnzrAVIq08o+S8AIJUdjbfLnumbT2pCqYilX/j8t4T+RJBgQ
         DGGnn3icc/Qb2QKb5boCiw1QAy8b1PVfvDFPUgkF3/q18mjPrFsPMQNpBV9RuSbjBJyR
         ROr0ZTVGItkALnhKJ9ARCNU/QS5xZjN5JC+rBiIs6EtDNL959L3iWgElWQ6smdEn1Av2
         /zNw==
X-Gm-Message-State: AOJu0Yw682kg/oeQrXs1bu+jKzWYflVcrCny3dPksboWL5lrAwOOImAy
	pV7NKHCCkzMOuGzTAtXRx+yEALKGOFKDDF36xw49YOOPkn3oq+x9P2YwzjuGtE2xZkrZIorRGC/
	yyipizKML9ykZr3FulW3ziTxeOMI+E92PhQ==
X-Gm-Gg: AfdE7cn6TEtpIJcDMw7DQs2pNQD15Qu+lKDhFZmPYrj5S7mu8yvaaDhbJ9Xi0jglgKP
	RBzucPm7JA3n2b99GWhVX/pLzlpGik8tg5eroCufm4L2NC9FHIpcv3XYRaHFrdN1WpXQ7VRGhmd
	XTkyqPgDP4LLSvu0qqacJLyfJI16H/5HRpdAAv4fMT89GNke91eFusUl+Ll5n5FGH+fVkg7X4WC
	vO4kISwh+/C+pxjRtqWiIFrHysopjc0rS5QdLWg5NbMavZujtNPDDUsqb9QoTRyIBgPUlEkzVwY
	ytnO0tjNmozl8aYwitVL
X-Received: by 2002:a05:6214:3210:b0:8f0:367c:eb80 with SMTP id
 6a1803df08f44-90758d0d294mr69259156d6.25.1784189892560; Thu, 16 Jul 2026
 01:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <0101019f5f238733-986e42ca-2a90-4b8d-bc4d-61f5ac444525-000000@us-west-2.amazonses.com>
 <FCA04DC9-81BB-46D7-82AF-137560376239@arm.com>
In-Reply-To: <FCA04DC9-81BB-46D7-82AF-137560376239@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Jul 2026 10:18:00 +0200
X-Gm-Features: AUfX_mxVfz5mET_wtIYizO6ZRR_cDvzM-LVs6u2j0ptrUTAi1DQ512K5O_Ng_30
Message-ID: <CANNYZj-UAK3Z7LcMk0_+fLf-jy+wQ8OzJMmr2XR53hT2GnEp1Q@mail.gmail.com>
Subject: Re: [OE-core] [AUH] pkgconf: upgrading to 3.0.2 SUCCEEDED
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 08:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241068

On Wed, 15 Jul 2026 at 17:47, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
> The upgrade is easy but the fallout is significant.  Specifically there=
=E2=80=99s a regression in the =E2=80=9Cpkgconfig-mode=E2=80=9D behaviour t=
hat breaks our build (https://github.com/pkgconf/pkgconf/issues/571).
>
> Nobody should try upgrading to this unless that ticket has been resolved,=
 or they fancy fixing it themselves.

I'm confused by the timing of this email vs the slightly-earlier 3.0.3
upgrade of yours. Is that one okay?

Alex

