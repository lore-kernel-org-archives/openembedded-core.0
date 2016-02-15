Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2E179605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 09:47:39 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s5so53461034qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 01:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TbJ8Cfk6fBiw8FFPPnPf5ILCsM0F4BtuooBiyeqOPgM=;
	b=Js2iL16l6kMsom1gMjO0QfW9aGTWcPrKSJicNsvnFIhZJhWVsgxjcKw5PbE9ucDJZO
	lEE41/QX1xNmkni3WQYTjFvZlH2tdHhwRSQx9WSLmJVh8GYoXNM3KfPDkeREeX9Ntroe
	rrXZewWwjU2o5YDO8HbDpMTr/bveAM/Aqu5MI7S6k43QgoqvL1DEwIZ77yzw8dgYf997
	Ve/LVMahNe35m9jftJrEaYBqHtxoYN3Ts2r+njZhjrPLTu+6tK3aTJwIOHMdW6VvMdNA
	IdWLgOxUSrxZcPOltxnCA22i4Sejq4cdqrRxZCvNGK2rtG91DmCAqwwl6+zmkSsuE0c/
	zt3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TbJ8Cfk6fBiw8FFPPnPf5ILCsM0F4BtuooBiyeqOPgM=;
	b=G3C8+viUeE3KrugbGZE0UZTyr2RiqIrUpDIu1zKSOJLfNta7zIPFunbyrbSsX8oYgc
	nP5LKrAGbbyYW8F9i7gk3EOWj3JlJdRmXFe4upQksao2dGklLlVYIl6h3sOLkAiKO42M
	LyyAw8QBSB3NJsOyDYsHq2PIXQIjrQtcKINbjteThECVC+vz+vmfUbfLnk2dDyZdTag8
	InHfMWN1i9YHYmVbNbtyaw/OqAlbUQPp8G1f1BQuPMUIu7XMAGvJIum0IvAshn544KvW
	YhW7z9lJPInqoF/mRH24aFFhbuhEv67BhIQVp6nf9x7jhZGXMQPJMUUb6QmUtYGSoJLA
	9Nyg==
X-Gm-Message-State: AG10YORYXP0hQPAy5EXeantkwo7B7yBr42lDBEDdryU0T3h97z34ktlPvhQjdWgmkjD8yA==
X-Received: by 10.55.78.131 with SMTP id c125mr18988299qkb.71.1455529660509;
	Mon, 15 Feb 2016 01:47:40 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v65sm10671863qhc.46.2016.02.15.01.47.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Feb 2016 01:47:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 09:47:33 +0000
Message-Id: <1455529653-14153-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH 6/6] libunwind: Fix build on ppc
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
X-List-Received-Date: Mon, 15 Feb 2016 09:47:40 -0000

gcc driver is fixed to pass correct options to linker to do secure plt
linking when enabled. however this option --secure-plt is not supported
by gold linker which is now passed by default from gcc driver. Hence
the build fails when using gold. Therefore when we use gold then we do
not use secure plt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libunwind/libunwind.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libunwind/libunwind.inc b/meta/recipes-support/libunwind/libunwind.inc
index 068858b..f83614b 100644
--- a/meta/recipes-support/libunwind/libunwind.inc
+++ b/meta/recipes-support/libunwind/libunwind.inc
@@ -26,7 +26,7 @@ LDFLAGS_append_x86-64 = " -fuse-ld=gold"
 LDFLAGS_append_arm = " -fuse-ld=gold"
 LDFLAGS_append_aarch64 = " -fuse-ld=gold"
 
-LDFLAGS_append_powerpc = " -fuse-ld=gold"
-LDFLAGS_append_powerpc64 = " -fuse-ld=gold"
+LDFLAGS_append_powerpc = " -fuse-ld=gold -mbss-plt"
+LDFLAGS_append_powerpc64 = " -fuse-ld=gold -mbss-plt"
 
 BBCLASSEXTEND = "native"
-- 
2.7.1


