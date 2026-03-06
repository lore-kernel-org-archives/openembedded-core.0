Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3610FFCC05C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 18:42:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1917.1772822533176252255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 10:42:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YkQaE9a5;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48374014a77so115052955e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 10:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772822531; x=1773427331; darn=lists.openembedded.org;
        h=subject:to:cc:from:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jb7ISJV8sF6fPWe9IkXmy5KxdQQNMf8VFK8hF9EsnlE=;
        b=YkQaE9a5iQJcirk+Xu9U/Xr1inttPzW0LG3jqxgJv1y5CwzBn7pxnaUk8NU+XtGEHE
         cJlEDESBp9RiPwaSrkbR2WlcQwgGIPwWGAu6BHhMFG5WjXQsD13lzr1Rvmu8jvyK+wvM
         OOSwYM2utdAAAFIvGamc1743as7qYjbKqcJ1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822531; x=1773427331;
        h=subject:to:cc:from:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jb7ISJV8sF6fPWe9IkXmy5KxdQQNMf8VFK8hF9EsnlE=;
        b=HGQjktpMxfNv78XR45YMm2dfUGRWK8EFeF+BjiB3G/5bvbdZcuNadHLkqFTp9d6efw
         VvO3hgBKndalIao08Y1dRtfNu1o6kAj1/jgOziQuRxhR748GdsQt89rzHutENhPfZWye
         XIEXVt4kNI3q8PKJsvuki13BOUsiflg6yPwSAYPZtX0wBVBf9QMMGK762AGEHYk17/Bm
         CgsjQjoR8kw6wAteO+NTxO/hFayduYGk2+ADDmB0pqaxCwfFlaaKMDSEm4mQPQf2LAkG
         C/tBpa9cFEfp+UJnImqc0lWQFbDwXimDjeb/A1YQQ/Bq8YtT3eVJvHjm2z1goj/Wbee9
         yPzg==
X-Gm-Message-State: AOJu0YyrU69dWZigdurNs1fvF/IDq/K5ES1tOWwifEnbX5MG4zHwCOdN
	BdTdMoOVw9kUQXdROFz6CTbOeDqmbVthsLU6IoKvMpGNEmL3gBWti+c+TYVasZr4j9qW+U05Eoz
	7PnVI
X-Gm-Gg: ATEYQzzmmhvM74sTfbkCL7Yib8jfxd40wqz8AlA4By4LL0Ffh4qOdqbCVY42d7ocWGP
	lF8DhrBB7XkRVd1JuV5907ACKklT8C4QkB+rpBZW+VprTpsIJonq8ZA1IaWnrTsZ5zhdlaEbrKe
	nqPAdgb5THgiBIuMAetNH9dIc2j0m1BurTrbGce7Ztv3D3iMWdJQIhHh4md5JzzZnuwajf0yP4I
	K1GwWRO07vziFBor4pWRGKEa8hFc7ehtBP8MgxnsIvYDLsoPyBjHQK68ZBa0KO/IrydWBH1TaRL
	adDFpLHpByXR99eq9LNy8QDE5vDsCcXcJy7//UkhBrvMLHqF3S1bK7bVDll9MJZdCUzRaQgGJTC
	NMIyGNIGnKyXKBJ21USHMtVzgxcJK/CXmbqYJr/pf//cyeMVQUQ3XfSK1xhdNCKhq5LNkme7+II
	gc8eTfnr3b37tPgezN0b/wrSN6mLIID94++w==
X-Received: by 2002:a05:600c:8a1b:10b0:485:2af3:3f91 with SMTP id 5b1f17b1804b1-4852af3406emr16878535e9.14.1772822531345;
        Fri, 06 Mar 2026 10:42:11 -0800 (PST)
Received: from localhost ([212.133.41.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485237f2d2bsm24717255e9.4.2026.03.06.10.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 10:42:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 19:42:07 +0100
Message-Id: <DGVX4XQ6VLWT.1HOMXA78ZXLBG@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, "Shaik Moin" <moins@kpit.com>,
 "Pratik Farkase" <pratik.farkase@est.tech>, "Naman Jain" <namanj1@kpit.com>
To: "OE-Core ML" <openembedded-core@lists.openembedded.org>, "Yocto Mailing
 list" <yocto@lists.yoctoproject.org>, "OE-architecture ML"
 <openembedded-architecture@lists.openembedded.org>
Subject: Clarification on ptest/selftest backports for stable branches
X-Mailer: aerc 0.20.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 18:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232584

Hi everyone,

Following recent discussions regarding merging ptests in stable branches, w=
e
are clarifying the policy for backporting ptests and selftests to stable
branches.

(I'm transcribing the Yocto project TSC decision)

Moving forward, we will apply the following criteria:
* Backporting new tests is acceptable only when they accompany a
  corresponding bugfix.
* No standalone tests: If a test case is submitted on its own without
  fixing a specific regression, it will be rejected by default.

The rationale is twofold:
1. New tests on stable branches add limited value if they aren't targeting =
a
   known, occurring issue.
2. AB-INT: We cannot afford additional intermittent failures.  We need to
   minimize the risk of introducing noise into the build results.

Regards,
--=20
Yoann Congal
Smile ECS

