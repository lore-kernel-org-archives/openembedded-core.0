Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 73F7060097
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 15:11:02 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id q5so4251769wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Oct 2014 08:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xo0oNDyITfo2b5UiCzcGa52Mh3BPj3VizCbiRhbwQmM=;
	b=XHdszJ8WkxnKEmZ8/eCpA53Z7e0laM9Tr/swvGg7XpVVBmJlsQEiqm1vqJyCp0RhHV
	4dGi3GhjgY0/GnzO0daeeBn6h34VFW4oiiUwyWkzNbWof3k+e4oQIgwCEiYkTNqC+pQ4
	26+BIIWHdA/khkENayXvvC4jf5VmM+EAZomDBFNtQdz3pCDYvyzgZ3dSJnyECMAXOEpL
	hk2e7PUsnsSZ2sJScFe+pq+IR/dgZDQoY+aXlXLMZ0TeoZzOjzX45e4R1Ozs8YGrlmVU
	j+PJ8/VYdsx1u7Wa32WbRe50j0VIc+w0o5NBk0EifYnYTZX+IBgdy3aprGGGKKy70kTn
	9tRw==
X-Gm-Message-State: ALoCoQma46L8z2KHtr0AV6691nyPUbwk6FpJdKcVl1I3AUjDjm35r9d4EvLAI8M3xzECfXj2hxcX
X-Received: by 10.180.12.136 with SMTP id y8mr1500687wib.73.1414336262466;
	Sun, 26 Oct 2014 08:11:02 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id dw9sm8625933wib.0.2014.10.26.08.11.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 26 Oct 2014 08:11:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Oct 2014 16:10:54 +0100
Message-Id: <1414336254-22707-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] base bbclass: add support for tar.lz
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
X-List-Received-Date: Sun, 26 Oct 2014 15:11:05 -0000

Some GNU packages (e.g. ddrescue) switched to lzip only, so add support for it.

Needs matching bitbake patch to work properly:
http://lists.openembedded.org/pipermail/bitbake-devel/2014-October/005093.html

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/base.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index ff8c633..128297a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -478,6 +478,11 @@ python () {
     elif "osc://" in srcuri:
         d.appendVarFlag('do_fetch', 'depends', ' osc-native:do_populate_sysroot')
 
+    # *.lz should depends on lzip-native for unpacking
+    # Not endswith because of "*.patch.lz;patch=1". Need bb.fetch.decodeurl in future
+    if '.lz' in srcuri:
+        d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
+
     # *.lz4 should depends on lz4-native for unpacking
     # Not endswith because of "*.patch.lz4;patch=1". Need bb.fetch.decodeurl in future
     if '.lz4' in srcuri:
-- 
1.9.0


