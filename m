Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814BFC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 09:19:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2566.1784452775364936756
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 02:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CWOWMMsB;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso6211689f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784452773; x=1785057573; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4YNKzuPFzCjDarHNHEZGPPmSNaEBl9Kem9U0lxK6qaE=;
        b=CWOWMMsBC7Y4fMMc0N1wjznuMmcdcPKD6Wrz2lY9UE35RtiHjGscWZmF1rwkCQncZr
         8W5QJVqiU6SBwKuOvSEiowbgTYE0WZS/hU7+od8QJ6zzOMTAFrCDESCujUg+8g6tU3np
         ENE+Dez1n3D6C0j0fKGVtmRBcKEv1Gv1APGFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784452773; x=1785057573;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4YNKzuPFzCjDarHNHEZGPPmSNaEBl9Kem9U0lxK6qaE=;
        b=qwwPkOiTuJOXDLAxNwX6tVE48rSHjusJpw3NkC9HdkkHnRg+o0Y6kvF/+Y6zR5c7BX
         6ruXRp/Wlg7JzcJMtbWmnpX6gRLuWY3CFaa1gEWNrj8fu9l+p2fWA1NmYeT6mCBI6tSE
         ofWvrOJ3UwqXQplPy9byuMQlSBFIcnaEiYaH3AgRTtHcwBe8LWtu+YNaexDRE94OWVs4
         3GQeNQTCra84UgA8RNwkdBqMhbrofO1bBjkkMupfNgu24QL/iM0mlgd38QYm5Ww4toH/
         c5mJ188Nb48fqRUgv7pbPPrI8tKnsZdr3SBngC9aDP1bw9D4v99YNH0uZ3Y8Gn9GASQN
         9i/g==
X-Forwarded-Encrypted: i=1; AHgh+RoahRepvV0POvo+BsDwND6Zp8FIGFpgDVop+bmYSVhp4vf+ok0z+o8VlodFLgLqlaLDJRTASacjTbtEmw9APV3CYw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJoOAoBjdIVbs3kQNAaVtr0rK20F35WZvaouUTtgsjqN+bc0nS
	JndHF6Z4kdZ2DJ5DpvD10uzk7WZTkAI/AzFP4YtXObL2a/x+TQa+3QPIePgWCS5Apms=
X-Gm-Gg: AfdE7ckJ3Dn2QJ3w4OJBwfdmcnRJ/1DMuEMNXmoEhQ7pHrK/BK+8N44jplPCpsrlcVp
	rT1GgKPXvVCHL8tqtA0dhg77gyqq5PClHHKebI8/QEHDzapk0VT1ZtkLpojFH8e/3me7aRRDPJP
	J8tSgGIVDAhkGpvPiexHqTQAkQSW5qXrsDKnQhJ6cyQjG3PNuV7usqwwl5xxPh0WLUrXc7bpcGv
	EmNi5du+BH9yiC77G6APHV3+fCNSqI0EGhQODyOabcH8sUnA5dvC32O9UEv3zFP+sPnc+bo3qgh
	adZyRyZM2xK9w+gqWYMnw3VHKUenZVRWjCKg0RpUG4bZ4urL2bU0OaaFt3+0ZbN7U9Q5UfNWPen
	s3aaaSM0wNbQcld9FKVsEKjcqlvMQ5Eweyc6nzAfL+RAFVHkNFFVlDqcPEe9NDxsWHFUlcBKUIn
	fqhXMcIKA5xCw8DBF+XTjgkqYlVF4HBYDNtdGHef6nTwJ0nNR23OLEnv0jhERedqVpvO0=
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr99512905e9.21.1784452773390;
        Sun, 19 Jul 2026 02:19:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954c841a0dsm151924715e9.5.2026.07.19.02.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 02:19:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 11:19:32 +0200
Message-Id: <DK2FPQT162CE.2I98UR0R53DHB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 2/2] util-linux: Fix CVE-2026-3184
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <jeremy.rosen@smile.fr>,
 <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260520105959.3115597-1-hsimeliere.opensource@witekio.com>
 <20260520105959.3115597-2-hsimeliere.opensource@witekio.com>
 <DJ4MKBK72LA7.1ZVS07CUD82E@smile.fr> <DJRJCATTYQ54.2XO9156CH6Z7T@smile.fr>
In-Reply-To: <DJRJCATTYQ54.2XO9156CH6Z7T@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 09:19:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241280

On Mon Jul 6, 2026 at 3:50 PM CEST, Yoann Congal wrote:
> On Tue Jun 9, 2026 at 5:30 PM CEST, J=C3=A9r=C3=A9my Rosen via lists.open=
embedded.org wrote:
>> Hello Hugo
>>
>> This patch seems to also be needed in master and wrynose, but I could
>> not find a submission for these branches
>>
>> please submit for those two and then ping this mail so we can continue
>
> Hello Hugo,
>
> As far as I can tell, this patch is still needed for wrynose.
> Can you send it so I can accept this for scarthgap?
>
> Thanks!

Hello,

I will now drop this patch. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS


