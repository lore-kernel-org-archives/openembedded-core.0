Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C694731CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:33:25 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id x65so9052322pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=6lW6UCpXY66suimwi/oSsQtoKrOI57YP6YQXujnDoz0=;
	b=Wm2T8872TE+xD19I+En/A8g5OvUr1IZSG4Ph5T++opxOtjldMngS0ID9WvwW25H/md
	EdzgWYMjVj5UKU4EYRifQIEl55+Xk0L0R7EzLkE2ehUhBbR9Kxt1DW7mSgJfJuCwDnhG
	SLlKXXaAqxLzNxTLFd4iGcM9/XPPGl2eN+bPcezXiRvK9ufRTguZb41/+JvMdQlrymPx
	/dHbKwO/63eUSNrqyxIBygZJfuHSuUIFHV+N/VTWnS6c5yR7Smh5Hl5y6ipy/k88bd47
	LxexNACyQ89sjTOpKxr29IKErmOF6dGwfWSg4scqquZ6RfECqHL4p4M5CMk0evn2fgPb
	JKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6lW6UCpXY66suimwi/oSsQtoKrOI57YP6YQXujnDoz0=;
	b=RwOtuWa6L/zHyBZm5RCsgAkTQWYnPRISRySQ9HQ3+h7o+BiLz1EzdMuZ1SKt+n+ivf
	JPBr6RUIqlmoK4D1LjBfH43RoVp4RQVm1XcMmBHUroNzePWVnaM6RdZnkGSH4TA0vdjC
	y4+8Add88P5HqD2Et9eUIQzdYD38qaGpny6/rZGMgbvinL/CG+zXlkMUcz+mw1LFgYUr
	6cnwBcX0I8FF8K0HUil4IvLwZPIe87zhHZPhrIOqC081PWl2WnElP2DGwwIJn0z92xG2
	Wi6Ch1qUbMm0tQFLAENIFp+3Zhv200Yrz9vcaVjkULIikUhH7nE7Lq1vsUW68WFg4a15
	/nmg==
X-Gm-Message-State: AG10YOTKpN23qtc8LfirfQDS7l1XfVPUNG2iwwyVfZt8dOOdQ3x26dpCqK/DmrOjn/EyCQ==
X-Received: by 10.98.18.201 with SMTP id 70mr51015525pfs.104.1455028406089;
	Tue, 09 Feb 2016 06:33:26 -0800 (PST)
Received: from nathanbox.home.gateway ([45.124.165.4])
	by smtp.gmail.com with ESMTPSA id
	ey2sm51296943pab.2.2016.02.09.06.33.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 06:33:24 -0800 (PST)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 00:33:14 +1000
Message-Id: <1455028394-17574-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] insane.bbclass: Support MicroBlaze with musl
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
X-List-Received-Date: Tue, 09 Feb 2016 14:33:25 -0000

MicroBlaze is supported by musl, add entries for the 3 variants.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 47b441a..2bc9315 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -127,6 +127,9 @@ def package_qa_get_machine_dict():
                         "mipsel":     (   8,     0,    0,          True,          32),
                         "mips64":     (   8,     0,    0,          False,         64),
                         "mips64el":   (   8,     0,    0,          True,          64),
+                        "microblaze":  (189,     0,    0,          False,         32),
+                        "microblazeeb":(189,     0,    0,          False,         32),
+                        "microblazeel":(189,     0,    0,          True,          32),
                       },
             "uclinux-uclibc" : {
                         "bfin":       ( 106,     0,    0,          True,         32),
-- 
2.7.0


