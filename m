Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0952C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:12:18 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.14517.1751641933605295684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ms01lCxr;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so1699137a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751641932; x=1752246732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVKdrbu1nzTCImNs5KLyYrksVMBlCJC6OULv35MS1+U=;
        b=ms01lCxrCd5ox21HL5QnIBaS9iwBZGMl3fIxpCtrvFR9A8yCxrmiBX4U4ebl/RAzEm
         51yp68WpATAqPm8VvwV/T9nRx35aQk15tQpua8jl13enQ1ykyWf5w7Ighde5Ff1NQxdN
         4Zv4mxcVtP4Owpbp1XZ3yS5cFfwTF5mLs00bURljRehZkVr2ybUZSd7QUdQBTJCFdk+j
         VwIocChbD7aLDTT5fxjrl9IJkoHe8NMEf2+3q58oIk0PuPSVgU4k0xd+Zn0pEDfRc9vE
         ktN5K9R6ywpSg+E7zPfuv++j6+eBSE2+m/rraE5aeVmEI/aWMtFBCDP78dB5jcRLaNKe
         wGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641932; x=1752246732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVKdrbu1nzTCImNs5KLyYrksVMBlCJC6OULv35MS1+U=;
        b=tdBpp+iInSWQfSU0DRMqqTmHnPUCzXRZG29FShv9Daeg+luK3LaKeJgxKzPQ7/Spei
         PfjGkuWm4JfKAkX967L0K4/WcyJZN71sZdQXLbQYQS261EalyMnRREd8krI7XIYNU6Fu
         sE/v/STSVmOAwp6g5fIOMaevDWmdn0QATSP1hbwvNBcbXcDfMShmjrXPUYvwFKGeh2+0
         eE0HEom7YUIRbZ4GqJPaH5azgqncQIAdjB+6XYaMVD3Ciy7qHvh0xrnYKOy+yqIPszJW
         1bhq+rkmKEcYwsSIvrqoqxtgPaPOtZUJsw2XKg4NKniNiCA4expfUY02xat/e48plmKA
         A3gg==
X-Forwarded-Encrypted: i=1; AJvYcCXC0DQBOOVbjnssb6Yv5oK09u4NNL+YCeS7zjWtO6iXx2ArsJCMEz0/3pyu7+E5lrof0P5idWurVJCJVvz2T9GD/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqFuTp0YzerR3aKTo76fIn/nARp/DUQ6+j/7Lu36e8xhfatGaU
	yJwmRt0XQAoHOKVtQd26eNl5qeMDOA3Vwswn8RrZppI9OkYJSAXytn2o
X-Gm-Gg: ASbGncsd3nSMUmoYeb4OVq+RN2dQs3Y2Gj8jDaIcbfBZb4JQE703Y9cnHItzorAGes7
	4COaRr94eBnWBgTye9GQ6ipfjsG7hRAslXXebQMMwLr0c5sPjnVHUL2zjntX+GCTHhk9GVjDo2f
	RfGOGdcToFZ/jNoNI51CVgh0g2XBa/0Kd+Os3AppozX4iLQaZEoXckn0iGOZ3WPzK3I4jKahIQA
	NSga2l+2RX5wicev69SHZptl41UcyBJjxPzY2w4OgmcK6HOZjQvJFF+S3cKGZi4Y5vq+s4jITVS
	uv+jgWs5L4lha9nZZ6P5KqCIONhv7azJd9XC01b5dKNr3z/VUvk4COCg9lkH
X-Google-Smtp-Source: AGHT+IHmsMB1GCWE7rTfuKRdnoS2KOyIOa6/LqoxBkp7B3gKWPZfwy+33ete+Tp3o6+hILGlnmLAlg==
X-Received: by 2002:a50:8ad8:0:b0:606:a99d:91d4 with SMTP id 4fb4d7f45d1cf-60fd34a22f5mr2269851a12.27.1751641931653;
        Fri, 04 Jul 2025 08:12:11 -0700 (PDT)
Received: from elitebook ([93.159.20.3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c63f9sm1443404a12.72.2025.07.04.08.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:12:11 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: michalwsieron@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Add relative path from B to S to
Date: Fri,  4 Jul 2025 17:11:54 +0200
Message-ID: <20250704151153.286734-2-michalwsieron@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <0c9426e4e7ff18ddbad4845e13f9a289e1ee9191.camel@linuxfoundation.org>
References: <0c9426e4e7ff18ddbad4845e13f9a289e1ee9191.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219938

> It gets even more strange as if you swap the build_root() to be before=0D
> the source_root() parameters, you see:=0D
> =0D
> /usr/src/debug/hello/1.0/build/../hello.c=0D
> 	/usr/src/debug/hello/1.0/build/../hello.c=0D
> =0D
> which is actually correct. You are supposed to order them from most=0D
> specific to least specific. That doesn't change the fact the output=0D
> from the other way around isn't correct.=0D
> =0D
> I still maintain this is a bug in gcc's handling of the prefix-maps.=0D
=0D
Welp, I used the same ordering as in bitbake.conf...=0D
=0D
Anyway, using now smaller set of flags=0D
    '-ffile-prefix-map=3D'  + meson.project_build_root()  + '=3D' + map_to,=
=0D
    '-ffile-prefix-map=3D'  + meson.project_source_root()  + '=3D' + map_to=
,=0D
I tried doing the same, but now with clang:=0D
build_root() first: /usr/src/debug/hello/1.0/../hello.c=0D
source_root() first: /usr/src/debug/hello/1.0/build/../hello.c=0D
=0D
So I don't think your comment about this being a bug in gcc is correct.=0D
Unless the same bug is present in clang.=0D
=0D
I can't do the check in Yocto at the moment, but if you say the=0D
[...]/build/../hello.c variant is correct and Yocto would correctly=0D
populate -src package, then I would say that's the answer?=0D
That is, to change the order of those two flags in the bitbake.conf.=0D
=0D
Best regards,=0D
Michal=0D

