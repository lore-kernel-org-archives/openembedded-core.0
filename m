Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8F5957393D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 17:43:16 +0000 (UTC)
Received: by widfb4 with SMTP id fb4so12375494wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 10:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=H8ZpaDauCqcGSMv9JtJHRrmjR4oIDGgsX7prr38z3gA=;
	b=kJ9pQ14PalPfO3T/MSWgVRFeVZANWU+CEUPyVdXFMJ7OtOOb3rNtINLT3bBoyndXAT
	T0IAqKMTDGslnvQDqMTf31+a5wgMqxXfLck6iLLqvf7CN6UVulEslnWsaK7SbsMIdJ4R
	qUEUCWCf31T400BnJZQK/73NO93najF7ERu7SwIV+36BsAGiElNEPTrUPJFrfOiHRIeZ
	8mmsyLyvQzpi0ttqX4hJnQpj/tg7qYPMzMj3a6drv9tzF9K6jRdT2MiU3K3aMVP1iEsK
	d282xM1yxdNLekII3yZlbfUaJqGf6rCQJybGq2LKtoAwmvcmnChLe1gDGPbrbtoG7kJ2
	GqLw==
X-Gm-Message-State: ALoCoQlPLTSSMB63q77nofpvkXSA+hgmtZi0JDe5gddHkAhSVIcVVhgcsCIZEjxHEJzHXSPsbakq
X-Received: by 10.180.211.73 with SMTP id na9mr53977950wic.60.1425922995853;
	Mon, 09 Mar 2015 10:43:15 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id v8sm13517239wib.0.2015.03.09.10.43.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Mar 2015 10:43:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 17:40:37 +0000
Message-Id: <1425922837-14418-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xserver-xorg: don't close already-closed connections
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
X-List-Received-Date: Mon, 09 Mar 2015 17:43:16 -0000

On shutdown xserver was closing connections that were already closed, resulting
in a segfault.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-xserver/xserver-xorg/xtrans.patch         |   38 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |    1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
new file mode 100644
index 0000000..e6dba04
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xtrans.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Since _XSERVTransClose frees the connection pointer passed to it,
+remove that pointer from the array, so we don't try to double free it
+if we come back into CloseWellKnownConnections again.
+
+Should fix https://bugzilla.yoctoproject.org/show_bug.cgi?id=6665 in which
+the shutdown section of the main() loop called CloseWellKnownConnections()
+and then moved on to ddxGiveUp(), which failed to release the VT and thus
+called AbortServer(), which called CloseWellKnownConnections() again.
+
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+---
+ os/connection.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/os/connection.c b/os/connection.c
+index ddfe50a..7ff44e1 100644
+--- a/os/connection.c
++++ b/os/connection.c
+@@ -513,8 +513,13 @@ CloseWellKnownConnections(void)
+ {
+     int i;
+
+-    for (i = 0; i < ListenTransCount; i++)
+-        _XSERVTransClose(ListenTransConns[i]);
++    for (i = 0; i < ListenTransCount; i++) {
++        if (ListenTransConns[i] != NULL) {
++            _XSERVTransClose(ListenTransConns[i]);
++            ListenTransConns[i] = NULL;
++        }
++    }
++    ListenTransCount = 0;
+ }
+
+ static void
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
index 347ce3b..9d9ede2 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.3.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xorg-CVE-2013-6424.patch \
             file://xshmfence-option.patch \
             file://Fix-subwindow-in-Xi-emulated-events.patch \
+            file://xtrans.patch \
            "
 
 SRC_URI[md5sum] = "afd93977235584a9caa7528a737c1b52"
-- 
1.7.10.4


