Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25872CD6E65
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5852.1780337578055961253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ppJtS67a;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69d7f4cc61aso4050523eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337577; x=1780942377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmqjCByYRPAqGLWzhrN61HnucWvjpK8WSQvdzFzD9ys=;
        b=ppJtS67a94MP26ostG1e2oKBn4wncCl7w3hm1pxDhU/1ZwAsoPqCHnOie/GePvJdNU
         uuVzjVrB/oNH4hs9kxRYQz91EVhqlag6rMvsrwus+NiIIXcan5rEqMqwy/ffYnAt8vhx
         dbB64V5RktfG06EXtVRCCrdglvRKNTTt8yVXcJf+ure0jv1mfpKvrJImawk3llSQGd+p
         vKML73zzzrsJpMU1iX6c21GOr8V62bT635Ldtee1gRQXWp8dJ0vi5KoD3qv6qUapaXw4
         p3o69s+aYQbPlFqzDrvcWvQmcQxz3cGOFhmLkLSRQeNosZzOU8bXVv7X9sUaF9RTJ80n
         cJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337577; x=1780942377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SmqjCByYRPAqGLWzhrN61HnucWvjpK8WSQvdzFzD9ys=;
        b=rgxD2l+sxRZnY8IQTVJMHnuRQ/uGY9JhSV4FNc2qCHaKN9yhF14YNmMc/eAXeAnzUH
         LqU9aLgDDkqinhoAqQiG91jQIBIE/LyySQ/tizPqEyc7zPWMgwJGGi+Y7xwwa8OxhFcN
         qIHG7m389RgyXsDfGtesCiswZtpexA1oa8xeIiqaahjzTVKxigs0yCCrjaFQ5YcNqCJC
         MxFWaoXLwnlC6GVXhWIyfAWCLlOkgv8mt5bTFd9hWH2gLshcQ+tbGz5qlirbi4t3jQtn
         mBHbRwxCDNYloROiAnxNyhsi08KucpfX4FKzRoW9N8ASxdUCdvv0w43arWagQWu39UlN
         JY5Q==
X-Gm-Message-State: AOJu0YyJkrvvafjtdjA4+3g9vd4RgAPf2EjRjziPHb+sLxEvm3h5SxRQ
	/dIrJ2qepngwuZt5N9peWzP2t/i/iqofkcN2xC8FZGUlwGkr8oRldLmjuU2n8A==
X-Gm-Gg: Acq92OFzD8oadxSJDyQSrrTvThEwDgFm5/4yxMObQaaQxucDyJR+f/o20lotLrVqL01
	oYQOXx2wWuWPa3RUnFRkpydj+necsOTUZSIMHYCBP75tMM9N2wXlXIDj/85VN4kSvU8UjUx9nN/
	CIfyJkVSJPlUMS5Vw6ehYH3/K3WGUE3XRxfBmhdRx6186hcC1Zbf4LGAVc2tAlBmhPqUWv3Llt3
	rWVyPgaEeWWNi9olqsW/vl1KgfharYjQfwcwXnPTn7sq5qu/BjzCxt5UCw60S0D5GB/XQM/8rrR
	lnQIMLihrMuRVrMs6NOWFGnZZ+q8rGgfcy6Yy4JoQgD9C2G8Igl5WJpzsmygfcbalwe22236wJq
	53Z9CIyUjExbpBXXM3TPYxVVRoruUxqaqQxT+kD3Xq1djrwFIbEkBDOAf5w5z2Gmw3Cact15DP/
	Rq0euEmMtTz8gLAZ6MVfwaDb7b4JDCQXs=
X-Received: by 2002:a05:6820:168f:b0:69d:8222:5953 with SMTP id 006d021491bc7-69e1061c79amr6341157eaf.60.1780337577321;
        Mon, 01 Jun 2026 11:12:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:56 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 4/8] python3-pyelftools: Update license to Unlicense
Date: Mon,  1 Jun 2026 12:11:39 -0600
Message-ID: <20260601181251.123019-5-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237979

The license used is actually the Unlicense (which is a variant of public
domain), so update license field to reflect this.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 447c8ad6af..7e50cef248 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -1,7 +1,7 @@
 SUMMARY = "pyelftools is a pure-Python library for parsing and analyzing ELF files and DWARF debugging information"
 HOMEPAGE = "https://github.com/eliben/pyelftools"
 SECTION = "devel/python"
-LICENSE = "PD"
+LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
 SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
-- 
2.54.0


