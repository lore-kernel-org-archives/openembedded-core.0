Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EFEF26B50B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 14:14:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wBDEEadM000403
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 06:14:36 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Dec 2018 06:14:36 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 09:14:10 -0500
Message-ID: <2f0c9d97ff2f889d3a9d54fa12a76ab828ac516f.1544710323.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1544710323.git.kai.kang@windriver.com>
References: <cover.1544710323.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] systemd: fix compile error for x32
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
X-List-Received-Date: Thu, 13 Dec 2018 14:14:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix systemd compile error for x32:

| ../git/src/timesync/timesyncd-manager.c:607:19: error: format '%lli'
| expects argument of type 'long long int', but argument 11 has type
| 'long int' [-Werror=format=]

[YOCTO #13074]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...hanges-type-of-drift_freq-to-int64_t.patch | 49 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch b/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
new file mode 100644
index 0000000000..8d395c2fa3
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-timesync-changes-type-of-drift_freq-to-int64_t.patch
@@ -0,0 +1,49 @@
+Backport patch to fix systemd build failure on x32.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/75ca162]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 75ca1621db4647a4d62d7873cd6715e28fe0f9fa Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Sat, 23 Jun 2018 09:41:55 +0900
+Subject: [PATCH] timesync: changes type of drift_freq to int64_t
+
+drift_freq is used for storing timex.freq, and is a 64bit integer.
+To support x32 ABI, this changes the type of drift_freq to int64_t.
+
+Fixes #9387.
+---
+ src/timesync/timesyncd-manager.c | 2 +-
+ src/timesync/timesyncd-manager.h | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/timesync/timesyncd-manager.c b/src/timesync/timesyncd-manager.c
+index 2b731af9e..404a2b189 100644
+--- a/src/timesync/timesyncd-manager.c
++++ b/src/timesync/timesyncd-manager.c
+@@ -604,7 +604,7 @@ static int manager_receive_response(sd_event_source *source, int fd, uint32_t re
+         m->dest_time = *recv_time;
+         m->spike = spike;
+ 
+-        log_debug("interval/delta/delay/jitter/drift " USEC_FMT "s/%+.3fs/%.3fs/%.3fs/%+"PRI_TIMEX"ppm%s",
++        log_debug("interval/delta/delay/jitter/drift " USEC_FMT "s/%+.3fs/%.3fs/%.3fs/%+"PRIi64"ppm%s",
+                   m->poll_interval_usec / USEC_PER_SEC, offset, delay, m->samples_jitter, m->drift_freq / 65536,
+                   spike ? " (ignored)" : "");
+ 
+diff --git a/src/timesync/timesyncd-manager.h b/src/timesync/timesyncd-manager.h
+index d8d97cc1e..18347416d 100644
+--- a/src/timesync/timesyncd-manager.h
++++ b/src/timesync/timesyncd-manager.h
+@@ -79,7 +79,7 @@ struct Manager {
+         /* last change */
+         bool jumped;
+         bool sync;
+-        long drift_freq;
++        int64_t drift_freq;
+ 
+         /* watch for time changes */
+         sd_event_source *event_clock_watch;
+-- 
+2.17.0
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index c53ce0d78e..a40c89973a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-chown-recursive-let-s-rework-the-recursive-logic-to-.patch \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
+           file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.19.0.rc2


