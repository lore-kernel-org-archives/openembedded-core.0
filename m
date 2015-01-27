Return-Path: <danismostlikely@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 87DE77147D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 17:29:58 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id ar1so16556308iec.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 09:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:subject:to:resent-date:resent-from:resent-to
	:resent-subject:resent-message-id:resent-user-agent;
	bh=BOw+enWsZVwNluBBuonIK0TYHqALjI76CdKojwePLs4=;
	b=mXCnISKNxajy76IzdBNO1IAHIn2InOEt1+mBV+6/sG72aayK01JQDavxkKx0HbFQ6L
	fMvtiEioI0ZgtsKgDILDuANRHkmZMT9nADhp+c/EVhMuHIh1+/1e9zt1aEQjtxa6wlm1
	7UG8WyjkkH9nteMcSUhPPsIYcBmm3gnSjHhT8CL1H2BHjd3+nHmUl4l3KXkadNWixoQB
	Ps+/wY3awV+Bc/0r/us49JsMzbS91S4jQfnMwJhaIUsEAMq5AmLsTNko4XJg/WsmecTn
	eILH05OyFAXTytICEEyM4qcYsXOTTYS+DmKCpy2CUn+V+xMm8GVAEblDPG33vzkINAJY
	2rAw==
X-Received: by 10.50.83.10 with SMTP id m10mr4360054igy.23.1422379798088;
	Tue, 27 Jan 2015 09:29:58 -0800 (PST)
Received: from mediabox.local (71-17-233-74.sktn.hsdb.sasknet.sk.ca.
	[71.17.233.74])
	by mx.google.com with ESMTPSA id u12sm1032103ioi.15.2015.01.27.09.29.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jan 2015 09:29:57 -0800 (PST)
Message-ID: <54c7cb15.0c0a6b0a.1efc.2c57@mx.google.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Tue, 27 Jan 2015 11:21:12 -0600
To: openembedded-core@lists.openembedded.org
ReSent-Date: Tue, 27 Jan 2015 11:29:30 -0600 (CST)
ReSent-From: Dan McGregor <dan@mediabox.local>
ReSent-To: openembedded-core@lists.openembedded.org
ReSent-Subject: [OE-Core][PATCH] image.bbclass: make kernel depmod data
	optional
ReSent-Message-ID: <alpine.LFD.2.11.1501271129230.8916@mediabox.local>
ReSent-User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
Subject: [PATCH] image.bbclass: make kernel depmod data optional
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
X-List-Received-Date: Tue, 27 Jan 2015 17:30:03 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

This allows an image to skip the creation of kernel depmod
data. It is useful for creating an image that will run as a
container image inside a host with no knowledge of the parent's
kernel.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/classes/image.bbclass | 1 +
 meta/lib/oe/rootfs.py      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 22b6970..b284101 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -63,6 +63,7 @@ PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 EXCLUDE_FROM_WORLD = "1"
 
 USE_DEVFS ?= "1"
+USE_DEPMOD ?= "1"
 
 PID = "${@os.getpid()}"
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 72d32f7..ed15c95 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -124,7 +124,8 @@ class Rootfs(object):
 
         self._run_ldconfig()
 
-        self._generate_kernel_module_deps()
+        if self.d.getVar('USE_DEPMOD', True) != "0":
+            self._generate_kernel_module_deps()
 
         self._cleanup()
 
-- 
2.1.0



