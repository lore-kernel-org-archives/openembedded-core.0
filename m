Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCD0CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 17:12:55 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39850.1778865168686647809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gTqsX/qE;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-651b4d09141so2827043d50.1
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 10:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778865168; cv=none;
        d=google.com; s=arc-20240605;
        b=CeoFd6DkJW+Hik23IVTPJmjfgOvCAvuinLzYIPaVVREWxugJBHHBt3ggnVRVIO7+rj
         8ipvQ0GIcqyW5pMBtAdRzkxTn24EYIyl5k2qO5HlSnfWL/KLY8DW0f6KtJIbIXf5cNM3
         yeX+oqC/bBoU/6sNXY8cbPu8hLxUp/SZjmIvIR+T82gHJPJqcDUhCYgjYKWa4YTgR961
         jJ99A44LD4A0Rzns6zuNhWH2hJ98D8OOUzR88Ac0zhcKfYwLmD6o5k86XtEOWxpXwyLG
         JzR+9Wb+aDroJpC4Qnpb8IS5qv7arNcOoXh/iOjBhW0LL/KgaBhwuwnzejn8IH3y7NvK
         C5+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Uhw1qlB8VWdolXqhgeVChdGIA9mCCsn+xAnOOaTKVXM=;
        fh=0a4tFkGZD2R2CwcpeLhRW79EIaCu+Fe25yA877LmfSs=;
        b=eArvSmp9CfRL7p4lFPKg403qDTN97Vcdr/jKs28nbXy2Hxw0EtaVttYj2tQN0rewIK
         3UvP/CwogdjX5o4OtUyEaZmS9Iet3so7LRjfQryXapHBZL7m3TDcDcsRFlMBe8z9NOQg
         hmaE8ON6ZIoDLzkKXpFMZOUutyATaInBAYAVFP/ro7Icptght6dXMk7/bug4I0xEnXMv
         H9o8lqgAE3ZWAThqWC2n+ZPcP3TvFxDqy0ZMLBqn+WTtwG2z1eR9/V9RoJ/CjNZ7RHcY
         sgCodqdVXqR45h8SfGNyNvxsUvdtWuzFVC33gPbortyusbNKL1UcE2te/QR/6j2a29VC
         kMEA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778865168; x=1779469968; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uhw1qlB8VWdolXqhgeVChdGIA9mCCsn+xAnOOaTKVXM=;
        b=gTqsX/qEcybRAubnLa+tFNf9MquBaw3OBHC0KGSWfqVTwhi8N7UMWOI1PTPnMk8R2S
         eaZMIgQVL9+/lC2lPMMaF1T4tmbwSjVFM2CuIaA6sCIMseQe/rjJjrRiObRLSJ4JcpFX
         5gKMj1z/OvovqZeVzDLpFVEQp9sPqpgVBk1NOA7oEBOOLAQhx0w5nSPEtefT6UpjoTrV
         +q7+91Lx/Td6jFB8LMmzoUn7xvFLdogoyk95qzQexJj3z5DYYTAfCllDOkeLIPZHnjCE
         jsxSddmx4iaRzkdnqMmNsM/vWLMNniba2A1jND29UaZ+/qkCH4DkqgU7JNXpafA0IpnO
         4PAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778865168; x=1779469968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhw1qlB8VWdolXqhgeVChdGIA9mCCsn+xAnOOaTKVXM=;
        b=AKknwiOqQZr7t8ezK6iVsP+Xl/qmDPujo5puSzESZ44m+/ycLRtYQDz8BNxQoKg91v
         CxiWfzkynD55aRplBKWeL4jPh51TuzxIGquXwf5e9UqZzWkxPYP2YV2uvuRVd0NIAHd7
         Ly7rc5E0xHr2XYCJ6C7znG1jOY8iQ8alSVZpECdTG5DcNhfsR6YDRF+1QtWtVyD3C1lf
         UfmNWgV/0yuKMBU/mxFdECuimeUm18h0kFJ7KgLkrtYE0UiPLbzER/Z63v80mph8zIqj
         2cBX5QvcW10RVq6UgdgdPmR01chuqYhu9/LAVid3WVK+PmPKWZWi1dDzCasecYIN9hKq
         aaFQ==
X-Gm-Message-State: AOJu0YwlkUroDH/J3jKbulli4JdxYDXZAMb0BnLWmrLLYCsDW8AwNNDj
	gA4vJb//EZZL70MFRY021i7W9DBfruarrZ6kW+nm99YWeKGzkoptY4lRS3cMpoU98Hlc02O+I3R
	sJqC0mOU52b5PkprcCpwOyJ2GkjfOdstaTbuIpzU=
X-Gm-Gg: Acq92OGpqlasfoNoSnypO+MR30iNlOPZXKOPN5fNqZ8Rl9LHazO4R7dU/XUMVQ4ui3r
	jwiuqDY89Hh31Uw44jD6aKYyZKaDG929ORj8/26WovH1PIU8GN6Y0AJ/pXV+Nc3Q+aVYzThnkuf
	IfXRdh8qwyP1dRJPdaIoNI5vAdNNwJdpZsTSNK4NdTQrnCXuRyD2mzOCqMBroNy2UR9IvvjVXuM
	nl7iMYOV7XE0VGVN3RI9+RxXMTAKzppeAL47IcUB1P0IG8BlcUVKKrmlRxsvEOebaABF21EESYQ
	TZiCq//Wrs32/zWNSvWig7iESaUCzKNvZfYseehuLVh9QAksnTr1Gqxc7n3BBF9iYq+GXP/N8Sx
	4nAlEo5XeKfyZOso=
X-Received: by 2002:a05:690e:488a:b0:65c:72cb:8a97 with SMTP id
 956f58d0204a3-65e0b224121mr5431338d50.29.1778865167683; Fri, 15 May 2026
 10:12:47 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Fri, 15 May 2026 19:12:36 +0200
X-Gm-Features: AVHnY4KZ-E9yupJzR3mpBKUi1VEwHu9Sg0WLJ60jyfjydAaghKjbkMr-EHZM738
Message-ID: <CABF_=ygrm+zsyehypM_iRpdfdnH8DSTCMK-Dtt=OQsy3aFtYPw@mail.gmail.com>
Subject: adding WXwindows-exception-3.1 license?
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Rob Woolley <rob.woolleywr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 17:12:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237182

The WXwindows-exception-3.1 license is a valid SPDX license [1].
And used in the `openscenegraph` recipe of meta-ros [2].
Generating the spdx (do_create_spdx) is now failing for this recipe.

Could this license be added to the `spdx-licenses.json` file?


[1]: https://spdx.org/licenses/WxWindows-exception-3.1.html
[2]: https://layers.openembedded.org/layerindex/recipe/438736/
--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

