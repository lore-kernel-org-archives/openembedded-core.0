Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3E54160CD5
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:12 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id q39so3109315pjc.0
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QQL9jLnn6v0Nj+oD0UHIYXG0OdhRni113JYVsHQCjEE=;
	b=M8DqrYsu6F3ADmNKeoQvCH5RyGXzjeM9WvuRtrLSf7YtQM2he/BKLW8Hk/giv52+wC
	/gt3w3Hdkj3FHV8K0MmD5DL8aDTg7WQrDL5DQ+PauCkf16Nw/lJKiMIhw5rfg/vYwBQZ
	GOuh9LOwNlPxihvDMN5ectl6gA9OGQg8zjDPtTEiMMnbUTnsFh1Ygv6AuB2HucEaOUkC
	UKzblwDhcU9qe1y2oeLotRnty6QkUMAXYPTMbPFI2h28WUUbOfYFmgm08sjTD++LelvJ
	VTcEXRFS3lf/MDxcJ1quDPuCskL2hVNH6VbJJzYzjBtB8CtJvtQNJN0mv3rtvTgNm6eE
	9zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QQL9jLnn6v0Nj+oD0UHIYXG0OdhRni113JYVsHQCjEE=;
	b=bwSWy2wZiYpdNu5mFu4WOW5tNAnoH+2/voS7GZArtJOkKZ0DXeNA9Ck927SXz4707d
	VQdrZlQB1mQuYVqIQ0cM3zHcgf1NgZEHiCOw480yuHRiYRCz5R5YeTlQyQ8dy7c4MzMg
	qvXXnj/t8fkIvS05EMgmGuGt5T7tumUEx3K0eHPi1DvcWocXix2Tc0H5LLmsCMKlT6UK
	Sr/u05nC2lCaERh6o9BkUaDinq+96ZeZaKHG6sc+JzHwet+PtGZOexDyX7j5WB2aNcu+
	C9Qi6YAPzzjGbnuJJ7z22iRdoD4bkmTjYVnuWZY4K+O3Pt9LRfbIVpafgwKqnljC1zz0
	1tcw==
X-Gm-Message-State: APjAAAXwBvBwQyb3pLXgsX/yjnPEg4fyCzxmxqW+F8MBoGc3Vrln32iF
	hyVlwFB1sUdnQ1VDm3+daSoWqQGO
X-Google-Smtp-Source: APXvYqy8vRUuENXFYLtipBKaleVK4qOZItqpRodZ/aXEmGWjRG/Zqy8O3a7uiPor1LhDAE0Cv+FPAw==
X-Received: by 2002:a17:90a:868b:: with SMTP id
	p11mr15942605pjn.60.1581264613325; 
	Sun, 09 Feb 2020 08:10:13 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.12
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:40 -0800
Message-Id: <f81704b6759f7827b1bd2adfb1e8896d93b85087.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 12/29] libxshmfence: Set shm directory deterministically
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Without setting this it will vary depending on which directories are present
on the host.

[YOCTO #13778]

(From OE-Core rev: 6217c3a7201b34888aa2fbae8b6e490bea545574)

(From OE-Core rev: 10357b0bf3f6b34b54c0329e7e392ecf2c7043cd)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 85a48e4c58..cc45696530 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
 
 DEPENDS += "virtual/libx11"
 
+EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
+
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
-- 
2.17.1


