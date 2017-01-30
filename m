Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.43])
	by mail.openembedded.org (Postfix) with ESMTP id 212A6772F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:46:30 +0000 (UTC)
Received: from 1cYAPl-0006oV-UK by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cYAPl-0006pA-Ul
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2017 03:46:29 -0800
Received: by emcmailer; Mon, 30 Jan 2017 03:46:29 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cYAPl-0006oV-UK
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2017 03:46:29 -0800
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2;
	Mon, 30 Jan 2017 12:46:29 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jan 2017 12:46:23 +0100
Message-ID: <1485776783-44453-2-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485776783-44453-1-git-send-email-sona.sarmadi@enea.com>
References: <1485776783-44453-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCH][morty 2/2] libx11: CVE-2016-7943
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
X-List-Received-Date: Mon, 30 Jan 2017 11:46:38 -0000
Content-Type: text/plain

The XListFonts function in X.org libX11 before 1.6.4 might allow
remote X servers to gain privileges via vectors involving length
fields, which trigger out-of-bounds write operations.

References:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2016-7943
https://lists.x.org/archives/xorg-announce/2016-October/002720.html

Upstream patch:
https://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=8c29f1607a31dac0911e45a0dd3d74173822b3c9

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../xorg-lib/libx11/CVE-2016-7943.patch            | 103 +++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb     |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7943.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7943.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7943.patch
new file mode 100644
index 0000000..5002423
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2016-7943.patch
@@ -0,0 +1,103 @@
+From 8c29f1607a31dac0911e45a0dd3d74173822b3c9 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Sun, 25 Sep 2016 21:22:57 +0200
+Subject: The validation of server responses avoids out of boundary accesses.
+
+v2: FontNames.c  return a NULL list whenever a single
+length field from the server is incohent.
+
+CVE: CVE-2016-7943
+Upstream-Status: Backport
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+Reviewed-by: Matthieu Herrb <matthieu@herrb.eu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff --git a/src/FontNames.c b/src/FontNames.c
+index 21dcafe..e55f338 100644
+--- a/src/FontNames.c
++++ b/src/FontNames.c
+@@ -66,7 +66,7 @@ int *actualCount)	/* RETURN */
+ 
+     if (rep.nFonts) {
+ 	flist = Xmalloc (rep.nFonts * sizeof(char *));
+-	if (rep.length < (INT_MAX >> 2)) {
++	if (rep.length > 0 && rep.length < (INT_MAX >> 2)) {
+ 	    rlen = rep.length << 2;
+ 	    ch = Xmalloc(rlen + 1);
+ 	    /* +1 to leave room for last null-terminator */
+@@ -93,11 +93,22 @@ int *actualCount)	/* RETURN */
+ 	    if (ch + length < chend) {
+ 		flist[i] = ch + 1;  /* skip over length */
+ 		ch += length + 1;  /* find next length ... */
+-		length = *(unsigned char *)ch;
+-		*ch = '\0';  /* and replace with null-termination */
+-		count++;
+-	    } else
+-		flist[i] = NULL;
++		if (ch <= chend) {
++		    length = *(unsigned char *)ch;
++		    *ch = '\0';  /* and replace with null-termination */
++		    count++;
++		} else {
++                    Xfree(flist);
++                    flist = NULL;
++                    count = 0;
++                    break;
++		}
++	    } else {
++                Xfree(flist);
++                flist = NULL;
++                count = 0;
++                break;
++            }
+ 	}
+     }
+     *actualCount = count;
+diff --git a/src/ListExt.c b/src/ListExt.c
+index be6b989..0516e45 100644
+--- a/src/ListExt.c
++++ b/src/ListExt.c
+@@ -55,7 +55,7 @@ char **XListExtensions(
+ 
+ 	if (rep.nExtensions) {
+ 	    list = Xmalloc (rep.nExtensions * sizeof (char *));
+-	    if (rep.length < (INT_MAX >> 2)) {
++	    if (rep.length > 0 && rep.length < (INT_MAX >> 2)) {
+ 		rlen = rep.length << 2;
+ 		ch = Xmalloc (rlen + 1);
+                 /* +1 to leave room for last null-terminator */
+@@ -80,9 +80,13 @@ char **XListExtensions(
+ 		if (ch + length < chend) {
+ 		    list[i] = ch+1;  /* skip over length */
+ 		    ch += length + 1; /* find next length ... */
+-		    length = *ch;
+-		    *ch = '\0'; /* and replace with null-termination */
+-		    count++;
++		    if (ch <= chend) {
++			length = *ch;
++			*ch = '\0'; /* and replace with null-termination */
++			count++;
++		    } else {
++			list[i] = NULL;
++		    }
+ 		} else
+ 		    list[i] = NULL;
+ 	    }
+diff --git a/src/ModMap.c b/src/ModMap.c
+index a809aa2..49a5d08 100644
+--- a/src/ModMap.c
++++ b/src/ModMap.c
+@@ -42,7 +42,8 @@ XGetModifierMapping(register Display *dpy)
+     GetEmptyReq(GetModifierMapping, req);
+     (void) _XReply (dpy, (xReply *)&rep, 0, xFalse);
+ 
+-    if (rep.length < (INT_MAX >> 2)) {
++    if (rep.length < (INT_MAX >> 2) &&
++	(rep.length >> 1) == rep.numKeyPerModifier) {
+ 	nbytes = (unsigned long)rep.length << 2;
+ 	res = Xmalloc(sizeof (XModifierKeymap));
+ 	if (res)
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
index 152ccd9..23a7789 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
@@ -6,6 +6,7 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI += "file://disable_tests.patch \
             file://libX11-Add-missing-NULL-check.patch \
             file://CVE-2016-7942.patch \
+            file://CVE-2016-7943.patch \
            "
 
 SRC_URI[md5sum] = "2e36b73f8a42143142dda8129f02e4e0"
-- 
1.9.1


