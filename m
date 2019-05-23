Return-Path: <nick83ola@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1C4B37E069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 07:47:24 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l25so7828377eda.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MMTGrdzvLZoN0s1hr9QwMT7GPCb1kMST8RyCdKoh4Y4=;
	b=g6yP7SsfWdvPNAqmdk39bWQtmhFT/Zn2jxFGcwu/mAIXxRpjRqLylWq+9VvsX3mB3/
	PId+ruuqr1ZDQNKdoiQtj6M7PweTH8vS2Qo2R+ilta34QTUhNF4nMTemxQqq2wV6+Ehe
	yOx6glbx7nlFUKD5h6BjM6R3rM0mgDNlAuKw0KqSSDk1faBlOleaTkTyZwfGyzkUsHPc
	22gCKDAPHxhkcp7dc9Qn87Pa3qDkMKa+RE4oacgrALX4G1vmEumxdrhAV3kUy1KA3GDH
	BcJfB6HsvviJnPZW3SRdcrK7qIAL+Tbvzf29W+9g2x7h+SGwKzIDPwZ9Bhm5HgO47kbk
	62mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MMTGrdzvLZoN0s1hr9QwMT7GPCb1kMST8RyCdKoh4Y4=;
	b=on08fOLdMb0Rdh8xMPKYjCXadwkPbeHH+NU7BOKtbvJzzzwixeUg5aN5CqeE6nqVQz
	RuY+Mn365lqPKwb3PgFVNJbncdEuZx0WjzxsZfaQ8V5N5PszZXH4zAAfha7I1hdzJXWh
	9xMo3qYtGUVGPMyHYiUC5RCGHnIUAjTWUOAFkKCVoHLtg/LH5de9Hwze5E8LMbcmwz5b
	HWCeiS+VVCMe4MASmJnJIA5x7M8uSysEgwmpjV1WMDMDCUR8jey+sXgBdgRgmH6FyYAS
	4L7PBG2Rfm6F2UaBOsVtlX8GKYGdwFJbg1B3Ue9A7ITJYLCgmA3vIoqsOgFHfJLyna0z
	Rykw==
X-Gm-Message-State: APjAAAUEz7LGBIWaLKJ79m1eTslUXHujMmtz77du4FIz/o5s7c/rpnYp
	BDHFNAODh7kg9/tWXPpnCn2q3gFalxI=
X-Google-Smtp-Source: APXvYqw4D4OoDs1g+veXM++6Qvd6R6qev7cFfJjAmg64ls7VNL94kN+iEepeUOMx0wjfavXpmK5FMA==
X-Received: by 2002:a17:906:4b12:: with SMTP id
	y18mr41112557eju.32.1558597644503; 
	Thu, 23 May 2019 00:47:24 -0700 (PDT)
Received: from localhost.localdomain ([176.61.90.192])
	by smtp.gmail.com with ESMTPSA id
	c38sm7516018edc.22.2019.05.23.00.47.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 00:47:23 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 08:47:03 +0100
Message-Id: <20190523074703.17145-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] connman: fix segfault with musl >2.21
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
X-List-Received-Date: Thu, 23 May 2019 07:47:25 -0000
Content-Transfer-Encoding: 8bit

musl > 2.21 changed the implementation of the freeaddrinfo() function
not allowing anymore to pass null pointers to it.
This was causing a segmentation fault in connman.
---
 ...-gweb-fix-segfault-with-musl-v1.1.21.patch | 34 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  5 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch

diff --git a/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch b/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
new file mode 100644
index 0000000000..43b43bc9f8
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0003-gweb-fix-segfault-with-musl-v1.1.21.patch
@@ -0,0 +1,34 @@
+From f0a8c69971b30ea7ca255bb885fdd1179fa5d298 Mon Sep 17 00:00:00 2001
+From: Nicola Lunghi <nick83ola@gmail.com>
+Date: Thu, 23 May 2019 07:55:25 +0100
+Subject: [PATCH] gweb: fix segfault with musl v1.1.21
+
+In musl > 1.1.21 freeaddrinfo() implementation changed and
+was causing a segmentation fault on recent Yocto using musl.
+
+See this commit:
+
+ https://git.musl-libc.org/cgit/musl/commit/src/network/freeaddrinfo.c?id=d1395c43c019aec6b855cf3c656bf47c8a719e7f
+
+Upstream-Status: Submitted
+---
+ gweb/gweb.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 393afe0a..12fcb1d8 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -1274,7 +1274,8 @@ static bool is_ip_address(const char *host)
+ 	addr = NULL;
+ 
+ 	result = getaddrinfo(host, NULL, &hints, &addr);
+-	freeaddrinfo(addr);
++	if(!result)
++		freeaddrinfo(addr);
+ 
+ 	return result == 0;
+ }
+-- 
+2.19.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index 2cf904cd85..f52b21cae3 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -7,7 +7,10 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://no-version-scripts.patch \
 "
 
-SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI_append_libc-musl = " \
+            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+            file://0003-gweb-fix-segfault-with-musl-v1.1.21.patch \
+"
 
 SRC_URI[md5sum] = "75012084f14fb63a84b116e66c6e94fb"
 SRC_URI[sha256sum] = "6ce29b3eb0bb16a7387bc609c39455fd13064bdcde5a4d185fab3a0c71946e16"
-- 
2.19.1


