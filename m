Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B3DCCD193
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 11:35:56 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.3948.1760787347349144961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 04:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtjBs7h1;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-427084a641aso935527f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760787346; x=1761392146; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQOF7K9X+SpwyYL83gdrHa/3UD5kLHW43EpmzQUfemw=;
        b=VtjBs7h11ZfjSrnOhQOoFgt4cyaBoPYHkP7BnPn1jbkKCLu6GMtzMoxLoLQkGFuM6l
         EbLhQBQt4IyqZNBQFys0B/pThkGyUvZM0hYpHmpkd8vEQF0xZBnzQYAAbYf4aQbcFDR8
         ZSR2tCGv7lSXiZaGxdi/kpgJCQYNyV8I/yJ0bWf6lVi6b9jVDhu1r1W8ORMABXxni51t
         kM4LmesSMezf4qjhyVA8b5UZHIhcPpSJSGd1JqULvE7fOOHiiqMUUea9q+sV/61WWx2d
         CT81al4DQDu5TEIpZvMbheJXuwyN/HvrRIsrCyWXLYU0wm4d0QQxtDamK9xKCp+v61FK
         L2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760787346; x=1761392146;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQOF7K9X+SpwyYL83gdrHa/3UD5kLHW43EpmzQUfemw=;
        b=kbs2gFrq2FeJCs7NaarxAhKYuaLUsS7tjdaAHSp24aMoyeJl+CXZvXsunU/bRfSx2B
         tyvlIq5UjAwmJj9pF5tjMfihLBU5Drb+glNNgAa6fAqWBp2PbchBZVwP/39NK98kZquh
         G5p1uB3Zv3nI1NSQLGUgloOWnlxNoJ0/NBYYUdMlSyJ3E36FkX7FNULd8kyofwev8NeQ
         4N1/EEfymwwSUrLI1JR2PgkWCZjL7WveRVgeCBXs0DrRtRR8rFvec0feRWtzfK8IDmwe
         QQ8fv4Trk9WhdrAIwsrm2CgFsBiOiyBnyJ0gDdqz6sacqTDMX55UY+xt+m0M9t7d/xMj
         /vdw==
X-Forwarded-Encrypted: i=1; AJvYcCWXjaCB9UDc1uE6TfkRjUjEtId8WuA28PxIPxQ1e2PAGVAo+56HLkquC/XR+bwf0H9OOnbZUEYeWTGR1Xt6PymjOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw29jAPpCxjgSpO80JEpcjuCcWR6/YECK3hRlgvoeOtTuhuQNa3
	lHZViEQkRdiR1I6q5RqwD7NhjYZP/K9h8/nrXjXaKx6LfFxDEBjyBmHC
X-Gm-Gg: ASbGncv6sKAc1BFK6InKFJRq6ZrCUKeJQxGrHgFMV3n/AC3KBIFbTWUmCdYCy6DPDiu
	M6cBBj1c0avInCjPOG/xg5tm/q0Snb9/gDMLcNzZkMJJlkpdi2u9Yjx8ckixmNPRD9YGz/Rm0cv
	h/ObKFp4JCzJYsglwKswEnCcgAmPCUHM5i86Z6sih1sOC6sr8jB3n2Jrz9RoBF3dI+V3cODElP+
	6oisPxVZq4EccGI/VyBEHBof+HPVgt8kjg+TcpG2ZYdaE7AEAJFsm9Am/lVF3N52WYlUOY5NQt3
	hyMpiIG1rBTEkZRRTr7wOhsWPJTeOsZI+/hCHN80y/xcNAI6nDnbZ9fd/vbmGfmkE1ldBXrGkda
	tRVWP8fI6lt4NZUuF7NMYe/PexrqvoHQjri5+rP8xczUsLoK0mQsVOpcmmjKXT+o7DMHS8muoXu
	sUQ3OgV4PDDQNgWsZYZtl26uHp98wr7g==
X-Google-Smtp-Source: AGHT+IGHbshj3mK/bFqiCHO0bAkNY4iO2AaDMU7s4fu0KfT2cciigo9QoCKCzkiH/Z9PC9N5G4CLEw==
X-Received: by 2002:a05:6000:428a:b0:428:3cd7:a336 with SMTP id ffacd0b85a97d-4283cd7a3a7mr1260537f8f.63.1760787345515;
        Sat, 18 Oct 2025 04:35:45 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00b97f8sm4427261f8f.36.2025.10.18.04.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 04:35:45 -0700 (PDT)
Message-ID: <808cc282-e13e-446a-a79d-aa39c2cb55f1@gmail.com>
Date: Sat, 18 Oct 2025 13:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] pseudo: Add hard sstate dependencies for
 pseudo-native
To: paul@pbarker.dev, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251016-fix-pseudo-native-v1-1-7c42af094122@pbarker.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 11:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225074

Tested-by: Gyorgy Sarvari <skandigraun@gmail.com>

On 10/16/25 21:11, Paul Barker via lists.openembedded.org wrote:
> Where a task (such as do_package) runs under fakeroot, the corresponding
> setscene task (do_package_setscene) will also run under fakeroot when
> restoring from sstate. Assuming pseudo is used as the fakeroot
> implementation, we need pseudo-native and all its runtime dependencies
> to be available in the sysroot before running any setscene tasks under
> fakeroot.
>
> We already add a hard dependency from all do_package_setscene tasks to
> virtual/fakeroot-native:do_populate_sysroot in base.bbclass, but this
> does not cover transitive dependencies. So, extend the dependencies of
> pseudo-native:do_populate_sysroot_setscene to ensure that the sqlite3
> library and attr binaries are also available in the sysroot before
> running fakeroot setscene tasks.
>
> [YOCTO #15963]
>
> Signed-off-by: Paul Barker <paul@pbarker.dev>
> ---
>  meta/recipes-devtools/pseudo/pseudo.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
> index 22c934977d9b..82499cdd74da 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -155,3 +155,10 @@ do_install:append:class-nativesdk () {
>  }
>  
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# Setscene tasks which run under fakeroot must not be executed before
> +# pseudo-native and *all* its runtime dependencies are available in the
> +# sysroot.
> +PSEUDO_SETSCENE_DEPS = ""
> +PSEUDO_SETSCENE_DEPS:class-native = "sqlite3-native:do_populate_sysroot attr-native:do_populate_sysroot"
> +do_populate_sysroot_setscene[depends] += "${PSEUDO_SETSCENE_DEPS}"
>
> ---
> base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
> change-id: 20251016-fix-pseudo-native-221fe3fceea4
>
> Best regards,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224980): https://lists.openembedded.org/g/openembedded-core/message/224980
> Mute This Topic: https://lists.openembedded.org/mt/115795308/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


