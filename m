Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE23CF8577
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 09:24:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30599.1763630682030615741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TpYLB7og;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso2896575e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 01:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763630680; x=1764235480; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV7yp9vOPucmZiwIWbE1NeKibN/Kvj7wwT6lXfOcjdE=;
        b=TpYLB7ogenoPCrrW62V6MWzQOET8EUq33VkJsESYz11tm3yVzdDIFBwUQSqx9YG2Q/
         diUdCTVojsiE9yztJhvOjfro8T0bcFFOKqER6oL/LP+Xu7B2VxnQMA8YXHFkLdKwYE2W
         NrDVfRIcHN1I3/9N4CN0EyZ/zJC41SfmdB6XIB8cPQPE1ipY5vpu64cdB89OqZavJRso
         z9HWXHR5PFeTzO345Ir9gcUTdFcqTcy6kuXWJMXIMFTa7q/Gx74h+og3mA16CYWkzoBA
         VMHLL6ajz9QqkxTGO+LKUE47CE/slkwuiQB5Z6DyG5ENb8h76/U7Xd3sE5b4l9xepWbu
         nqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763630680; x=1764235480;
        h=content-transfer-encoding:subject:from:cc:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dV7yp9vOPucmZiwIWbE1NeKibN/Kvj7wwT6lXfOcjdE=;
        b=xSYwtZbuuw/cUA79WuPjNOVVjPAQJVG2XBfubE9pLVmfKJlQ/+k5gSnVDV5F7y80FV
         JCLD5+xXTw211UgTL9byvF6Gk96RyjriyYC6SPVPBciARRY/9mEjtLmWqIImOtdHb8pj
         hC8pmFk2ULtbV/7+KZMsV7VmYENi13SCL5lk248rzecdtRd/F32vdlRF9AfTZVB49g8W
         kxe73f+80hRLN4OIiEhLC0sgANrVW/oPoL27Ddpx0SUEnTI81t7N+0QgWaq8JRXouW9p
         hE8e2taR+WFvohfHrKBLgG+iqdyvHnGLuzaalXf8bRSKLolePh3ozDut0n2oQ+uypmj5
         tq8Q==
X-Gm-Message-State: AOJu0YwkF0I+3UGDH7ny9NI6VFtaa0g/OPIkzstfCKtxBgqIdQzVGRZV
	b06XUxn63zIJ3vS1hytI3WjJd0A1FgD4CEi3TFyQIDhRzIz0Aq7eIvoSIGFw3g==
X-Gm-Gg: ASbGncuXKM2Yt10eloFr2NUvgRsRIWLIS25q1xFUOQjwX0CX23iOdNB9KwzBfGSQ+0d
	aFLX5oB817M2QGRXQdHMe9hFhOL4JKcKjO4FiYzJkNgi9mtTgwLrBmBWapBwvhjIHCE0HIogHb5
	q8iaO9D1MZfXnzl2539bPuyO0G8CYqR2pQecz1sIgXr0e5+lBnNVd8NhlmzETnhyc5TzYwuWu6j
	D7SM6WvQwg12GtDMw3GQYvck1E35/oIxoBc0QofljZ9+rikPEES7ZgwRcv9lQr93llABZRhxMMy
	MKTzwvy4apWQn5SX6hu3X22H2rnKQSXD/H3aPIZbFh3IZRaeobob7X1e4NewkhMPxRbDSEpSQtj
	eFRs8w55HghRbppBPYzgguK16PBL6FqArSklQdU06ITtPoe+M/0rBCk3lJE+4M+bwuL7OVfLZo0
	qy0xrfoHGvHYh2lU3v7/TNK2Q7NBRWk7JwxUsU2kxatauL
X-Google-Smtp-Source: AGHT+IGkLU/j0Eba3hbjhMIdAKMw6zjv9v8oWIAk2CSZN+VlHuAP9It6SF6CuSRIwobI9LM5nrxwIA==
X-Received: by 2002:a05:600c:1909:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-477b8a6470fmr22304105e9.10.1763630679742;
        Thu, 20 Nov 2025 01:24:39 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1076865sm96459935e9.13.2025.11.20.01.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:24:39 -0800 (PST)
Message-ID: <24e06766-bfdf-4090-9f13-ff6f5dbdd21d@gmail.com>
Date: Thu, 20 Nov 2025 10:24:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
Cc: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <ross.burton@arm.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Subject: RFC: remove STAGING_DIR_NATIVE from CMAKE_FIND_ROOT_PATH and specify
 full path to compilers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 09:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226609

Hi,

when I recently tried to fix a lot of recipes in my meta-python-ai layer
at https://github.com/zboszor/meta-python-ai to actually be able
to cross-compile, I came across an interesting issue related to
python modules using cmake internally in their build frameworks.

Here's the python3-onnx commit that needed tweaks in toolchain.cmake:
https://github.com/zboszor/meta-python-ai/commit/a1b466ec0db66866ff1c817fd707c33837ec0225

The problem was that the pre-release onnx 1.20.0rc1 uses nanobind,
which in turn seems to utilize both STAGING_DIR and STAGING_DIR_NATIVE
as currently specified in CMAKE_FIND_ROOT_PATH. Then cmake
rightfully complains about libraries in recipe-sysroot shadowed
by the ones in recipe-sysroot-native.

Removing STAGING_DIR_NATIVE from CMAKE_FIND_ROOT_PATH then
made it necessary to specify
* the full path to ninja in CMAKE_MAKE_PROGRAM
* the full path to compilers in OECMAKE_C_COMPILER and OECMAKE_CXX_COMPILER
* some other things, like the full path to protoc and python3,
   because for some reason, they were not picked up from PATH(???)

My questions are regarding cmake.bbclass:

Would it make sense to make the use of STAGING_DIR_NATIVE in
CMAKE_FIND_ROOT_PATH for target builds optional?
At least provide a choice to opt-out?

Would it make sense to specify the full path to C/C++ compilers by default?

Would it make sense to add CMAKE_MAKE_PROGRAM and the full path
to the proper binary (make or ninja) to toolchain.cmake, depending on
the value of OECMAKE_GENERATOR?

Best regards,
Zoltán Böszörményi


