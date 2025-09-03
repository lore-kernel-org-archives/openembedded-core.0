Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46C7CA1007
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 03:03:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.3621.1756868606652827283
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 20:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AdQ1P2D4;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-327f87275d4so4762450a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756868606; x=1757473406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+xac7fJgiCoZhOSeY4ff6FqxK8MfkMtYNUR/8vTcgDw=;
        b=AdQ1P2D4LsDvDQLl0tcJM8r/c6f8t5XWmCeQacygSJRSE+NO6qdpIItQYV+Mr69kip
         57H63UJaJwtrsckqiXSmTaieI9zyzyD8nV0oZDpeonY4HXi+5KsH8UodDEWgiebdpIoi
         tBZLS7/lrtapNWr0Ok4oPXyywk4DaoLSJ1Y5S/9K16OHp7mHDM31KdOMOwEwzyadG2Qo
         ECP5kSjwNuuxOFPUwLWnJquhrTqMTD9lBuQDc8/dqK24NnXOvIthOBLDJ35OrsINub4J
         GUJs0oMVAbL2uGk77TiTdoXf6xwovcc9EC9k4QqW4PxkUb1oKWzQspFZrCCy1G6COrii
         HH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756868606; x=1757473406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xac7fJgiCoZhOSeY4ff6FqxK8MfkMtYNUR/8vTcgDw=;
        b=ndk2bMV6jd+OA3AOvgPRdsT960XUVwOvsqkWbW9yLmtmYFp8imqMJp6H2WGpOAP2zG
         SOtR82rZtwyLjNQhwJLK/4+GmW84hfbLQYWnb0hkvZGpmWnyIN7euX7IVBnc9NBysxN0
         6tCfrFIODICRJbTyCjYIGtenF4P/Khb+E59Hxr9/tZyTn+bvR/PLeq/LEQkmaTLyH7Dx
         tgKR/bWlJhhHanIsco7lh3aRU75d/mqLPOZujdBEs0tG5GVpXhBw0C5YiOk6nICvfOve
         YrJLeGM3LLpDuX62vzdz8ytzeQuRv9EZSt4HNXdNACIqdCZlb9JjceWPkGnvOKAjoAo6
         rg3Q==
X-Gm-Message-State: AOJu0Yy51HCvltONpU7nJoNagiQM0kjYJLzgjjwIp9G0o2qkT5/Vvq+/
	fVieUhVL78uVj//r5kz8l2Qsv7fypfbxIEnATbgkm0XLI1GaKMOOkaLEXJHvnVN1
X-Gm-Gg: ASbGnctQQi2juglaph6bNxzAXtDfDQAA40tKOODu+pPP0MlrQJUOAY/F5SJxLITy1L1
	Vt8WH9elIpJIrIywz/0pGzyQdCgTfO+DhIxd/h1nZasmoV9alPw+smE4EGkn/i2x0tRsdRQ3qi1
	z+Rbo9wFfuBIyXThMnM4vpXnl7Ctj6ckfAFcYRjdyKK5/Etw9pye/SMH2fuXjTMol4LiKTb8mS/
	+/Ug8oByLJ6IW1qWvzMAxht3DdzZN+3AGP/xUJQ6jsIQ8qeF2oXlIXX+bl8OAXaC3KKG7IM0Vvy
	KpqFAsJgKE8teSebIFNAoMKflTWA7DzwWZvhgkFgHVdqAPF5Z7F1GrWlRuVZKFJxAN1SBUDy8oj
	y1PMu3r5GsEpgM5VJkV0CqPLcM4+MXiOX6l025W33Q46Z+0RIGx+uHMp5gBtS7Q5eF1NCdXwi09
	rQFqTdIoCRKxUgSGnTDfvcJeYqzrkMP0m9iKzqTakJaaDcJwTnz0Q=
X-Google-Smtp-Source: AGHT+IG4cTY9Zg8tpKMSHuluZlhuA1OhSPvjIRwDzd+koIeo5ebMZAVHeQMsUGCHTlD+1Qm1Kk1nIQ==
X-Received: by 2002:a17:90b:52ce:b0:327:8c05:f8b6 with SMTP id 98e67ed59e1d1-328156df7b8mr16376595a91.28.1756868605658;
        Tue, 02 Sep 2025 20:03:25 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327976b5074sm8993845a91.4.2025.09.02.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 20:03:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] python3-lxml: upgrading to 6.0.1
Date: Tue,  2 Sep 2025 20:03:21 -0700
Message-ID: <20250903030323.3669364-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 03:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222837

Bugs fixed

LP#2116333: lxml.sax._getNsTag() could fail with an exception on malformed input.

GH#467: Some test adaptations were made for libxml2 2.15. Patch by Nick Wellnhofer.

LP2119510, GH#473: A Python compatibility test was fixed for Python 3.14+. Patch by Lumír Balhar.

GH#471: Wheels for “riscv64” on recent Python versions were added. Patch by ffgan.

GH#469: The wheel build no longer requires the wheel package unconditionally. Patch by Miro Hrončok.

Binary wheels use the library version libxml2 2.14.5.

Windows binary wheels continue to use a security patched library version libxml2 2.11.9.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-lxml_6.0.0.bb => python3-lxml_6.0.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.0.0.bb => python3-lxml_6.0.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.0.bb b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_6.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_6.0.1.bb
index 56f5664c9b2..5d76641675c 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.1.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "032e65120339d44cdc3efc326c9f660f5f7205f3a535c1fdbf898b29ea01fb72"
+SRC_URI[sha256sum] = "2b3a882ebf27dd026df3801a87cf49ff791336e0f94b0fad195db77e01240690"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

