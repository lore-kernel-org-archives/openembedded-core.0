Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D157C52D6D
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:09:52 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.30105.1722791389249906443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RNAVTaRP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso7675954b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791388; x=1723396188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fF/5i4Eqp9IwB3eLg6KFqe0Ni0czaNQYox8VOr9AgFE=;
        b=RNAVTaRP3l6fs4EmXgdBCatGKJZTI+BDA996rxk+i8ATJenyU39R3ShyTRfnepALRm
         azQZg8gMQc/96XTz3UQYLaMbSCYGGCeMxXfGqZZ2yb6lFbY92cjwevx6Dxep3HBVSpYc
         lg3Ip4RAsC+5GnkZsIJ9NDA/Gt0sUP+Zavrgg4j+IRPrXBJB5S7uSqEcenUXfkazI2aY
         H+L/vWQi6JyNa44uA5qH8B0mgRDjHtpuquNs6eyJ1E5GBQqgsPOse18sqKe9DgxKwtok
         ln5/BeL/H0W6CZ+4yXUYoX69/XrKNyd/sO3iLN1F3p0rqwBtm0Hi0IBl73smvy1uNFdQ
         mQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791388; x=1723396188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fF/5i4Eqp9IwB3eLg6KFqe0Ni0czaNQYox8VOr9AgFE=;
        b=pDeoGp4aY9rL9x0tVXPDeKuQAgZZnX86z8FUpcIaoLtyrL87/uq66WlFa6Vh1fLwfR
         ndEcOFgngd7GnzEuRb/tWIis8wO/QCL595TetDbypMbo1zPaFqPy42FXnLyVhDl6CZr0
         n/2of77gjZx8N6zNgUN98z4ksCEWZyorJB2V4Ul4jo6qT6IKT04EzXkdm4GJvvgz05Qh
         dTYnFvyM+aB6sF07CsUGK9mM5m2tr4QsdwWgBQMfic0mcHUHKD0AkZzVDb3mNyAPrCVS
         g8E3G4TxtivyfakaQYVsWgDpXS4pDUwoTXiKK/OpLz2KXY3/GpFZ9itTflF4+ZpP2HwX
         OUiA==
X-Gm-Message-State: AOJu0YwkPoWF9llTOCR5p3IQrByqp5fzu5Rm/8nP3SWzVDGhJkqLBG2P
	CAAFnN7nyOtOO/jQ88UgT7ADLP7en4EtUzzrL2Pi8DLwwnIPngoxYGj28BOoPOuUPoyc2I+gaFO
	2GjfqLQ==
X-Google-Smtp-Source: AGHT+IEmJfHvl8wNqpanM+0cQZRbX9ta9cg5IR5iuwHMg45Ee1qalj64Oub6K18GQZ0FoE8Gb4RCXw==
X-Received: by 2002:a05:6a00:a16:b0:70d:87e0:9e7 with SMTP id d2e1a72fcca58-7106d0843cemr9031383b3a.25.1722791388559;
        Sun, 04 Aug 2024 10:09:48 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec269d2sm4293225b3a.17.2024.08.04.10.09.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:09:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/18] rt-tests: rt_bmark.py: fix TypeError
Date: Sun,  4 Aug 2024 10:09:19 -0700
Message-Id: <9563027c35a4b1961a83100e22d4ea4430abd8b9.1722790925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722790925.git.steve@sakoman.com>
References: <cover.1722790925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202975

From: Changqing Li <changqing.li@windriver.com>

Fix following error:
  File "/usr/lib64/rt-tests/ptest/./rt_bmark.py", line 287, in run_cyclictest_once
    m = rex.search(line)
        ^^^^^^^^^^^^^^^^
TypeError: cannot use a string pattern on a bytes-like object

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5108da4009ccd3dfc92632171d6bc4dae4507db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 2a4eed412f..5d22623656 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -284,7 +284,7 @@ def run_cyclictest_once():
         avg_cnt = 0
 
         for line in res.splitlines():
-                m = rex.search(line)
+                m = rex.search(line.decode('utf-8'))
                 if m is not None:
                         minlist.append(int(m.group(2)))
                         maxlist.append(int(m.group(4)))
-- 
2.34.1


