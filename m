Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 84FD161750
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:58:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PQMQ1YSbz4c
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:58:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582322322;
	bh=2y0rAkOt9+XGbETlwr36fT28U3giH/RJVRyDtqDQNLs=;
	h=From:To:Subject:Date:From;
	b=uIgx6nI9PBepE1N2+s+AWQcPUnmV3W3kNNdZawJfy8lVKHeOlXk2Y0s813em1MH0N
	JhgVPnWuLak7y60/4+apgWPj4VRIxwBZ5mGG97iCzeoqAVDDs27UqBg2DAqlpsGbMf
	b7mofKv5p477y4+naXemkrD31YzPbPOXe+lyC8k1/pKf3vPtgu8jSBs59CcsZy8Hza
	A9XNkbrvQ53h+pHQv0QbN5o027MWn4ACmTvMg53qSkhTHB44Khdez4FNCSpLXUpTtH
	cCNtAkTQzQt2t84RAkM53a0Ksa7ze7/j8R9MUNG+hOTq0eS+l365BMpJpzXEaIz5Yf
	XhYY0720pUJKgeJWgGLYPT0s/yoZwcvZPwWy/HEXpGGvym/Ud3nZ6I2P1EtRcxUAF8
	qUCu6ebaygLUIq3En+fgDqGeNfVNX3OSo7Pfb0hZienWTIYTL90eBctWR1/LA1aHK+
	jEx4HNDekIEnQtg+E9wVqta89QT1kbFYNv+yMTCbivY8M3cqNYWKiGdEfatFWEYwx1
	9xK81Ul4Ozh2PviJ6M8nJF+uV7GB5NMTtS/SxQoNbyQ6vXBSPY5LGxUlZH3E3b/Wzr
	hVtMJFZZPPHA/eW/LGFjdaF2ng0GLw404iBums/EvF1oZdyyrFWl9KUYrOPtJijN9k
	vQgy9KaG0rfYvXmGzFnG5nK0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 23:58:40 +0200
Message-Id: <20200221215840.4363-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] ppp: Security fix CVE-2020-8597
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
X-List-Received-Date: Fri, 21 Feb 2020 21:58:41 -0000

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2020-8597: eap.c in pppd in ppp 2.4.2 through 2.4.8 has an rhostname
buffer overflow in the eap_request and eap_response functions.

References:
https://nvd.nist.gov/vuln/detail/CVE-2020-8597

Patch from:
https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...01-pppd-Fix-bounds-check-in-EAP-code.patch | 47 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
new file mode 100644
index 0000000000..b7ba7ba643
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
@@ -0,0 +1,47 @@
+From 8d7970b8f3db727fe798b65f3377fe6787575426 Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@ozlabs.org>
+Date: Mon, 3 Feb 2020 15:53:28 +1100
+Subject: [PATCH] pppd: Fix bounds check in EAP code
+
+Given that we have just checked vallen < len, it can never be the case
+that vallen >= len + sizeof(rhostname).  This fixes the check so we
+actually avoid overflowing the rhostname array.
+
+Reported-by: Ilja Van Sprundel <ivansprundel@ioactive.com>
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+
+Upstream-Status: Backport
+[https://github.com/paulusmack/ppp/commit/8d7970b8f3db727fe798b65f3377fe6787575426]
+
+CVE: CVE-2020-8597
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ pppd/eap.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pppd/eap.c b/pppd/eap.c
+index 94407f5..1b93db0 100644
+--- a/pppd/eap.c
++++ b/pppd/eap.c
+@@ -1420,7 +1420,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
+@@ -1846,7 +1846,7 @@ int len;
+ 		}
+ 
+ 		/* Not so likely to happen. */
+-		if (vallen >= len + sizeof (rhostname)) {
++		if (len - vallen >= sizeof (rhostname)) {
+ 			dbglog("EAP: trimming really long peer name down");
+ 			BCOPY(inp + vallen, rhostname, sizeof (rhostname) - 1);
+ 			rhostname[sizeof (rhostname) - 1] = '\0';
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index 644cde4562..60c56dd0bd 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://0001-pppoe-include-netinet-in.h-before-linux-in.h.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
            file://ppp-2.4.7-DES-openssl.patch \
+           file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.17.1


