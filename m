Return-Path: <george.mccollister@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57051785C2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 23:37:14 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id m191so8295703itg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 15:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vueOnkerCc6xhe4FFsPYRsqJzWmG1FRT497GbdI7+Xo=;
	b=WAPw/b9uJimNT572gIpzAOPdxfSr5yAE+e2mc2nZkvq+C5Lb6mUImIqy9BM6xlM08K
	E5+NmJAW325m9BxjymyRi9koIwswnx54F34JumG1oFCmfSaM+pRrMOppQP7YUMDlbKGy
	nT6qchCWhbg3MGeR/wGzvPk3g5DAW25aqzTw5DGI2b5nGKC22x91sZNIcaRhJ59bNEuw
	sC3VVF8HOHPAg1PneIyxKHwfnP+WtnEuyAUJwJSk8OgdIXtSGaty0vck+Bn7d/icA2r0
	Yn9hc5bhWFXYmtQinusKW2Y6JsJkyWyFWexy7O/jstOCfdnS8YdX+/SpEC05rBCK8p+I
	uGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vueOnkerCc6xhe4FFsPYRsqJzWmG1FRT497GbdI7+Xo=;
	b=n8fp/gCLTXlfF5WbQX3t1LvqaeEYXUCQrnLBVA5R5vtS6H22uj2XhVX7zf3xS2lWHW
	8zrVguQsGOJyMYAFPaEX+TZW12GbUAqiF+gzrVtEUMQxXz9MRxhWyVu3BlKytR3ZbQWC
	PSdXKlqlF6euuAd3wHLVni23YrPHbPNeF9uh/I/JkWiDQqZuqzssWyXISj6CvykHYCGb
	FmnZq398vowW5jjIx6Pw32+V+7Pl6Bs/jgRo2zFB2TypKEMoFEWalvnsbhqdEJLkfVIH
	cwvx3jxbd0dfJuzTmfDry0eI870yteg9fwnHQjGA8fnVKh+FhD99W9BaSApLc0ogZQ0g
	cJFA==
X-Gm-Message-State: AJaThX6CVsPoILjBt7+rQelE8noOraSsNgLYpXIgPrz6MUprsJvM7L2B
	cCnVYbLSDwvGDXxHLQAA1jd3
X-Google-Smtp-Source: AGs4zMYRTrhPdDD40gTUwIohXKdogBuYv+64mNBimGxZAobgmmC0jCSjmdVAcxlWyCOpK+hlOaRvhg==
X-Received: by 10.36.249.134 with SMTP id l128mr12920671ith.12.1510616235258; 
	Mon, 13 Nov 2017 15:37:15 -0800 (PST)
Received: from localhost.localdomain ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	k19sm4836396itb.18.2017.11.13.15.37.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Nov 2017 15:37:14 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2017 17:36:36 -0600
Message-Id: <20171113233636.22474-2-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171113233636.22474-1-george.mccollister@gmail.com>
References: <20171113233636.22474-1-george.mccollister@gmail.com>
Subject: [PATCH 2/2] shadow: fix CVE-2016-6252
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
X-List-Received-Date: Mon, 13 Nov 2017 23:37:14 -0000

Apply backported patch that fixes CVE-2016-6252
Integer overflow in shadow 4.2.1 allows local users to gain privileges
via crafted input to newuidmap.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 .../shadow/files/0001-Simplify-getulong.patch      | 52 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch

diff --git a/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch b/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch
new file mode 100644
index 0000000000..1d69e2fee4
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-Simplify-getulong.patch
@@ -0,0 +1,52 @@
+From 1ea1133aa22c691684dc9921c53313ff1b3b825b Mon Sep 17 00:00:00 2001
+From: Sebastian Krahmer <krahmer@suse.com>
+Date: Wed, 3 Aug 2016 11:51:07 -0500
+Subject: [PATCH] Simplify getulong
+
+Use strtoul to read an unsigned long, rather than reading
+a signed long long and casting it.
+
+https://bugzilla.suse.com/show_bug.cgi?id=979282
+
+Upstream-Status: Backport
+https://anonscm.debian.org/cgit/pkg-shadow/shadow.git/plain/debian/patches/302-CVE-2016-6252-fix-integer-overflow.patch?h=jessie
+https://github.com/shadow-maint/shadow/commit/1d5a926cc2d6078d23a96222b1ef3e558724dad1
+
+CVE: CVE-2016-6252
+---
+ lib/getulong.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/lib/getulong.c b/lib/getulong.c
+index 61579ca..08d2c1a 100644
+--- a/lib/getulong.c
++++ b/lib/getulong.c
+@@ -44,22 +44,19 @@
+  */
+ int getulong (const char *numstr, /*@out@*/unsigned long int *result)
+ {
+-	long long int val;
++	unsigned long int val;
+ 	char *endptr;
+ 
+ 	errno = 0;
+-	val = strtoll (numstr, &endptr, 0);
++	val = strtoul (numstr, &endptr, 0);
+ 	if (    ('\0' == *numstr)
+ 	     || ('\0' != *endptr)
+ 	     || (ERANGE == errno)
+-	     /*@+ignoresigns@*/
+-	     || (val != (unsigned long int)val)
+-	     /*@=ignoresigns@*/
+ 	   ) {
+ 		return 0;
+ 	}
+ 
+-	*result = (unsigned long int)val;
++	*result = val;
+ 	return 1;
+ }
+ 
+-- 
+2.15.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 031e880630..9fb1cd3d17 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -18,6 +18,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
            file://0001-shadow-CVE-2017-12424 \
            file://0001-su-properly-clear-child-PID.patch \
+           file://0001-Simplify-getulong.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.15.0


