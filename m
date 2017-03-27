Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id ED1CC72FB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:03:40 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id y18so71896797itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iWop/UVKrOn8grylxWP0Y3K3F+RdxLz7VyGlGQMPSPQ=;
	b=KlRq7d38RvZN+NPYZ3H3MpQImjE+9NXoJC6mpUaKeRq+JyYrx7viVVaIFCcnkdKW/y
	u21/zP4+NLlQuwau+U/GRQFXe9x6DGv9P81gLN5PLvaBdQFBY3fDm2uNzLIX4dsAFAIV
	T/g3RHjKYvuqIMIAXUFt9/S1tKk2TAMpM6a9SE+bPhS6MW1BGdr4LxAehMaF7zu18bco
	K5CtEvMBuB5mRhkFMkMG0a4lwOjk9MPA6+5kgncQZy/w0SnRSy+dg0Qsxi5LZBS4cg+5
	JpzfDkpm0JISmTlBJzJH9QKPDjsRCq3MGXcBzPdwj9UUj65ubSUKRPGKPe4U/iQ/Lsc5
	7h/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=iWop/UVKrOn8grylxWP0Y3K3F+RdxLz7VyGlGQMPSPQ=;
	b=OR3ETOByYym7lzoL5l84V1EiI7Y4R71OYx+ykrM+xLgLrA1bqCL/hmZEzQtZYhmM51
	QuqueWEH0KGB9HvI5AffVK1lQcKvIJvqn98eVtOXW01tB6oemE6gJtG2JhnLaveiu6Gl
	R+SkkS1sxUHJOQj8tqVUbiP7FNbVHKOf3VfPD+otMJd/w/6QCnqcWGzE9X0gdFruJKpo
	IABhmCA0Z+xY00Y5zGD0SGXk5Zo6Vchpbtd7yettmxUUnKzNpfiJ5PWNB9kzDJrpzUUp
	+SCJlW9vm0UVWoaFKIOM0/btDuSRWWfc2TGEHw9JmT5Ifklk+8ssG6VQC0XIGNd9/f+T
	MFdQ==
X-Gm-Message-State: AFeK/H3iQw0emMmDHNLJUTHTCPN6pPhot/cmyTCeUEXtV+4VKbXYNIEh9pG6ZrGmvI8XMq0P
X-Received: by 10.107.6.206 with SMTP id f75mr19483866ioi.75.1490619814255;
	Mon, 27 Mar 2017 06:03:34 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2B5.dip0.t-ipconnect.de.
	[93.232.210.181]) by smtp.gmail.com with ESMTPSA id
	y203sm217251iod.11.2017.03.27.06.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Mar 2017 06:03:33 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 15:03:23 +0200
Message-Id: <798bd1ee14f3880d25bfaa051fd2585396eabfdf.1490619742.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.4189796e0dbea7cfc888587157135c9fb8477ab8.1490619742.git-series.patrick.ohly@intel.com>
References: <cover.4189796e0dbea7cfc888587157135c9fb8477ab8.1490619742.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] oeqa: QEMU_USE_KVM can list machines
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
X-List-Received-Date: Mon, 27 Mar 2017 13:03:41 -0000

Previously, QEMU_USE_KVM=True enabled the use of kvm only when "x86"
was in the MACHINE name. That is too limiting, because for example
intel-corei7-64 can also use kvm but it wasn't possible to enable that
without changing OE-core.

That traditional usage is still supported. In addition, QEMU_USE_KVM
can be set to a list of space-separated MACHINE names for which kvm is
to be enabled.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/testimage.bbclass | 4 +++-
 meta/lib/oeqa/targetcontrol.py | 7 ++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index bfe5714..a259423 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -210,7 +210,9 @@ def testimage_main(d):
 
     # Get use_kvm
     qemu_use_kvm = d.getVar("QEMU_USE_KVM")
-    if qemu_use_kvm and qemu_use_kvm == 'True' and 'x86' in machine:
+    if qemu_use_kvm and \
+       (qemu_use_kvm == 'True' and 'x86' in machine or \
+        d.getVar('MACHINE') in qemu_use_kvm.split()):
         kvm = True
     else:
         kvm = False
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 47cfe85..b256f1b 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -131,9 +131,10 @@ class QemuTarget(BaseTarget):
         dump_target_cmds = d.getVar("testimage_dump_target")
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
-        if d.getVar("QEMU_USE_KVM", False) is not None \
-           and d.getVar("QEMU_USE_KVM", False) == "True" \
-           and "x86" in d.getVar("MACHINE"):
+        qemu_use_kvm = d.getVar("QEMU_USE_KVM")
+        if qemu_use_kvm and \
+           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
+            d.getVar("MACHINE") in qemu_use_kvm.split()):
             use_kvm = True
         else:
             use_kvm = False
-- 
git-series 0.9.1

