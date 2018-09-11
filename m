Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 59B487984F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 09:37:43 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e1-v6so16002727wrt.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=43iaJ2GIXSEcNlS+R3RpROt7mkQRivKZo7nQB+pAGtg=;
	b=BQAqjCROwaj7PFFxICFCBtT54RNrDd+iRZoel4kdNy0okMoaImKSq2TwHdoBaJBFZM
	WDjm5ASR8MXceo7lmdNMG2lmVleluyntl1TxPEbcVo1M0LWO8jBJlIRo36VJAfL8EIrk
	9SEJUYepr8fMSQvnUnIdW6c4y6CEQ7Vq8O4vEbS5VZkcrwx/klNrHAK6gnGQjXV8HJKH
	5XXfX4LUmbCur0VNjdkPlpcr3yo0YMPWmJNPMod7h53VBXcSiAO2yXlk5bHHXA8S4F/N
	qUDBmy4lM6ETMgTXtRo1ijpmi6EeRz/XBjKDESRkHJI9adOOo4YmU32LzCGNnQDTAdlY
	IflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=43iaJ2GIXSEcNlS+R3RpROt7mkQRivKZo7nQB+pAGtg=;
	b=qFk5JI+IW9nt9FtvLFJxHE8C6+92Cqac9VlblqJoG9+9ySEHTiShs3tnfC9bZb3G2J
	z6oqXxrkYzLW4VGYQe/wVh4fKO/Xkq/Kb0pIY/MIGuuO3sb/EcBou9eZhs05AcWxyFZM
	La4bHPEuscuJBQNefdctO4OpNwoElgjeMy/BDn1h2NK3mi346052h0Sq/MDxHicQfsi1
	Y3bW608dzwFmVJYRsXRUB6R+g9TAqIVp8/oZH84Wwsy26gk1UQA3w3JdTJPyqRz4+Ehc
	PA6SSHW2f3Wg5o38MjZGj2uWalHqrntFw/btSIb/DqNzeTnf5gGOIiK/qIxdxRdzM1LY
	GUhg==
X-Gm-Message-State: APzg51DHqda47MwvFuNtMA8NJbOVkQvTMjsMokBCENkTdJ7/zJwG0ydH
	xC3CcGyZOcjT05s1hsdyPTseDnza0mw=
X-Google-Smtp-Source: ANB0VdbQejRxgE6vp1wHCIOcw1t+J37qdwf7ObETsquOgSSjfALVCqIQEf0siYCf02kIC6uSD8a/BQ==
X-Received: by 2002:a1c:3503:: with SMTP id c3-v6mr762641wma.46.1536658663524; 
	Tue, 11 Sep 2018 02:37:43 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m68-v6sm948450wmb.10.2018.09.11.02.37.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 02:37:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2018 10:37:40 +0100
Message-Id: <20180911093740.5334-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lrzsz: fix CVE-2018-10195
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
X-List-Received-Date: Tue, 11 Sep 2018 09:37:43 -0000

"Integer overflow in src/zm.c:zsdata() causes crash in sz and can leak
information to receiver."

Take a patch from Fedora to resolve CVE-2018-10195.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../lrzsz/lrzsz-0.12.20/cve-2018-10195.patch       | 28 ++++++++++++++++++++++
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-bsp/lrzsz/lrzsz-0.12.20/cve-2018-10195.patch

diff --git a/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/cve-2018-10195.patch b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/cve-2018-10195.patch
new file mode 100644
index 00000000000..dea298634f0
--- /dev/null
+++ b/meta/recipes-bsp/lrzsz/lrzsz-0.12.20/cve-2018-10195.patch
@@ -0,0 +1,28 @@
+Integer overflow in src/zm.c:zsdata() causes crash in sz and can leak information to receiver.
+
+Patch taken from Fedora.
+
+CVE: CVE-2018-10195
+Upstream-Status: Inappropriate (dead upstream)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff -urN lrzsz-0.12.20/src/zm.c lrzsz-0.12.20.new/src/zm.c
+--- lrzsz-0.12.20/src/zm.c	Tue Dec 29 09:48:38 1998
++++ lrzsz-0.12.20.new/src/zm.c	Tue Oct  8 12:46:58 2002
+@@ -431,10 +431,12 @@
+ 	VPRINTF(3,("zsdata: %lu %s", (unsigned long) length, 
+ 		Zendnames[(frameend-ZCRCE)&3]));
+ 	crc = 0;
+-	do {
+-		zsendline(*buf); crc = updcrc((0377 & *buf), crc);
+-		buf++;
+-	} while (--length>0);
++
++	for( ; length; length--) {
++	  zsendline(*buf); crc = updcrc((0377 & *buf), crc);
++	  buf++;
++	}
++
+ 	xsendline(ZDLE); xsendline(frameend);
+ 	crc = updcrc(frameend, crc);
+ 
\ No newline at end of file
diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 4b349be32f7..002c774c6d8 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://www.ohse.de/uwe/releases/lrzsz-${PV}.tar.gz \
 	   file://acdefine.patch \
 	   file://lrzsz_fix_for_automake-1.12.patch \
            file://lrzsz-check-locale.h.patch \
+           file://cve-2018-10195.patch \
            "
 
 SRC_URI[md5sum] = "b5ce6a74abc9b9eb2af94dffdfd372a4"
-- 
2.11.0


