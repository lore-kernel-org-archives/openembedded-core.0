Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0D8C88E6F
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 17:11:58 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2934.1789405913758058953
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 10:11:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hsqbBXWs;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90cc64570deso546316d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 10:11:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789405913; cv=none;
        d=google.com; s=arc-20260327;
        b=MlK/K3RfO+oGFDfb5z6k5nm3ql9jUCcHObnpUyIDsaDDx1vgSqTeGTZt50T734GyeB
         OfYbfqzQRND9p8t/AeFpnYPU1ppO/HMqdN3Fh+z+NOddJGHpEsDyOsfAw4SebbL4pjiH
         uiKSKUPrkujq6h+S7grMkj++3kkoriRRQvFGCwSVxgyu4rWWTqW1EJoM+JlvdAx013dX
         AiKq+UzIX76padLN5jGHbYxhpBpSH8QmS3eLBnJYtZMtNzMOKtEpX8u06fxOPeJDorMT
         xpL7fUl4HD0VFIjowVz5QYF0dGBbNcfEe1H0zbsIugPwn6p5SL9OzCHIqHVnxjWT1HIn
         +p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jkLG2wL3cZ9vnKRwjuh8wQWpolUfHIkphYSp3+x4GnU=;
        fh=OPg4Gut/HMHHWUPkWi87x+Qjitik9izWlC6he7wZii4=;
        b=ZZSNpFDIFMkoqbzCGvflaGKCTTHCJDsPEvEAyEMkUdW35H8HNQFMvVICw3QIAyqSCY
         l/TYlI+486duoYRzC1mU0W6T4L5fhQ8kk9/Z1S8IGZ6uMxKM+shfSpJlJvvzSi7zJThR
         gBMGW+aBDubE75fcAP01UkMmAA4KdA0Tw7OS15v+9ndF9+OPPvnYYNl+rMjFoXawSk9d
         JLN5sQimGut8gaMdKP7ULHXyRY5Rw2vK4Y3rb/ra0GmrBeyZ0ifLra1aSa8ZkcZ/ZE8b
         MbFDf/7kHvcQ8ASe5YN6CL15r48lOAp5/Aet9ZSvTN95JwToheIGMU3ZSDyrtk0H7kB3
         6sxQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405913; x=1790010713; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkLG2wL3cZ9vnKRwjuh8wQWpolUfHIkphYSp3+x4GnU=;
        b=hsqbBXWsp7bJUE8eWhXza3HApVdnzRsOkhsoUvzbObJ19iBNHzJ17eGbo1UkrvtF5B
         /UWCpwzvXfTNjMU7W1F2M25LZVbkvMq3U1Y6UtoCmJfKJ0U396JTMTu0pKcBCEGS4Dr0
         ennvO2kJhWzCv3+656josOOKb+6bHGkFoSmJ23PKoAhq4xPE6TgUO9HzoA0TBM+Sb8bk
         Sy+3ekKrq0TK8HtTELnrFakFWZJTfwCipKevv4BGCw2NzBkdEjVJxy2pCDZrbbeS2izF
         N7IPowITN9u8lLb6ViMAHtwmmH70U7epINDszKTVFhBYTUzJzRYbKq9J+6V5vJl2R4nO
         5hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405913; x=1790010713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jkLG2wL3cZ9vnKRwjuh8wQWpolUfHIkphYSp3+x4GnU=;
        b=sQzdYqwZR0h+OTSxwNe+YGED06U4rnJs8wBUYN7iX2H4Y9iaTcnXB8C1nvxPWzXeqk
         d8kGZNg+54hGLuSiDGHFupbX7UYo/vYGvUXCBu0c2Lgk83uZZpnUSIaFTEjxvFzkhb3M
         kTibT+ciEn+2JAN2Q014eWnIbESO87yDBlwkN7BKDP+EuHmQ2QylcRK3DqgsoB8QFaXm
         3UzUZ459Z7ODp6bYtsL335xQIrSL702RkclUcQUmFgnfQ0febgaGasaLhnoUf+RXQbxF
         TsjqdgvEfFPPiCVJbW0f50NBA/ys/4vhlJzhfi5fP360OvR3xqelbFj/Q/7/IQLcNkhS
         SN7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBaadsdtR1cQnSu4HSKm+t4v+VZYvJ5dZ4XjxCtxCuogjXRVdTchYa6sJxiLxWsThZpXqOFo3gnU5p7xNUJFNsgA==@lists.openembedded.org
X-Gm-Message-State: AFuF++meT3rFMD5szKLitNT2M+OovCqGWuAIVhPlKzF5odo5TSlRUwRb
	GXTIA73BAF9CPcYGKgG49oaCIVAQNGyyz2R6KNrlmHHwi1MKGuGejdcnUrnULJa7/N100agv5HW
	G1YRq1mMh/nTRYJ9MPuCayjv/BL3fAl8=
X-Gm-Gg: AYBFou2VuLGsuNVf9CSud34Fa7oicviJAE9WTmvqrm7wBE5tRSmLC1pDYx07iC4jutM
	FmDhWNW4KoznPPJ82wmthqEtyB8g7agXK6AEgpOToNgo7URORvjan3j+QqAGljNcO2c+Ghg+qQg
	FNw+Im9Q6EtWG0cxbsMZU//wwrw8gpobxEXSFmBkLl2zl0pvv0s7IrXyXk03Dh5TrMu/Ftn9+JE
	D9isR+H1ibMkFRXbYNmO3pcMqVMwWqEa4BCzipxSav04zek0lke4UYh7l/+B55ziFxRCcQBe3OO
	9mOXfE6qPYg1GerGHGeygRdb8HM3CSQWcVLMwskk/AGVXVx3g9eVvk0XY0R1ZguaS0UkiTNjtl7
	BG22NfkOV/2EKrA==
X-Received: by 2002:a05:6214:19c6:b0:910:3923:cc70 with SMTP id
 6a1803df08f44-91234419496mr4794116d6.25.1789405907949; Mon, 14 Sep 2026
 10:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260908-mathieu-reproducible-faketime-v3-0-03a856c33239@bootlin.com>
 <20260908-mathieu-reproducible-faketime-v3-1-03a856c33239@bootlin.com>
 <CAMKF1spk2s1h7yA5F8YfDQpKn_ho_cDgPj0cM2E49Q__0A2yyw@mail.gmail.com> <DLAKJAXKRIBT.3LH9O2N8G34TD@bootlin.com>
In-Reply-To: <DLAKJAXKRIBT.3LH9O2N8G34TD@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 14 Sep 2026 19:11:36 +0200
X-Gm-Features: AcwNN1WYXUu8_1fwHKv_-InvP4315ov19CepExaz4UkaiFu-PVXyCQcPO8mM4JA
Message-ID: <CANNYZj_DmnX_4N=GKZG_UV8ZCHBQL0eZukwzw0L7q75savURiA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/4] libfaketime: Import recipe from meta-oe
To: mathieu.dubois-briand@bootlin.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245790

On Wed, 9 Sept 2026 at 08:23, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:
> > I have sent another patch to meta-oe to upgrade and also fix the build with
> > clang23, please consider the change in that as well before you bring
> > this to core.
> >
>
> Thanks, I will make sure to import the patch.

That needs to be posted to oe-core (and it wasn't). It's also a
Pending patch, please submit it upstream first.

Alex

