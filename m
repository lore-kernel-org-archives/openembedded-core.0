Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106C7C47BE1
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 18:28:32 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96788.1767724110987184282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 10:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvZBSmkz;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b1c0dcb3b3so22047485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 10:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767724110; x=1768328910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWZrLXB7XnOemrKbUqKB1ln7FbdLPw/WfamWIxS2D54=;
        b=UvZBSmkzzmVm8+ernC66YdMfuJRNOQmyp6YasTsm1WFa7igguu7Eehbf+j/eWKcaUs
         3zxoLFE9rKKYm3ZNDiZKu0+OcwKzvB+CYZUYwm+EdhuvvGoEPmcR5cHUFxHhDDyZvTKf
         u/1ZGpXMkFk8fj9154leJI4f8y1Ponju2TQAP3M9a26QhVW1bA+p/krze0WtyQzed3aZ
         Zxy7i5J3oLkjK2XPQljqPBoek3j/Y1t4LUSyiuK2ZGBGx7TVpRyenHNbb9iQsW19bpYL
         pRohQjIplRVj6n56mA9wAxGl85ztOV+ofofhEYozriSmrH6vVGjyYpflhCENYfbefm9g
         25Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724110; x=1768328910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWZrLXB7XnOemrKbUqKB1ln7FbdLPw/WfamWIxS2D54=;
        b=TjXTD8lPj9e8hTjj03ecI7+BUUcAmhCAdzaDvEB0PZT1tfevpayI2R1pezmAzr2mSN
         3wiUdTHyynzQgGtipTt125WGiGko24fKdLNRxC4ImAIek3/l/DnMNCdjtNu8g2XkanJw
         MBgxQlg8eiSoCdPG8YLH+Se4IsrTZJrhQAk1AA4+PKqaWEhp2Uk8WeH9V3qGKK/yQ/wS
         ZNBBNATnyrgZikHnT8tec5PubwC38KJMyB9QW/oqXgrSyXQRLwyH85qjDDDvp5jeOLyO
         /HAPlv24tPLZMMuPILxvBGR8wuJXv2xhp4trxVOeir2kzYwq23kD0Pg+DErsQ9aE2803
         eTEQ==
X-Gm-Message-State: AOJu0YwhHnhlcWXQcH4gr1UbAwq5x4Co6ouUw2ImNucwxJ8GyPelhV+p
	wL+y0/0AJp1rqnlGc49myht3snnHWDgT8SqLSkMVgOc2sqqjpwaCyTtiGfcGxNRJhOg=
X-Gm-Gg: AY/fxX4phrq5ShCB53GpIgxnO0Pr1HpwHeg4r9RdkEIi2bFQPnoVhKnhH/nJ6+dQ1+l
	RIiJmMYFafvjw0MULyB30ghb8P4aCdkLdeRBrYe3m2I7qhH3qecJ86tDnvp5qAYPHgZ6iBykhn2
	wx0sFzo9kkrb93eOlHehq1n/u0ZfOyGgyhZNQRdCbpIwETAXk+nl4+sS+xzVpw/raqqZ+kiWc0s
	7K8smuhiqb7wAEhfQhUW0+OsSJXFUzk9HedOCdrdvt89lMM4anmSGpDgY1wZ/FOhx0tivIl24AP
	FunUfq2YAHqwSkHy3y8Sh5t23/pko5qHYDARZneFzWVNy1G8y+Tz3Sya5NRfGQQCSp9nHW9hI5B
	DI+uawqr0vnOyQ3rugxjUM+qM+x2spgaevKd2Q/KoJCmQ1m32iSgMleDYeVkQ84DTBq1PSkxZli
	IrThNKrZvEhYXomdhXAZzvjc9tdX8f+g9zb6dWwNMg2Fe+6HX+B4ThlNU=
X-Google-Smtp-Source: AGHT+IH2z98lg7+FlwkfXNkWtyqCe1u9wXHyDt7fhTYr8lgj1oHIRS+4q6mO+Ra0rfKbAyXPFomeUg==
X-Received: by 2002:a05:620a:4690:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8c37ebc1922mr370601785a.8.1767724109871;
        Tue, 06 Jan 2026 10:28:29 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4a97fesm214003185a.4.2026.01.06.10.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 10:28:29 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH 3/4] generate-cve-exclusions: Move python script
Date: Tue,  6 Jan 2026 13:28:21 -0500
Message-ID: <20260106182822.3377881-3-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
References: <20260106182822.3377881-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 18:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228911

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification
---
 meta/classes/generate-cve-exclusions.bbclass                    | 2 +-
 .../linux => scripts/contrib}/generate-cve-exclusions.py        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
index 3e34ba563d..4f539ee4c5 100644
--- a/meta/classes/generate-cve-exclusions.bbclass
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -28,7 +28,7 @@ do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://g
 addtask clone_cvelistV5 after do_fetch before do_generate_cve_exclusions
 
 do_generate_cve_exclusions() {
-    generate_cve_exclusions_script=$(find ${COREBASE} -name "generate-cve-exclusions.py")
+    generate_cve_exclusions_script=${COREBASE}/scripts/contrib/generate-cve-exclusions.py
     if [ -z "${generate_cve_exclusions_script}" ]; then
         bbfatal "generate-cve-exclusions.py not found in ${COREBASE}."
     fi
diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py
-- 
2.43.0


