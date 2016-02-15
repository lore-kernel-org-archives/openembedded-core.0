Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8FCA36FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 20:09:24 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id y89so118443654qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 12:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7ewosw03VGUxR5Mc9VzMXiu49kZkZ/xrU3TDKKWsrp4=;
	b=r2fFp0TyrFJW496r5ckNx6M1EC5YvNOX/QA9EKmUuW7c6uusPUDpLLqtBqiOcpvN2i
	BF5koY/yKhQ3Dq1/2NZNQQexxqemoP0MDeR1XTh3WNTz/Mf//HlLk+VSUBa+5eY6nn2A
	2K62VDMkeICNBw9ge2K7eYt1fz9mVrcyRBR7XFQsqr5XMq6HtFlTS40poUuu28cCtVpr
	hJGnVEAxwnyTIDqw6oRlG14qY6Ibnzme5aQUkKb+RFj2S0CYgdqqMH0mLOqa/gEFRDKr
	PyqT5n/U4RsroT4xqPykmHrx8OPM3F0aFRkJ+ISbMSig9wmR+Ywrsy/rJbXMDaWopvxI
	ds8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7ewosw03VGUxR5Mc9VzMXiu49kZkZ/xrU3TDKKWsrp4=;
	b=WZHk/MFwTjTu6AXr2S8yLTYcppFDqw2wUQduZIJlj+uwZ3AFDIg/yLnRfCbU9OxV5h
	UnCt2ibe9eUT2KXJY6FQSqjId2aYUlWc4lOcqXRlk+vx0vMfJtdmUAeDNrQNMp+JvkAn
	3EbhJmnXGu6WsiLGoGW1yMMqijVw6XCRDJXNqmHejukfoavh7RvRk6Zm1ZyDCdF45YHF
	hXIuzVgIXhRZUzepMHm+uqceRIPQfORnaUklwFm9vBtCiXRm6lHpKe9rH6w0DtL2fFz4
	EVYhJgr9Im9GizKnaYCnh4vjgcyLIPIPdVOsx3G7Cq1f1FhaqI6p/9emmjWQDYRBYB4P
	OYjg==
X-Gm-Message-State: AG10YOS9qGbQR1q6G6XfeE9FS79Qs4Wv6ohriLsn2wXiw0pDbmzVIWtg99uCxP87AFPEig==
X-Received: by 10.140.106.97 with SMTP id d88mr22847922qgf.84.1455566965219;
	Mon, 15 Feb 2016 12:09:25 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	r6sm11600944qhr.28.2016.02.15.12.09.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 12:09:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 20:09:18 +0000
Message-Id: <1455566958-103827-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH] binutils: Fix useless rpaths QA warning
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
X-List-Received-Date: Mon, 15 Feb 2016 20:09:26 -0000

elfedit and readelf contains /usr/lib in elf header
this patch deletes them from binaries, ideally it
should be fixed in libtool and Makery of binutils

mips target binutils dont build gold so remove
them from ALTERNATIVES list

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 79e2a12..7a5b4cc 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -51,6 +51,7 @@ USE_ALTERNATIVES_FOR = " \
 	strings \
 	strip \
 "
+USE_ALTERNATIVES_FOR_remove_mips = "ld.gold dwp"
 
 python do_package_prepend() {
     make_alts = d.getVar("USE_ALTERNATIVES_FOR", True) or ""
@@ -111,6 +112,10 @@ do_configure () {
 	done
 }
 
+do_compile_append_class-target() {
+	chrpath -d ${B}/binutils/elfedit
+	chrpath -d ${B}/binutils/readelf
+}
 do_install () {
 	autotools_do_install
 
-- 
2.7.1


