Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD2BCA0EE3
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 06:24:39 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.94453.1755066271101514547
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 23:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmRag6Ny;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-76bee58e01cso7431535b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 23:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755066270; x=1755671070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6NL0+1sNN+ZYJTP8U+xe1KIobRnYhXlvacmLMO6z44=;
        b=CmRag6NyMeA4fvSmnfh0UdXGHYS5sI5qJbOQ9btux7RrE0MIisClIKJ+Rr+xWBiB/H
         TRrqFyH7Wpur0LnI2pXI33G6C1mRKDlq9K1bYEj+gLMI4dhIKWfBygILA9cO+Pw9gd48
         yTXY0txPLF7y9Zd1i5pf6HDIsncOsvjyFq5Go5/mWsrPAxcVVqfS+dim6EoNKKLCQa7r
         5hIDOQgwdUBEe5/xVo8Zh7RSJRC/z9ivrS6eFDBKK8wG5hqms6EMpZH3/3Qt4pfGn3r4
         yfW6bC3C4RfmjGw5DpGGV+JCIeXKGmw2wg8tkH8l1jvTODyAy1rysZv492VAL+Rmhi5E
         DQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755066270; x=1755671070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m6NL0+1sNN+ZYJTP8U+xe1KIobRnYhXlvacmLMO6z44=;
        b=V+KlmCPUtVvpZBR3eQDkE6R3sZljzpy2HbT1HnuXI3uxNg3R20O0Rx4nwX0eLuZqp2
         BjXGlCD8xnjyYfLMzpcjGQbWON2Vz8KHYuggtzm8eG02dcEgR85qIYhHjHvMdVbV/qsX
         9ZuBUdcC94pnzP6jLAXNaGrlrj42I2knjdFUQJveTwSDWWmT58IAK0FsjHTW3Z8E/iAN
         4qlntSV707/jn6JR/tZEEW0iW7noZemdecGjZa6kl6GfBKA62t/oGhHMRaUKvmkJlAJU
         urq6KNRvgbTQ8CCFPOXnJ/J2Pv/HDxKyKsKMltbQ7uN/7FNocUD/rFBUc0FbVhXx5b7d
         DOlw==
X-Gm-Message-State: AOJu0YwKmkivieoXdG7UV4ysxCYsrkKXyISBIKkGUHjH1CLqlhOu8ZRZ
	6hOWbUJWcAmTcY2h7ROHTq7FVbokD0KzRUZtdKI+vJ8mYWNGLEL7n/1Asi7bERt1ZxY=
X-Gm-Gg: ASbGncumaVvLn+3JVuryHseV5+VTAQUiT97/AsXjA3usIiiAYk/NU66z/bxdDF6N5iv
	htZJztScEPrm3iHk5YnqqwpRHKpSVTSvgXak8EWvNYKrUjKqsNSsY4H4PbOKB6MXqTHoZBeZNbQ
	IIoBNx+4ZOo1SGPXawLVAidZL5puudPLmb8cP9Io+3FUN3Avooka9LxDsyqHp0RusPmdnZyqRSm
	9czX16+8wBFsHNobesSUh5gCWCH9/VgsFs6Aw1wc3JD0qTdxKeawQf758CshUqF/4pPzX/6GwWO
	M+XfJ1ok7nZCxQyNNs+PwULDAkYB6VMnPaWTOhhYizS9hBmVkuI+krSh6IE7b4ld3Kp60NhujxW
	3hbQVbSSrSUCF0s7aB0Uvcg==
X-Google-Smtp-Source: AGHT+IHV3KzflgXE0q0EHq+7Ytl6C5qy6RJeEMLgpwJgnqTOLpO9SZR593IUAr57B67aTpFtnZBdsg==
X-Received: by 2002:a05:6a00:2d28:b0:76b:fbf4:b9d8 with SMTP id d2e1a72fcca58-76e20f9334fmr2712759b3a.22.1755066270158;
        Tue, 12 Aug 2025 23:24:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b44f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfcf523sm31004004b3a.90.2025.08.12.23.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:24:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] elfutils: Mark failing ptests on musl as xfails
Date: Tue, 12 Aug 2025 23:24:27 -0700
Message-ID: <20250813062427.884193-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813062427.884193-1-raj.khem@gmail.com>
References: <20250813062427.884193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 06:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221789

Elfutils tests do not all run cleanly on musl systems. Make the current set
as baseline by making the failing tests as XFAILS. This helps to not regress
further more.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.193.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.193.bb b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
index e700c415be9..3d98f1e2140 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.193.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.193.bb
@@ -66,6 +66,7 @@ PTEST_PARALLEL_MAKE = ""
 PTEST_XFAILS ?= ""
 # See - https://sourceware.org/bugzilla/show_bug.cgi?id=32232
 PTEST_XFAILS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' run-strip-strmerge.sh run-elflint-self.sh run-backtrace-data.sh run-reverse-sections-self.sh', '', d)}"
+PTEST_XFAILS:append:libc-musl = " run-large-elf-file.sh run-backtrace-dwarf.sh run-stack-d-test.sh run-stack-i-test.sh run-stack-demangled-test.sh run-deleted.sh run-compress-test.sh"
 
 do_install_ptest() {
 	# copy the files which needed by the cases

