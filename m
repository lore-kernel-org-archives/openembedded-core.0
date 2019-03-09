Return-Path: <max.oss.09@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 496886006E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 18:50:48 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id 10so728822eds.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Mar 2019 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Pv1nCQmSWDpPXvbJJnQEl8OlVj0zIL0JfsSyp5EHdwA=;
	b=HRQlQPvqcZ4B3gibloWGAIrJPj/UgjejsF2WHMLWgZ7kxDuYkxYmdPxxx9/8PoapKH
	8usBRbL76i50s+GR/z4uYffGENQ6gWBKaaEJ1PH4aGYIrcETWg+Vwi00CsNFAiCYyLjZ
	z+zZHrv7uDJNdSuPOMHGN2S1crVCom19djE22NJu+MA7ppCyttBWIuSlhqS9TNDLB47O
	pvz4BeVYyWUOt+cVVmiJCChJyzzfI2DeRUSM99DP7Op+z9oc6Qkzw652zxDJzh7p/hqZ
	PpDUHdYXti0B3vC6YWCOGpLxEiRfORQaTrBuVhDoNGFOva5I5bl/EOK0JP+kW+ObhBQV
	EVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Pv1nCQmSWDpPXvbJJnQEl8OlVj0zIL0JfsSyp5EHdwA=;
	b=ctZTbnRK0FvfpkInqBtYSBW89eOOJSsr9OVaXkB1xOhqqj9R0jEweOdlnwx3ggYgmC
	/3LnZ17bU8wTdiy9tliiSF1TpGcFKQY3Y07buH1V82WkoalHZp8v9YPxs9KlOTYIVJBv
	++M6s/ypih72JhL6K4Yp3R24QfSt397pmcKsGTWx5TUrc45uiw2DwgxEq24ZpoUWRF7h
	S0bewj+SHej2xW9skxsEXN5JqtB8HO25xHm60JxdCYOL3zL77y+Ds4/CFeVmpNZYrweJ
	DxGada1rhmrASdGosO6yTXvummUbnSL7jqsfWHHA6XP0NgzuQjkpHwoDhUwcFjNqI3yt
	YOTw==
X-Gm-Message-State: APjAAAWG+Z8UcvCyVBkEH4YkgEsjwhz8nRDXuN48fdBZjzhJvLZNNfT2
	n3fn2684QnpTz46+6d3JFqsVWclJ
X-Google-Smtp-Source: APXvYqz1zVvLOvuVXpG492Z1uSXCOmEN2c4EcfUGlvxkwCyICA3oCC6qt78NGUg4NBiajaR6EWsSDA==
X-Received: by 2002:a50:d2d7:: with SMTP id q23mr38289795edg.120.1552157448570;
	Sat, 09 Mar 2019 10:50:48 -0800 (PST)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id g5sm2059939ejj.42.2019.03.09.10.50.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 09 Mar 2019 10:50:47 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Mar 2019 19:50:07 +0100
Message-Id: <20190309185007.1568-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Subject: [thud][PATCH] target-sdk-provides-dummy: Extend to -dev and -src packages
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
X-List-Received-Date: Sat, 09 Mar 2019 18:50:48 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids errors when running populate_sdk under opkg:

 * Problem 1/1:
 *   - package busybox-dev-1.30.1-r0.core2-64 requires busybox = 1.30.1-r0, but none of the providers can be installed
 *
 * Solution 1:
 *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.sdk-provides-dummy-target

 * Solution 2:
 *   - do not ask to install a package providing busybox-dev

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 33d2cde3be4d25389cbea07064ffbc7b2f74273e)
---
 meta/recipes-core/meta/target-sdk-provides-dummy.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index edf07c4a23..e7bf2ac632 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -2,9 +2,17 @@ DUMMYARCH = "sdk-provides-dummy-target"
 
 DUMMYPROVIDES = "\
     busybox \
+    busybox-dev \
+    busybox-src \
     coreutils \
+    coreutils-dev \
+    coreutils-src \
     bash \
+    bash-dev \
+    bash-src \
     perl \
+    perl-dev \
+    perl-src \
     perl-module-re \
     perl-module-strict \
     perl-module-vars \
@@ -33,6 +41,8 @@ DUMMYPROVIDES = "\
     /usr/bin/env \
     /usr/bin/perl \
     pkgconfig \
+    pkgconfig-dev \
+    pkgconfig-src \
 "
 
 require dummy-sdk-package.inc
-- 
2.13.6


