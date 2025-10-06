Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5968FCAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:34:28 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.31716.1759750462976285197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 04:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e4Miu7u5;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42557c5cedcso2468565f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 04:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759750461; x=1760355261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOnhuAOwkdXnhgrdWIKGWlU/wKqbYiwK7DBFkef0mgM=;
        b=e4Miu7u59P1INm+gDK2UB2S51zLb8d7SQlDymTaDuBnWPzcM9XVzLyI9x0zTpLIW4Y
         eMQJShkxyrToOAJhSQ1qq7UlS74jl3j3HtH3+TYOuV4OKkrv7zUtPpmDQlDCQIgTCoKO
         XBw8NWdEPHo2plxP3/yf4as03wTkK61sK/uMBjnXsIls4RL6dYCAuN5BSobQjGwfSsZm
         qr5E3ehQk6R49u/EkgY1oun8u6fMdp5wwNvnGDPJOEu20toPFhaBcxSe6Hl+2/wFcVcq
         YThtnW1huOU+InxtohcJ66/HGRQmwUXXHVchilIFdl6yhLN7K+Qs+oiHgKdD+AxRUw/9
         2JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750461; x=1760355261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOnhuAOwkdXnhgrdWIKGWlU/wKqbYiwK7DBFkef0mgM=;
        b=wsLwzPcGZsYhZ4Xq+/aabODz5lcB8bJFOfU2wkqZbq+65XhBEBQOO3aUgi41nGK1kJ
         0T2i7lKhWDwo86GvsSG5Wn4uKUDvBxsuaemO8rorL9gdJtAKHkloCsdtKapKNPXf8YHC
         Iqk4v2vbQdhzLV88+6PhOoMAhDlOQWJxjswQ9mtCafh+oCX/l4Ou9SIlNiF4FiIfieJh
         qCvd11OS+OMtfexFKfiRHhgIBvGfe/AMV64txADjDbcJvXCeJS1BtKi/npwJEklxmyMn
         d7F8lu+laV/2UjosUY7H2E2wE0zK+KfA2G/Xq9f2N6Vlec27peo3Xj2Yt6jq7DCfSMeq
         IKrg==
X-Gm-Message-State: AOJu0YyCDbqHsOduxeHKcSVaWymT1TDt8cIsCE+j6CgHziyrWOjoPpas
	3kOGw3NjTU4l3Y0mQwQsg2RLS950QLj0dsdrCn0cnuQKj3KYZk+kC3PAu1TkmQ==
X-Gm-Gg: ASbGncuyplv7r/y2AzGF7CAJBO4cyE1gyErdmjWOPJsku2CfpCNBYyBznJne7P+uz2w
	nTl4w2n65avYRpE6RnqQxCqbJum6drGvyOj66T6GWXtPEUk2Yj6+9K4Rh06XmhQJQ8UH+rfK/Ww
	fRjueFApdS8LjPynmQwdA9kpahl6VvlQbU3nFGqKa94e9sigT0FbmwiiqveBZ6uZpQBQxQohwfu
	HdjrfiwemHiGXt51bejZcxCpc2AYEAMnlOe/RSI0bGnMcNxuxiR8YYbC4gmztVwiRXjYfgNTAkq
	W1WO3Ko6DW21uGdc1KKf9A62L3dl4T4ze0vxjhLqCDYbEr8jaNL0osNalRQVKLJvCR7JiU5qov6
	vItybyhOYkVD+HJNc8lVqW91eVyMvPTRlTTqpyn9305sopUkkvqh36lueOUQOtiCajORFZ9kuDY
	S6maIOCCh6KHlev3rAJIoAJ2w3Gwz2VFKWB9Z3WMrTBrDn2DSKboIfU9X+ITnpKIMdTobr+3QI9
	ZutOZyX2GKIJbrTQe6E
X-Google-Smtp-Source: AGHT+IGc+a2k/A1cVNV0xYVCdvPDnqHKKBXEMIahZwbrH7ZBVv+ZYrHJEFVLEFPCv/rILRIEupC/Ug==
X-Received: by 2002:a05:6000:4381:b0:3ea:80ec:854c with SMTP id ffacd0b85a97d-4256714bee9mr5792653f8f.19.1759750461128;
        Mon, 06 Oct 2025 04:34:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f45e9sm20872632f8f.51.2025.10.06.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:34:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/bblayers: do not assume integrated poky repo
Date: Mon,  6 Oct 2025 13:34:17 +0200
Message-Id: <20251006113417.3928034-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 11:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224477

From: Alexander Kanavin <alex@linutronix.de>

The autobuilder is being transitioned to bitbake-setup which
sets up individual repositories that yocto is made of. Adjust
hardcoded revisions to match these repositories.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 7eb176aa04b..08bc1d1e442 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -157,7 +157,10 @@ class BitbakeLayers(OESelftestTestCase):
         with open(jsonfile) as f:
             data = json.load(f)
         for s in data['sources']:
-            data['sources'][s]['git-remote']['rev'] = '5200799866b92259e855051112520006e1aaaac0'
+            if s == 'meta-yocto':
+                data['sources'][s]['git-remote']['rev'] = '913bd8ba4dd1d5d2a38261bde985b64a36e36281'
+            else:
+                data['sources'][s]['git-remote']['rev'] = '744a2277844ec9a384a9ca7dae2a634d5a0d3590'
         with open(jsonfile, 'w') as f:
             json.dump(data, f)
 
-- 
2.39.5


