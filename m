Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48047CCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 07:53:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7555.1763452385678429001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 23:53:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clzWkP9e;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477632b0621so33752145e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763452384; x=1764057184; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wY+865EEoR3nm/o+BNk6nfc5MmPtCyPxr5SrXO97Yc8=;
        b=clzWkP9eW+AfFyvydfX/xm9XpAD5GLpDNLg+BXJvrbEcqPe7pFC0DfqQ8qmFKroslr
         hwWgZwWzzZs+wM/Sp1tXATWzgX3tSlGYL4ZauUi2gHnU2iuR+KtrGaxPG2erU1LovKIb
         8yd5F7SYxJLqtvcLaPqjSVI811ThxssB2FiU4ckh5i+JPMpomDHNX9cFgwDkjnolS5Ib
         n8UuItqXKR3P5RRlKlaGTYSxOx1ibbnpcMPqvMKPBaUSRRr0/gT41WNUXLiZwE5TAPY3
         7sAPlWBrnZhr70XBy2qOHG2q9JAEseLfyKzMOgB+K/3GGBJah08O0YHF7jl2Tx+HBwwt
         c3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763452384; x=1764057184;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wY+865EEoR3nm/o+BNk6nfc5MmPtCyPxr5SrXO97Yc8=;
        b=wqfNSOiKmswBcqFJ3AdmZxHVK9T2WOl7mZlm2eJqQ7Rd67VXFGZbcaX+/c2g8Wq8VS
         9ClH9SdPq0LN56sR7cAoqQvmRFD3NWBmZWZyCQqJ5MkRtcFR7rqRFvV0m5dfC4ofMupu
         RRsLcOE572R0KC2vjAAX+e9etKuGN8uOoZCV3sIK2nVjXLa9w0mAEI8/ixBk05gY05kw
         fHhLPUxaPBr/ROwzmWVlv/cHlhCWVqKq5sc+t7Y+NMBaHvjnnOSdLpS8x7xZg84KkwIO
         Yfro9rlErViSqGO7l3mrhXpITuOfdQUl0uWQjkf1n1IeyQe8H9ChJpsMnM4h5WOURZY1
         GWPA==
X-Gm-Message-State: AOJu0YzLyWEU0olW7786+d4ZS2j4aTiJ/OZ86jwCEnpgvDDzaNkdXPl1
	fFU+h8kC1oFKCg9YBffKcPW+cVoIsyyIEAXg7arZscfd8s2muJwVv0Hu
X-Gm-Gg: ASbGncvXuDbxRJCFdV/rrUAbPBCsk7vNgpG6n0gjCh04jXC2FqW6jAyXBZx0H/v8Uw+
	BUPjiqA5kV4AcApN+LshyS2MSHYn5Haii+5leI8Wdw5RA/VEwod4SND6TKi79ZHMtZTd8zWQ6Pe
	uWauwJyFevaQlvIUOO/UyZGm8shj/+egKqOKr4LvI6QVUwIsUkUWVwVRheXZpM44PY++rBD3JXp
	ny9id5drVwN0PRiKmgvK8LejwZ3fNNq/bKNwbKUt0lPNxZXqfdXU8Q+rwzryGG0SdwDD8RcDryJ
	0p3/+lQTk8DMVsEvRJkvGIhJk2rDSlJEqS8EN+ZQU+h46M49kWs5iPV9xQgIQFwk7HgdJ45Ruhx
	x8Utpmu4oTbHeUtDJid8B65j9CFIINCGjO1QHgeou/nmpR3tBQA8vvqboOZOR13Bbsl2irgdQ8Z
	6fT2o9M97ORTkTKz8QPYbzTenZQ87Y44eRdNwDmHF12qfxnmhaWp3HBVj5T6kQsBn+sqzhX1H9k
	oiUiVBRV+U=
X-Google-Smtp-Source: AGHT+IFhi0CC+dwtb/kaETjeeBB0YiC27q2UdZdtdCUjvKk+UFIly/qwEhTgJg3Ay/lKtmOGkWYaEA==
X-Received: by 2002:a05:600c:4685:b0:477:8b77:1575 with SMTP id 5b1f17b1804b1-4778fe5dcbfmr135211545e9.12.1763452383848;
        Mon, 17 Nov 2025 23:53:03 -0800 (PST)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a7cb24dfsm70541905e9.14.2025.11.17.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:53:03 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 18 Nov 2025 07:52:53 +0000
Subject: [PATCH] scdoc: Upgrade 1.11.3 -> 1.11.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-master-v1-1-72d7ec661c89@gmail.com>
X-B4-Tracking: v=1; b=H4sIANQlHGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0ML3dzE4pLUIl1LUwMLc6NU80SjREsloOKCotS0zAqwQdGxtbUA1a5
 82lgAAAA=
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.13.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 07:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226511

Drop backport of 3667cce Makefile: drop -static

Changes from 1.11.3:

  Drew DeVault (4):
      Makefile: drop -static
      parse_preamble: remove useless branch
      utf8_size: fix bug with array length
      Update version to 1.11.4

  Jason Lenz (2):
      Fix unclosed indent at EOF
      Fix make check permissions mask

  Kirill Chibisov (1):
      Emit \(ti and \(ha instead of ~ and ^

  Nico Wagner (1):
      Makefile: remove unnecessary path separator

  Sertonix (1):
      gmtime: handle failure

  Viacheslav Kruglov (1):
      Fix logical error in comparison with ULONG_MAX

  elij (1):
      strip indentation after a hard line break `++`

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../scdoc/scdoc/0001-Makefile-drop-static.patch    | 23 ----------------------
 .../scdoc/{scdoc_1.11.3.bb => scdoc_1.11.4.bb}     |  5 ++---
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch b/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
deleted file mode 100644
index 631d06375b..0000000000
--- a/meta/recipes-extended/scdoc/scdoc/0001-Makefile-drop-static.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 3667cced504bc40b176d4570d99a83fe67599f3a Mon Sep 17 00:00:00 2001
-From: Drew DeVault <sir@cmpwn.com>
-Date: Wed, 4 Sep 2024 10:07:46 +0200
-Subject: [PATCH] Makefile: drop -static
-
-Upstream-Status: Backport [https://git.sr.ht/~sircmpwn/scdoc/commit/3667cced504bc40b176d4570d99a83fe67599f3a]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 96ad48cd04a6..49f076aadd39 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,7 +1,6 @@
- VERSION=1.11.3
- CFLAGS?=-g
- MAINFLAGS:=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
--LDFLAGS+=-static
- INCLUDE+=-Iinclude
- PREFIX?=/usr/local
- BINDIR?=$(PREFIX)/bin
diff --git a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
similarity index 82%
rename from meta/recipes-extended/scdoc/scdoc_1.11.3.bb
rename to meta/recipes-extended/scdoc/scdoc_1.11.4.bb
index 5f571c64dd..059150df46 100644
--- a/meta/recipes-extended/scdoc/scdoc_1.11.3.bb
+++ b/meta/recipes-extended/scdoc/scdoc_1.11.4.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=31752b4a8edd3fb9ddba1cb90fada74d"
 
 DEPENDS = "scdoc-native"
 
-SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master \
-           file://0001-Makefile-drop-static.patch "
-SRCREV = "0528bcb993cac6c412acd3ae2e09539e994c0a59"
+SRC_URI = "git://git.sr.ht/~sircmpwn/scdoc;protocol=https;branch=master"
+SRCREV = "70de0e5e5d3bc40134ee65c35f1631656199f4be"
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install

---
base-commit: e7dc42e30c76bf0fbb4d3cc019bbec675bac55fa
change-id: 20251118-master-950872e7a2a9

Best regards,
-- 
Alex Kiernan <alex.kiernan@gmail.com>


