Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A94C54F4D
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 06:42:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25491.1785134524455826603
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 23:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FLJ9yWPg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so10835885e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 23:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785134523; x=1785739323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NpYXclyLX5JM7kviyu1HjsTpqBn3hRskMA7PS9CRsVg=;
        b=FLJ9yWPg9Q7f+Ci4kiTPLbIZdSHv7KpM2NZfteowkmfHrTIoiC6l5PpaPH7JBY1FC7
         5xOoivF453d0a9SyhsIIqXizLRrkxGNayGjvE/tUddyqehGmLHdF4HeJLdMXl98rjiXd
         0byIL8ge4TviIpH2l+nFTuacSWdmvXFA+9jso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785134523; x=1785739323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NpYXclyLX5JM7kviyu1HjsTpqBn3hRskMA7PS9CRsVg=;
        b=qbFHgdkSRDMCeKs1uhTPDsv3XWMBHkZBLwRQYl0uJFBQyvFoZgiXTk4fcMQ2RL5nia
         afyM9u2n9udXv4P0JZQEx8JBP/N1F/iqhPUXz95BVgV91qWUkf0zzehMihBHVEhxGRwJ
         yDZHyMZUbDWYOtDKrDSQS9SPzRtofN+FrQnYQkCjPvJlKoU2//BgR90suyP9r61jElJe
         ORiBJ7zHc8+qasxdmunBgre7Q1WRN6JAdogkLZLO16cXa1uqBLmODaR1wMsrJhNzfQ3/
         TnYI2pX4eqww1KAWgdo5B3R4Dn2C6qmazYts0dRenyKHU4wacXuzNX0vPPDobWyjTqC+
         92zQ==
X-Gm-Message-State: AOJu0YwyUiYYixz4c0lOa9r6zR+ZbKhYTwxEyqe0D/ptVhsP9U0HYc1n
	DDADPOKumbzkrHKNhbB9UtQVLfgO4p+PtR7NyW3IZjrrDOiS+pbLqQYwGg5FPwCsvkIMFNAWbrG
	ObNCt7VA=
X-Gm-Gg: AR+sD10YxTQFRvKibrQq9LWoumtWQyjvGASS3IvpjjO1zWcpOieqq1Or3rrDSWIAA+Q
	jE/30yyblR+CvB5q1eZthkx2n6DtImR6fAR3jGfW2gAP1+u+uUzVko3NOdeC5AyQ0+z/K4REb0y
	fsmPkLoXYWk6S6gHIV+/qWhctii5nfluEDkCAQt9Aum1GzFqG0K/UPzfr6MtfUuDjYGsqBhBVg5
	W/uP1fBVoJ+5CXeHQlPRvHBuO6cT1VBcPNfMRdWZT2+inQLFeQMAEYcXEsdtywKOtf6TZ97QhGk
	t+VSrRZPORqG9SMudhJKV1XsH+zsHwVm42RXXr3x3+HjkxNAwLgPf/GCZoeDkNmQibmWfblc0/m
	LDeQwVYOltSYSaYfwgDwpaCux6B8GlLSfNQI9D+ou/iaYlxmiaHwFWLmOCe2w27qNqjCLUQ7xPW
	Re1vzSUy/iUlv8aqR7NJcELPgablWxjg==
X-Received: by 2002:a05:600d:6451:20b0:495:5f00:9497 with SMTP id 5b1f17b1804b1-496b571a081mr63982175e9.18.1785134522647;
        Sun, 26 Jul 2026 23:42:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3a01:52d:1da2:a363])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4866813sm229103255e9.8.2026.07.26.23.42.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 23:42:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] python3-cython: upgrade 3.2.8 -> 3.2.9
Date: Mon, 27 Jul 2026 07:41:51 +0100
Message-ID: <20260727064158.3784068-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
References: <20260727064158.3784068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 06:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242040

3.2.9 (2026-07-23)
==================

Bugs fixed
----------

* Indexing into freshly created lists with an out-of-bounds index could crash.
  (Github issue :issue:`7793`)

* Function arguments with default values could end up uninitialised in closures, leading to crashes.
  Patch by Anthony Donlon.  (Github issue :issue:`7782`)

* ``bytearray.append(None)`` could crash. The optimised code was also lacking concurrency guards.
  (Github issue :issue:`7796`)

* Some rare corner cases when concatenating text strings were resolved.
  (Github issue :issue:`7799`)

* Assignments of builtin string types to typedefs of `object` could erroneously be rejected.
  (Github issue :issue:`7789`)

* Subscripting ``type`` failed with a ``TypeError``.
  (Github issue :issue:`5563`)

* Manually disabling ``CYTHON_VECTORCALL`` in CPython could lead to invalid C code.
  Patch by Florent Gallaire.  (Github issue :issue:`7807`)

* Some internal Limited API version checks for Py3.12 were corrected.
  (Github issue :issue:`7845`)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-cython_3.2.8.bb => python3-cython_3.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.2.8.bb => python3-cython_3.2.9.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.2.8.bb b/meta/recipes-devtools/python/python3-cython_3.2.9.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.2.8.bb
rename to meta/recipes-devtools/python/python3-cython_3.2.9.bb
index e899fc411f8..3457a914901 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.8.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.9.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "f4f23a56b25221a06f91817fe8f3114ab8b48a4fac73187dbb64bc2c4a87961f"
+SRC_URI[sha256sum] = "d249c9022ab13286b17bd66f30609e800c5f95efeecb06168990c7a66cecde6c"
 
 inherit pypi setuptools3 cython
 

