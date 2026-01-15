Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF457D46613
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 19:03:47 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2518.1768503818765599284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 11:03:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTmjDbV3;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c52ed1af33so14746185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 11:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768503818; x=1769108618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZox6An/C+1JDlJ4Vcku+OVl9Mk71VbAZ7t0/m3Y7HI=;
        b=PTmjDbV3iSxh10ZV3ea9e7bwoG9iUgVoQA6G5xC0E9jXS7AXwk0XvuF5RiYzEpyP6r
         4X1kS7FnBYdBWZ1tLpSlTDrEvD8Rb04bjBCkzX/pEudOWlG2I4wm1iIpf97CxHVHCV4O
         cbqc/fThPeohxiNlrNmJhPLvVHg76QOoAHevriH75TtCfD9Ui1Mn4gWyfEAj6O96n42z
         eRScSIDn73W3eBvEQ0ptHbwOh14kyOZPCHHiuVTGvel2OLt9pbUHTpU/fudC0CUv9muj
         jZS4nDS15duzFJZo1cCkd69E0rFqPfFXuGLK7jPnWG25vS8CUEQIQgjtGv526ssnMS9r
         8BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768503818; x=1769108618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QZox6An/C+1JDlJ4Vcku+OVl9Mk71VbAZ7t0/m3Y7HI=;
        b=i16UIexQmDr5qPssx+aU37WTeVVdWaUAIz88ecAjrskzQL6OQxCevcJSnfHWC7LhqN
         TDIBoJ6ppOQpa92wJZTn/oW1GuHmisbs+J8dw8spOdcuQyBXjjrit0h5jd97+auPxLOK
         gvyhasYpCYemqMhV0SoYDQNTreqYMljgdiRFU3f6n8edLQ740hZ5WNsjFQ/PQ5FuYCH1
         BseQZKMMD7KUJmpx4uemUCg3Z9DjgrUfi7jte/fNxmfSDgonebFfWhtrVrkFVf+W4xC8
         W5er8CJSJQ8eW+Wz+SyHfPSndQj2LlNgCADk0rtvx42LxL0MMtZmkRBhO8Wv9zi0oTE2
         oCRQ==
X-Gm-Message-State: AOJu0Yzg96WyQalzEv/vsknd9ChreucWUcYSWMwWb3dCKsuvHcCyiKVj
	YuiO9jkfqLcEmL9tPO3e0I7NkaPfOT+gewawdB+LXCRKdhcngXa74kQk9yrd4bzjeAI=
X-Gm-Gg: AY/fxX7zq/NLNA0FeiYtQCxfI4YdPxvBnI6JUgZW44psBo8UBwQCOJvJmRwqEU1bKkZ
	dKhuW0xAHmtCqSiKPSX9/u5HZiZr01pDGPZPXGjMv3TxJ6569UGi0n0ZkvUL0+GCrBI4Y+KgLDl
	/O1e4/uzfoEI3IY7zHmSDoOvxkVOnfXjVld9yB1dD18c03qcXKgJzhDL2Y56y9/TWq4i2sj0jYL
	8ZpjIHWXsHmN3jv04wx4k3EQOsuuIANvR+H2vUGK6tU0afsWp/NIDiFUPaBTt7LNFBw6hEN/R46
	aJLuHFCKMBwSgdGq9njAPV0+93MaAThOe+QobegCxfy6iIqwWSsLe47pNWoVYoUgN/ySKC0rhQo
	jtkr4yXywFK2r6YgNZtSBabTQOB91gagb8a0Mb1yUl3DMdw0EOm/WodlZlbzuSGv0vi5m4azblS
	BwgxzMv1an4bvCyko8l0qu3WSXH9ttYAg0YSazP5WOtPvSTQF9zXBkTPA=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr59976085a.5.1768503817681;
        Thu, 15 Jan 2026 11:03:37 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm17016385a.16.2026.01.15.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:03:37 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v4 3/4] generate-cve-exclusions: Move python script
Date: Thu, 15 Jan 2026 14:03:29 -0500
Message-ID: <20260115190331.2276779-4-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
References: <20260115190331.2276779-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 19:03:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229430

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 meta/classes/generate-cve-exclusions.bbclass                    | 2 +-
 .../linux => scripts/contrib}/generate-cve-exclusions.py        | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/classes/generate-cve-exclusions.bbclass b/meta/classes/generate-cve-exclusions.bbclass
index 163f23ecee..1b0fa4baa5 100644
--- a/meta/classes/generate-cve-exclusions.bbclass
+++ b/meta/classes/generate-cve-exclusions.bbclass
@@ -64,7 +64,7 @@ do_clone_cvelistV5[doc] = "Clone CVE information from the CVE Project: https://g
 addtask clone_cvelistV5 before do_generate_cve_exclusions
 
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

