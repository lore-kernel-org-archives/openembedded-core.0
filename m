Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C153C021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:09:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.6610.1740485370483860280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CAc6AIAl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f2f783e4dso4710938f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740485369; x=1741090169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DBfFP7wb8Qh9wgL+r8urRneIf8Bwxza7vRBHCPeb9/c=;
        b=CAc6AIAlbwtyYTgwXApQ1enkirFitEVFzANHG4o/lGyZc/Rqe/IGo1YFszuHajYaoO
         f3SmZp0SvnuttiNGlsuFHO3oLoWByDen3JjYr/KjEKTlq3qzuKcLbDwSPBvdvREJittq
         jN/5zqYdFNQh/WU/DFjw/MgVDy706swb8WnUzJyTu7Pm/ZCI1b4Pnafzbs5rjgc66HPM
         4N54+X518DHOAPAfaq6TiLyZ2leqNNGsZ5oItfvksT22UOHytPmPt1op30W+8zpo1Sqd
         jmMuOWmWgsaNrriBo95pGeHWLYYh5ec7EJ+zXB0mq5hZE0+xi/F7u9F14xcJBYrb42JT
         FH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485369; x=1741090169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DBfFP7wb8Qh9wgL+r8urRneIf8Bwxza7vRBHCPeb9/c=;
        b=s+nzjzX2Q4dycGyqZ+gQhu3oeUXy4Voj0udiX/qJD83DhWNjo4IDvMUaYO+hHfyTCN
         ZfUkecGz+geYg3s27JSfQN9pRZqiEF9xxsRPY8IRSuPrwg+IlI/8gO/tUMhSSCPC81Om
         DqVjw9Xr6ZB9v4LPBK0CmTdz7w3sJW2QOR38ogbEqGwiSaZL17Fgp8wzF3+teGC4wz3K
         +ElH9/QGy1t44U1NUzNdIjVmWLR/1QRwFm3A90jsCTWN6+qXui4gIYARSo1D0A9KgLk5
         7HVdQQFS+VNNGQUv9U3hRGTWlfCnWh6UZjd5P6d/wpc1ZTg/CPaMi/aG18j6Vmgh0iOv
         Q3rg==
X-Gm-Message-State: AOJu0YzVGw/JqWtyo+I62vhgp2EjTGVWhynhIz264qnJOMbMVYq/RqHd
	Bi1DbCokNWGtzPvyUfcjL1Y8oVrfIQW5w2/TBmC9tidHvlZ7jkPTb8cBcQ==
X-Gm-Gg: ASbGncusRyKW0orNq6HpXBXrTvRrYwLeNVuZ2QbnNVTbZni8T9of/vvWc64jbvHUbIO
	1YyL2UidVepZ0PfAwfKLOzaHdfykfyh5zyxOvkmGF8A7kHBWbhue9Tynz4EiNHBYDDmTXH5+LTN
	qaXG5oLGp1XyuEOhlxbQve5sj+Iv2fEU4hlprU2xfpLpgXjMSvm5DMPcjOqMpiIHuoCPB5TObCe
	nOpjZFruo67wthibECvklwf5oad5ehpA1i69ZkU0hmUf4epbYt7+IFLCmrVdaMhCIskqimbZRyg
	yEP78ozCQfIiHibYaou3rB0F14a8upH9TSFXxU+mnzKMmfc2YXoL/VG0i5EsNvA=
X-Google-Smtp-Source: AGHT+IHPC52FA1Rvf0EET97mhV7Gl0XNQu10DZIfN6/9bNuoWN/uSZP9+OKwZHrbkDW0lfbiSQIhFw==
X-Received: by 2002:adf:ea04:0:b0:38d:e190:b713 with SMTP id ffacd0b85a97d-38f6f0942e7mr9809144f8f.37.1740485368697;
        Tue, 25 Feb 2025 04:09:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fbef5sm2130012f8f.90.2025.02.25.04.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:09:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] classes/insane: do not leak host uid/gid into package_qa sstate signatures
Date: Tue, 25 Feb 2025 13:09:22 +0100
Message-Id: <20250225120922.172002-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211877

From: Alexander Kanavin <alex@linutronix.de>

This prevented package_qa sstate from being reusable unless host uid/gid
values would  match exactly (and they unfortunately do on the yocto autobuilder
worker machines which all share a 'pokybuild' user).

I noticed this when testing CDN sstate reuse, which otherwise works well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 866cef65260..fc4ca84b35b 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1066,6 +1066,7 @@ def package_qa_check_host_user(path, name, d, elf):
         check_gid = int(d.getVar('HOST_USER_GID'))
         if stat.st_gid == check_gid:
             oe.qa.handle_error("host-user-contaminated", "%s: %s is owned by gid %d, which is the same as the user running bitbake. This may be due to host contamination" % (pn, package_qa_clean_path(path, d, name), check_gid), d)
+package_qa_check_host_user[vardepsexclude] = "HOST_USER_UID HOST_USER_GID"
 
 QARECIPETEST[unhandled-features-check] = "package_qa_check_unhandled_features_check"
 def package_qa_check_unhandled_features_check(pn, d):
-- 
2.39.5


