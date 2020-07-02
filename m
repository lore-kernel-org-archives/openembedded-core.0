Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.1912.1593677196136421013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 01:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: FCWtGuo/0TXsNLgPhLAG7c+0MIwhfJXk1N4dgtbHUrdz1w41DqGzbiLLKO7cHgk5tJpNBM5PWS
 Aq6KF5Co77Ng==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="208346481"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="208346481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 01:06:35 -0700
IronPort-SDR: mFFVAn2PVFcjkTdyQR96WXYRj94RMcT8TfpoIlAjtbXgknRHqDnYen1gtewo6TztaKrzqnU4BJ
 5bMYgpcxXMbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="387261481"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga001.fm.intel.com with ESMTP; 02 Jul 2020 01:06:34 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: fix CVE-2020-10761
Date: Thu,  2 Jul 2020 16:06:32 +0800
Message-Id: <1593677192-37266-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593677192-37266-1-git-send-email-chee.yang.lee@intel.com>
References: <1593677192-37266-1-git-send-email-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2020-10761.patch                 | 151 +++++++++++++++++++++
 2 files changed, 152 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6b9dd99..d41cc8f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,6 +31,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://0001-qemu-Do-not-include-file-if-not-exists.patch \
 	   file://CVE-2020-13361.patch \
 	   file://find_datadir.patch \
+	   file://CVE-2020-10761.patch \
 	   "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
new file mode 100644
index 0000000..5806565
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-10761.patch
@@ -0,0 +1,151 @@
+From 5c4fe018c025740fef4a0a4421e8162db0c3eefd Mon Sep 17 00:00:00 2001
+From: Eric Blake <eblake@redhat.com>
+Date: Mon, 8 Jun 2020 13:26:37 -0500
+Subject: [PATCH] nbd/server: Avoid long error message assertions
+ CVE-2020-10761
+
+Ever since commit 36683283 (v2.8), the server code asserts that error
+strings sent to the client are well-formed per the protocol by not
+exceeding the maximum string length of 4096.  At the time the server
+first started sending error messages, the assertion could not be
+triggered, because messages were completely under our control.
+However, over the years, we have added latent scenarios where a client
+could trigger the server to attempt an error message that would
+include the client's information if it passed other checks first:
+
+- requesting NBD_OPT_INFO/GO on an export name that is not present
+  (commit 0cfae925 in v2.12 echoes the name)
+
+- requesting NBD_OPT_LIST/SET_META_CONTEXT on an export name that is
+  not present (commit e7b1948d in v2.12 echoes the name)
+
+At the time, those were still safe because we flagged names larger
+than 256 bytes with a different message; but that changed in commit
+93676c88 (v4.2) when we raised the name limit to 4096 to match the NBD
+string limit.  (That commit also failed to change the magic number
+4096 in nbd_negotiate_send_rep_err to the just-introduced named
+constant.)  So with that commit, long client names appended to server
+text can now trigger the assertion, and thus be used as a denial of
+service attack against a server.  As a mitigating factor, if the
+server requires TLS, the client cannot trigger the problematic paths
+unless it first supplies TLS credentials, and such trusted clients are
+less likely to try to intentionally crash the server.
+
+We may later want to further sanitize the user-supplied strings we
+place into our error messages, such as scrubbing out control
+characters, but that is less important to the CVE fix, so it can be a
+later patch to the new nbd_sanitize_name.
+
+Consideration was given to changing the assertion in
+nbd_negotiate_send_rep_verr to instead merely log a server error and
+truncate the message, to avoid leaving a latent path that could
+trigger a future CVE DoS on any new error message.  However, this
+merely complicates the code for something that is already (correctly)
+flagging coding errors, and now that we are aware of the long message
+pitfall, we are less likely to introduce such errors in the future,
+which would make such error handling dead code.
+
+Reported-by: Xueqiang Wei <xuwei@redhat.com>
+CC: qemu-stable@nongnu.org
+Fixes: https://bugzilla.redhat.com/1843684 CVE-2020-10761
+Fixes: 93676c88d7
+Signed-off-by: Eric Blake <eblake@redhat.com>
+Message-Id: <20200610163741.3745251-2-eblake@redhat.com>
+Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
+
+Upstream-Status: Backport  [https://github.com/qemu/qemu/commit/5c4fe018c025740fef4a0a4421e8162db0c3eefd]
+CVE: CVE-2020-CVE-2020-10761
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ nbd/server.c               | 23 ++++++++++++++++++++---
+ tests/qemu-iotests/143     |  4 ++++
+ tests/qemu-iotests/143.out |  2 ++
+ 3 files changed, 26 insertions(+), 3 deletions(-)
+
+diff --git a/nbd/server.c b/nbd/server.c
+index 02b1ed08014..20754e9ebc3 100644
+--- a/nbd/server.c
++++ b/nbd/server.c
+@@ -217,7 +217,7 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
+ 
+     msg = g_strdup_vprintf(fmt, va);
+     len = strlen(msg);
+-    assert(len < 4096);
++    assert(len < NBD_MAX_STRING_SIZE);
+     trace_nbd_negotiate_send_rep_err(msg);
+     ret = nbd_negotiate_send_rep_len(client, type, len, errp);
+     if (ret < 0) {
+@@ -231,6 +231,19 @@ nbd_negotiate_send_rep_verr(NBDClient *client, uint32_t type,
+     return 0;
+ }
+ 
++/*
++ * Return a malloc'd copy of @name suitable for use in an error reply.
++ */
++static char *
++nbd_sanitize_name(const char *name)
++{
++    if (strnlen(name, 80) < 80) {
++        return g_strdup(name);
++    }
++    /* XXX Should we also try to sanitize any control characters? */
++    return g_strdup_printf("%.80s...", name);
++}
++
+ /* Send an error reply.
+  * Return -errno on error, 0 on success. */
+ static int GCC_FMT_ATTR(4, 5)
+@@ -595,9 +608,11 @@ static int nbd_negotiate_handle_info(NBDClient *client, Error **errp)
+ 
+     exp = nbd_export_find(name);
+     if (!exp) {
++        g_autofree char *sane_name = nbd_sanitize_name(name);
++
+         return nbd_negotiate_send_rep_err(client, NBD_REP_ERR_UNKNOWN,
+                                           errp, "export '%s' not present",
+-                                          name);
++                                          sane_name);
+     }
+ 
+     /* Don't bother sending NBD_INFO_NAME unless client requested it */
+@@ -995,8 +1010,10 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
+ 
+     meta->exp = nbd_export_find(export_name);
+     if (meta->exp == NULL) {
++        g_autofree char *sane_name = nbd_sanitize_name(export_name);
++
+         return nbd_opt_drop(client, NBD_REP_ERR_UNKNOWN, errp,
+-                            "export '%s' not present", export_name);
++                            "export '%s' not present", sane_name);
+     }
+ 
+     ret = nbd_opt_read(client, &nb_queries, sizeof(nb_queries), errp);
+diff --git a/tests/qemu-iotests/143 b/tests/qemu-iotests/143
+index f649b361950..d2349903b1b 100755
+--- a/tests/qemu-iotests/143
++++ b/tests/qemu-iotests/143
+@@ -58,6 +58,10 @@ _send_qemu_cmd $QEMU_HANDLE \
+ $QEMU_IO_PROG -f raw -c quit \
+     "nbd+unix:///no_such_export?socket=$SOCK_DIR/nbd" 2>&1 \
+     | _filter_qemu_io | _filter_nbd
++# Likewise, with longest possible name permitted in NBD protocol
++$QEMU_IO_PROG -f raw -c quit \
++    "nbd+unix:///$(printf %4096d 1 | tr ' ' a)?socket=$SOCK_DIR/nbd" 2>&1 \
++    | _filter_qemu_io | _filter_nbd | sed 's/aaaa*aa/aa--aa/'
+ 
+ _send_qemu_cmd $QEMU_HANDLE \
+     "{ 'execute': 'quit' }" \
+diff --git a/tests/qemu-iotests/143.out b/tests/qemu-iotests/143.out
+index 1f4001c6013..fc9c0a761fa 100644
+--- a/tests/qemu-iotests/143.out
++++ b/tests/qemu-iotests/143.out
+@@ -5,6 +5,8 @@ QA output created by 143
+ {"return": {}}
+ qemu-io: can't open device nbd+unix:///no_such_export?socket=SOCK_DIR/nbd: Requested export not available
+ server reported: export 'no_such_export' not present
++qemu-io: can't open device nbd+unix:///aa--aa1?socket=SOCK_DIR/nbd: Requested export not available
++server reported: export 'aa--aa...' not present
+ { 'execute': 'quit' }
+ {"return": {}}
+ {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
-- 
2.7.4

