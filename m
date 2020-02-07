Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9082660EC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:40:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u6so3013816wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BVX7NizTXgqR8K5fdTRKdHHasMEzLxa4UmBJSsWnwTA=;
	b=Oa1cplqhvxnZadPl/lU7mfH6b3a/pY02IUko6wNy6VxQqMfna2bCwlmFlUViV73rIk
	BI6YKYFOLQy0k+xMH3gZstn+/t4Tkw1lXCk0b5oeQTgCSHwx1PS8iJCVa6Mjjp8Dqy3R
	UW/sN3qvbOJumqGpnsaLTpSd0dXaxT/RPsOR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BVX7NizTXgqR8K5fdTRKdHHasMEzLxa4UmBJSsWnwTA=;
	b=sdDyexC+zcSxZ9AYHNd3Cnikx3TRVEk+IjXRPW76v+bSO86bXR810CZb8GScC62zqP
	s+62xfH/JKorKCvliVMbUokosAi3XcDZ1WS0DcWy5q+gtVbDxBiKLWSZPW95csPWNeXi
	9xYSfO4H8dZFaoRqsAJ+4dElvfJZTrIri4lEds1Wm8S6f69VLQcHtXWSAFidPNvDFpgj
	bvO8/5Oqof5K5AQ98cMxnTsDse/QQMXoaqL/DO4Lv/3SDzbUzMa+72XQbMnBgrVasi7q
	DS6ViIoQ9Do7NyFL9y0WfPCfl3ttUVN6Wlr9ON8EVi4qOam2hLQQiJzHO5JtTdMDXBMs
	O2ag==
X-Gm-Message-State: APjAAAX9Xt9fwiBwPpHUZye73iMBvBdWEtI4auINczdpk5SzDodB50dX
	sfIEJ0DAyQ5C6brPRMptnmlqBzEVAZ0=
X-Google-Smtp-Source: APXvYqyXvqfP8r3w8GECrYIWVMk3+wBAU2zOdp+BReF/w5ucuJDZx5ZQfrs1sc9AqWLmKBhDsc2cXQ==
X-Received: by 2002:adf:e40f:: with SMTP id g15mr4959286wrm.223.1581086459994; 
	Fri, 07 Feb 2020 06:40:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a16sm3526412wrx.87.2020.02.07.06.40.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:40:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:40:56 +0000
Message-Id: <20200207144057.6121-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200207144057.6121-1-richard.purdie@linuxfoundation.org>
References: <20200207144057.6121-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] libevdev: Fix determinism issue
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
X-List-Received-Date: Fri, 07 Feb 2020 14:40:59 -0000
Content-Transfer-Encoding: 8bit

We need to sort python dict output to be deterministic and generate consistent
header files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libevdev/libevdev/determinism.patch       | 34 +++++++++++++++++++
 .../libevdev/libevdev_1.8.0.bb                |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libevdev/libevdev/determinism.patch

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
new file mode 100644
index 00000000000..33a6076b781
--- /dev/null
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -0,0 +1,34 @@
+The order of dict values is not deterministic leading to differing header file generation.
+Sort to remove this inconsistency.
+
+RP 2020/2/7
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: a/libevdev/make-event-names.py
+===================================================================
+--- a/libevdev/make-event-names.py
++++ b/libevdev/make-event-names.py
+@@ -67,10 +67,10 @@ def print_bits(bits, prefix):
+ 	if  not hasattr(bits, prefix):
+ 		return
+ 	print("static const char * const %s_map[%s_MAX + 1] = {" % (prefix, prefix.upper()))
+-	for val, name in list(getattr(bits, prefix).items()):
++	for val, name in sorted(list(getattr(bits, prefix).items())):
+ 		print("	[%s] = \"%s\"," % (name, name))
+ 	if prefix == "key":
+-		for val, name in list(getattr(bits, "btn").items()):
++		for val, name in sorted(list(getattr(bits, "btn").items())):
+ 			print("	[%s] = \"%s\"," % (name, name))
+ 	print("};")
+ 	print("")
+@@ -111,7 +111,7 @@ def print_lookup(bits, prefix):
+ 	if not hasattr(bits, prefix):
+ 		return
+ 
+-	names = list(getattr(bits, prefix).items())
++	names = sorted(list(getattr(bits, prefix).items()))
+ 	if prefix == "btn":
+ 		names = names + btn_additional;
+ 
diff --git a/meta/recipes-support/libevdev/libevdev_1.8.0.bb b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
index 84274987d71..46ed5d786ae 100644
--- a/meta/recipes-support/libevdev/libevdev_1.8.0.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.8.0.bb
@@ -6,7 +6,8 @@ LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
                     file://libevdev/libevdev.h;endline=21;md5=7ff4f0b5113252c2f1a828e0bbad98d1"
 
-SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz \
+           file://determinism.patch"
 SRC_URI[md5sum] = "879631080be18526737e33b63d848039"
 SRC_URI[sha256sum] = "20d3cae4efd277f485abdf8f2a7c46588e539998b5a08c2c4d368218379d4211"
 
-- 
2.20.1


