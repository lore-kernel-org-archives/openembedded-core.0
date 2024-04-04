Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC6ECD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 11:38:13 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.35864.1712230689506867459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 04:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=OzkGhtmu;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=2oLg+VoDw7dIQodXDgDYs5725FAkXQ9WBgyNOwJdyp8=; b=OzkGhtmuq0R2IpuY7szddskVis
	07S1+ez2++Xv2zqGU2xZuOml/Z4jnhZSoOTR3cracoqqsMCLWpErdjvIf6VQUZdhWjNOGrM5VnUqu
	1jhunN/sxRe7b0B5iHjYzWzH9bR9Q9zwreeqiOyx3SNxY5A5lHBguINnylomo7b1DtWaZ7bsFLvGM
	ogAgod6ppSpVZAe+1VxePz7DJl7gCPYU6GkySh7urEKZiiaVWUSuC0Jq4rTaQHIzNPwUIN5dPQQbf
	EAmluG9oX6o1QI+8wRjtiWHgL7xidWDU7qRnhSbMy7z1xcG5B0Xti9Jq3bKjHpI6fL/aXCivjB0mX
	8jQsPrnw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rsL52-000FYz-Df; Thu, 04 Apr 2024 13:16:28 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rsL51-000Wu6-2u;
	Thu, 04 Apr 2024 13:16:27 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 1/5] classes: jobserver: support gnu make fifo jobserver
Date: Thu,  4 Apr 2024 13:16:09 +0200
Message-ID: <20240404111613.2574424-2-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404111613.2574424-1-martin@geanix.com>
References: <20240404111613.2574424-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27235/Thu Apr  4 10:24:59 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 11:38:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197957

Add a class to implement the gnu make fifo style jobserver. The class
can be activated by simply adding an `INHERIT += "jobserver"` to the
local configuration.

Furthermore, one can configure an external jobserver (i.e. a server
shared between multiple builds), by configuring the `JOBSERVER_FIFO`
variable to point at an existing jobserver fifo.

The jobserver class uses the fifo style jobserver, which doesn't require
passing open file descriptors around. It does, however, require
make-4.4, which isn't available in common distro yet. To work around
this, the class makes all recipes (except make and its dependencies
itself) depend on `virtual/make-native`.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/classes-global/jobserver.bbclass | 87 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf                |  2 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-global/jobserver.bbclass

diff --git a/meta/classes-global/jobserver.bbclass b/meta/classes-global/jobserver.bbclass
new file mode 100644
index 0000000000..3866b473e6
--- /dev/null
+++ b/meta/classes-global/jobserver.bbclass
@@ -0,0 +1,87 @@
+JOBSERVER_FIFO ?= ""
+JOBSERVER_FIFO[doc] = "Path to external jobserver fifo to use instead of creating a per-build server."
+
+JOBSERVER_IGNORE ?= ""
+JOBSERVER_IGNORE[doc] = "Space separated list of packages that shouldn't be configured to use the jobserver feature."
+
+addhandler jobserver_setup_fifo
+jobserver_setup_fifo[eventmask] = "bb.event.ConfigParsed"
+
+python jobserver_setup_fifo() {
+    # don't setup a per-build fifo, if an external one is configured
+    if d.getVar("JOBSERVER_FIFO"):
+        return
+
+    # don't use a job-server if no parallelism is configured
+    jobs = oe.utils.parallel_make(d)
+    if jobs in (None, 1):
+        return
+
+    # reduce jobs by one as a token has implicitly been handed to the
+    # process requesting tokens
+    jobs -= 1
+
+    fifo = d.getVar("TMPDIR") + "/jobserver_fifo"
+
+    # an old fifo might be lingering; remove it
+    if os.path.exists(fifo):
+        os.remove(fifo)
+
+    # create a new fifo to use for communicating tokens
+    os.mkfifo(fifo)
+
+    # fill the fifo with the number of tokens to hand out
+    wfd = os.open(fifo, os.O_RDWR)
+    written = os.write(wfd, b"+" * jobs)
+    if written != (jobs):
+        bb.error("Failed to fil make fifo: {} != {}".format(written, jobs))
+
+    # configure the per-build fifo path to use
+    d.setVar("JOBSERVER_FIFO", fifo)
+}
+
+python () {
+    # don't configure the fifo if none is defined
+    fifo = d.getVar("JOBSERVER_FIFO")
+    if not fifo:
+        return
+
+    # don't configure the fifo if the package wants to ignore it
+    if d.getVar("PN") in (d.getVar("JOBSERVER_IGNORE") or "").split():
+        return
+
+    # avoid making make-native or its dependencies depend on make-native itself
+    if d.getVar("PN") in (
+                "make-native",
+                "libtool-native",
+                "pkgconfig-native",
+                "automake-native",
+                "autoconf-native",
+                "m4-native",
+                "texinfo-dummy-native",
+                "gettext-minimal-native",
+                "quilt-native",
+                "gnu-config-native",
+            ):
+        return
+
+    # don't make unwilling recipes depend on make-native
+    if d.getVar('INHIBIT_DEFAULT_DEPS', False):
+        return
+
+    # make other recipes depend on make-native to make sure it is new enough to
+    # support the --jobserver-auth=fifo:<path> syntax (from make-4.4 and onwards)
+    d.appendVar("DEPENDS", " virtual/make-native")
+
+    # disable the "-j <jobs>" flag, as that overrides the jobserver fifo tokens
+    d.setVar("PARALLEL_MAKE", "")
+    d.setVar("PARALLEL_MAKEINST", "")
+
+    # set and export the jobserver in the environment
+    d.appendVar("MAKEFLAGS", " --jobserver-auth=fifo:" + fifo)
+    d.setVarFlag("MAKEFLAGS", "export", "1")
+
+    # ignore the jobserver argument part of MAKEFLAGS in the hash, as that
+    # shouldn't change the build output
+    d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "| --jobserver-auth=fifo:" + fifo)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6f180d18b0..23a016b31e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -960,7 +960,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
-    OMP_NUM_THREADS BB_CURRENTTASK"
+    OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
-- 
2.44.0


