Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD912F8E486
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28275.1776378805367387653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ui4b5P3N;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so543745e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378803; x=1776983603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFm7VjounM+gu7O7oiKUuw+UTStgcv5QPDvogYmbpV4=;
        b=Ui4b5P3NlrLSZFp1H77qr9F++XTwODQZCrpi2I4Fh4/p76NIbdWGsELuDNU1TnMfcY
         p3ri0bnsekqe4jBeEMqn/b8kuh9cHn21I45sMPvkIG0FQuE9ObyTyaKVYXQTgsR9WIEL
         RJb94vJZKkUMFcbOavs8nHKDwCe4C0FLJk+AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378803; x=1776983603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFm7VjounM+gu7O7oiKUuw+UTStgcv5QPDvogYmbpV4=;
        b=bqcLdUUv6YX4Xr7sDpG6JsP+5ChVkw8Ki8MqNDY9HfqHYIG9zhqEOdU2AYr8CXKXSA
         K3wNrLPjmZIDVe8JmjI3ZY1Jj/U43yonK4kCbRUR/dv6h/do/4e272Nwk9YKNFQS6zrh
         Q49boW96TvMoqD2Sbj+pPrS67Jlm/HA5UW9L6TOlB1lZTo91c5KA97UxtpVhbSzxz5YG
         Prsppx+Wr6vxF6kV3NeHLTMwawXmmfXfEu2f+UlByxYTGBcEOVmmV9zxfH4BHoktTPZ0
         jmC4U9LDcW4UQ5V5ZNDy8BDoQDsDX5U3JGtHgOVBw0SoZ0jnldBY5hrr47iJoOPifqb8
         N1FQ==
X-Gm-Message-State: AOJu0YyCS8WTpHb0Z+qBKeeWwN3Qq7c6nuzWmKfWJ/qOFCkjWCuAC/BN
	7RYvgQYpl+qbWadvMYSEk6b7jnCAFW/UlMFArwsAhLXiGgH9Z4l+oc++CDRwUdXO/tJroa8aKsp
	UXHwsO5uTLg==
X-Gm-Gg: AeBDievAYQKtToLEkK9fwQ3pJVTGzi1kdd+c4RH5TinSF+vMImGd2MJUKNhlEh7kVU0
	ybnfEIiGotSL13Tl+MGfL9VHDbz/xuAlx4IppJEkddh4kzTMBkrEr8Vflc6E2bPh1Dwg1Zsb79I
	OaemFMZRFSsKtonuz987MvcDt41wu8V5xNRerru5WWNMqKOE/jzEJEtDky2qSHvRoZ3QlGR3OOa
	IJ2vSKCaE5w09eYXzXeE9Sve3kkD/2pi9+fWXCW1KmUJkCfKFVY8dWPm79tUHv4qa9BUKy0VLuZ
	X/vDxHZilZ8GnYaZSkanZ+/9EsaCmWvVzhGSVNRXCX6bmm1Jll6qEocP2JyoQzDdabFPZaMIPb+
	x1iTAK9DwW97FCG4z9SSmmYgoqju0lHMAlYxonipVky+C/Byg1llMx/oJtoU8fSit9tgWYisZhw
	H8BgI9WpfMxpZ180vHt/6fyzlRblKc11Cn0tGQnMb0qgobqlOhv0baye2WIUQaisYu+cpWklH4f
	x9jKxRoILhtiWTupg7lB24Ub7GnEwYg55NM00PzSz9acVH7
X-Received: by 2002:a05:600c:8b6b:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-488fb8859ddmr3392145e9.2.1776378803568;
        Thu, 16 Apr 2026 15:33:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 38/51] selftest/minidebuginfo: extract files from tar archive using tarfile module
Date: Fri, 17 Apr 2026 00:30:21 +0200
Message-ID: <99d513c47f2feeffe442ac9344a13350f65a1cc8.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235467

From: Alexander Kanavin <alex@linutronix.de>

Python 3.14 added security checks around archive extraction, and by
default will refuse to handle symlinks with absolute paths. It's possible
to handle this using 'filter' argument, but it is not always available
in older Python versions on various host distributions we need to support,
so let's extract only the needed files directly using tarfile module.

busybox is itself a symlink to busybox.nosuid, so both are extracted.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d52d00a3bb4a1ba93e88f1d24d8bb99d6aa321eb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/minidebuginfo.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/minidebuginfo.py b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
index a8923460f90..5f37522c325 100644
--- a/meta/lib/oeqa/selftest/cases/minidebuginfo.py
+++ b/meta/lib/oeqa/selftest/cases/minidebuginfo.py
@@ -6,7 +6,7 @@
 import os
 import subprocess
 import tempfile
-import shutil
+import tarfile
 
 from oeqa.core.decorator import OETestTag
 from oeqa.selftest.case import OESelftestTestCase
@@ -33,7 +33,10 @@ IMAGE_FSTYPES = "tar.bz2"
         # ".gnu_debugdata" which stores minidebuginfo.
         with tempfile.TemporaryDirectory(prefix = "unpackfs-") as unpackedfs:
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "{}.tar.bz2".format(bb_vars['IMAGE_LINK_NAME']))
-            shutil.unpack_archive(filename, unpackedfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/busybox", path=unpackedfs)
+                tar.extract("./bin/busybox.nosuid", path=unpackedfs)
+                tar.extract("./lib/libc.so.6", path=unpackedfs)
 
             r = runCmd([bb_vars['READELF'], "-W", "-S", os.path.join(unpackedfs, "bin", "busybox")],
                     native_sysroot = native_sysroot, target_sys = target_sys)

