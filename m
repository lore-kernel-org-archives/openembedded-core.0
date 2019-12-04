Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id F00F27F771
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 12:32:21 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id t14so7695211wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2019 04:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YF2pcMMZtVzEODD/6l1btvLu2Vmd3RID616YND0H1tE=;
	b=NAhqgcr/sh8fvCgcCwFh5dy1lAWBTBoIHpehaaCLj5KEM3k9PJQYykzqNHKysS/43Y
	E1QHaDjnw/A0R67AozYMNOFejSqpsoUZKAp9bko/G5/fEeD/cvs+ESybsz9xu4JXJ864
	KtqtUL1iaryGoK1Ix43gcu+Lg8BrjHmfo18M8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YF2pcMMZtVzEODD/6l1btvLu2Vmd3RID616YND0H1tE=;
	b=lTQ8R7aGCPPsTZ/qcRf7Dns0U1qZEYNn/uDkFzOBAdt+Hh5JpDHMLNMmiB1fPV0MgB
	T1ERM0j+GJ6NirjV88I6VKg9XzHykIKUHAHWN8kKLSvIXB7o/nEBAIVxYds0ZeHpW2QL
	Kl+UvFkjAgIBoSqEDRioXX/MIijde5s3AgvsW5MQhm7TeRA9xe6KLvKPtRMdZfRG6NUF
	3Nc4gXF/jA7oHM8x5pgYH6liDhsOd3rDH2p8IisLpK9gwN7amnUsPdHNf3Ram+Gz37sO
	2i2MMY1Wi4bLGqFBPEGSbymqT5O3udxmWFGKRT7U7BkEIKRjNHGwOT+D3vBig1M5n2L4
	TfIw==
X-Gm-Message-State: APjAAAUVO8tn0L3UXLexFs7K9os/BYbRlT358e1ehlNFTro0OnbAfKnB
	LvxA3W61eUVCpsWYh/EkLn2GU2izTw4=
X-Google-Smtp-Source: APXvYqwWJEwa9kKDhqb4O0UUsoqD9x3Rr35wy7zLUE1Xs1p0Ov2AF8CuZm7KAt8htQn376J5FwVJvg==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr26366746wmk.46.1575462742208; 
	Wed, 04 Dec 2019 04:32:22 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	188sm6349746wmz.13.2019.12.04.04.32.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Dec 2019 04:32:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 12:32:20 +0000
Message-Id: <20191204123220.30601-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/qemurunner: Fix cmdline variable use before reference
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
X-List-Received-Date: Wed, 04 Dec 2019 12:32:22 -0000
Content-Transfer-Encoding: 8bit

This avoids some tracebacks we've seen on failed autobuilder builds which would
allow the real error to be seen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c025eb09c5f..60e1cf8e08e 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -242,8 +242,8 @@ class QemuRunner:
         self.logger.debug("qemu started in %s seconds - qemu procces pid is %s (%s)" %
                           (time.time() - (endtime - self.runqemutime),
                            self.qemupid, time.strftime("%D %H:%M:%S")))
+        cmdline = ''
         if get_ip:
-            cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
                 cmdline = p.read()
                 # It is needed to sanitize the data received
-- 
2.20.1


