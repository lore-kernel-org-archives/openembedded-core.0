Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7310EC531DC
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:31:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.91194.1723613475826112814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f0hz/Tkw;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d5so57563321fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723613473; x=1724218273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=f0hz/TkwbIeDoFZdgcmrBAC81131al/h/x4MubcS05Pnk8AOA56w3CsHTWEdbtaq9u
         /8es+lhMILCdr0iqe4v/7tKpmOWhZNOKXUPu5qDrfUDT3QICOiJQ/kKZ0V14zdFo+zTg
         6bHyiiF07kITMZz97/xIuiPvStzjf2fKCWtKXhG90ACFYbvRFZU4KLFSii459dGaHtZ6
         8IJCSQhcob+JRLmZbvR74vnuRm4fKhnjEKGYQUY32GoUpEHgxNgYFMPCf5Qq0rn+A2XQ
         eIDBzpLskRX/HPm/5eSXGc/slCc+pD7XeyH8Q3bvNMsz9rSwS1JLrAtYeq3v9xIBW3UB
         TkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613473; x=1724218273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiI9KetorS/9A07ChLdSkFBO47gtER30WpzVa4qfC3k=;
        b=JgNWmSaLiI52T7WLDNnA6G9ICyKuPBW37qvNtHhTQSAGs1KG/O5DAlnGg8a7eylRbA
         Y/0tuR6eeO6c3oVyypHBSIuJDPyvpxj83RXw9qAwQTN9CWeJWGQO1ONnc4VpXXhKA4nV
         Zq3aWSd3uJRU6MUr7LzXFqfk/XjMlWmx/WeXixE4MlDO+wykhspyu2xEvfnX0W8wHDPL
         uydSjtYHIQvUD26Hp1z9vZDMqbAe2sOIUN81+HC1KYDPgBytMH9bjHhbpRKjMqmMhDSm
         H5JcFegw3EnKIzGmKFK/Xg0PbkT0gK1VE6dzNpuXlc/Ss3SvNKc3BdovGE/aabffOLSb
         UZug==
X-Gm-Message-State: AOJu0Yy8G1qIJecHlGrS2aFnho8PEtMJ0qWeCX9jin2Ivi9IDXTKAmrN
	zOHoDi33/fkuOWdQila1kkF63IAqj7/j9YEG0wQ9enTA/m1obkhjUkOVVQ==
X-Google-Smtp-Source: AGHT+IGpIR/5EUCZqi08h9Q5wejbHikn9NhlxUk9eAn5y69NF8JXaxFmqDXmsi+cPATilWD8yA6djA==
X-Received: by 2002:a2e:bc0d:0:b0:2ef:23ec:9353 with SMTP id 38308e7fff4ca-2f3aa2f7eeamr9531581fa.38.1723613473225;
        Tue, 13 Aug 2024 22:31:13 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2311:d410:8c63:2ebf:4fe1:9568])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded4db0bsm8885525e9.32.2024.08.13.22.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:31:12 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH v5][OE-core 6/7] cve-check-map: add new statuses
Date: Wed, 14 Aug 2024 07:30:40 +0200
Message-ID: <20240814053041.4991-6-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
References: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203307

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


