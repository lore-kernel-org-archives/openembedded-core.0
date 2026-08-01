Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5876AC55181
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4417.1785586499692549705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:14:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N4VF0BNt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so3674755e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586498; x=1786191298; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rIcKvwwarClI3fExOzzOxdzFrpp2dQV2RLn9lIdOOg=;
        b=N4VF0BNtKaL8sRPg/oPKHgtDFzwCw5jHA3iB013OU/X6t80fcfUUGWwGQwr2q6Ty5B
         f+GCqTs/s5Zmku6N/yvAeNPF87w4eLjXi7TfbZW9l1Q/3KbO6iki7V4VDwsjZdyppGpO
         F0FvyBX9sBfGD98flBqsbyEcsvOEA6HC1ZYns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586498; x=1786191298;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rIcKvwwarClI3fExOzzOxdzFrpp2dQV2RLn9lIdOOg=;
        b=n1mBXqLOnn6FLGPqP7Qs+qbd2N1WE7b0cOiwYX2BgAAcS8RnI0iMYPMmyxtK+sRF6e
         cxKXP3kQ8WKekBuTpmZOwHB7RTCgGcTfZ0s/bRbMC/6No1uiH2/jPE54ojqgoU11rfEb
         +LhGqKL4J5+mkxfXpk5ktjX2L6Ch0TFaBEYPzRD5MHHRE4nm2A2q2lh+/d4oScJCvt0q
         ubrWn4lyXdsmT3xZ0wcdBPUstW4jhMxo/emhlMG5o+WR9XAEhSOYjSK/ZdH+lqetYyEb
         8vZKqQTubEG/QVvYoGt7AownFuSr7tZexMCVA4BTFsn1z5hJlBKVY4D4hLCcUqHZVB/N
         cggw==
X-Gm-Message-State: AOJu0YyP2chYmMYF7Xp7QKdmbq2oMcfTUFD8d4Eh4YCLcd8ApL+NXANm
	cV2LAOJI4iAqLjrpdgwEscjiSjJnca+3UpURllq1AandTrmPSd61UnRbQXTRbNcyydmy0CN3TzC
	xaw+vnO0=
X-Gm-Gg: AR+sD12dJClMy+HE278sOemWLW5x4lIV0ij/E1h63xMpdaQn+u8E4Fat2VN+g5VOAWF
	0dfcbyNQFqeTXiMnPWmjHjcQpNK6XaF5KBQbQ7CFv/1l1ssoOjUkEZORXt6AuMQGaC4G06buhdZ
	EVA4lD30p5VSZ7s2zAZwIDyKRYD4MxXueCzMXnNffm3J+6u4Z43jL2WtvYhkMYQnKAJ2usPF1yt
	Y44TYPESnjCw5EEbjT1P/4MTii1WpDFZ2eraUqpVO8rAuVizglayA4SIZTBrIMs8xK5gWp0TId3
	hKhacOlWcLolU/OpAmL3JBzd1lROUybsMcNmKLhhWcN0kiD0BmK999NdtM4Y2zONkSRMKXC4Fjf
	Wy1zTAmxnEMpPkbrAVqxQeBgj4d5UGVXiRvXg5Re9kkJ6ITU6LPHGrSg5zNZrVMp5XQXxWBlTqo
	vg9hB1cwCeptglGiS5d1DWuiEP/2CFPzUqQ3F/LMg1wXQPEZA/hJfVg/cjASwyEdvuACbH8XUg0
	RFqAy01DiI8ZahdPBCGqjO6XSk+
X-Received: by 2002:a05:600c:4795:b0:495:5d5b:7533 with SMTP id 5b1f17b1804b1-4980c65b84bmr25299505e9.13.1785586497878;
        Sat, 01 Aug 2026 05:14:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.14.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:14:57 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] harfbuzz: upgrade 14.2.1 -> 14.3.0
Date: Sat,  1 Aug 2026 13:14:50 +0100
Message-ID: <20260801121454.2770123-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242491

Source: NEWS

Overview of changes leading to 14.3.0
Friday, July 31, 2026
=====================================
- Changes affecting shaping output:
  * Lookup order is now respected for mark positioning in the cross-direction
    (y in horizontal text, x in vertical text): marks no longer follow a
    cross-direction shift that a later lookup applies to the base. This
    improves compatibility with DirectWrite and Core Text.
  * Fix mark attachment to ligatures formed from decomposed glyphs.
  * The `calt` feature in Hangul text is now disabled only for the Jamos,
    not the whole buffer.

- Support for partially instancing version of `avar` table, as well as `CFF2`
  table.

- New fill-glyph paint operation and APIs for the common case of filling a
  glyph with a solid color.

- New API to fetch assorted raw values from the `OS/2`, `head`, and `post`
  tables.

- New experimental API to extract a font’s glyph dependency graph, that
  applications can use to compute glyph closures themselves without running the
  subsetter.

- New subset flag to convert the charset of a subsetted CID-keyed `CFF` fonts
  into identity charset, and a matching `hb-subset` option. Useful for
  embedding fonts in PDF.

- Command-line utilities now handle non-ASCII arguments correctly on Windows.

- Various instancing and subsetting fixes.

- Various fixes to the experimental `harfbuzz-vector`, `harfbuzz-raster` and
  `harfbuzz-gpu` libraries.

- Various improvements to the HarfRust integration shaper.

- Various build, CI, portability, and fuzzing fixes.

- New API:
  * OpenType:
    +HB_OT_BITS_TAG_FS_TYPE
    +HB_OT_BITS_TAG_FS_SELECTION
    +HB_OT_BITS_TAG_MAC_STYLE
    +HB_OT_BITS_TAG_IS_FIXED_PITCH
    +HB_OT_BITS_TAG_UNICODE_RANGE_1
    +HB_OT_BITS_TAG_UNICODE_RANGE_2
    +HB_OT_BITS_TAG_UNICODE_RANGE_3
    +HB_OT_BITS_TAG_UNICODE_RANGE_4
    +HB_OT_BITS_TAG_CODE_PAGE_RANGE_1
    +HB_OT_BITS_TAG_CODE_PAGE_RANGE_2
    +HB_OT_NUMBER_TAG_FONT_X_MIN
    +HB_OT_NUMBER_TAG_FONT_Y_MIN
    +HB_OT_NUMBER_TAG_FONT_X_MAX
    +HB_OT_NUMBER_TAG_FONT_Y_MAX
    +hb_ot_bits_tag_t
    +hb_ot_fetch_bits()
    +hb_ot_number_tag_t
    +hb_ot_fetch_number()

  * Paint:
    +hb_paint_fill_glyph_func_t
    +hb_paint_fill_glyph()
    +hb_paint_funcs_set_fill_glyph_func()

  * Subset library:
    +HB_SUBSET_FLAGS_CFF_IDENTITY_CHARSET

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_14.2.1.bb => harfbuzz_14.3.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.2.1.bb => harfbuzz_14.3.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
index 6b6c6a0f606..6e4e9b7b850 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.2.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a54a5d8e9380a41fbb762ce367bcbf7704792dfca0d93f1bbca86c5a57902e0e"
+SRC_URI[sha256sum] = "16070d77cfc4ba1f1e7327e83bf9b3f55898081cabdb94e56a33e04fc8874eae"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 

