Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89BED0E6C1
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 10:31:38 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14043.1764066692340953893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 02:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XZHA7pCj;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8845498be17so71608076d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764066691; x=1764671491; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7G++hTnq569MvawcynV8XdiELqUsiO93sGAsKsVyqY=;
        b=XZHA7pCjzNQYt2mcQjpiujZ5cOe2GlEfe7k0hlHdwch/RZ5saSSH92xi9JqONiqdwD
         9HxU9JIGLCSy1gTMuscQ2P7CRnWOhRqW17ZKdW89fI8/45dBKfPOnbe9M4tFz5AL1Kat
         /htNnSKUCHtngorkx6UJlkkPqkJFSLdsfCG3UaHZLw166Cz9r3uzfJo0fhZNGNj22cD5
         VTzaqJx5ZyjS183H5aStF9Uzv0/fo9s3284ui6P9UeTtrILMrIClT7ALGQG0Hii6V6Oy
         3kL7f6/eANnw1vV+alug2/aDWdBV6KRvco0MAKofcXr322hekfeMuzu2cQ4uDm2yDwVQ
         osTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066691; x=1764671491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7G++hTnq569MvawcynV8XdiELqUsiO93sGAsKsVyqY=;
        b=G0wMJTWtIQC5+eeoVhORJ4J2zf6/z6VQMhkiWtYFgXYxAqAlljhWefmAjBfbWFBKZa
         LKwRdu3OjPq1y32/GjkSDuH9Mf1NKVEkp682NXGZa14aOEXA5wB99w1cC3U9X/yPQvGc
         9f5yOAqGNxewE7QbGCHzcRhDmnYeGvTXJcRNT/2txJdoZkqbnuGsp/EOE2IzNgw0hrDg
         2BMzxc2nK7A2Q4gdYSHfzYqr3t9ZmSLLpGjKyT8Z5k+UiTH2s79yuzAtlLCyVl5ugOK3
         mtQ2UG8vSpR+epzJszExZiEC9vPyHUpswWiccxSTQDB0DyJ2UyAuhQBktNurABas1ZUf
         hGXQ==
X-Gm-Message-State: AOJu0YyXSZu6yWii3QO9rqJksonWKOa0L6VGJbhoZUNK5sp0DlQUFizU
	qdTghCFI7Lr+GaixQyrD5RE2xXr5gUElzOGM7L8bhuGkfBU3S2W0diRmyYmYuFnKHW/+zEr+vDS
	Hbuf9t7SA/6NMKSszyio2gQ8adw2hgk2QlA==
X-Gm-Gg: ASbGncuQZrFibgoXcLkXC3Y3urQvfsnklTfFdirJ0FUcCAB+r9UIfGGv56DBUm0Ze3u
	sc7eEl/RyOlUO7NuccKXiSFfXkP+juXUkozgrGRbfgEwLl2Mj5KyD8XHNJ6wFTbkc57gYF/sHKJ
	SNYzBSK3eKx/plxBi/09oAuRvfAdjKawk8Me18K63w/czXJOUmon4EoJNqJwdpm4ev+VNP2myK3
	ysfa7JNjhihARIvGHvOcvHL5UIQz0wWvIBArJugSVsyPigw5JnXoqmKnLpfP3m2RFwV15IBE2aI
	Se0tXyXzOHhKDt7pqJV3Y9xKpobK4g==
X-Google-Smtp-Source: AGHT+IG+xASM3hAj8oZBIQe4kHCaBg2zjX24mB6uZZ1+oYexAtA4FI96BT9SNsBdIhstBQNvZ8SC09GC2XOwLNuxIhc=
X-Received: by 2002:a05:6214:19ea:b0:880:4dd6:20c4 with SMTP id
 6a1803df08f44-8847c4a4a08mr191133736d6.25.1764066691315; Tue, 25 Nov 2025
 02:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20251125090722.2240655-1-vpuar@qti.qualcomm.com>
In-Reply-To: <20251125090722.2240655-1-vpuar@qti.qualcomm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Nov 2025 11:31:19 +0100
X-Gm-Features: AWmQ_bkoPexfEUQIFypNXkg30cz12jAMzECPUsLla2kjjukRD-jTorv9xGVUvoA
Message-ID: <CANNYZj85=33xxwT0hffW=4PeR99crUiTcWRtyTv2qYVLubY6ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] udev-extraconf: Split automount and autonet
 into seperate packages
To: vpuar@qti.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 10:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226762

On Tue, 25 Nov 2025 at 10:07, Vivek Puar via lists.openembedded.org
<vpuar=qti.qualcomm.com@lists.openembedded.org> wrote:
>
> Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
> udev rules and scripts for automount and autonet functionality.
>
> If the image only needs storage devices to be auto-mounted or just needs
> network hotplug handling, splitting the packages let us choose automount or
> autonet package without having to care about other rules. This change does not
> save much space but helps avoid installing unnecessary scripts and rules.

This still needs an answer to the question asked previously: how was
this patch tested? Given that previous iterations of the patch made
serious runtime dependency omissions, I'm somewhat nervous that the
patch hasn't been actually verified on the target.

Alex

