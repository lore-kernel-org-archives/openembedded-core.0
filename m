Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 874EC6D435
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 18:14:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id gn14so4385496plb.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Dec 2018 10:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rptVzVcudWWMemoJ7mp4Wrq0Htfxb84ondzhHKp3kdU=;
	b=nDYOwX6Asus9mCcmPU3/RriRhhJVwNZk+Q3WUWHL/CWEepW/y/D7o9rzZ60MCUZ7MR
	HUJQSuK/CPlUmlcbLyQT6KUH2lPdEBx4zxqWaDQySsy2jWeHQ0d2542zDNJQJeCjl8kM
	6LhXYRX5RkpikjxOP+6zZRQVnM7xO2lHNev9qD0zJK9kJfe3dHsu74Q1IpuboA/Vi8gt
	XLmS3ISOp5cwm/VTMN5TGHK8quZNFIpdWOcbCZmx/GNCubuMicuFb0IUeyo3BnrlBq5H
	7q2shRmN/8nYQxWpuJFQrLFF+NAjWr6FKi2FnVnmUePGjbeKFstMH7FONQgHEeEcTLAA
	aZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rptVzVcudWWMemoJ7mp4Wrq0Htfxb84ondzhHKp3kdU=;
	b=kx9qnU1z2ZP4svkAWgavPw1Xjq8wXsjQ+vGwZyUiM2KX20nyx6jTw47+G3MR+WRt1N
	FMXfUMoehPaMH+6fgCrpTZrTdPOQDpRSW5npW2e2N6sf7wcBFJNut1HDCmSbVjKw/QYW
	sbncGTilNwRYjo/9JTJQYdGYUqd312iT7OayDNqWFq112OEfFhK8/Xql9n1kNoFvgsaw
	ovl0AeToUJNXGeNH+T+sWJ6iMAx6oSjpXyefKBNGLx75uTA2fnHuiQHvzspmgDtMAcH6
	ujwP40WhzOAJKxuKtWKO2UBFnK1OcgPsb0am7j5W9VtUE/qdTnL12LKUmvzWkvzbGp0t
	4GVw==
X-Gm-Message-State: AA+aEWbGWw4FgoHTckfKZKo1iOEH0ofnzgQ48Fx6CuxGJFq0ny0/sEXr
	NCjp8VCA9Rf5DrBg6JG/Hmbz0qgNHAk=
X-Google-Smtp-Source: AFSGD/UJc3FxKtRT7E6LDe8ib/LfBJ5hWzRQvIA1M3GiIPsn/y1Ok5OE4zwtDv3V6UF6CskiljHIHg==
X-Received: by 2002:a17:902:e08b:: with SMTP id
	cb11mr10203246plb.263.1543688064235; 
	Sat, 01 Dec 2018 10:14:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id t3sm8949728pgv.31.2018.12.01.10.14.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Dec 2018 10:14:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Dec 2018 10:12:54 -0800
Message-Id: <20181201181254.42701-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181201181254.42701-1-raj.khem@gmail.com>
References: <20181201181254.42701-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] nfs-utils: Fix exportfs segfault on musl
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
X-List-Received-Date: Sat, 01 Dec 2018 18:14:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Rebased

 ...ot-pass-null-pointer-to-freeaddrinfo.patch | 32 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.3.3.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
new file mode 100644
index 0000000000..a44d1bf2fe
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch
@@ -0,0 +1,32 @@
+From 4f115fc314646500f7b4178d7248a02654c7cd10 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Nov 2018 16:47:57 -0800
+Subject: [PATCH] Do not pass null pointer to freeaddrinfo()
+
+Passing null pointer as input parameter to freeaddrinfo() is undefined
+behaviour, some libcs e.g. glibc might just call free() which does
+accept null pointer but other libcs e.g. musl might not and instead
+cause the program to segfault. Therefore do not rely on undefined
+behaviour instead make it deterministic
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ support/export/client.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: nfs-utils-2.3.2/support/export/client.c
+===================================================================
+--- nfs-utils-2.3.2.orig/support/export/client.c
++++ nfs-utils-2.3.2/support/export/client.c
+@@ -309,7 +309,8 @@ client_lookup(char *hname, int canonical
+ 		init_addrlist(clp, ai);
+ 
+ out:
+-	freeaddrinfo(ai);
++	if (ai)
++		freeaddrinfo(ai);
+ 	return clp;
+ }
+ 
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
index 35587dfb7a..572ae3146f 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://nfs-utils-musl-limits.patch \
            file://0001-cacheio-use-intmax_t-for-formatted-IO.patch \
+           file://0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch \
 "
 
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
-- 
2.19.2


