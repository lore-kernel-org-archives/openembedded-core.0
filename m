Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 260A0E6ADD7
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:37 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87814.1766434112109406801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KiAIsALH;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b727f452fffso864707066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434110; x=1767038910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxvuYGdA5QMHMBcwfcIEBngk0+unuDFVTqaNz50lnWk=;
        b=KiAIsALHecRk9fTA2uLIzhUHMX1+a+XH6yYAHnchr1nWQNAriK7T1HTZN2hGpEPHby
         e0rOw/guWE/UFCyIpi40VxofnW1v8FVjX6oUknG3zSLqcTudiRYuGZSWEpxV8ubbe7/q
         neqBKE70N9AxTJvPTx/tEZWQADDh4Z60dwExAha0rihj7/1svZzgqw/FMWOE5BS5wxzC
         QIk+6UVKAd0ElPojte+2oreonqVNAdVY/aOtqgaJXwfPQsF/dUGbaOmw+6+73dVjazhb
         cqhEzryNCMsIVRJ8Z2nddrtI+eJL+wq3wPRHVtu/io1WlpfZhGYlwITUzoqTzGftHr9d
         vmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434110; x=1767038910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vxvuYGdA5QMHMBcwfcIEBngk0+unuDFVTqaNz50lnWk=;
        b=kTnHprubYTI6IQD/r4ZgjO7R++ujYnRNgjqMckbsKd6dB2iiI0aw2lWgOp0M/KctnG
         FO8Lhr5+Yra5VmskfDECjOtgnAlL9fJz8BItqVNocFbdJpII6aMBNteuLJW4uk8O0knr
         bd6bCP25Ah0ID780/UpLqVJhlhxV5/qg9D2AkVXwhSI6cgsNbh+nM9MbvmLHIC3iCxNa
         eNQTTgAz0Kam2bqyy1ZvPDMvFYy8g+F1cG/e8tWprDaexfjKCxnE6EFBxdDTeEtVdu3G
         vJTtEVCE7g/51GY9Bkuigf9Mae5oxKl6xZRYI35wcnLYfK+cLuBB9c1spsZQsSzcP1WV
         MJXg==
X-Gm-Message-State: AOJu0Ywf9re3VWpvjUxS4L3KnjfrtL4E5z43X+UNbUO6OWCxSduu+/lL
	aeJEyASGk5P6bsZ4Bn0n9nxgkDnVwohhhqDmWKN4qKho2ZSaHWXBKtUcPBm1qQ==
X-Gm-Gg: AY/fxX7VLDRyGRkrEweqe2gc9xalX28KKWABi1FcRF7KBuZP9sn2UawOwZCEBm5V6oe
	ym8oipzL4uPuCQFAiUJCe/AJB55cTg3nryvKMn74e5Cy4ho/ZpdVT+zb6lTiJsJj5MeY0IcjVyq
	6aRhqzlLlRrpSURUxQVZ56FfDWXHDM4CXXQc5Oyfr0OTEGQerwlmTLiu1ez4n0DXONel6bT9Zgr
	7BeWazhto9e1ciSaRz1/Kc7BUpuvZqI954vWyFCRAQj/7zd7G6BKsCU9r63wtxOGO663H4hODVk
	wKKTbe3gMGWrWGKTNusOHr05WVXNfNIG6od9GIXUUE+S5aUcfeuCv5MWX46taWXs5RoQZZ29RYj
	V5b1Kv3hyhpmlRS4egmJ0Bhzig6sUVf20qUk2sxNLmcNUmY+r+uUdVjxEcF4Hu4YpkpjeJpWpb4
	2m3JNJhwsfrDA6go2cBIeoJl7IcdURO5ejkzPr88n5kk4KQRw=
X-Google-Smtp-Source: AGHT+IEZvOMtTwViR4pAAnB8HyfAMIZhemVrNq4kbt1A5boLdV4htg7EEiYiXynLJga3lW2GZvu+Mg==
X-Received: by 2002:a17:906:23e1:b0:b77:1b05:a082 with SMTP id a640c23a62f3a-b8020400379mr1200912666b.2.1766434110305;
        Mon, 22 Dec 2025 12:08:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 064/114] python3-pdm: upgrade 2.26.1 -> 2.26.2
Date: Mon, 22 Dec 2025 21:06:46 +0100
Message-ID: <20251222200739.2278706-64-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228389

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/{python3-pdm_2.26.1.bb => python3-pdm_2.26.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.26.1.bb => python3-pdm_2.26.2.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.26.1.bb b/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.26.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.2.bb
index bd25f141f0..13dd1ec0db 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "60a568201424a7193b661f6fed6e446e39695b52edc5e0904ba0b07fcaf2e787"
+SRC_URI[sha256sum] = "98207f8aabd6913a25ee0b4985e79e1652e2db274915f3ccf9408e33191ede4e"
 
 inherit pypi python_pdm
 
-- 
2.47.3


