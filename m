Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2FA6A71A6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 18:16:50 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id y205so5833297qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 10:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=NTSpg/CYebBHV98JK1ENH3BsZmipunbJjPTbY+kMTug=;
	b=RaUczr5FH4sB9htOGxaCW8Yi0FVP+HciwDeB98mHWj9oNEqBqb+OebuXAF4DBsrW6d
	3N5A+tfQ7QmVdikSqaDHcZf4a8zbMg3UuxtqwObK8DXFoS8GpLctfOIklcgkCcc314Pf
	3w2/2ONPDc80N2ihRwGSzm9wBVzikGZKRvsIFzKQs7+o4DrDMKC+ts9Z79YVv+T2cBSt
	nPCTKRo5zaJxjDOuaaiFjiF6MfxQZUYrfw47TsYRuhgZL/OmFaFgDN+S8OuejG3plAFj
	WhEgoi3RbxeA4NnVhHU6huu1XgCe9q90OtQQh8R/ggJEh48khIb7z2khs8sBa8+5vcIM
	KcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=NTSpg/CYebBHV98JK1ENH3BsZmipunbJjPTbY+kMTug=;
	b=liT5F79f32GrFfKnpEqGJ5kVd2sXAeW1w2dpdU73qn8Q/4fpp2xsRANcbc/GRidUYg
	yQXUZt6Cx2aCwj1RsEzQPgFwoOQUp7wppahySYTTBrQpOc0E++R3QUUi6sEEzHS4WE1G
	vWfTR4xx76fspYEEenkUEX+57nJ9GM96CXR3OtTqx5Rq08CjC5t7jRDbvgYjdb02O8Hx
	Bb9mMgcRJLf+IRxWU94m8rq1GZpPyi+kLEPWFFgL9wv0HJS64nNjCcWSMuKJbPe1ffSm
	0EsR8TkqO7BjoK+0qzHXUbER+4qUh1RRx1HSK+Fqqrjx+Hy2FBEtBQqiIRFUgQR6pEXj
	a2Xw==
X-Gm-Message-State: AKaTC01lwUH33BugAamdK+T2sp1KbRGLZ2XjcrXql5tnJkIC69+DCIECF0Qb7yjlJKovBg==
X-Received: by 10.55.188.198 with SMTP id m189mr22858062qkf.248.1479838612220; 
	Tue, 22 Nov 2016 10:16:52 -0800 (PST)
Received: from monster.lab.ossystems.com.br ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 1sm14314678qte.46.2016.11.22.10.16.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Nov 2016 10:16:50 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2016 16:15:59 -0200
Message-Id: <1479838559-24993-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] libpcap: Disable exposed bits of WinPCAP remote capture support
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
X-List-Received-Date: Tue, 22 Nov 2016 18:16:51 -0000

Disable bits of remote capture support inherited from the WinPCAP merge
which cause applications to fails to build if they define HAVE_REMOTE.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../libpcap/libpcap/disable-remote.patch           | 36 ++++++++++++++++++++++
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch

diff --git a/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch b/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
new file mode 100644
index 0000000..7e1eea6
--- /dev/null
+++ b/meta/recipes-connectivity/libpcap/libpcap/disable-remote.patch
@@ -0,0 +1,36 @@
+Disable bits of remote capture support inherited from the WinPCAP merge
+which cause applications to FTBFS if they define HAVE_REMOTE.
+
+Patch from:
+https://anonscm.debian.org/cgit/users/rfrancoise/libpcap.git/commit/?
+id=f35949969269dfdcc3549b12fade604755e1e326
+
+Upstream-Status: Pending
+
+--- a/pcap/pcap.h
++++ b/pcap/pcap.h
+@@ -506,6 +506,11 @@
+   #define MODE_STAT 1
+   #define MODE_MON 2
+ 
++#ifdef HAVE_REMOTE
++  /* Includes most of the public stuff that is needed for the remote capture */
++  #include <remote-ext.h>
++#endif	 /* HAVE_REMOTE */
++
+ #elif defined(MSDOS)
+ 
+   /*
+@@ -526,11 +531,6 @@
+ 
+ #endif /* _WIN32/MSDOS/UN*X */
+ 
+-#ifdef HAVE_REMOTE
+-  /* Includes most of the public stuff that is needed for the remote capture */
+-  #include <remote-ext.h>
+-#endif	 /* HAVE_REMOTE */
+-
+ #ifdef __cplusplus
+ }
+ #endif
+
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
index 9072fe0..8ce18e5 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb
@@ -2,6 +2,7 @@ require libpcap.inc
 
 SRC_URI += " \
     file://libpcap-pkgconfig-support.patch \
+    file://disable-remote.patch \
 "
 
 SRC_URI[md5sum] = "3d48f9cd171ff12b0efd9134b52f1447"
-- 
2.1.4


