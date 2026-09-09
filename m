Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0252C79F8C
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:10:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6760.1788941425432636865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iLw5+INl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4859245e493so2999791f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788941424; x=1789546224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W7VZapwcr2cRoApj/daR8cBRhCX9H1bOufrtQX/4k7I=;
        b=iLw5+INll32qartptr0ctKwGhTnt2fafdoEvIznO9Rfm/FYCLuK5TjE5czcW40hPoZ
         isJy7qagCbT/9XfIxztYnTQVXw/Kam+sbm1uS6ZMzQmKPF/n5CxgkKTHMQy6NDF2Bcd+
         /ImkcgAgmYfRwNreKGBwr2v7dQ3sBwdqXWlCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941424; x=1789546224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W7VZapwcr2cRoApj/daR8cBRhCX9H1bOufrtQX/4k7I=;
        b=fdOPzwYq5vA389SeCk7Wx0kaHssUqJ6f3gefL1ozrs+dpRnq6ZyTpz24HJK87Fd3+h
         QVpWQHUoxF15/zOgpYbmh7kt77GV+uocg/e5bwkXCEJYVYBrmER8J5fd4ZH+hSQOlGEy
         P5Hu6KN8xzbXWEn+1Ul9NloivMY4E5GlpOxugOBZIhB2xvY9IAoxWY6V2DZsKjDVdu39
         N6mkcP64lz7dI09XlP9mMsVDY8jAjzC82ztkPPF5AWjxJW3EBVeW0QisxKVA4OY1uG1f
         HKR1rBW+HVffbYEuElc3D+ok7duEwgLmxjI+ih0f3hHL1CXU2B4QYF45Q5JwFALcHwa9
         RE9A==
X-Gm-Message-State: AFuF++nxdrDysysVuSdCCgZ+IJ4PRNrXVT7+LrRZTuE23KsLMdrVlca0
	NblpkdlL8wdrrfD4shXm6fWLgxK8ENJMimaFdrs68AGIN/PkezFa+Yvv9eE96YYhLgMsWU6BJed
	3fTSBNjs=
X-Gm-Gg: AYBFou2lFNIsX48VfgGEiKVXAGfYzG1Kkq6dfousp+Uo6JcJdn7Lkk8dgIEQgrBdp23
	lx3pRvMG9lzFT541hvIVPI4g9rWMFX8EGFF2cOs/zlZCJz8GCXytZtTpepqk1Py3z3YN0ObN2zs
	bpZtrysLk73DIaOp/5brBKRsDdxBprIL3K4jh8UL9MpfBf6CwTfPIEhcFzMeFBDfsojYFG1l9dJ
	MQfd+/P5V8hMxQoWXBvolQv6QSBvyEMFKmg00KCbrI2Er8yEMd4J6IYxDnOu4Hk/f9xvb1d9MDs
	rAc3RskatA7G2lr+e9m4PFg6+7sQBQIGFpQDxnB0JOMyeNz004YE+0HB57a65+skjFiKMxzYZSO
	N/6p7DLCtgHDZw7FbIEX4ynGaLF4IFFR6fFDsqET78S823FQgO5QW4HaZ6l/5QGqZ2q2O8mMqO+
	FoUbVAmkcUyDNp9mho5tk+gIsLdd5PgkrrUc9DxXBTa0fB0S23Q0i1w+hMOolGraPJMjRKw6pEM
	UnVob9AVALD7dBFZ0+uTcUxtJX+
X-Received: by 2002:a05:6000:41d8:b0:485:8a47:5b96 with SMTP id ffacd0b85a97d-4858a475cc1mr31745275f8f.51.1788941423629;
        Wed, 09 Sep 2026 01:10:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9d9a:c76e:7178:6165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40855548f8f.16.2026.09.09.01.10.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:10:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-numpy: upgrade 2.5.2 -> 2.5.3
Date: Wed,  9 Sep 2026 09:10:20 +0100
Message-ID: <20260909081020.2238149-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909081020.2238149-1-richard.purdie@linuxfoundation.org>
References: <20260909081020.2238149-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 08:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245452

The NumPy 2.5.3 is a patch release that fixes bugs discovered after the 2.5.2
release. Apart from the usual bug and maintenance work, there are a number of
StringDType related fixes for problems discovered during the ongoing string
work in the main branch.

This release supports Python versions 3.12-3.15

Changes
=======

* Casting a fixed-width byte string array (``np.bytes_``) to ``StringDType``
  now raises ``TypeError`` when the bytes are not valid UTF-8. Previously the
  invalid bytes were stored as-is and later caused undefined behavior in
  string operations.

  (`gh-32296 <https://github.com/numpy/numpy/pull/32296>`__)

* ``MaskedArray._fill_value`` would become stale when ufuncs that change dtype
  left the result holding a fill_value typed for the old dtype. The mismatch
  was silent until something later called ``_check_fill_value``, such as
  ``.view()``, and then a ``TypeError`` would be raised.  Now, when the copied
  fill_value is no longer valid for the new dtype, fall back to the
  default fill_value for that dtype instead of propagating the stale value.
  This may raise a ``ComplexWarning`` if the fill_value is complex and the
  new dtype is real.

  (`gh-32423 <https://github.com/numpy/numpy/pull/32423>`__)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-numpy_2.5.2.bb => python3-numpy_2.5.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.2.bb => python3-numpy_2.5.3.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.3.bb
index 44062046810..c88b0bf1a29 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
@@ -10,7 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "d482d171c406ae88c5b19cad3b6a1c4c5209f886ab74bc44c2c865c23f52d860"
+SRC_URI[sha256sum] = "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6a6c17489a67563"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

