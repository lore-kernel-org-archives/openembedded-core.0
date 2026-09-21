Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67620C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 13:57:24 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49598.1789999037723552638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 06:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YqGHg1/Q;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so1859102f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789999036; x=1790603836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMPnfT3bsFja7kliLbTH2xJd8HDPp3EDtOe7pN8sYbk=;
        b=YqGHg1/QntZPqvWk0FfXL6L81mfek2h2ArxIThB58ZrrOIk3l1Wa7Ls5YjLn19B1vG
         NvrjBMZsv37Xaj6GapWw1Q1pChc6eB08BQ5RT61ng+M0UvYOaEUAU9YRNQN5iTW+1BiL
         6mWQckfsXFGWSXXFOSs94kcDVxiS6Ok3lwOwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999036; x=1790603836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMPnfT3bsFja7kliLbTH2xJd8HDPp3EDtOe7pN8sYbk=;
        b=OCn78VGkI8stGTEWg0OTX5ni3qdg59HECOKYS8jVbkO/kjxYtN1u+ULS81Q6YxUVoD
         5fMlrult/Il+qnnUjBgqUv4U4i1SfGXDbiYwcvs2ebiTmcqpmQwF+hl5Q7/8wxPMpnUl
         xUbZ3TRE2fJhGyRfG2CDBMN60RXtagQAADUoO0xt7Y47myy9OiqTg8ARON9yUNUDocNE
         dYalfAOdhXHUswYSMmTR3SyJsiKoSMO3FYZgfZAopclaphkoEoP9vapRdXdzIPHsxf4d
         QPGwvNlrbfMB2B1YtAJNHe5v+m44oQdMtGXD2rpNcKRfYXaCUNV8ar41Fmlv6fKOYWLK
         VibQ==
X-Gm-Message-State: AFuF++nSlWknG8ObeE4EOO+jBuT9Nqvuz8tS/tmZg6qNjTWobzMPmcb+
	vav90gaJ43SYkqIwfdbqzumDgw8aurR4qAJNZr3wGqJsxAbv+sY2sVKmjR3hrQlfu8qG94KHZJy
	vSregsVo=
X-Gm-Gg: AYBFou3nOYQP/U8KB8pGiHsohNdqRWgDbUdLt3VTjDyXyZBQj+HVNXToosb+U08CfiA
	zVjWuFed/U1rz51nvVT6D2/gWunxSaPemyB++tnwQrP0BI01F16xqMeLAWN0CIUWSHUMm5HgERM
	T5dPMmpWRMQkgaVz7kamc4gMmAYqd8fHf6BmhUoGuVQfbHjM3ppywsd6TlbjxL9f4KdicW3PAsH
	ID7s8gIX7Qjb2bgQ24IZYORRAYV4aBudfUs4J+96VH4SVypOl5Dm0h8HIHvdLOFTocLxGdkQo5Q
	O/ed3FaAklP34I1sLT5J+fGYN039uV8KWIc/vAzSwi9bhUFO0jwI0+4pKYdB9I4gprMEmrUYiAP
	LwqX9P1wjqVQCSYpAk5+FC9MD9hYx03KfI1/ZqoQx206dcpGsrq7u52dI+2RFhI/94ibuVIhCMZ
	HHg+57vwgbeCHaeXhKjXve0oBmDwVYes9wkhA+DiLI/LDIQEDRTH4qUxWzNaWkBLETunOAv6he/
	UJdYR4I/vB20sVaPbV03FIejXpWeHkdgVa26rCmtNWWtacv5euPCcWOQwgsNghLRdCxhGNvNLR4
	pc1bRg==
X-Received: by 2002:a05:6000:186a:b0:486:f9d7:59a0 with SMTP id ffacd0b85a97d-4871e363f25mr15309181f8f.45.1789999035764;
        Mon, 21 Sep 2026 06:57:15 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244608e7sm24385788f8f.6.2026.09.21.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:57:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH] python3: skip ptest incompatible with ptest-runner >= 2.5.0
Date: Mon, 21 Sep 2026 15:56:55 +0200
Message-ID: <20260921135655.1776407-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246333

From: Yoann Congal <yoann.congal@smile.fr>

With ptest-runner >= 2.5.0, ptests run with PYTHONUNBUFFERED="1" envvar
to unbuffer the python output (to fix AB-INT timeout issues).
A python3 test, "test_cmd_line.test_non_interactive_output_buffering",
expects buffered output and fails on unbuffered output, skip it.
See https://github.com/python/cpython/issues/128377.

Note: upstream fix also skip it on PYTHONUNBUFFERED!=0:
https://github.com/python/cpython/commit/30268b5d2fbb1a5e6c876f0cdc4cbdb5d93315e6

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3_3.12.14.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.12.14.bb b/meta/recipes-devtools/python/python3_3.12.14.bb
index 7ee32601cd3..d7f6d2dc32e 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.14.bb
@@ -260,6 +260,12 @@ SKIPPED_TESTS = " \
     --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
 "
 
+# With ptest-runner >= 2.5.0, ptests run with PYTHONUNBUFFERED="1" envvar.
+# test_cmd_line.test_non_interactive_output_buffering expects buffered ouput,
+# skip it.
+# See: https://github.com/python/cpython/issues/128377
+SKIPPED_TESTS += "-x test_cmd_line.test_non_interactive_output_buffering"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \

