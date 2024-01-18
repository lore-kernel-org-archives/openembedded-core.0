Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E97C47DB7
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:24:34 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.8365.1705573468917752473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmoe92Dm;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so104214966b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705573467; x=1706178267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J79iMIi+g28FozIB4ksQzVw72H05lO60U/TZX4kDPa4=;
        b=dmoe92DmqzZGtrNxyHrUhkcroDcI7vUPd/h6g+bNCrdqtKnrvcq2KxhtwOXJ2IJ2sI
         lR6kt9Wu7wTO5ICzAaQGYKoGpNPTbeSY2JH+2vRTSx6EBL015b+Zvbt0OW9YpUg9jD/c
         Xx9UoFoXMQW6PQ5m+PrfQZDGEXSQCATrALvBUp4SeKM25Xcd9qWdUpGuTPePozmnjiYI
         AmJq2VtF2G1KlTKYTpzws/Miv11ODMBkxTHeTLBwB6DSCSJWfXcJkNTXRb5xOnYguy1/
         RNrtL4+58RgAfqFd1xsMWhY4wfm+xiB/g7huN0wI1c/ZNcPg05bTEPjgsQ8L5FUc5iad
         6xwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705573467; x=1706178267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J79iMIi+g28FozIB4ksQzVw72H05lO60U/TZX4kDPa4=;
        b=iSD77afyNQekjfUsUXYto62qhur3KF33KZt2chgkvK+xLeHjXHS5dQ6jATkFKvFo4A
         3aaV0BNu55T1fIH35s6Dgm6+e347lpzc3wOpMW5H1kK5UwGP2VI27G0kwBX9ViNOzQs4
         4jE9RS6s8nKsHWyawnH3HsZQhojyTA19xAXoCs5LjoVNNLA8blScvBVX8e1yli/Tb5AH
         rP5pXd4IBchKLTs9ukZDq6b6js2dwwZ4TWwkINiqNq+v17U7KwPHreaZv0H6+57ybYdb
         Md0xU48Lbp3MCM0NJzrZwLPYBlSiahvnn7anDmOGnvPjb4FQdSSzCzW+lWKl66GlhPY2
         Viig==
X-Gm-Message-State: AOJu0Yxr8LBc9Az9fjlabtSvbY6UvS4Wm4j47N/COqTZc2beHTYUMTaC
	xnW/eFLM3bs9u4iqfAVttRvtSJLTkbstbZ0Fdm9L55HnMmTgWRpaDh4sKby5
X-Google-Smtp-Source: AGHT+IFDWsXQTruG1T2Dq6V48TbU7i8yDEc398CReqhqjHlPxDQpO7WnqtAuCHZ8pSUTAWnTRnJX6A==
X-Received: by 2002:a17:906:446:b0:a1c:a542:2fcb with SMTP id e6-20020a170906044600b00a1ca5422fcbmr731595eja.31.1705573467179;
        Thu, 18 Jan 2024 02:24:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id hw10-20020a170907a0ca00b00a2ea4f1b0cesm2461003ejc.2.2024.01.18.02.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 02:24:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] classes/package_rpm: use weak user/group dependencies
Date: Thu, 18 Jan 2024 11:24:08 +0100
Message-Id: <20240118102409.2680941-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240118102409.2680941-1-alex@linutronix.de>
References: <20240118102409.2680941-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193971

rpm 4.19 automatically generates provides and depends for user and
groups:
https://github.com/rpm-software-management/rpm/blob/rpm-4.19.x/docs/manual/users_and_groups.md#dependencies

This mechanism relies on sysusers.d for the 'provides'
part, and thus is systemd-only at best. So we need to disable it for now,
otherwise image generation fails with unresolved dependencies.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 09cc7d62681..027e06ed877 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -711,6 +711,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
+    cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
-- 
2.39.2


