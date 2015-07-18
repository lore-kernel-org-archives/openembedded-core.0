Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA087611C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:50 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so78774922pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MBEz/Js0nW+rXvgvPAwv1jcizM4Alwzgb5zDLrPkI3o=;
	b=sZzF+/uFQlhoh9aNi48tx7mTZiFWiNyu+79shwDPMZAJe7XwoCH/CsG8Hx3NvCjNTr
	Pr9amkjZT6cOjgojssLUOxcrqnsAmW/gyl7+QKpmBPc+lMNNH0MIbddb+hMlijndr2aI
	LQch0xwMTzYaria6dG7iBsqKhw3HixKo2X581ZjRBUBsu2gHCuT91hUMnuwnsUrycNH8
	NxgyL80DKjUPXqluDtgauDx18zCF+44pt8ue5Xh4Ew5BTLvvN9ryZsVeve7UJaKxcTPM
	UTaACaeA7NUunlqS7fPDkYjyGPnpaMXoluKCI5bhLa0Y6IUIVXFrfgDOTiv1dC/R+BcS
	vDnA==
X-Received: by 10.66.165.8 with SMTP id yu8mr40517173pab.82.1437232610733;
	Sat, 18 Jul 2015 08:16:50 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	i5sm14691351pat.42.2015.07.18.08.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id B21FDFC12F3; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:18 -0700
Message-Id: <74ce6e3c652aa5f0d3c471413bc39874b3003646.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 11/25] ppp: Security Advisory - CVE-2015-3310
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:50 -0000

From: Roy Li <rongqing.li@windriver.com>

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3310

Buffer overflow in the rc_mksid function in plugins/radius/util.c in
Paul's PPP Package (ppp) 2.4.6 and earlier, when the PID for pppd is
greater than 65535, allows remote attackers to cause a denial of
service (crash) via a start accounting message to the RADIUS server.

oe-core is using ppp 2.4.7, and this CVE say ppp 2.4.7 was not
effected, but I found this buggy codes are same between 2.4.6 and
2.4.7, and 2.4.7 should have this issue.

(From OE-Core rev: 5b549c6d73e91fdbd0b618a752d618deb1449ef9)

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../ppp/ppp/fix-CVE-2015-3310.patch                | 29 ++++++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.6.bb         |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
new file mode 100644
index 0000000..c9edb30
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/fix-CVE-2015-3310.patch
@@ -0,0 +1,29 @@
+ppp: Buffer overflow in radius plugin
+
+From: https://bugs.debian.org/cgi-bin/bugreport.cgi?msg=5;bug=782450
+
+Upstream-Status: Backport
+
+On systems with more than 65535 processes running, pppd aborts when
+sending a "start" accounting message to the RADIUS server because of a
+buffer overflow in rc_mksid.
+
+The process id is used in rc_mksid to generate a pseudo-unique string,
+assuming that the hex representation of the pid will be at most 4
+characters (FFFF). __sprintf_chk(), used when compiling with
+optimization levels greater than 0 and FORTIFY_SOURCE, detects the
+buffer overflow and makes pppd crash.
+
+The following patch fixes the problem.
+
+--- ppp-2.4.6.orig/pppd/plugins/radius/util.c
++++ ppp-2.4.6/pppd/plugins/radius/util.c
+@@ -77,7 +77,7 @@ rc_mksid (void)
+   static unsigned short int cnt = 0;
+   sprintf (buf, "%08lX%04X%02hX",
+ 	   (unsigned long int) time (NULL),
+-	   (unsigned int) getpid (),
++	   (unsigned int) getpid () % 65535,
+ 	   cnt & 0xFF);
+   cnt++;
+   return buf;
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
index 8bc3672..b6b4048 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.6.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://ppp.samba.org/ftp/ppp/ppp-${PV}.tar.gz \
            file://provider \
            file://0001-ppp-Fix-compilation-errors-in-Makefile.patch \
            file://ppp@.service \
+           file://fix-CVE-2015-3310.patch \
 "
 
 SRC_URI[md5sum] = "3434d2cc9327167a0723aaaa8670083b"
-- 
1.9.1


