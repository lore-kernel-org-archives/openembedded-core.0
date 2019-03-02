Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 57D2D71A74
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 16:53:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y15so932621wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 08:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u0ZIarwx9K+lSO3JHXFHiqMafpt+7kuUEK/QllLquL4=;
	b=eEFnf84wGt4lC+h8arwdHI/qZWhkPFN/MhVxRgqsf6144wHrofX+uRunXS2wq9N0OS
	rG+3+OEHeOlZ+mOkfszhjK48/dmaurlwdHcTg5JYZez0C3EOYUqyzJlf082KYKkOcjQM
	DmQIUFQ/o+3+AcGlrOluRMUXEpeW0czUUZcyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=u0ZIarwx9K+lSO3JHXFHiqMafpt+7kuUEK/QllLquL4=;
	b=B1cwM4QhfyAQJNZp/4goLPsO4p4Xtr5cyeTPL3LLrv7HdbsdtAHJ8YmqN5y01LZ8dF
	wc8qLTjOXyGJiSMN7gd0hvgV7h+uzMwIkXSqYTonGAa1d9tPQK68yFIwCCwuwGkBI6+A
	RkyJ4iPBpwdnjMzuo71DEfoa4m5pYgjU5fl/vrg7Okuy5iD011nMSUFm7ftBXHh36eFM
	+CD/XlMsZXG9XIzItg0uFz6nR0mNLrn/DORGcaAzxPbrA7GacdENBTpGEiwDkD371NPT
	UaMH5bq4SNS1Nd7XLHVasKCx6t5GLKe2mAWUXWkOjwnuHBDksaoD3c26jDZwrB25IuJG
	zKmw==
X-Gm-Message-State: APjAAAU+90Qs9fiav2dzAO4BJi7LgKrDUm2/hGTo8nDopUPtveeiyo5D
	hzc4E3rL2j6jAAUFyF2X13RgX0M0OPM=
X-Google-Smtp-Source: APXvYqxckeeGJ/gqVjEKCvx8vvRHrM9Eoi65P3vpTnnM+8mshpps5UNuGy3EUlWKDV59Ht/ATQ91Iw==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr3991740wmb.46.1551545588549; 
	Sat, 02 Mar 2019 08:53:08 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e193sm2046103wmg.18.2019.03.02.08.53.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 08:53:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2019 16:53:06 +0000
Message-Id: <20190302165307.4290-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] mcextend: Add helper class useful for multiconfig
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
X-List-Received-Date: Sat, 02 Mar 2019 16:53:08 -0000
Content-Transfer-Encoding: 8bit

This class allows users to easily create multiconfig BBCLASSEXTEND recipes
and is generally useful. It will be used by new tests so add as a general
feature.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/mcextend.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/classes/mcextend.bbclass

diff --git a/meta/classes/mcextend.bbclass b/meta/classes/mcextend.bbclass
new file mode 100644
index 00000000000..0f8f9622986
--- /dev/null
+++ b/meta/classes/mcextend.bbclass
@@ -0,0 +1,16 @@
+python mcextend_virtclass_handler () {
+    cls = e.data.getVar("BBEXTENDCURR")
+    variant = e.data.getVar("BBEXTENDVARIANT")
+    if cls != "mcextend" or not variant:
+        return
+
+    override = ":virtclass-mcextend-" + variant
+
+    e.data.setVar("PN", e.data.getVar("PN", False) + "-" + variant)
+    e.data.setVar("MCNAME", variant)
+    e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
+}
+
+addhandler mcextend_virtclass_handler
+mcextend_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
+
-- 
2.20.1


