Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id E97476C48A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 01:08:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id gn14so3595662plb.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 17:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ivi+Gix/9Ax0sm/1ri4b50ufhsEJbVmzh6xtBEk7ck0=;
	b=OQVHg3siCRXvkb0ksvXIFWXF7/cDkxdGL/E9AmxTEjrLNPH2i63ExcJbH09lHd4ZNz
	iwl3lNk6kLUPvhV89+B+Ol0lTEEg1fAEsjp1SgT1AYC9Bc8Sp+8r8I/RfWLAY/tCpbqT
	0IETg44RQXYAoNM9p5gDkpWqhuOJzGSe9EuO4xwIPhLDb+nklmBK0lfrVpmIYhn5spiI
	ojC9Nn4n4gsS5mMgcCMHmESsqFAYDhM/hef+QTDb2DpLFbHbVwgoQ2xpyPsPmS5NtzSv
	QZGTufxccXKtj6G7xTX4/Q1MhBazEotrCspOzZIR6yoslJpxpZaclCP5BOfIk6khVFWX
	ZOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ivi+Gix/9Ax0sm/1ri4b50ufhsEJbVmzh6xtBEk7ck0=;
	b=bzHnpK59qmHYtKcDAq3FwaIxqdM2z2R1PnKfrke7ioCn+aC/Ek7KhbbQ+CmRtHLPuA
	belSJhKtZNaWFNSJcDpkmE2Rxc/mkDO+zSFqOV4Rf16QrdEamcbDegir+MOvqHRVpYWd
	rXLR9j60iKtR0MEZGkIaYQMVxGrRFfKiSrBoziAZmZyRzpCIIqlCwEY6nemXBFJrMXBf
	qBpthvxfgwgBZbCvkKVShcsZSJOSaNG17TTs0on/d+hV9mhAolML9T8o+DHG5kuHhp8l
	EEZGelhMSqkkNbkRY9Lpf3dAArsrtVReVUKvNUFYKLs9ZYBJhj/RJ+wemKqa8Q4oZeAM
	cSGQ==
X-Gm-Message-State: AA+aEWZWbiQmIgHl8BIaoxbe0qJI4MmAoi/Po8CbpOFvzCnPMn/SMBXI
	8KXAF03LHMfh5+aEr95t8eK2Ct/KbZw=
X-Google-Smtp-Source: AFSGD/UmeUnklt1b73uhptoTRZ2abCJ/HWww5fLrxSAn/TMlfkuuTRSOIP97M+7MkLcwcSWj8t16WA==
X-Received: by 2002:a17:902:30a3:: with SMTP id
	v32mr1889810plb.26.1543626502537; 
	Fri, 30 Nov 2018 17:08:22 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	q199sm18683422pfc.97.2018.11.30.17.08.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 17:08:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 17:08:07 -0800
Message-Id: <20181201010807.28924-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181201010807.28924-1-raj.khem@gmail.com>
References: <20181201010807.28924-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nfs-utils: Fix exportfs segfault on musl
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
X-List-Received-Date: Sat, 01 Dec 2018 01:08:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-pass-null-pointer-to-freeaddrinfo.patch | 32 +++++++++++++++++++
 .../nfs-utils/nfs-utils_2.3.2.bb              |  1 +
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
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
index 5c0586fa75..9b3f36d343 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.3.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils-debianize-start-statd.patch \
            file://bugfix-adjust-statd-service-name.patch \
            file://nfs-utils-musl-limits.patch \
+           file://0001-Do-not-pass-null-pointer-to-freeaddrinfo.patch \
 "
 
 SRC_URI_append_libc-musl = " file://nfs-utils-musl-res_querydomain.patch"
-- 
2.19.2


