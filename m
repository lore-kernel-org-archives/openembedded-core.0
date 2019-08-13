Return-Path: <bounces+12060237-dea2-openembedded-core=lists.openembedded.org@sendgrid.net>
Received: from o1.f.az.sendgrid.net (o1.f.az.sendgrid.net [208.117.55.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6269F79C92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.me;
	h=from:subject:in-reply-to:references:mime-version:to:cc:
	content-transfer-encoding:content-type;
	s=smtpapi; bh=g+f5BQo39DYwm7jZo5kaoRDeUepTZZZNI130zhzhnCQ=;
	b=v95fBXytVhk8HjgrczP9+P9m/94CoXl9NjqhILczNuGieTJG/mCWVcCBn9IPMFA316Sh
	e0qiMlwPJ7nPVgWoLRbhWLssx1AUl4B2u4MC2c23srglksSqw07MxN/GLrIr801GbnCO3z
	f74yim30QzkkMZkej3vyDoUUJAw83PESA=
Received: by filter0037p3iad2.sendgrid.net with SMTP id
	filter0037p3iad2-13491-5D534704-9
	2019-08-13 23:25:56.336464063 +0000 UTC m=+1570614.478824406
Received: from
	t-keweng-westus2-ubuntu.sthawock52fuzp14qwoa2ht3of.xx.internal.cloudapp.net
	(unknown [52.143.72.184])
	by ismtpd0008p1hnd1.sendgrid.net (SG) with ESMTP id
	xGo2xkdGQ36meqxxiJMTRA Tue, 13 Aug 2019 23:25:55.913 +0000 (UTC)
From: Kevin Weng <t-keweng@microsoft.com>
Date: Tue, 13 Aug 2019 23:25:56 +0000 (UTC)
Message-Id: <20190813232542.16955-2-t-keweng@microsoft.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813232542.16955-1-t-keweng@microsoft.com>
References: <20190813232542.16955-1-t-keweng@microsoft.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?5plbwHlDV1x0k2R0bHwCzxXjHeGg9GIuX3p3eyxUEIsO2BVtB=2F3iyHMXziEfDg?=
	=?us-ascii?Q?PZfL8EzAFZJc88Bp7OZWZwRTfK6q23QeBqPtGrY?=
	=?us-ascii?Q?1tGdKDVzMWo7WgfV2a3rNUxziR0i+Y4IbJccLvJ?=
	=?us-ascii?Q?fSy6KO8Y+w1kD7LoEtNvyKHl4H0qbJGMxhueSAG?=
	=?us-ascii?Q?TNeUVyMSR05WKNuaDGy3vxgT1NmFSbcXaAWc8M1?=
	=?us-ascii?Q?kuO3deM4xwPmP3uQFVPmzEbpisrjzp75=2FaEGSrB?=
	=?us-ascii?Q?wopeGE5Odp7mBZhx6vgHA=3D=3D?=
To: openembedded-core@lists.openembedded.org
Cc: Kevin Weng <t-keweng@microsoft.com>
Subject: [thud][PATCH v2 2/4] dbus: fix CVE-2019-12749
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
X-List-Received-Date: Tue, 13 Aug 2019 23:25:55 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii

Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
---
 .../dbus/dbus/CVE-2019-12749.patch            | 127 ++++++++++++++++++
 meta/recipes-core/dbus/dbus_1.12.10.bb        |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2019-12749.patch

diff --git a/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch b/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
new file mode 100644
index 0000000000..393c70ca21
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/CVE-2019-12749.patch
@@ -0,0 +1,127 @@
+From f0120c5d97a4cc1b659e86d38f2b1f646ca20ea3 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@collabora.com>
+Date: Thu, 30 May 2019 12:53:03 +0100
+Subject: [PATCH] auth: Reject DBUS_COOKIE_SHA1 for users other than the server
+ owner
+
+The DBUS_COOKIE_SHA1 authentication mechanism aims to prove ownership
+of a shared home directory by having the server write a secret "cookie"
+into a .dbus-keyrings subdirectory of the desired identity's home
+directory with 0700 permissions, and having the client prove that it can
+read the cookie. This never actually worked for non-malicious clients in
+the case where server uid != client uid (unless the server and client
+both have privileges, such as Linux CAP_DAC_OVERRIDE or traditional
+Unix uid 0) because an unprivileged server would fail to write out the
+cookie, and an unprivileged client would be unable to read the resulting
+file owned by the server.
+
+Additionally, since dbus 1.7.10 we have checked that ~/.dbus-keyrings
+is owned by the uid of the server (a side-effect of a check added to
+harden our use of XDG_RUNTIME_DIR), further ruling out successful use
+by a non-malicious client with a uid differing from the server's.
+
+Joe Vennix of Apple Information Security discovered that the
+implementation of DBUS_COOKIE_SHA1 was susceptible to a symbolic link
+attack: a malicious client with write access to its own home directory
+could manipulate a ~/.dbus-keyrings symlink to cause the DBusServer to
+read and write in unintended locations. In the worst case this could
+result in the DBusServer reusing a cookie that is known to the
+malicious client, and treating that cookie as evidence that a subsequent
+client connection came from an attacker-chosen uid, allowing
+authentication bypass.
+
+This is mitigated by the fact that by default, the well-known system
+dbus-daemon (since 2003) and the well-known session dbus-daemon (in
+stable releases since dbus 1.10.0 in 2015) only accept the EXTERNAL
+authentication mechanism, and as a result will reject DBUS_COOKIE_SHA1
+at an early stage, before manipulating cookies. As a result, this
+vulnerability only applies to:
+
+* system or session dbus-daemons with non-standard configuration
+* third-party dbus-daemon invocations such as at-spi2-core (although
+  in practice at-spi2-core also only accepts EXTERNAL by default)
+* third-party uses of DBusServer such as the one in Upstart
+
+Avoiding symlink attacks in a portable way is difficult, because APIs
+like openat() and Linux /proc/self/fd are not universally available.
+However, because DBUS_COOKIE_SHA1 already doesn't work in practice for
+a non-matching uid, we can solve this vulnerability in an easier way
+without regressions, by rejecting it early (before looking at
+~/.dbus-keyrings) whenever the requested identity doesn't match the
+identity of the process hosting the DBusServer.
+
+Signed-off-by: Simon McVittie <smcv@collabora.com>
+Closes: https://gitlab.freedesktop.org/dbus/dbus/issues/269
+Closes: CVE-2019-12749
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/dbus/dbus/commit
+/47b1a4c41004bf494b87370987b222c934b19016]
+
+CVE: CVE-2019-12749
+
+Signed-off-by: Kevin Weng <t-keweng@microsoft.com>
+---
+ dbus/dbus-auth.c | 32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/dbus/dbus-auth.c b/dbus/dbus-auth.c
+index 37d8d4c9..7390a9d5 100644
+--- a/dbus/dbus-auth.c
++++ b/dbus/dbus-auth.c
+@@ -529,6 +529,7 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+   DBusString tmp2;
+   dbus_bool_t retval = FALSE;
+   DBusError error = DBUS_ERROR_INIT;
++  DBusCredentials *myself = NULL;
+ 
+   _dbus_string_set_length (&auth->challenge, 0);
+   
+@@ -565,6 +566,34 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+       return FALSE;
+     }
+ 
++  myself = _dbus_credentials_new_from_current_process ();
++
++  if (myself == NULL)
++    goto out;
++
++  if (!_dbus_credentials_same_user (myself, auth->desired_identity))
++    {
++      /*
++       * DBUS_COOKIE_SHA1 is not suitable for authenticating that the
++       * client is anyone other than the user owning the process
++       * containing the DBusServer: we probably aren't allowed to write
++       * to other users' home directories. Even if we can (for example
++       * uid 0 on traditional Unix or CAP_DAC_OVERRIDE on Linux), we
++       * must not, because the other user controls their home directory,
++       * and could carry out symlink attacks to make us read from or
++       * write to unintended locations. It's difficult to avoid symlink
++       * attacks in a portable way, so we just don't try. This isn't a
++       * regression, because DBUS_COOKIE_SHA1 never worked for other
++       * users anyway.
++       */
++      _dbus_verbose ("%s: client tried to authenticate as \"%s\", "
++                     "but that doesn't match this process",
++                     DBUS_AUTH_NAME (auth),
++                     _dbus_string_get_const_data (data));
++      retval = send_rejected (auth);
++      goto out;
++    }
++
+   /* we cache the keyring for speed, so here we drop it if it's the
+    * wrong one. FIXME caching the keyring here is useless since we use
+    * a different DBusAuth for every connection.
+@@ -679,6 +708,9 @@ sha1_handle_first_client_response (DBusAuth         *auth,
+   _dbus_string_zero (&tmp2);
+   _dbus_string_free (&tmp2);
+ 
++  if (myself != NULL)
++    _dbus_credentials_unref (myself);
++
+   return retval;
+ }
+ 
+-- 
+2.22.0
+
diff --git a/meta/recipes-core/dbus/dbus_1.12.10.bb b/meta/recipes-core/dbus/dbus_1.12.10.bb
index d71f7f7042..d7ad1d8be4 100644
--- a/meta/recipes-core/dbus/dbus_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.10.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch \
            file://dbus-1.init \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+		   file://CVE-2019-12749.patch \
 "
 
 SRC_URI[md5sum] = "c3e12b4206e2a7da39d7cc42567790ef"
-- 
2.22.0


