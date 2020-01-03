Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 64EBD7F89B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 22:50:18 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id s21so16785935plr.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 14:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ofhgQ75VF1PZEHEtt2O+fSGO7FjycXwJri2M0fx+0Tk=;
	b=MVp8ORxdEPxqJxuHPH+BLf6k1yN88pDBgfGnOvjpofP5TXhVM/LT8fDRf9ryV2skk6
	YtRXWBxzcOJZWaQ2yjutYyvAvpRFXeJwLIcNcGk/ClW2aNA2zIodj22CJvEWQX2FPnkH
	nd86s1NzKNApcvqTrD5eIjndy7DS3EPhgIHlVsTZCjc6Otua3ZiA5n5b0nUGaXm8KnC6
	p0Jwy1L6v8zsvyFxAtfh5n3Lm81iULb98B+wxErVW7qtOgpsV8r5pSSguN41P6rJsq2B
	jBI7UJOvsyWJ/rnJTb5XqYv7TFv3nd63pWGR7cEb1ggfPc7cs3JtLzPBg6iGNSoCCc5G
	mpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ofhgQ75VF1PZEHEtt2O+fSGO7FjycXwJri2M0fx+0Tk=;
	b=MuWCmFcCM9Yb2aqOALSSanCslGbs7Ni8lZ67gRh6HzVCAe6ecR7raa+INZnnRuYRVd
	jCFEPDsTZEGrWD1rVJ+4EL4EibZcufXTafIiG5OJDxi/PhTxDwE51cf/l5Pe+A7XlW6R
	tQe9KsxQu0HqoWhOMqtVd2Hy16B7wZkyRtaBQvjfYes+2WO7SgIR6BtJrQE15jJS8mje
	gN502SRqe/085tJF/CxKXnLGJQdY5e+gPV8QtugnqYO6PEYu/wFOVO5t0vCgV198wsxN
	rSaOUMkQHIwaH+L6MlP8aWKHsqH1dT085L7wnPHlXjXO2XTC5TA41CNSIJSJ+nZ4NuIP
	G11Q==
X-Gm-Message-State: APjAAAWIWc4Rh6YSFtA1jYgV2NzU2SF95XZXfZroafVKJT7+9LkibFUM
	+Iw//1YA2X9k8QzA5FLPzs3YThpAvH8=
X-Google-Smtp-Source: APXvYqzU56xt9T2+9ymO4xXvJuz2PojeEJJjvVfY25pU6rhp3U7knHGOZYU5BDrgGDN93uNiEmRnIg==
X-Received: by 2002:a17:902:fe98:: with SMTP id
	x24mr94444652plm.155.1578091818990; 
	Fri, 03 Jan 2020 14:50:18 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id f8sm68556215pfn.2.2020.01.03.14.50.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 14:50:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2020 14:50:14 -0800
Message-Id: <20200103225014.1506129-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH V2] musl: Ensure that B is clean before configure task is run
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2020 22:50:18 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Rebase on master

 meta/recipes-core/musl/musl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index e5cc869cb9..bdce412162 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -27,3 +27,5 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 
 # Enable out of tree build
 B = "${WORKDIR}/build"
+
+do_configure[cleandirs] = "${B}"
-- 
2.24.1


