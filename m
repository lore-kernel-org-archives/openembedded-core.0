Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.10543.1594990601535881191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 05:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t+UWHFPH;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id a32so7488931qtb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 05:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3A5ZTuRzhayzfPIfsqxf57jWTeVgtiz9iUR+xVsV+8=;
        b=t+UWHFPHsZkZjbUuPj5rhTJA16DQbfqi5t41IwNHt68ni0A2MQaC6+yLsFuHtqwOLE
         2T/zlS0mFfvSmgKpgpyUd4g8nMzdFKxuLGS0cVcLHgGuVJ1jxfy7QEePrwOAIVzTN5tt
         ZPBGxWmH0XtTkQtuquia2gWqBdAWxQYVuMwHkXw0heLpFBWQVv0YSAlb2zOtWrBoljod
         6ABfNBExobFnTV0TDt/3a9k+p1ckhfo+J6rw9DVNjmB+PXFoFPH646iFou4+xLigL0xi
         gbtgQ9p+DwsNjAZHTjv5W3yK0sFubQ5jdrlfwWTovgkCwJ8DTc70Q3sMZJU/jFAaSLyN
         AMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3A5ZTuRzhayzfPIfsqxf57jWTeVgtiz9iUR+xVsV+8=;
        b=L87jrzL87pb6gYzVGfSms04+/0eY/vS+1lr/ZswK3skS3ERA9F7duH0jlCQzkD2SUL
         NCPkDpdyYZjZ2k+FJgRwyAmTTnKcmIrHrWttpCnQEPxtd0nJjBDRlb0gf2n8tp/+p/Vl
         ILCM1XJbkU5ZQvym4/6n82ANqkOuGEZfCIeudsYnhMFAyLsOgKnttF9ESt1RgCAumzhg
         LQdmbuJi2lWe0mOPRsU5FnduwxRSWImvgVBfy9ZfufZHAYqLNom+hHagwXa7+GQ0iSXX
         ticyN6vzEOsbIrp7iiV6wXMiAoBtlDsmPUFgkjCnfmTrqS+eEe2gh7LfB245M5QPi8Jn
         +kWw==
X-Gm-Message-State: AOAM532baddD4+Bq+XXllKqG0C4a1mfMR5Copf/+SR4lHhhgBMmbKcwz
	4tZ/i1a5Ku9baxVp+5mc9geR9TwWdAJzZg==
X-Google-Smtp-Source: ABdhPJwwaLh2saZS+X75xtvMgsUBefHpp2zM6MwNGLgORi7nQP5BDBWarZYIbeJpaZeTbMOuUVW/iw==
X-Received: by 2002:aed:2a74:: with SMTP id k49mr10637620qtf.38.1594990600726;
        Fri, 17 Jul 2020 05:56:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 79sm10431808qkd.134.2020.07.17.05.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:56:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] kernel-yocto: account for extracted defconfig in elements check
Date: Fri, 17 Jul 2020 08:56:33 -0400
Message-Id: <e4121155e3c51b8f4f9aedb3280600f859bb3add.1594989620.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1594989620.git.bruce.ashfield@gmail.com>
References: <cover.1594989620.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The test for whether or not scc should to invoked to generate a
config.queue was missing the newly created sccs_defconfig variable.
We need to test for that variable as well, or we may miss generating
the config.queue in some cases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 54a1a1627a..3311f6e84e 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -213,7 +213,7 @@ do_kernel_metadata() {
 	meta_dir=$(kgit --meta)
 
 	# run1: pull all the configuration fragments, no matter where they come from
-	elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
+	elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} ${KERNEL_FEATURES}`"
 	if [ -n "${elements}" ]; then
 		echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
 		scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
-- 
2.19.1

