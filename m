Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39392C83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 12:48:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.12527.1693226929044283058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 05:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=d5L23ERb;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=ZbuD7SqOLzdiVy4UZZsIZjpcepKOafwWTWSO7KBvU8E=; b=d5L23ERbknTc11LI792YcxgAhi
	SMpJGuTU4wy0ese/g7/FcCdE7fELoxRKo27OoDeWmthXYT1ZSh3/uC1P90sImJZUED9Q52cKuaWXs
	J3ueyxwzrc8TuS6MVcvk9pgvkudBvMKksgf1K+IhmtZWhg5uYkQPAyB0H3BUJegm37xmDsm4F2rCV
	IPoz6PeXNgLTecjX0MoinYcguY8oqlIZc3CVTWxAM3tqJDN0DehixL0f/T3WgJB8wAGjLnCgTGiGD
	6kRb7hj5txGa01yzdXgtguCVZqMf7UooFg00Q16LKtoHFjBgyiBxaEdOQe0re1IqqqKdt9ojtK+h5
	9lsAyONQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1qabfi-0009GN-8v; Mon, 28 Aug 2023 14:48:46 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <martin@geanix.com>)
	id 1qabfh-000BNd-So; Mon, 28 Aug 2023 14:48:45 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [RFC PATCH 1/5] classes: jobserver: support gnu make fifo jobserver
Date: Mon, 28 Aug 2023 14:48:25 +0200
Message-ID: <20230828124834.376779-1-martin@geanix.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/27014/Mon Aug 28 09:38:26 2023)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 12:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186824

Add a class to implement the gnu make fifo style jobserver. The class
can be activated by symply adding an `INHERIT += "jobserver"` to the
local configuration.

Furthermore, one can configure an external jobserver (i.e. a server
shared between multiple builds), by configured the `JOBSERVER_FIFO`
variable to point at an existing jobserver fifo.

The jobserver class uses the fifo style jobserver, which doesn't require
passing open file descriptors around. It does, however, require
make-4.4, which isn't available in common distro yet. To work around
this, the class make all recipes (except make and its dependencies
itself) depend on `virtual/make-native`.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 meta/classes-global/jobserver.bbclass | 80 +++++++++++++++++++++++++++
 meta/conf/bitbake.conf                |  2 +-
 2 files changed, 81 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes-global/jobserver.bbclass

diff --git a/meta/classes-global/jobserver.bbclass b/meta/classes-global/jobserver.bbclass
new file mode 100644
index 0000000000..c76909fe50
--- /dev/null
+++ b/meta/classes-global/jobserver.bbclass
@@ -0,0 +1,80 @@
+JOBSERVER_FIFO ?= ""
+JOBSERVER_FIFO[doc] = "Path to external jobserver fifo to use instead of creating a per-build server."
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
+    # and old fifo might be lingering; remove it
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
+    # ignore the joberserver argument part of MAKEFLAGS in the hash, as that
+    # shouldn't change the build output
+    d.appendVarFlag("MAKEFLAGS", "vardepvalueexclude", "| --jobserver-auth=fifo:" + fifo)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cf7ff3328c..8cf188270b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -946,7 +946,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
-    OMP_NUM_THREADS BB_CURRENTTASK"
+    OMP_NUM_THREADS BB_CURRENTTASK JOBSERVER_FIFO"
 BB_BASEHASH_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} PSEUDO_IGNORE_PATHS BUILDHISTORY_DIR \
     SSTATE_DIR SOURCE_DATE_EPOCH RUST_BUILD_SYS RUST_HOST_SYS RUST_TARGET_SYS"
 BB_HASHCONFIG_IGNORE_VARS ?= "${BB_HASHEXCLUDE_COMMON} DATE TIME SSH_AGENT_PID \
-- 
2.41.0


