Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BE5FA3739
	for <webhook@archiver.kernel.org>; Fri,  2 Jan 2026 11:58:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3875.1767355102238837672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jan 2026 03:58:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cUgoksMk;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8887f43b224so183466266d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767355101; x=1767959901; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jiAhEqY7cmJHhMs1z9fCKWlorEONvoMOvKvjNDm6C9I=;
        b=cUgoksMkC+q8gXg3suGOFTBvNNfIbYk9SNy/pbiJvV/Ald4EhFRrLOYypor8TQrSHd
         KdcXV0ftigtgPK5cYcC8+AglZ23TC966+JQT08G1QpBvUZVWlfov1PSX/gnNajAoCrbU
         fqhHO1Jp3/mukPbLeSYuiXggnysAuQfTpn12OXOrVK5X+MtS/LRJnJ/mrohV66UP6hX8
         Fo0K1d4YPzW6G0BIGmzSZOs5lU1s3dRRKLBWMd9pGSl0iFOwWJjZctgJBabPsQj7rHrS
         AUKW9QNkNdQf7jyamo2Hi6OKo+bWLKUqVSNA6TCy4qD97PxdCalRalAtL+NhUVYtPiXs
         78GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767355101; x=1767959901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiAhEqY7cmJHhMs1z9fCKWlorEONvoMOvKvjNDm6C9I=;
        b=JqpgwRfi+pCtVEcn+kKBxBGJ4jROH2AmNbr5CUnKIuTnPz+X0f/j2qTIBv/kylYUTH
         uhlx+WiDzUIp9whEWxLNRhzfHnuCJxsiakvq3TGJHeddM/kcrTk5ugB2HuUtLKnvmvb8
         VtJD7Uq3heKBF/dSb+/C0RCvz8hpgy+7JvaeJcw91IKeLenq9yYQBNJtLX/zUfq2Tv1/
         lMKV8Bhp9tteM/IEUuTL+Praetj/neVG4gp+mLgeriSDdlpNKIG7BFAsmn5LodJWQ+/G
         zBDgWpz9w9exhJYswjdVebnb3Jb1HSUs6bvZKwMo6z1vsU/CuruDFMbqJ5ygUIV2RH00
         EB/Q==
X-Gm-Message-State: AOJu0Yy77FtFFe83AMlmU9MJh2VJSccYsBRzyJmEyn+5wxDIju0klNmT
	FEXEqx6yQps2dshvIj0Hpj4Iu3sT/gPD1FJ8rGUV6RvOcrb5BZLR99TXf48pCaIY82iIuauMlyD
	0RO001mth4EZqgDMP+mG549vzPTC1dM1kIQ==
X-Gm-Gg: AY/fxX4VhlJoRv9U4fGAXb7Sg9mps8nUfC3daf2IU9MdaUT/Gf0X3ONC/bapan1xn9h
	L1wHmJaWHqJCbnriQ6o8EcLhwnnXH6/2NFUNSmoZQiiVAyylqiI5YgKQCDTPE1FsA3fepA6yDKy
	oDf4jkf+ZOPkw7ByEo46vT1OoGWa34+ZB57SRYUV8UhgTTGbnif1Zj/6GO4pMPyxv+kGAI2p/Yu
	/qVYw5w2sT4L/vKpqhNOXQufE4c9TN0mgk3h9Rah5ZlUOpV+/rOb1qmVWV+DlJi0gQcba3rB+rT
	FnFl+PeGPKPbfvZhsjo06XYTtXDhrg==
X-Google-Smtp-Source: AGHT+IFNLnX+dE5CD2CrjgcduJrUeOjU8if/+EsLD3jWH5ANb6V0mvGxysOff9k2Iygkx9O0aX+yhrlV+QfdZsQSOu0=
X-Received: by 2002:ad4:5852:0:b0:880:5193:1102 with SMTP id
 6a1803df08f44-88d84334621mr505060296d6.56.1767355101068; Fri, 02 Jan 2026
 03:58:21 -0800 (PST)
MIME-Version: 1.0
References: <20251229124538.1535197-1-alex.kanavin@gmail.com> <DFBMYE2AZW0G.2OICW0SD4EGBV@bootlin.com>
In-Reply-To: <DFBMYE2AZW0G.2OICW0SD4EGBV@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Jan 2026 12:58:10 +0100
X-Gm-Features: AQt7F2qVsF2DGB1XgjFfIEwLeDIXB13Up6BVapSTbPprcrbkMJd5c4huZKrBbnQ
Message-ID: <CANNYZj9N=vQECr+oRj8NKcbS95kztcuuVW1frpKrBBu5tYGy6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libnl: upgrade 3.11.0 -> 3.12.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jan 2026 11:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228836

On Tue, 30 Dec 2025 at 15:54, Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:

> Just some note: it looks like some ptest is failing intermittently on
> ARM64 after this upgrade. I'm not sure how bad the whole situation is,
> but it's bad enough that I already saw it fail twice today:
>
> Failed ptests:
> {'libnl': ['nl-test-util.c:Core:route_1_The_list_of_2_routes_did_not_find_a_one-to-one_match_with_the_list_of_3_expected_routes']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2800
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2802
>
> Yet on both times, the rebuild succeed. No issues on other
> architectures.
>
> I will keep the patch in my branch, so I will try to monitor the failure
> frequency.

Hello Mathieu,

the update has landed in master, let me know if you see it happening
again. It shouldn't be difficult to patch the test out and file a
ticket upstream, I just want a definite confirmation of the
intermittent issue.

Alex

