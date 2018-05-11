Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 233E7771C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 23:52:08 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id w129-v6so3398528pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Sf6MDUNjFCrNeMjYA6nTwl5T2iG1KUqDOLmQWCehT3c=;
	b=Z+vRbrcqqaP1Rq+omZzEB1Cr9gG1EEOurwDta7ZcIOzP2fqsQVQr+CfL7UoDsprKCY
	oYeN8PQvUgNzuhv/ZNUaHm6G04yfsj+4nX62+SRt0/UmURpua+hy49aQ3nE0N0lOXzLW
	b7e86W9T+zH+38OkP7PTnMLKKC326+fwPGeS3uIlLZRes/yr4haUIqR27iC0Fw9tFvQv
	IzwunIpTy6zQBvbhXZ7oCMRbtkTnGvpJtrVZwEszXBvRX8R/mCGCQyCOQ9NexG0rZK1F
	3+cbsf/d7WyotPbJOFszL+97bqQ4vR//jhHdajinxSjXXEnKOkHFwhyPLEhulLevYLRr
	66/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sf6MDUNjFCrNeMjYA6nTwl5T2iG1KUqDOLmQWCehT3c=;
	b=legxsc6zQkoGwBRLa62OyIeu9XgEX6W1T62N6Bh0rAqLxfjJBed6RFscOXD2sPuJFb
	jQpt29ty7XdN0S4qrU875/1tj9n0fMNjhEWhR32lfIgiFxgWAjLfANddhcFvi3pRWimn
	jG5ylptXUuzV/UviuS1PaNjCfkfkWvULrDA20hw/6U6I/vE8BEA/NQ9o04q6ugDR1r+R
	aLzOOYtgQFUY1nj2vgR9VPTVycJCkfLMuNNrnmUuXXGwUpN9GCP8ppnjqfbR4d6M8np4
	gPe8XR0tnCSiu9uea1vVx5A89AqsQU2VlRVksHRQh4XzkN9t82Ds0WJ+K0b+pK2zmMiG
	TeaA==
X-Gm-Message-State: ALKqPwfGUcPUQ2W74PpS4GjUaKVhNmDKaw9WVck9NRR95uUs9m1yFiM0
	Z1XvJC30lGrxG+aQd7i2fhCemg==
X-Google-Smtp-Source: AB8JxZpsgNGaEznkpg9GhTGfmRffMzrujvHHdWGtEh+g1/+QfdQU79wLmlTXkLxyn7oS+v5OxiOOcQ==
X-Received: by 2002:a63:7702:: with SMTP id s2-v6mr886100pgc.313.1526082729851;
	Fri, 11 May 2018 16:52:09 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	z62-v6sm9943207pff.57.2018.05.11.16.52.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 May 2018 16:52:09 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 16:52:03 -0700
Message-Id: <1526082723-13508-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [rocko][PATCH] libnl: fix CVE-2017-0553
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
X-List-Received-Date: Fri, 11 May 2018 23:52:09 -0000

An elevation of privilege vulnerability in libnl could enable a local
malicious application to execute arbitrary code within the context of
the Wi-Fi service. This issue is rated as Moderate because it first
requires compromising a privileged process and is mitigated by
current platform configurations. Product: Android. Versions: 5.0.2,
5.1.1, 6.0, 6.0.1, 7.0, 7.1.1. Android ID: A-32342065. NOTE: this
issue also exists in the upstream libnl before 3.3.0 library.

  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0553

Backport fix from upstream libnl 3.3.0 release:

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


