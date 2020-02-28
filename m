Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 990C1618E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:20:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01S4KWf0010677
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 20:20:32 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 27 Feb 2020 20:20:14 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2020 12:20:12 +0800
Message-ID: <1582863612-310553-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] rng-tools: only print the success message when initialize entropy sources
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
X-List-Received-Date: Fri, 28 Feb 2020 04:20:31 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

There is below message when check rngd service status
in qemu env.
[rdrand]: Initialization Failed

The complete service status as below in qemu env:
 # systemctl status rngd

    rngd.service - Hardware RNG Entropy Gatherer Daemon
       Loaded: loaded (/lib/systemd/system/rngd.service; enabled; vendor preset: >
       Active: active (running) since Tue 2020-02-25 05:08:11 UTC; 42min ago
    Main PID: 133 (rngd)
       Tasks: 2 (limit: 3591)
       Memory: 1.0M
    CGroup: /system.slice/rngd.service
           `-133 /usr/sbin/rngd -f -r /dev/hwrng
    Feb 25 05:08:14 qemux86-64 rngd[133]: Initializing available sources
    Feb 25 05:08:14 qemux86-64 rngd[133]: [hwrng ]: Initialized
    Feb 25 05:08:14 qemux86-64 rngd[133]: [rdrand]: Initialization Failed
    Feb 25 05:08:14 qemux86-64 rngd[133]: [jitter]: Initializing AES buffer
    Feb 25 05:08:31 qemux86-64 rngd[133]: [jitter]: Enabling JITTER rng support
    Feb 25 05:08:39 qemux86-64 rngd[133]: [jitter]: Initialized
    Warning: Journal has been rotated since unit was started. Log output is incompl

The message "[rdrand]: Initialization Failed" is misleading and
also results in parselogs.ParseLogsTest.test_parselogs failed
in do_testimage.

In fact, the message only indicates the rdrand entropy
source initialized failed and it doesn't affect the rngd
function. So improve to only print the message for the
entropy sources which initialized successfully to avoid
misleading users.

That makes sense as after check the available entropy
sources, there is a logic to check whether there is at
least one available entropy source exist as below in
rngd.c
if (!ent_sources) {
message(LOG_DAEMON|LOG_ERR,
"can't open any entropy source");
message(LOG_DAEMON|LOG_ERR,
"Maybe RNG device modules are not loaded\n");
return 1;
}

That's to say, only printing the message for the entropy
sources which initialized successfully is safe.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...-print-the-success-message-when-initializ.patch | 47 ++++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_6.9.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd.c-only-print-the-success-message-when-initializ.patch

diff --git a/meta/recipes-support/rng-tools/rng-tools/0001-rngd.c-only-print-the-success-message-when-initializ.patch b/meta/recipes-support/rng-tools/rng-tools/0001-rngd.c-only-print-the-success-message-when-initializ.patch
new file mode 100644
index 0000000..ba3958f
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/0001-rngd.c-only-print-the-success-message-when-initializ.patch
@@ -0,0 +1,47 @@
+From 820d7fc8477b690803f9640452ce6df2f3eb6a79 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 28 Feb 2020 02:39:53 +0000
+Subject: [PATCH] rngd.c: only print the success message when initialize
+
+Only print the message for the entropy sources which
+initialized successfully to avoid misleading users.
+
+That makes sense as after check the available entropy
+sources, there is logic to check whether there is at
+least one available entropy source exist as below:
+if (!ent_sources) {
+     message(LOG_DAEMON|LOG_ERR,
+             "can't open any entropy source");
+     message(LOG_DAEMON|LOG_ERR,
+             "Maybe RNG device modules are not loaded\n");
+     return 1;
+}
+
+That's to say, only printing the message for the entropy
+sources which initialized successfully is safe.
+
+Upstream-Status: Submitted [https://github.com/nhorman/rng-tools/pull/84]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ rngd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/rngd.c b/rngd.c
+index d8cd9af..78dae36 100644
+--- a/rngd.c
++++ b/rngd.c
+@@ -795,9 +795,8 @@ int main(int argc, char **argv)
+ 				ent_sources++;
+ 				ent_src->fipsctx = malloc(sizeof(fips_ctx_t));
+ 				fips_init(ent_src->fipsctx, discard_initial_data(ent_src));
+-                                message_entsrc(ent_src, LOG_DAEMON|LOG_INFO, "Initialized\n");
++                                message_entsrc(ent_src, LOG_DAEMON|LOG_INFO, "Initialized successfully\n");
+ 			} else {
+-                                message_entsrc(ent_src, LOG_DAEMON|LOG_ERR, "Initialization Failed\n");
+ 				ent_src->disabled = true;
+ 			}
+ 		}
+-- 
+2.24.1
+
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.9.bb b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
index 913342c..cce61aa 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.9.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.9.bb
@@ -10,6 +10,7 @@ DEPENDS = "sysfsutils"
 
 SRC_URI = "\
     git://github.com/nhorman/rng-tools.git \
+    file://0001-rngd.c-only-print-the-success-message-when-initializ.patch \
     file://init \
     file://default \
     file://rngd.service \
-- 
2.7.4


