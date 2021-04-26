Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.11685.1619463216605220645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 11:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CQSoAxKs;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: petr.vorel@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id a22-20020a05600c2256b0290142870824e9so933wmm.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 11:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=VlZRY0YC4E3pBCFI9QRP7TqNUkP2OrbCqZSc1fSNo9I=;
        b=CQSoAxKsMrUFWRAN6KFSe7/Khpd4KMtFyMAXvdIk+O17PqgprggQ1oRCaOO0x1tzdW
         iO0zizWFqo894ALQ8iStJHBCZotoBoeFcRTM3kcUS/136Hwjq6JyuAG39WCFmyGywwBh
         9urJ3o4oLYaoj0a1Rga93TKzpW5qGePS/TGgPqS278UVRVnc3Tuc/nALIE6K/HSIrbv4
         v1JV8/tCNYiGPYi3YzpzHHt+ibHgnzgvE+qjYcYJFxr39fjs4rqCpz2GqBHa/nEBRGu8
         iGgfEidJNtpUW541VxL5GuJrpxGXC196OhNqj/u75j+7H9ERLGElKbsuNRdQsKMg4f2d
         /Cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=VlZRY0YC4E3pBCFI9QRP7TqNUkP2OrbCqZSc1fSNo9I=;
        b=t0Rtp83ayAyuAgkU1jTeQReMUZHgO/VcTDuZADTfKwgvTkDCu9azVeqr16LQ/qHYLg
         T56xUOm+uVrt1huCQrKT134mT4H9U83AI7kigX2Y6B7193bl7LtG0FZe6Pqw4Kdyd5c/
         jv/XN7VVd44UHNzwBp0Z+1TPINMOQrlCMl1gXG4T7E+fdW8SHCY89t/Q4AjJpzPMnYxz
         wEBh6Zn7ouu6rtmmamACTYeMFnFocihLYrhZ6j2M3+O3AYhfXishxGh4rF4vPiNRlrcu
         e42499de/6x7M2LIVIxyx02PENY+qdKlG4nhxNRrZCt3QVnMwMinYnVmQcUQ7G7S58We
         YZVQ==
X-Gm-Message-State: AOAM533QLUMH1PnjcKzYpdFrvaA4HwXQKM0wvJoQIa7lBpw9UgC7gsMN
	HxZ3kzvhPg/Q9Hs1EslE908=
X-Google-Smtp-Source: ABdhPJyFiyrvzmsAb2waVsnivGmrG+/Xo2OtJX99ftskYKPZ+pApbTYS3v8hj3BUnW5yaavcBLXRJQ==
X-Received: by 2002:a05:600c:4f8b:: with SMTP id n11mr14130260wmq.136.1619463215075;
        Mon, 26 Apr 2021 11:53:35 -0700 (PDT)
Return-Path: <petr.vorel@gmail.com>
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id a9sm1170022wrw.26.2021.04.26.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 11:53:34 -0700 (PDT)
Date: Mon, 26 Apr 2021 20:53:32 +0200
From: "Petr Vorel" <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: LTP drop MUSL specific patch
Message-ID: <YIcMLMtsNSTlinqq@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem, Richard,

I'd like to replace MUSL specific patch
meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
with just removing broken files. We use this in upstream CI for Alpine, I ported
it to Buildroot [2], where works well. It's better because it does allow to
handle MUSL without rebasing this patch.

I was looking into the docs, it looks to me that do_configure [3] might be good hook
to add it into. But it looks like by default it contains oe_runmake clean [4].
Or should I use different hook? And how to find the default content of chosen
hook? (if I need to extend it, I'll have to provide the original as well)

Thanks for info.

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L35
[2] https://git.busybox.net/buildroot/tree/package/ltp-testsuite/ltp-testsuite.mk#n72
[3] https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#new-dependencies
[4] https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-tasks-configure

