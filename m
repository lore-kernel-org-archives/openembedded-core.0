Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5B97547D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 06:52:52 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id bi12-v6so2740977plb.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 23:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uuyzbLwsN82jPmrAR0LydpV9/V9/1dcWDzfhEF1LU1M=;
	b=BUR/NPpGl6dbje9EEjvE9lQU61e63PU5cRmw6pE98l6JF18CTDVuIDaFu3QpF/HH8o
	4zKO79yXaNGG3ZsgV0gTFEvtc9T3NGKgOMtk1GyB8Kyo8fjiqSYRej7DPJK4x8pbWmQi
	KH07Y0Yx179rik993kndcnylQh7Wye7uab2n+IX3NAB0zVq7T/TFFv6klGZpAdryG7Jm
	5WRG0ibZ3/DsenLM6BFVBXIK/eixa4LA2XYZTHtBFp1wzItSYepZuwbzDLu/nOuUcceG
	TfQjbgGQxyPjTFxd8Gcf0kfKjGryj0ipS3MVaI+IG+ZSZEQ+CxyayAaKrt8JdRm9tzzx
	xQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uuyzbLwsN82jPmrAR0LydpV9/V9/1dcWDzfhEF1LU1M=;
	b=CP8Qp+RnI5hoTHxxeH1PEpkI3JLQKV1BWRNb6wwWcykuEqliZg8IJRSdII8w9c1wDG
	Xf1IqBLljjWLLVQ8DuXX34Tttq4LE6sO/9d7KEr2yNDSxna0avyZ3y1AjKoWZpAzQdJI
	0rO23xQI4E3fAuynq3tduOnWGQW1Jvh5LF7EhxyFBCP8PTkDji/4Kh3ncRSP3uNE53KI
	4o/xO/LfKqp8XCFc2xHZ0f5njOFBw8BryAxARlBOAhMbLq6RQ/39L04O89b8S7NaUWX8
	HK/5WiPz3fds74goPurO6nNjW/IjoDHnzh/YrvsUDMN6xyxWk4fzKMXhjrDX04+EGfi2
	3Pjg==
X-Gm-Message-State: ALKqPwctI8yvJkW1MgbKX8apFz7onTEs0baMSdwh8aLGjHKhRD/tTRgc
	80I5tAFn7reTSiQbk5OG7YDurQ==
X-Google-Smtp-Source: AB8JxZrGlQB7exDPjB3BeEbBRIC5CJuNWu1sGErlRKA86K3/SF4SEwA2X3mMIJDcvzWUXj4nGczBVw==
X-Received: by 2002:a17:902:28a7:: with SMTP id
	f36-v6mr3489985plb.155.1526021573199; 
	Thu, 10 May 2018 23:52:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	q126-v6sm4583116pga.79.2018.05.10.23.52.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 23:52:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 May 2018 23:52:48 -0700
Message-Id: <20180511065249.40069-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511065249.40069-1-raj.khem@gmail.com>
References: <20180511065249.40069-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] libxcrypt: Fix build with gcc8
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
X-List-Received-Date: Fri, 11 May 2018 06:52:52 -0000

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...format-truncation-warning-with-gcc-8.patch | 36 +++++++++++++++++++
 .../recipes-core/libxcrypt/libxcrypt_4.0.0.bb |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxcrypt/libxcrypt/0001-disable-format-truncation-warning-with-gcc-8.patch

diff --git a/meta/recipes-core/libxcrypt/libxcrypt/0001-disable-format-truncation-warning-with-gcc-8.patch b/meta/recipes-core/libxcrypt/libxcrypt/0001-disable-format-truncation-warning-with-gcc-8.patch
new file mode 100644
index 0000000000..654eae6c6a
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/libxcrypt/0001-disable-format-truncation-warning-with-gcc-8.patch
@@ -0,0 +1,36 @@
+From c8c5908611e44a649489e8d217528fedc4864e14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 10 May 2018 13:32:20 -0700
+Subject: [PATCH] disable format-truncation warning with gcc-8
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crypt-sunmd5.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/crypt-sunmd5.c b/crypt-sunmd5.c
+index 4c85b7f..3e838cd 100644
+--- a/crypt-sunmd5.c
++++ b/crypt-sunmd5.c
+@@ -151,6 +151,11 @@ getrounds (const char *s)
+   return ((uint32_t)val);
+ }
+ 
++#pragma GCC diagnostic push
++#if defined(__GNUC__) && (__GNUC__ >= 8)
++#pragma GCC diagnostic ignored "-Wformat-truncation"
++#endif
++
+ void
+ gensalt_sunmd5_rn (unsigned long count,
+                    const uint8_t *rbytes, size_t nrbytes,
+@@ -189,6 +194,7 @@ gensalt_sunmd5_rn (unsigned long count,
+             "$" CRYPT_ALGNAME "," ROUNDS "%u$%s$",
+             (unsigned int)count, rndstr);
+ }
++#pragma GCC diagnostic pop
+ 
+ void
+ crypt_sunmd5_rn (const char *phrase, const char *setting,
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
index a1be4be7ef..8cc5edac49 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
@@ -12,7 +12,9 @@ inherit autotools
 SRCREV ?= "215b32aa4e0b255c3356a96bd6d257661bad73ca"
 SRCBRANCH ?= "master"
 
-SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+           file://0001-disable-format-truncation-warning-with-gcc-8.patch \
+           "
 
 PROVIDES = "virtual/crypt"
 
-- 
2.17.0


