Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A83DC982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2831.1790154721603854442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UgeF+LDj;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso2911075e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154720; x=1790759520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wtrnI8d8Nu6VarTVw/f516xLkysqwscMSo181+GAnlw=;
        b=UgeF+LDjnvfhdGlFnGAPfTULqelR8AyMs7Fzps9KydFugmRrrVPi611/rLeIHUc07V
         iYKicFAZtQCSqWM7Nh9kCF6yOBRniWx4G6jMXYQqB+og846ZaHWEhisdG5Xsj6fFoirH
         4vqDfVdpRx7CVaIFsvHHPHRzH4ELzhrsUpQoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154720; x=1790759520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wtrnI8d8Nu6VarTVw/f516xLkysqwscMSo181+GAnlw=;
        b=H3VhSRtmvFkBHTINVRm3Rmzr5YfbGND9UhI59VJJQqhw7gJ7l1m9KPrTD4ngebaNEb
         ie2VbdZwYrQj6SNzo/abk22BsQu9nKNOT5EQQtdVONIxnk2+lxVDfqKZnf0RwrN2+s6v
         s4XE7MQ8n5dg1FWShECkBhMHdPKxQjASzBXXXMRDUBFcgXJLmjetzzFvfGjL4NAW1+qV
         NBPKE4AlgXs68SFRPmh+q4Ll07cATE++dcd941WRKyjL15l6KEy/M8W2M8EePpwV745G
         704QEi4aRJ0PznDWAcPHIK9BXPPddxPGGVNdF1Ds5ztbJ6/IK87JxazW3TpTHbSFh1TM
         R1kg==
X-Gm-Message-State: AFuF++nIDvu4nzAziAnSPy4lFSOKvmZhlkyJIgX8FLraRy1GOp6XkfJX
	vTwhKVJeW/h70R/UZKkfxg/rZagyuTphux4fHcoWHM+sxoVwC0U3GsqyvNp8qlbzZXK/FoO1x/x
	aAs0ZrWM=
X-Gm-Gg: AYBFou3XHR0bHaF8TjYsTL8UOjjxiGnsDJ0bV1o8Yj4CwruT+78ZdwV19Edk4SlRJ/I
	SPNRv1+1B7EcphHWfM+6SHzwIkGeChPH6UyjEO+3gfPjjW7sdW9WTT03FwzBXE4nY6ASsFSy/ma
	YW9NlxqhSooO7j0wJRLoYEPh/29UyT7+quSyL0n/b3k+7tJvnBz54RLp6ZWuaOFh37faW8XvMoZ
	yM3VPi2Z8Bm75LW8X3EOzntr5Ikbj6HgXjZRe7qr+7/4oqBEfuaiJBBkntX0UkQ+NIpbGT6hXfc
	0dBpoHbgDBQ4mhTuztW1WzMIlmtgCtWkfHYEP/j8w5PEfCpzdbnc7VN9e1dVVlMopg6K5UHJAaZ
	ucVKuspMA0SCaRuxPmPx+X68STlUtynoSZEtEvtlm6uFb3hfsxz0C5cIbunPsMgbOZk1aP7v9sb
	qxIasZf65zpomENrrRivQd7bjuw3iVvPKxg2T99WLfUKZKCUtdyBhT6EpVYv4RJDT1OzkKDuU9L
	PbcS/w8e4reFuy8bHCzfmU7L7NaWIBHtG/hwYM/W+cISTmXnoelVpn/cSaWO3cakyWdfzzSJDg/
	WUZ4xCdGITDXjh8/61s=
X-Received: by 2002:a05:600c:1549:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49fdf352358mr23220625e9.35.1790154719451;
        Wed, 23 Sep 2026 02:11:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/48] python3: skip ptest incompatible with ptest-runner >= 2.5.0
Date: Wed, 23 Sep 2026 11:10:35 +0200
Message-ID: <4e337750e8031603c9678206374741e5bf035e2d.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246495

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
index 7ee32601cd3..14be125180b 100644
--- a/meta/recipes-devtools/python/python3_3.12.14.bb
+++ b/meta/recipes-devtools/python/python3_3.12.14.bb
@@ -260,6 +260,12 @@ SKIPPED_TESTS = " \
     --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
 "
 
+# With ptest-runner >= 2.5.0, ptests run with PYTHONUNBUFFERED="1" envvar.
+# test_cmd_line.test_non_interactive_output_buffering expects buffered ouput,
+# skip it.
+# See: https://github.com/python/cpython/issues/128377
+SKIPPED_TESTS += "--ignore test.test_cmd_line.CmdLineTest.test_non_interactive_output_buffering"
+
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \

