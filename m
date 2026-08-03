Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236E0C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:04:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38408.1785744255024418669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OISI0wL6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so18010485e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 01:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785744253; x=1786349053; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k79oL+NAcR5PsXn11Qb95nPn1kmbvEVb0tw7Z6W7M+s=;
        b=OISI0wL63wwDFWJVfmBKpFd89eNonwvUgltEPubSqT6E1Bh2xTwcgbkrbGZIMELxnj
         WGqeigxbZWChKtrFAYV8z8wTLLewGFRKNzYi3Kgkqvm6AQx1sy0lw4bBB2YFWbixuk4f
         qjQdYm5KaStRuaXHRswkZ58p/6aUQQKexDP3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785744253; x=1786349053;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k79oL+NAcR5PsXn11Qb95nPn1kmbvEVb0tw7Z6W7M+s=;
        b=jzG4EQTR1zwSQ6d+fwqggTZSNyGiFymD0puUrtymHJo9iceUblfjxOZJ0GfWC0weEu
         Kn8m1VgAF8oHfgGwprmtFRKzQMBOELsffiOLKqapnOdwpK8IghFbeQ+exW89QX+T/JeB
         5r9xBG4V7cjPQmmg2S5dg6wkzs6PTD0cH7nxKhaxDnDADMDLhRGVHxAuS3Vj5cd6dyXo
         k4Cw6gmOQ4ag9aoasFzR1qxMZs9uSoYToBpPX4+cOcgijSzfhwT3fBowxXBUQQ60RDTv
         zAFhhUEWwV9mfkKhfRctlZYP8bdGKOSGWzDNtnCmMBebA89yXOQNaLAwRvsQ8slk2QF0
         aP1Q==
X-Gm-Message-State: AOJu0YzBr1kj0CDXJd7qvvcbDcKzDaek2cz6spT+N93VkoLTkKtcKE6I
	LPDvFqA5tiTQ31d5trRRx9DZIwxk/i+ysV2LNLkSYl5hcQ2JFsEtdw2hRg4C9YQokEp7Egn72P/
	Fsp0Vj0g=
X-Gm-Gg: AR+sD1197A85X7W9fXWeZSTXkOQL1pu0bvAw8haqLqyRF9RVcpTikRGWg2XbdawXO5W
	7Racp5p27UcLnJ6NczzN/KE18+bTMzSrQO5S6CD5PCheHlzJ66zto5zSoaDp0iZmO5QueWZF3Bt
	Rd7eC1AVenxbQSVtEqathxHUWX/jAD05gY9o/SCz1lona7xpKvucoQkLYUr1u959WMze1DoRHqZ
	XB3JQZiN+avo8F0XGeVJdFukYGYIplKk/YP3ocbE7cwtjfrnC85GrxOcjPqVWydRqM+IWM4UYC6
	HF40f8+oS8QiX4BHibJ8x0Whcs6f67fLkrlqnqYmss1xDa7uuZgU1xuF3VETocVnXjm1DK7E5Hi
	IBVpWj9ldIEnOKPHerQ0h6/uReSoKuNm/hw2zD4gGD0HfPUjvFQ2UtaWHrUE99VoHuX6pNVoIA7
	gTzcVrgug+ez9nNGDHV8Fu13Wpr+NMniN4QmtXawiqgCxIvOpOuXxCibC7ya5hfJYShYLTVhEdL
	CUEo0NeR7jXeTmAFw==
X-Received: by 2002:a05:600c:8711:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-4980c652515mr238571395e9.11.1785744252137;
        Mon, 03 Aug 2026 01:04:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b84fb2sm124108185e9.1.2026.08.03.01.04.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 01:04:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mpg123: upgrade 1.33.6 -> 1.33.7
Date: Mon,  3 Aug 2026 09:04:10 +0100
Message-ID: <20260803080410.717636-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 08:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242615

1.33.7
------
- mpg123:
-- Fix heap buffer overflows in unicode path conversion on Windows (bug 388,
   thanks to Alejandro Ramos).
-- Fix information disclosure of uninitialied memory for --auth-file without
   line endings. (bug 390, thanks to Alejandro Ramos)
-- Fix out-of-bounds read/write when combining --continue --random --listentry <n>
   where n is larger than the playlist size. (bug 391, thanks to Alejandro Ramos)
-- Fix a harmless valgrind memory leak report by not nulling playlist name.
-- Fix error handling of win32_net_writestring() (Windows only) by actually using
   a signed type, also preventing a OOB read on failure.
   (bug 392 by Alejandro Ramos)
-- Fix a mostly harmless OOB read of 1 byte when printing USLT lyrics.
   (bug 392)
-- Fix leaking file descriptor on read error from --equalizer file. (bug 392)
-- Hardening of loading HTTP(S) via curl or wget against funky URLs by including
   the -- separator. No actual vulnerability, tough, just extra care. (bug 392)
- out123:
-- Fix heap overrun on --endian conversion with differing input and output
   channel counts. (bug 391)
-- Fix parsing of filter specs with whitespace before commas, which resulted
   in out-of-bounds writes before. (bug 391)
- libmpg123, mpg123: Harden memory realloc calls against multiplication overflow
  of size_t in arguments. Specifically, this addresses part of bug 389 with possible
  application abuse of mpg123_set_index64(). (bug 389 by Alejandro Ramos)
- libmpg123:
-- Fix possible use of uninitialized values in layer III dequantization.
   III_dequantize_sample() for consistent output also for strange input. The new
   code seems to be slightly faster after some rearrangements.
   (thanks to He Huang, Swinburne University of Technology (discovered using
   NexusSan))
-- Fix a double free when deleting a handle after failed mpg123_decoder() call
   (possibly among others). (bug 389)
-- More strong wording in API that ID3 text convenience links are short-lived,
   but safeguard against ignorant use by nulling them early.
   (bug 389)
-- Prevent double free in mpg123_set_index() 32 bit wrapper being called with
   index size 0. (bug 392)
-- Harden against an application wielding a foot gun by handing in an undersized
   decoding buffer betwee seek and read (return error before trying to decode
   and discard frames in that case). (bug 392)
-- Do properly terminate ID3v2 texts coming in UTF16 encoding when they overwrite
   previous frames, like with other encodings. The symptom was a shorter second
   frame resulting in a combined text with the earlier longer frame.
   (bug 392)
-- Check and properly handle null source buffer and zero size in mpg123_store_utf8()
   instead of reading past (before) buffers. (bug 392)
-- Ensure clients get ID3v1 data with (unmotivated) mpg123_id3_raw()
   only if the parser decided that it is there, not possibly the last 128 bytes of
   a seekable stream without ID3v1 tag. (bug 392)
-- Prevent impossible NtoM resampling with too low target rate (like 1 Hz) which
   would trgger endless looping. (bug 392)
- libout123:
-- Fix deadlock in buffer mode when combined with (stereo) 24 bit output. Now
   also mpg123 --buffer 4096 -e s24 shall actuallly work. Sorry. (bug 392)
-- Abort early on zero/negative rate and channel count in out123_start().
   (bug 392)
-- Fix divide by zero in WAV writing by catching channel counts that go zero in the
   16 bit WAV header field. (bug 392)
- libsyn123:
-- Explictly reject mismatched format for appending filters with
   syn123_setup_filter(), preventing memory errors from that API-violating use.
   (bug 392)
-- Harden the dirty resampling interpolator against extreme rates (around 1e18 Hz)
   by fixing a sample offset check to not do the exact overflowing addition
   that it is supposed to guard against. The fine resampler was … fine. (bug 392)
-- Error out on trying to create a filter of order 0 instead of dividing by zero
   later. (bug 392)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mpg123/{mpg123_1.33.6.bb => mpg123_1.33.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.6.bb => mpg123_1.33.7.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
index 7fa048c9fc3..002c4f1cc64 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.6.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.7.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "929a7c18ba662b8927aed4de229ad9ae8ab2b4806dd0f30b90113eb1b4e2195a"
+SRC_URI[sha256sum] = "31d0e35a4ca567ec9b5ebda6c3062bb4435d6d3eacd6ef0d95cadd7854dc03ee"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 

