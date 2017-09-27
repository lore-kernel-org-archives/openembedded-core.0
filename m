Return-Path: <matt@madison.systems>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3C26C77DAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 12:02:22 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 188so7647499pgb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=M+uWpSML3kXVZjqY+uiIY/wG4w5MDYn+sL5mmUyAvKs=;
	b=Xf0tfHJZGJuyahJ+VNypnPalK+s/BCI/uZANfy4Zl0lHghEGBALC2qkaNgwRYr/+2X
	ez7+UWjlNK+0g9gtbWwEN8aFL1IXdX3Sw4OTcvcDsLxalOM+I/6C+AbIVsJ21JOTJzLj
	Mg/mb6aN36/9dboA/dUm43YPVoAW3AP9s0OwLs8Vlm+Z7hoGs8qtRCHTE0MVD2CSW0Kb
	jy7T0nedjH8UlLNohf7Udl8yUSdDLl63k6hI/Q4OYkhcf86V3NkFQ6ZSc7lpYhxTH6+k
	z7Py0WXwgVt9afA2lvwC6YAJMfPaFx6gNiKXzsqgL+CZr1rgIs+rsi6jiF71musCJiea
	YC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+uWpSML3kXVZjqY+uiIY/wG4w5MDYn+sL5mmUyAvKs=;
	b=ennM0/TxbU2jMYpBoixnRDgsA9jmXlM3ht0fnYQk0a+EWxJYer2mIarXZEq1DJpAS1
	8QYr0mJQ+9SnC71o5qREFzOlc4C62vQ6CN3GBSTCIXcVg11X8R67Mbjwy+sJEj2pz/Py
	y+6kDjUzZTnVFYnB9ZMXXp0FY7SB55hxEoBfTUEDnaGGUSqOdH9n1eGRkeMSj/fH+lDu
	dYhCYG3ICMV6VsgBil9tWjOybhccOo0qbwNjuu+1gdRE+ngsi5Lyt/WFR62fV9KckjGu
	nj07ikeLf7STcTYXOYdFX/oU7emtmqrv7oRbRBohyVqbRmwqvNwIzkJLO1OIVvkoSZA2
	CdLw==
X-Gm-Message-State: AHPjjUg4Mcgdk6spcCIvv5qLcOsf9eeTwFCfFrPb2Cewz1el8pR29md/
	aFEv4S4mBCOYBYggjOiFS4rvTxxb
X-Google-Smtp-Source: AOwi7QAPh8Jd9nQ5iNKB8DN9XNIr76IK7ic4eGJo6ggmfDjKRUycPGc/j3/OYmD7N3CtHNu+VsDZyw==
X-Received: by 10.84.132.104 with SMTP id 95mr1072755ple.231.1506513743772;
	Wed, 27 Sep 2017 05:02:23 -0700 (PDT)
Received: from workhorse.madison.systems
	(c-67-170-200-185.hsd1.ca.comcast.net. [67.170.200.185])
	by smtp.gmail.com with ESMTPSA id
	j18sm2912203pfh.161.2017.09.27.05.02.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 05:02:22 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 05:01:46 -0700
Message-Id: <1506513706-14213-1-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] goarch.bbclass: rework mips architecture checks
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
X-List-Received-Date: Wed, 27 Sep 2017 12:02:23 -0000

Move the mips32r2->mips32 rewrite to an anonymous
python function, and change the GOARCH setting to
use just the passed-in architecture string, to
avoid an unwanted variable dependency.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/goarch.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 9ed562d..7553987 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -43,14 +43,10 @@ def go_map_arch(a, d):
         return 'mips64le'
     elif re.match('mips64*', a):
         return 'mips64'
-    elif re.match('mips.*', a):
-        tf = d.getVar('TUNE_FEATURES').split()
-        if 'fpu-hard' in tf and 'n32' not in tf:
-            if 'mips32r2' in tf:
-                newtf = [t for t in tf if t != 'mips32r2']
-                newtf.append('mips32')
-                d.setVar('TUNE_FEATURES', ' '.join(newtf))
-            return 'mips' if 'bigendian' in tf else 'mipsle'
+    elif re.match('mipsel.*', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
+        return 'mipsle'
+    elif re.match('mips', a) and 'r6' not in a and '-nf' not in a and '-n32' not in a:
+        return 'mipsle'
     elif re.match('p(pc|owerpc)(64)', a):
         return 'ppc64'
     elif re.match('p(pc|owerpc)(64el)', a):
@@ -74,4 +70,10 @@ def go_map_os(o, d):
         return 'linux'
     return o
 
-
+python __anonymous () {
+    tf = d.getVar('TUNE_FEATURES').split()
+    if 'mips32r2' in tf:
+        newtf = [t for t in tf if t != 'mips32r2']
+        newtf.append('mips32')
+        d.setVar('TUNE_FEATURES', ' '.join(newtf))
+}
-- 
2.7.4


