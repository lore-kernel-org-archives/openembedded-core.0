Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CA10C4828C
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 13:35:22 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.15959.1706276120699357048
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 05:35:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BQPUXV7Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e60e137aaso10176465e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 05:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706276119; x=1706880919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iG3pNsTHKCM9haeGeHhuuEJtKcYOOxPWEp7jj/b9cqU=;
        b=BQPUXV7QYXvO+rCZTmfT/+jANNri3d9rAt10gNmQpscLKUlZbFZhilu9Q8lpXEJnQO
         M5Kv+iHgusqF6uhneQ4O643O5F7nM5JW2MME3JuiIppF6qEcqViUUAAb5YPsveFpIhg6
         gj68LZcFHb25LXIqWc9dbt7cHHJ/vDThsxBUkPbx8MSr/ulHoyviNkkCug7uBPe75Cb+
         xHQjAZLssrRwehkuMpmbsiqUjDPOEC5+1gH9FvBxE0JJhOdmLFwnxqEVHswkhGx/1Lgj
         7owUmqQpB6y8jtcp4Z28iIjCxjtIQofJc/NqBPmXsh5UM9etPl8LepQD6sylFmGPzNKo
         J0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706276119; x=1706880919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG3pNsTHKCM9haeGeHhuuEJtKcYOOxPWEp7jj/b9cqU=;
        b=kew0b8x00ph4v1UX5oX/UbTSySlOxP8r/P6u7TS+JA6xOUNcFJMEtRgWGEmFlLcZ7F
         oUc7bMlY4jk26T+yjIoG6P1JMN44J99NBkjnvBFN9YqbTQjAJSJCAzdkHsEueMqWtwps
         5Ttb0KOrreC6hLRVsop2bXnzD9bblp3YY/v3XA+eRvAnVcaD/SGEaYHjrce3nuS1/nYH
         u3tBtHzOgAGuEtUq4+b383HHt4aao170BNSSsCYMBcGAIGdRrMIdfRxmaFq9+TQaApyH
         j8nMwNV7A/LS6BrPOnIsyWE4NfZqcZwuFar9TxxrvOrfEDMdTAFFh+O5XeJt39EkdAjv
         xtPg==
X-Gm-Message-State: AOJu0YxI87ITs7moNeM94fmAowLmzEMVDl2IBLJGlFBAOIZWYMoXWcQC
	PD4QKKi326ubNP77gro1H8UHlSK1wFkKf46/UPE2Lmpldke6OGyecdY5sMrh
X-Google-Smtp-Source: AGHT+IFmBoGME9jG9En+rL6YL5YKti7eXR0+oLDjr381RmUcSQydXgHm6MtWco07lTIejHLL1hJJkA==
X-Received: by 2002:a05:600c:40c4:b0:40e:a5b8:a27a with SMTP id m4-20020a05600c40c400b0040ea5b8a27amr858406wmh.106.1706276119036;
        Fri, 26 Jan 2024 05:35:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id vg14-20020a170907d30e00b00a30f3e8838bsm631554ejc.127.2024.01.26.05.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 05:35:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/8] classes/package_rpm: set bogus locations for passwd/group files
Date: Fri, 26 Jan 2024 14:34:53 +0100
Message-Id: <20240126133455.2609378-6-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126133455.2609378-1-alex@linutronix.de>
References: <20240126133455.2609378-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 13:35:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194366

Since https://github.com/rpm-software-management/rpm/commit/f3eaeeb7341085e1850e914350cf1f33d538320d
rpm does its own parsing of /etc/passwd and /etc/group instead of relying on getpwnam() and friends.

This has an unfortunate effect of leaking build host uid/gid values for users and groups
into the cpio header inside rpm file (where previously those were always zero).

Installation of rpm packages relies on rpm header to set files ownership, and that
is a different structure that is build from .spec information, so we can avoid host
contamination by setting the paths to something bogus.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 3ca6c5aa7b3..e0f4de42a15 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -722,6 +722,8 @@ python do_package_rpm () {
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
+    cmd = cmd + " --define '_passwd_path " + "/completely/bogus/path" + "'"
+    cmd = cmd + " --define '_group_path " + "/completely/bogus/path" + "'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
-- 
2.39.2


