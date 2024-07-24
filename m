Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B960AC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:26:00 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.13316.1721834758065292736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LopNHaBj;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso38806101fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721834756; x=1722439556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=LopNHaBj1/EjZKDgr61pnDfOF75te5btZtNPFJaoxqTLEh2ilEzAF12O2HSbyuztha
         9MiIYZ0OsuTsKwaWF0fTibg7fWv2b+TMeFrS0mYZyT6ay6qiCRMRqPAVqkGsNLvQLQer
         8cOpYE2IeUyPzwOmfqPy9sIjVehK4vGs3KCzzVkvbzshsNZ40II2b/CZ5OCl7qiqgJ5L
         NxHW3zUdYH/ey9EseJMazLHs3DS0w/PK3tjGBy90oVZs4ZiLZvxq15ZsMrAmyZHWwjyw
         H6FnfMix/AdodbIZUQgDWwCRDywG5rbgYNiUTGSbIvmTmuPszTu+DeIixHdiLaXWaBH/
         CcyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834756; x=1722439556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=Ptj6b40+8Xl2evIL3e3s5tObSbdZo1NoCVNpWkIcz2nFOXvFb9zjZxNZuE2vZGqfsm
         R56w9jTvk3n+CKrTN6aTfRNJWaVpcIN5klO9a/XfMPqNp+M4h0inAXQRdYRSYiEfdfuQ
         U/UBNNPfna72Qv6Hm04BNeEW0fNanzPd32pnrLFAWkwdDXfV8VQMMsVCv9vftKX+K1KQ
         EJpNVJm9loqQVElsLBVH+jzPgzgEU463P6T4lex9lBJqBQd6/ux/1KA+hh/bFSJkihdO
         TtzeL4s5GLY/7t7f34i7vzjZ1XIs8b8hW6zBvfyUhFwHhlsFroFbHXItCOn64C3vWh7e
         4wHg==
X-Gm-Message-State: AOJu0YyJ75TuKAY3Cna6jfZpIBXV1+GmEzdjyuOqvXDCUZA/bDXr4qgN
	9cwCZYdkQwUMTwqw+6AFoBbQsleTwq5go6PX59iurekG1LkvO97sdxjLqQ==
X-Google-Smtp-Source: AGHT+IEUakvLUXmlggTzCS5Sw4lpG7fFKufXSH6vNjIVjEol0wa4Ns800GkPfXrAAWcdHqrdjl3cPQ==
X-Received: by 2002:a05:651c:222b:b0:2ef:2fcc:c9fb with SMTP id 38308e7fff4ca-2f039dbabc6mr1537081fa.36.1721834755355;
        Wed, 24 Jul 2024 08:25:55 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e667bsm33636125e9.29.2024.07.24.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:25:54 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][PATCH v3 4/5] cve-check-map: add new statuses
Date: Wed, 24 Jul 2024 17:25:29 +0200
Message-ID: <20240724152530.25856-4-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202451

Add 'fix-file-included', 'version-not-in-range' and 'version-in-range' generated
by the cve-check.

'fix-file-included' means that a fix file for the CVE has been located.

'version-not-in-range' means that the product version has been found outside of
the vulnerable range.

'version-in-range' means that the product version has been found inside of the
vulnerable range.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/conf/cve-check-map.conf | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
index 17b0f15571..ac956379d1 100644
--- a/meta/conf/cve-check-map.conf
+++ b/meta/conf/cve-check-map.conf
@@ -8,11 +8,17 @@ CVE_CHECK_STATUSMAP[backported-patch] = "Patched"
 CVE_CHECK_STATUSMAP[cpe-stable-backport] = "Patched"
 # use when NVD DB does not mention correct version or does not mention any verion at all
 CVE_CHECK_STATUSMAP[fixed-version] = "Patched"
+# use when a fix file has been included (set automatically)
+CVE_CHECK_STATUSMAP[fix-file-included] = "Patched"
+# do not use directly: automatic scan reports version number NOT in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-not-in-range] = "Patched"
 
 # used internally by this class if CVE vulnerability is detected which is not marked as fixed or ignored
 CVE_CHECK_STATUSMAP[unpatched] = "Unpatched"
 # use when CVE is confirmed by upstream but fix is still not available
 CVE_CHECK_STATUSMAP[vulnerable-investigating] = "Unpatched"
+# do not use directly: automatic scan reports version number IS in the vulnerable range (set automatically)
+CVE_CHECK_STATUSMAP[version-in-range] = "Unpatched"
 
 # used for migration from old concept, do not use for new vulnerabilities
 CVE_CHECK_STATUSMAP[ignored] = "Ignored"
@@ -26,3 +32,6 @@ CVE_CHECK_STATUSMAP[not-applicable-config] = "Ignored"
 CVE_CHECK_STATUSMAP[not-applicable-platform] = "Ignored"
 # use when upstream acknowledged the vulnerability but does not plan to fix it
 CVE_CHECK_STATUSMAP[upstream-wontfix] = "Ignored"
+
+# use when it is impossible to conclude if the vulnerability is present or not
+CVE_CHECK_STATUSMAP[unknown] = "Unknown"
-- 
2.43.0


