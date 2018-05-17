Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9542C7481C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 22:17:54 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id l2-v6so2405147pgc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 15:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=j4TWK3KGbS0r2B59gYPMQ/OnClg6dzv7n2RULTUpNq4=;
	b=e2nxlHsSRW6gwaBso9d3Vh7RCY0oL572dWTMMi9+c035/GblSapzvpn7z3YAO0KRZP
	omf0scJtlHazY+XKkz1pTXHHiP+mKmDAXOFUgGV4IQYj6G9yjic/R7lJvzhCGcC2or26
	1ffr39paxYs4UXlfxP97P/P4fasUxR4W9gYtK8gkfnM2LdBVifaiXrcVhpQ5x1EWjzaU
	t0f+2XZAZGgtCQYO9LodGlg/6Gl6lL0OHbAUULkq31mlYhxGRGfRKT/c7GPis75Og6pd
	xHDlvv+XYDtWoowUkJO4FnCc8GmcoGJTx7iWLNZ1ZmD3l3ho6eqtlrpyfrUkOA9t9XlQ
	qiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=j4TWK3KGbS0r2B59gYPMQ/OnClg6dzv7n2RULTUpNq4=;
	b=m5IalKj600fo29ijGf9cx5sYAN5z3oXE12XhI02Pf2yM3cvd8Ld9zhheOR9rjk6w/T
	Kz7JKVlHd/oxOdFxCa1fXNF5Vb1L4ItB8heN1NKdfGZQmT6bYX14WULNwVqL3cAMUQ45
	zetTt2T9GyYT9nrzDKDzgwyJvCwUzBxRx/gxV7Li1bYDzRGwzGu9HEizGuvFrlVb4tz6
	S/CCResvRZiaClyP7qD8miI3uKYrmeK2IFSfxOQKZPreFplJIHmQOHY6CkzGZXshCGtx
	dFVNzs2SSZw2MhqFFuxHeEEv0bPIHY2flFGygNEcF5b2kULHqnO3XkHXg01cJ1XwrsDS
	KeDA==
X-Gm-Message-State: ALKqPwdpLtEotGd1IOD/ifn9bIDYynCL46yOOXDD/y1dWidWcwZc6w4O
	VdPiH7ZNnBxHW7l6SC8m/5ZcLA==
X-Google-Smtp-Source: AB8JxZpHPJqn2BduiNm/r2HQTv1RrDIKQjJ6hZlMC/Nx0Q0RPjm9448411K+osJXyAeOww5EOVIPcw==
X-Received: by 2002:a65:498e:: with SMTP id
	r14-v6mr5249025pgs.78.1526595473515; 
	Thu, 17 May 2018 15:17:53 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	29-v6sm9960270pfj.14.2018.05.17.15.17.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 15:17:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 15:17:47 -0700
Message-Id: <1526595467-3538-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [pyro][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Thu, 17 May 2018 22:17:54 -0000

An elevation of privilege vulnerability in libnl could enable a local
malicious application to execute arbitrary code within the context of
the Wi-Fi service. This issue is rated as Moderate because it first
requires compromising a privileged process and is mitigated by
current platform configurations. Product: Android. Versions: 5.0.2,
5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
issue also exists in the upstream libnl before 3.3.0 library.

  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553

Backport fix from upstream 3.3.0 release:

  https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb
  http://lists.infradead.org/pipermail/libnl/2017-May/002313.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...eck-for-integer-overflow-in-nlmsg_reserve.patch | 43 ++++++++++++++++++++++
 meta/recipes-support/libnl/libnl_3.2.29.bb         |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch

diff --git a/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
new file mode 100644
index 0000000..594dd06
--- /dev/null
+++ b/meta/recipes-support/libnl/libnl/lib-check-for-integer-overflow-in-nlmsg_reserve.patch
@@ -0,0 +1,43 @@
+From 3e18948f17148e6a3c4255bdeaaf01ef6081ceeb Mon Sep 17 00:00:00 2001
+From: Thomas Haller <thaller@redhat.com>
+Date: Mon, 6 Feb 2017 22:23:52 +0100
+Subject: [PATCH] lib: check for integer-overflow in nlmsg_reserve()
+
+In general, libnl functions are not robust against calling with
+invalid arguments. Thus, never call libnl functions with invalid
+arguments. In case of nlmsg_reserve() this means never provide
+a @len argument that causes overflow.
+
+Still, add an additional safeguard to avoid exploiting such bugs.
+
+Assume that @pad is a trusted, small integer.
+Assume that n->nm_size is a valid number of allocated bytes (and thus
+much smaller then SIZE_T_MAX).
+Assume, that @len may be set to an untrusted value. Then the patch
+avoids an integer overflow resulting in reserving too few bytes.
+
+Upstream-Status: Backport [https://github.com/thom311/libnl/commit/3e18948f17148e6a3c4255bdeaaf01ef6081ceeb]
+CVE: CVE-2017-0553
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ lib/msg.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/msg.c b/lib/msg.c
+index 9af3f3a..3e27d4e 100644
+--- a/lib/msg.c
++++ b/lib/msg.c
+@@ -411,6 +411,9 @@ void *nlmsg_reserve(struct nl_msg *n, size_t len, int pad)
+ 	size_t nlmsg_len = n->nm_nlh->nlmsg_len;
+ 	size_t tlen;
+ 
++	if (len > n->nm_size)
++		return NULL;
++
+ 	tlen = pad ? ((len + (pad - 1)) & ~(pad - 1)) : len;
+ 
+ 	if ((tlen + nlmsg_len) > n->nm_size)
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/libnl/libnl_3.2.29.bb b/meta/recipes-support/libnl/libnl_3.2.29.bb
index 7d4839b..4ce80e8 100644
--- a/meta/recipes-support/libnl/libnl_3.2.29.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.29.bb
@@ -12,7 +12,9 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
            file://fix-pktloc_syntax_h-race.patch \
            file://fix-pc-file.patch \
+           file://lib-check-for-integer-overflow-in-nlmsg_reserve.patch \
 "
+
 UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
 
 SRC_URI[md5sum] = "a8ba62a5c4f883f4e493a46d1f3733fe"
-- 
1.9.1


