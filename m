Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA7E7CCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:22:01 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4499.1792236114415452078
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GuFuwpgF;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: oo.hehir@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1694381eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792236114; cv=none;
        d=google.com; s=arc-20260327;
        b=oFqFy5/0RsYb+WOBKf91pZyewy010gq7+KyX9B2yZvvlC4NJbo6Q6V0E1Wt02LHU4s
         JxstzC3HSJvdLRAKgul6ruYJBp0ZhN9yDY3CJh9gcXpDPnoZQ5O5ELOM+9leJRrFL0aT
         z8Zi+HcKjmU/JK2hdkJ0CmERABGmpyl59nZz9HelCPAezp2/oPpl8Df2a/Lkuw6diPqw
         D3AzsA8mn/lys4+JkWivkyLTU/N88EmNXZqpra5JrYjYEPskDYUrmPsj8G29xdxNvFtD
         Jt14Ys30k2jah24SD8SJNWRxcX5RXrsHakXdTwvtG23XUFUJPRZpsflkmerAQLbkLC7N
         kxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HG46eGCWp5ier2CAzyx/idgCcq77AjfpUfRN+gDOSIE=;
        fh=F6XsNXGmOxCfiaMpimjXxzfvvDgbpxFeVSM1n8QzN3M=;
        b=sBnNaYlfRlB0zw8igGnRo3OZFzYM7dYj8mDrPn1Gg9RsleInwqq3p9lugyaX0hezs/
         hOiN3D0sCnyJSTBbQvHGey6lhEx1wmiqXy3iUGcVPnGpOEg+h9DvQJgdrvpO69YRrQqp
         LSRy5WAyuC5X+b45Pz4WgqmouMropH1nehEmhCiBihpzSwVx3vdlwuP4DTKazKPm5ou3
         rhPL1BLOr1tPWK4KG4Gb3Ex7ij6Ad9LamUrmEyJyzJaBfry65raZ4Huhv8Yu8FdiVRFv
         DGZNFXx/M3Fh2xEPLM3imNv+X8isy4RjxSbSQz8GuhQyqDF4gjsUTDvoLbUUrTbQ0zDE
         HuVg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236114; x=1792840914; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HG46eGCWp5ier2CAzyx/idgCcq77AjfpUfRN+gDOSIE=;
        b=GuFuwpgFOtkeHgGuCj5L5LThrNFQT6XU04V5OsDsfoHnRBiV2v1JIRV9ptgPygUn5A
         cvJwJnjYsZ9NPNR7bv89kETNOwZcg3VY+DZJGTNfgh2XlC7alzlI2kEB7ShIOciXkSNY
         8Elq7Im2C/KcZjzTWEpGLKcW/uHSKDOvrU6I04SU86gnJ52VFmOVESmYhqZnnguFkt0G
         sW62slwI5+jZLTdcYIJsbrDHRdv9rgPnGBR4ohIdhbLGWN8BAKbmX44onRAXRUzfttQJ
         g5YRdC+nBqdLmoFwYNQ3qw6PHin6n6bx0OTV52Inu9xBI5ELHh09T9e6WJAdmSk7yKMr
         LuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236114; x=1792840914;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HG46eGCWp5ier2CAzyx/idgCcq77AjfpUfRN+gDOSIE=;
        b=AHB/J4FlPsWchlDMgY1i/PcVuUnRV+UAqRXajY+U9JZAPcYQ3cEtziGKfgMTaef9cT
         cDR9RI3chBU+M0MZmT/mfq+b/TpPyK/CmuXSuKACK1ZH7upbitfByGM/QxONMcu97CoY
         Cu3OoxpuutHtPZOLp3SlnJlUvTDMPH4bscr+0SbAX8wwy/rb/DkaBKtQqMAakgux9Ci6
         uhuPLASVNg4RxdyaK3z2C9QFB2TPSXqy2sMZqYx6Vf9az1HnKG3Y8iwRr8Wi1/8NK00R
         7cg/l9Mq6GKLx2se9Hh0bF3oVRRPn7Gs9pxgwkxbRis4V3+N97ho9s805SCsyq4rcgRk
         gK8w==
X-Gm-Message-State: AFq9FYIVY8OLt0sJ3BgrgBMg/u0JMEjZwBIbJUZGzSoYnpH5awIRkh/N
	Xsv9xZK0c9h+ubrQqGk40Ls8njf+9lBqaZcuS+0yeaqsYp80HMSe3CuGJ2D0tA8MwVyyJk50/V7
	cGGQyfUSZHF0Vp/QML14syOpll72cOLymxT2j
X-Gm-Gg: AYBFou0Jey9v1xx8d98q89b9lP4M7jy/pCdtXMctIuj8+MYC4jlNz3L23H9446wIW8m
	S04Celb3kYaawF3n7L9KhqxlGz2wVNx1vHRFk2lH9ouyDv9b+jQt2MXS3hrsgBP+WP31XJJjFYs
	Xiy17f1fkwEI39Vq8u9uX7SUDeuYnvk/sn7tLgAAvedLV9dEiyIkWRoTzi7N3+NTiPDFjYgi1CL
	e82i13baA+faSj3SPt98iUdEIsm35DdipZgNiO9Mgm27lV1uwUqjeuTPfeVb0ApG5FtojKere1l
	ahVDP5kBYcfdeNnVz+rz5GpAmcLCEGDbnrfKPRMLiEUmCctNfiyNisLV
X-Received: by 2002:a05:7301:1884:b0:35a:4ad6:d215 with SMTP id
 5a478bee46e88-361a2343db8mr3377789eec.22.1792236113473; Sat, 17 Oct 2026
 04:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261016204547.2328847-1-oo.hehir@gmail.com> <20261016204547.2328847-6-oo.hehir@gmail.com>
 <DM71K03PYNLU.ACDXXJ36A9BF@bootlin.com>
In-Reply-To: <DM71K03PYNLU.ACDXXJ36A9BF@bootlin.com>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Sat, 17 Oct 2026 12:21:17 +0100
X-Gm-Features: AclHuK_IVplszq6oCc9F-bxRfJwcCNwjbJkCEaaoxV1mIs1_q6Dia8qETrVwWNI
Message-ID: <CALp3LZ5B5qVVA38jS998KYQdB11RDomLW86rwGb4fYq0irpX2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] tcl, tcl8: skip binary-40.3 on RISC-V
To: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com
Cc: Khem Raj <raj.khem@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248078

Hello Mathieu,

Thanks for this. It looks like it was in the musl build during
do_install_ptest:append:libc-musl. I've modified the tcl recipes' sed
so it only matches at the start of the line. I ran some tests locally
& was able to recreate the issue. My v2 patches now build & install a
valid run-ptest on musl & glibc. I will send v2 of the series shortly.

Regards,

Owen

