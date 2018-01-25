Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76668601D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 20:44:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0PKioIU024632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 12:44:50 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 25 Jan 2018 12:44:50 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jan 2018 12:44:49 -0800
Message-ID: <20180125204449.32748-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/1] rng-tools: modify 'read error' message
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
X-List-Received-Date: Thu, 25 Jan 2018 20:44:49 -0000
Content-Type: text/plain

Expand messages output if entropy data cannot
be read.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../rng-tools/rng-tools/read_error_msg.patch       | 98 ++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb      |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch b/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
new file mode 100644
index 0000000..8aa13bf
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/read_error_msg.patch
@@ -0,0 +1,98 @@
+rng-tools: modify 'read error' message
+
+Make the 'read error' message more descriptive.
+
+Copied from https://bugzilla.redhat.com/attachment.cgi?id=1295857
+and modified in one place to apply successfully.  Error message during
+bootstrap modified to show device name.
+
+Upstream-Status: pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/rngd.c
++++ b/rngd.c
+@@ -247,8 +247,11 @@ static void do_loop(int random_step)
+ 				continue;	/* failed, no work */
+ 
+ 			retval = iter->xread(buf, sizeof buf, iter);
+-			if (retval)
++			if (retval) {
++				message(LOG_DAEMON|LOG_ERR,
++					"Error reading from entropy source\n");
+ 				continue;	/* failed, no work */
++			}
+ 
+ 			work_done = true;
+ 
+--- a/rngd_entsource.c
++++ b/rngd_entsource.c
+@@ -63,10 +63,8 @@ int xread(void *buf, size_t size, struct
+ 		size -= r;
+ 	}
+ 
+-	if (size) {
+-		message(LOG_DAEMON|LOG_ERR, "read error\n");
++	if (size)
+ 		return -1;
+-	}
+ 	return 0;
+ }
+ 
+@@ -152,7 +150,7 @@ error_out:
+ }
+ 
+ /* Initialize entropy source */
+-static int discard_initial_data(struct rng *ent_src)
++static int discard_initial_data(struct rng *ent_src, int *buf)
+ {
+ 	/* Trash 32 bits of what is probably stale (non-random)
+ 	 * initial state from the RNG.  For Intel's, 8 bits would
+@@ -164,10 +162,12 @@ static int discard_initial_data(struct r
+ 	xread(tempbuf, sizeof(tempbuf), ent_src);
+ 
+ 	/* Return 32 bits of bootstrap data */
+-	xread(tempbuf, sizeof(tempbuf), ent_src);
++	if (xread(tempbuf, sizeof(tempbuf), ent_src) != 0)
++		return -1;
+ 
+-	return tempbuf[0] | (tempbuf[1] << 8) |
++	*buf = tempbuf[0] | (tempbuf[1] << 8) |
+ 		(tempbuf[2] << 16) | (tempbuf[3] << 24);
++	return 0;
+ }
+ 
+ /*
+@@ -175,6 +175,8 @@ static int discard_initial_data(struct r
+  */
+ int init_entropy_source(struct rng *ent_src)
+ {
++	int bootstrap;
++
+ 	ent_src->rng_fd = open(ent_src->rng_name, O_RDONLY);
+ 	if (ent_src->rng_fd == -1) {
+ 		return 1;
+@@ -182,7 +184,11 @@ int init_entropy_source(struct rng *ent_
+ 	src_list_add(ent_src);
+ 	/* Bootstrap FIPS tests */
+ 	ent_src->fipsctx = malloc(sizeof(fips_ctx_t));
+-	fips_init(ent_src->fipsctx, discard_initial_data(ent_src));
++	if (discard_initial_data(ent_src, &bootstrap) != 0) {
++		message(LOG_ERR|LOG_INFO, "Read failure in %s during bootstrap\n",ent_src->rng_name);
++		return 1;
++	}
++	fips_init(ent_src->fipsctx, bootstrap);
+ 	return 0;
+ }
+ 
+--- a/rngtest.c
++++ b/rngtest.c
+@@ -335,6 +335,7 @@ static int discard_initial_data(void)
+ 
+ 	return tempbuf[0] | (tempbuf[1] << 8) |
+ 		(tempbuf[2] << 16) | (tempbuf[3] << 24);
++
+ }
+ 
+ static void do_rng_fips_test_loop( void )
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index 4a66bed..b3c9fd9 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -7,6 +7,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
+           file://read_error_msg.patch \
            file://init \
            file://default \
            file://rngd.service \
-- 
2.7.4


