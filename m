Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEABFCD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 08:22:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40721.1781166152321066104
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 01:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WfNCDLHh;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so50556335e9.1
        for <Openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 01:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781166151; x=1781770951; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxcKcEeyCswtEbeS1RNg7Ee7tgvGGV80Tn+oJ5AxUcI=;
        b=WfNCDLHhrVgDC8GqoFKBAq0wwdXOhmMjYUgy/TXLeYuZIdvzvTwGsJzCZdVMjJTx5X
         Z8d66R+3ZW89yBjlrz1tKOQD/CDgaGyG5ba8d1A2U+ZPSOz/wvhbz94nodO11lMTxUi7
         /2ZGG+PIU80Ee90RjrRHFXm7agHXvEoZ4UUM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166151; x=1781770951;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxcKcEeyCswtEbeS1RNg7Ee7tgvGGV80Tn+oJ5AxUcI=;
        b=Gur09q8JNYvJT/cQHRWHHKPN2bdb7TBJY3egt77UwKLoutOkqDacx1eG9iZEvIogm7
         Nls6dDwFAJs7/8qIf5F4zP7Nly4DsRBJnuJhm0ZZlTaRneLw197omAFXIqgcPl3DccG+
         zc6fJzNjtSl2O2vGJvCRWsB90a5dtfJbGJVlZeFu/FZ+OfMvXuQWc6bUz3uKzsawRPP5
         gaqrp8zgfV7J7ak8GYa+ZPAmGkJhS3oTTdf2Oj7C2m7xv3tcCiyXNVe7mTvgQNc6QnPu
         YLEJ4Tn3c1b2sNPntRd95W5HKIDwcuovIGw6Q0KMpA4HrQsf+YdvjELgInM7sm+f6iN7
         qajA==
X-Forwarded-Encrypted: i=1; AFNElJ/KLADHRsMrEIjKVS3wE1sl06BqyX1GosspMSrs2NAOAW64eKT6qvn7gCZTSN+AUUIjzsSvPvsQHP0zutQ2ZMT2sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxatIJcLgrOlNRDWOAREkSCJSGO42fAHrbKDCCUiJtaMduPlPxP
	/Q5A95jDMA0E84ABMhm6rcM67tfMjPILOxzsCaIfAvA5Wf1qJwyLukP5bLsvT/keejk=
X-Gm-Gg: Acq92OGQBf0+gkzDhIOoVBBRuRtT27CH317QD60OjhoUgyy6ybrRiQRwIXQCdwvxZq/
	H3VwwzJrn7zIhi78CGYHtRNSrrzpXakwTo0glIJOrUUnUcXlzbUJJ+q4vygeqGfrRk6TIqjN8CW
	QQXtj9VEHqWKtdlzqBUKkYz/RGehXG2/Aha4DjKg5PfLj6Hx9J0pFUf+/EDkVgD6Et6PctAr9L4
	5DP35NxIu2u1sWenmWd0iy1g9vh4i1MdR0q/JGLEAdxsJ/mEP+bnlnUfw4DvNldJ+CLkR+6Gw+B
	jPOCgFs2CXsOlC2Nvmg0LGOaH/csL/pK4/QSWylyw45VWXvVGFi71b7Ze7N782+8m1vljvVqp7e
	iTHm1LlVKOv0wxVyJU9QKjw6oKdGE7t7aHOT0MYaLh39DkVWyQH6Njo6XMrTtyh7pAOPGDBNm8U
	xwOkF2l5havYyqv+s6iDh4xty8OX2zvS6RnlJgZF1W31tDA1C5zOWp5xI3W7iF5n9nXnS9i//gs
	G4kLMKdQKkI+CE+d22y+Uw/0vY=
X-Received: by 2002:a05:600c:3656:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-490e5639467mr15299235e9.23.1781166150647;
        Thu, 11 Jun 2026 01:22:30 -0700 (PDT)
Received: from localhost (2a01cb001331aa0084744357c26c6744.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8474:4357:c26c:6744])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e532c778sm30585065e9.14.2026.06.11.01.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:22:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 10:22:29 +0200
Message-Id: <DJ62PCZH9RWW.2CWRCZW35I546@smile.fr>
Subject: Re: [OE-core] [wrynose] overlayfs.bbclass: upperdir ownership
 change in wrynose
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <andreas.muetzel@emlix.com>, <Openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <14026682.uLZWGnKmhe@mobilepool081.emlix.com>
In-Reply-To: <14026682.uLZWGnKmhe@mobilepool081.emlix.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 08:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238427

On Thu Jun 11, 2026 at 8:12 AM CEST, Andreas M=C3=BCtzel via lists.openembe=
dded.org wrote:
> Hi all,
>
> we observed a change in the behaviour of overlayfs.bbclass when porting a=
 BSP=20
> from scarthgap to wrynose:
>
> This class used to create a helper unit that created the upperdir if it d=
id=20
> not exist by calling the script found in meta/files/overlayfs-create-dirs=
.sh.=20
> Additionally, the script changed the owner of the upperdir to match the o=
ne of=20
> the lowerdir.
>
> This helper unit and script been removed in oe-core with commit=20
> 623c20ff1e989730138c3fbe6e8247eaada20707 because systemd now automaticall=
y=20
> creates the upperdir if it does not exist. But systemd does not adapt the=
=20
> ownership; instead, it gets created as owned by the default user and grou=
p=20
> (root:root).
>
> I could not find any reference to this change in the migration notes - is=
 this=20
> an intentional change or have we discovered a regression?

Hello,

Indeed, it looks like a regression to me. Would you be willing to handle
it?

If it is easily fixable, send a patch or, if not, open a bug on
https://bugzilla.yoctoproject.org/ with, ideally, a reproducer.

Thanks!

>
> Best regards,
> Andreas


--=20
Yoann Congal
Smile ECS


