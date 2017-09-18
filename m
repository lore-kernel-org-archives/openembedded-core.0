Return-Path: <will.newton@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87A9278276
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:44:12 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n64so381566wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 06:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5bIVbirtZ5FxJVfyMFcUIos/SjYgjwGZssjEUWNxcSk=;
	b=dJzA26O2MDzLf8mRw3tYIjUmviiK2xlDggkm/ntaIqlAIym53kGZ1qqC61kqsDqkob
	01COkDlwFlyAXy0x4hk274amoFl/W/A08l8sCHMtLZgsGCpg78IlVK/ATdYhWtXgAI5x
	wxnKDappenbhzWot6ao47xxevqu3Fd3K63S8R62SpkoegCD80AFGIxuG6uRflbAfDN++
	55kpSjE1LE3VQZ7vtdLzneIg7kg6fXJ9xDaZBkLvHVYX79InFiGP94dZMPlOZiBoVRGU
	hVe4HuMq6PtFXxzLfod/eeHQbnzX9h/L+lvwsQ7AVoasjDezUNr4EhhQgfoBWhQLgFuy
	yTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5bIVbirtZ5FxJVfyMFcUIos/SjYgjwGZssjEUWNxcSk=;
	b=fd0rqSDCkUfbq1iLoaHx88YdqaGuJdCKbWJVByJjEL+420w5GV+mi6trFjiTvzv28c
	W5Vx4DGHCySp7COeu9Tq/0K6OpkXSftO8IlphnbkyN8RV1T1CNVFVC+37r4hFNLPgj7b
	PeT685zncswyLVIVm8K3eGfZK8MCUp7XqMUftYGFJOzNj+urbJQrqSGGavbB16BiqhS1
	0gkZ76xQRcZ7SHnH+cVfgTA++CzfvfQqhVtzQwE9qc2glbF+rwG7RflqU1m60ZQK4ROs
	w5dclKbmlr2gFnbShVb0pjR+6tA7wibfXNcolRw4f/C5vCjtMBF6iS2VBSvVYr+GHnU+
	wOxA==
X-Gm-Message-State: AHPjjUiTsOn6xLKLMVEDnhupvXj/nkVFbJC+7wn4MxRCP1h7p0/M2G9H
	dlU7nR8GAhaZhlUP
X-Google-Smtp-Source: ADKCNb6YLf8Z5bIQfZxoiTSHflVVoVxpbSRX5CAefCY+xujIaD8+W+1I1lQtZWpj9mhOy6s+RjbS4Q==
X-Received: by 10.223.160.221 with SMTP id n29mr28165601wrn.214.1505742252753; 
	Mon, 18 Sep 2017 06:44:12 -0700 (PDT)
Received: from localhost.localdomain (46-198-7-164.adsl.cyta.gr.
	[46.198.7.164])
	by smtp.gmail.com with ESMTPSA id 32sm7170821wrs.19.2017.09.18.06.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 06:44:11 -0700 (PDT)
From: Will Newton <will.newton@gmail.com>
X-Google-Original-From: Will Newton <willn@resin.io>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Sep 2017 16:43:56 +0300
Message-Id: <20170918134356.16124-1-willn@resin.io>
X-Mailer: git-send-email 2.13.5
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [pyro][PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Mon, 18 Sep 2017 13:44:12 -0000

From: Will Newton <will.newton@gmail.com>

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

(From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3b9c50a336d)

Signed-off-by: Will Newton <willn@resin.io>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/goarch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 4a5b2ec787..12df88f8c4 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -38,8 +38,11 @@ def go_map_arch(a, d):
 
 def go_map_arm(a, f, d):
     import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
+    if re.match('arm.*', a):
+        if 'armv7' in f:
+            return '7'
+        elif 'armv6' in f:
+            return '6'
     return ''
 
 def go_map_os(o, d):
-- 
2.13.5


