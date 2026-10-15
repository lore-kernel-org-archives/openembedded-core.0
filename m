Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3A7CCA462
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 21:33:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8677.1792100033657886230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 14:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V0vMKRu9;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48de72fc832so699742f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792100032; x=1792704832; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEAn5eSai0jTP10aO+S5kPXlS/lC3v1/8dsgvmrcGPc=;
        b=V0vMKRu9s/XyaAHH+sxOgjiahSSwDW9fw4ajQMQZdVgomGE+fEwcS/IkwU7IDTN3X9
         JhIlSYuVEgCup8XBk3jVgO/paDEZDEyG/yYelcrj3VVLO9i1+gXdTsZ/GvgiCRvPZWSD
         7HDsMIsRSi6Lv2k3AvFm4U1BSw5yWhR2A1nHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792100032; x=1792704832;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEAn5eSai0jTP10aO+S5kPXlS/lC3v1/8dsgvmrcGPc=;
        b=TvSKsxE4Tm47ajGkGGV6jG9/4PVQmHxGsw8M1SH3/Zq5JGZmI6AcBJ8XswUwG7J+o/
         iO/mSTcnD4xD5fNNYqYW2CIQYddxn3+Pwp6ubhj2DmEa4waIby/w2Z/kc+2iZaGh5r1A
         b4BZ/nN8bPYawsiiHm/YJMjv9VTfnNqkFqy0SCu+tV1sMYdBC6IJAUMHp3MrRfOLUU2E
         d9tL+4H1L6GBKJV+oN33lNZxDOnEI6YSl1g/MwUdBCrm/IEZkGQIeKK6aNHDwM5NCE9R
         Oac7l55lDI4Hi8DOaZUst4w8cSJLeCZSDyoyw38maWK3niXYb79lMVJVEu/2yPKoqHjy
         YqEQ==
X-Forwarded-Encrypted: i=1; AKwUvByfZ0WliBaheNBrTeK0vpJFt2R1gpR3Plfg/luO7VHeQLhhRiA+83ZqeOSqO0O04NU2/+MqCDATUF5cYs51ltwoSA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJJN7buns8KeaUIl3r2QVsNSKev51M4PbyME3DSUY94QY7+qgh1
	bf95Jy3vNvwhnbq31Vq3ApjiLmwHWtGDYPscSMIKNTTAsJcKLv22uSJgOO7mReYtoHw=
X-Gm-Gg: AYBFou1GwiL4/M2/bwr1j2NJOZW1aH+c/rL1nS1oqZlaxdpj3idn0QvBFaH42uYPPKn
	UFeeoHpx2Kxax8b4mp0NNnWFyfuk0kauYfkN2WtFX6XItL+ULerNlqRQ61w0Lvw2K7RWZoMT0Al
	17MXksc5yq8Z2rumYdKlfOOub1JtILJI69Gcj87grZeSOGBsx6yzC6CWG/FLjdZLDm1hufdTcaO
	HBF8K4EIlHk48/gXHmGE6ZfGSyKEHfEHfIwTWNRLbJWkExHMD652+yEAXeG8x+Lgg5dNRBE0MGb
	ryFXxFzkb+PHT2n0uyr3iOxsJ8cxdfkBDcXzpkXULpr1uXZ38s1CNZ18yyQbmh9XYwn9aT/97ks
	4Y58lCZ92t2FoY82eNDONQbK9F5MiphJ50RUweXDTJskaxsbahPHp/7PMa2GDDRODF1Qeue3p42
	YdBehxWPgY6rCo4x0eABWOK0R3OeFAXHAg6PpqifcY36G1rGw1e/makDtN0Tmo95iirHivpz8zZ
	Nr/bjaui5C71jFddesKVZcJPKFaI1XlzGiKwcHt56Y/Pc6zRStSaUDaGoPaDDw=
X-Received: by 2002:a05:6000:469b:b0:48b:a4b:5a2c with SMTP id ffacd0b85a97d-48dba7893e3mr27807316f8f.3.1792100031792;
        Thu, 15 Oct 2026 14:33:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm588455f8f.47.2026.10.15.14.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 14:33:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 23:33:50 +0200
Message-Id: <DM5QFWN94ZTR.1JHKJRMRCI8YA@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <devanshp@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 5/8] curl: fix CVE-2026-8927
X-Mailer: aerc 0.20.0
References: <20261007112403.486499-1-devanshp@cisco.com>
 <20261007112403.486499-5-devanshp@cisco.com>
 <DM3ZEZORCSRZ.27QK3IA59S0GQ@smile.fr>
 <PH0PR11MB76163B9949BBA5FD283D5A76D39C2@PH0PR11MB7616.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB76163B9949BBA5FD283D5A76D39C2@PH0PR11MB7616.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 21:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247899

On Thu Oct 15, 2026 at 10:27 AM CEST, Devansh Patel -X (devanshp - E INFOCH=
IPS PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,

Hello,

> I compared the submitted backport with upstream. curl 8.7.1 lacks
> first.h and uses the older test.h harness. Its res_easy_setopt() and
> res_global_init() macros assign to res, requiring the rename in
> init1647() and test().

Ok, now I see it. To give you an idea, this is the kind of info I want
in the backport notes. Can you send a v2 of the series with that added?
You will have to rebase on top of stable/scarthgap-review, I took some
patches of the series.

> run1647() retains upstream=E2=80=99s result. Following
> your earlier feedback [1], init1647() also retains the CURLcode type.
> With those adjustments, the test passes; reversing the library fix
> reproduces the Digest header leak.

This info can go into your commit message. Knowing what kind of test was
done is always good.

> [1] https://www.mail-archive.com/openembedded-core%40lists.openembedded.o=
rg/msg226412.html
> Regards,
> Devansh

Thanks!
--=20
Yoann Congal
Smile ECS

