Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 75D6060C24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 15:30:58 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a6so9029675wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 07:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y4qmaKk0LUopJeBNdVuULt4KuXiUxC0GCDGdD/zNZS8=;
	b=TRy7vZJeR5XwmGFSr/UCfjC2Cqga6lAt6fMhDIXEEkIo3lt4HHz3PJcjdZGUvizV37
	+6nZWP6+jYANwWUPtDnHrqeu4SHxMux7TZNn8SjP0ZkChi2+D62IL9ySFwOvCz03jppW
	q6c/UwP/8mMmS5Y/fqTk+q9xpyP++/hY22CMXi2IUHRoGJcRLOTHYrfngcyd6hRW5jmJ
	kUEwt3lfYTMOq/oLeWfXtmqmykoyiJo8eHff+L7OtHRuvqlhHpz9340s7SpFpwr5gr8N
	+vmAcccQvZQLoCqhKfNibfNSaxez+ahy+6ikQCUnwNykkEyXfzrDytAfBkL1frSOSGr3
	ujiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y4qmaKk0LUopJeBNdVuULt4KuXiUxC0GCDGdD/zNZS8=;
	b=hbPAfG3KWTLF+lf0OSm+OX2l9S1Ci0bSF6SficEVgSSudbNWXAIibC6Ozmh4eNg9Hb
	O84fP06s9Oif/3yCcYCkIB+GGpAaVX+3RCevHgUxGSRCuIDF3L7vi2Uqof4aJhuEy14T
	ZoV/N8lBNexzCwtm3CB8G4sIvMbtk3Y6ud/SsNc4FTLjP2stqMbV3CpLCcEzQzX0KBI7
	wwNkoxVPMHHlnjMLNSXPpjtMXkiPyatm6fB752C1Zr93DBWktJloeN5bsdxHBuLbhuAr
	yRQQHgori6BCqRyeWj/Dbgj1FNtUE67KeDadN8ibWuk+lPtu99Zhp0xrUwARNrV/8BGe
	sWwg==
X-Gm-Message-State: APjAAAVmZJLD3zly11HEPbIklzhybH/KvmaREJoc/cZwV6MpwFU+762N
	WTFGLYdm4A1n8OI4o5oam8r3JP6H
X-Google-Smtp-Source: APXvYqyADeAG/FYcXFvdMYhYn8epct+v5t4fUD3UVcDotzKuTp3BZO3YGv5nHaCcHAKBijOSIIt5ZA==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr13486348wrk.53.1580484658494; 
	Fri, 31 Jan 2020 07:30:58 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	z3sm12432497wrs.94.2020.01.31.07.30.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 07:30:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2020 16:30:25 +0100
Message-Id: <20200131153025.31040-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] busybox: sort the .config file used by ptests
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
X-List-Received-Date: Fri, 31 Jan 2020 15:30:58 -0000
Content-Transfer-Encoding: 8bit

It was found to have slight variations in order of options
depending on the host. Sorting it helps reproducibility.

[YOCTO #13756]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 391e4fd1639..1a82f23b0f3 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -356,7 +356,7 @@ do_install_ptest () {
 	cp -r ${B}/testsuite ${D}${PTEST_PATH}/
         # These access the internet which is not guaranteed to work on machines running the tests
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
-	cp ${B}/.config      ${D}${PTEST_PATH}/
+	sort ${B}/.config > ${D}${PTEST_PATH}/.config
 	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
 }
 
-- 
2.25.0


