Return-Path: <paul.barker.commagility@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6E54C601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 11:32:30 +0000 (UTC)
Received: by wmec201 with SMTP id c201so129639663wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 03:32:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hRQKY1/WJof7H1q0whWSX/G0Lt2ma8du6/O39CfI/48=;
	b=cMy0p3cdMxVEKCdIlIfKv+JGrfNQOjSTjFeM6TFtXwAIdI+AYriFpxAWShtHL+fDV5
	SqmSP3J0+Rs/EV7+zuFr8YtjXGlhcackiTdSqArv7AyQHE/psqQm3csthSPTl2yx/QZd
	zUP8Y/4v5A818hgI6VmoslO5kM3KjSJs4q+FiGPe09tkvNK9kNEyFRjvvZdPADH+gRuL
	044j4Rj9LHo1F1qdOqsqRL92SsNEFT8HEHLvD1btt9wBYWv+lNiEaiaTg3J2nvgMlkt9
	OhhcBkhaddofCuv+LFEc2I3ztDk6jdcUoMj/NdjufIMYKXV08t62i+Yv09kk3qo7K6+e
	wH+w==
X-Received: by 10.28.127.200 with SMTP id a191mr16368376wmd.27.1449401551439; 
	Sun, 06 Dec 2015 03:32:31 -0800 (PST)
Received: from oebuild.commagility.com (inno-commagility-ownrouter.lut.ac.uk.
	[131.231.60.35]) by smtp.gmail.com with ESMTPSA id
	186sm11662017wmv.9.2015.12.06.03.32.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Dec 2015 03:32:30 -0800 (PST)
From: Paul Barker <paul.barker@commagility.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Dec 2015 11:26:34 +0000
Message-Id: <1449401194-31567-2-git-send-email-paul.barker@commagility.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
Subject: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Sun, 06 Dec 2015 11:32:31 -0000

In the Linux 3.10.y series, repeatedly running 'make scripts' causes the modpost
script to be rebuilt every time. This causes a potential race condition when
building multiple external modules against a 3.10.y series kernel: one recipe
may be running do_make_scripts and modifying modpost whilst another is running
do_compile and using modpost. In my case this caused a permission error during
do_compile for one recipe as modpost was not executable at the time it tried to
run it.

In Linux 3.11 this was resolved and multiple invocations of 'make scripts' does
not cause modpost to be rebuilt. However, there are still vendor kernels in use
based on the 3.10.y series. Even on later kernel versions it would require more
investigation to conclude that running 'make scripts' whilst also building an
out-of-tree module is always safe. Therefore we should prevent do_make_scripts
from running at the same time as do_compile.

A side effect of this is that only one out-of-tree module recipe can be running
do_compile at any time. This may affect build time if multiple, large
out-of-tree modules are being built but that should be rare and the impact on
overall build time should be low.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
---
 meta/classes/module.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index 0952c0c..74280f0 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -4,6 +4,10 @@ addtask make_scripts after do_patch before do_compile
 do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
+# Ensure one recipe isn't running do_make_scripts whilst another is using those
+# scripts in do_compile.
+do_compile[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 module_do_compile() {
-- 
1.8.3.1


