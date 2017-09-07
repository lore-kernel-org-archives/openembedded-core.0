Return-Path: <will.newton@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3C177A62
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 12:31:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p17so1281374wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Sep 2017 05:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=MQwOZnWR3SJRt0ASj6/BDBY08WYoKkRocFnibuvqdDA=;
	b=YTe6ojQRG/nYgWNSsjJ3TwbobkA4QMnT78fo/iG+nWHc2noSxNd4uyHqhgtnNBrqaV
	KeiJsKAbdkSN2QipDpvj/sE4X99i1mnzft0bQo357EDP4CIZUPli6HnMY48wbEELs/Ew
	fyIBlDI0iE9RCV2r7w54KbL6KCpkf8J6ApQo9Cw7oNkDO+u+1JfIYnmgEUbB4BmgeQgg
	y/c6cWCHjom/3TUJGlA+YEi2CrUMkPNFpqa9P6rtJLe1VA2ciVKzBiD8Dci4bjmvvPbD
	8OPcpt5QD2FDJbQks8YO8DWX4WhnjlQZUikh+86z4/N4DrlaH28pAxnI1gNTJJvt5IOQ
	9s9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MQwOZnWR3SJRt0ASj6/BDBY08WYoKkRocFnibuvqdDA=;
	b=GLZeIPD3K8e3PeB6+5SKVtmAF+A8+jfCe4wSFGV9/9KDAo8mjT9B08WxD2JAaA8xSk
	ngtRZ0nrRAzxN/IdOQ74ByuaNL5ei0r33OUlHeremjqo2IrWDRajrBR3/qjBu6B1OE+J
	g71PKetAecpgat+OJ34mbrbcRfdfL/dtHOkEcBlAYMTQ3AK/0yzRedsDTj7OWn6+OtKI
	OYXRqq7SPCgXoFZEthNNsmMAI2/Dcr0e8B0iVjATzgla0tu95DAQPC7RNxHt4Ta+9+wV
	oQWWfAgThdXuciGlimP+Zv36IzF06K4tRFYh625/cZsvr4TvSo4+OMJPJx6rMSc6Lh5i
	umLw==
X-Gm-Message-State: AHPjjUiQie3aRNGxHguoSSsr+TDDd2bKqUCMkj2dAh185wuO9KwUfPQG
	anYHlxi3k1XbLe8O
X-Google-Smtp-Source: ADKCNb4texGVw3PJDNYSxjyfYKH9ysQRVSXKqBceQLcQszlevvlErqRtjfv6ptHakK2fsm6VKnDriQ==
X-Received: by 10.28.143.205 with SMTP id r196mr442858wmd.144.1504787508688;
	Thu, 07 Sep 2017 05:31:48 -0700 (PDT)
Received: from localhost.localdomain
	(cpc99254-seac26-2-0-cust416.7-2.cable.virginm.net. [86.7.141.161])
	by smtp.gmail.com with ESMTPSA id d5sm358894wma.22.2017.09.07.05.31.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Sep 2017 05:31:47 -0700 (PDT)
From: Will Newton <will.newton@gmail.com>
X-Google-Original-From: Will Newton <willn@resin.io>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Sep 2017 13:31:42 +0100
Message-Id: <20170907123142.28622-1-willn@resin.io>
X-Mailer: git-send-email 2.13.5
Cc: Will Newton <willn@resin.io>
Subject: [PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 07 Sep 2017 12:31:48 -0000

The previous logic applied a regex to TUNE_FEATURES which could
set the GOARM value to 7 incorrectly, for example when dealing
with an arm1176 core. Simplify to check for the presence of
"armv7a" instead. At the same time add a check for "armv6" and
set GOARM to 6 in that case.

Signed-off-by: Will Newton <willn@resin.io>
---
 meta/classes/goarch.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 4a5b2ec..35f2987 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -38,8 +38,11 @@ def go_map_arch(a, d):
 
 def go_map_arm(a, f, d):
     import re
-    if re.match('arm.*', a) and re.match('arm.*7.*', f):
-        return '7'
+    if re.match('arm.*', a):
+        if 'armv7a' in f:
+            return '7'
+        elif 'armv6' in f:
+            return '6'
     return ''
 
 def go_map_os(o, d):
-- 
2.7.4


