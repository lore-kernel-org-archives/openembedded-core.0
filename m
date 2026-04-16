Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9582F8E488
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28276.1776378806385555214
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=h3VufN32;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso621815e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378804; x=1776983604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x20e9wxeDlAXdEuZpXs2g/DEGuOIR/2HUSKnMHglAo=;
        b=h3VufN32ce9GFx0h0CMfXydc9hi5Hzk1OmGEo9pbsMKCcSCNBXIxXP8PCGQPDOtk9K
         W1QEmQZX/qZvbcfJ4jqJFrLx0YeIyQE+bH3RqSd8tZqlTGJrYy0lFuy18u4576YqTUHt
         h8zCnNP1B/pJ/LZ+WmZmzXQFwEPvMcbfi8vik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378804; x=1776983604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8x20e9wxeDlAXdEuZpXs2g/DEGuOIR/2HUSKnMHglAo=;
        b=fhVWtY8mTQFtafmdWriWxmERe0RqzSYAa4zwDW1uCsswbmHIZEvg9ly1CgWo3l6Hhc
         AChFmAjxjA/dLxzW3mk+TzXbp3FptxdW0j8iFNpc8ZQqjqvwhEyjOpa5RGyn1yBK0p9X
         YXhjgkCcDls8j2Co3SUeFSgXvdwvegzdwIgx5rejAC/A9dOpyjbtDMMbN8q09ooUB2iu
         QWXy5fJdMVNpN8Y+AoNf7IXnr/o9oy6lkZkNZmk9zGpIhbAv85WVMqq5QOAYhU+DkC6I
         lsxW2W5E+PXjGNjBaqB6g/93eIUaoml8JPeHryF7KHGbQAKC7wjVxl4n6ze0mZ6DdYSf
         +wzA==
X-Gm-Message-State: AOJu0YxbvdkZLQlFEAq8KJPyPOdroHboGWQJl5/RnAEi4Wk7ZdFgsTfH
	J1rHfGkRBn0CtaoukcHMB8Rm/YxXm887Rcixs0j3N6Qjc80BPWIg6szru8pY4quu17001zSLj5q
	rwQno7hAe8kZW
X-Gm-Gg: AeBDiesGj0puGiLVTp1bHc6tZWkIoqGsEHiC0khpiWrihTjCJGn9YfdTc98gnssES2D
	qro6CX1JKIC3AvjC0gvCRgYF8hDsTVZvpVdLrnP0haadBmQNEPaRW4AVjSe+bw2Y5XfjIHkAn1D
	jvAS39jpjtFdltUlWoFa3ljpv3y8LdLFaX8e4iBnUJqKA+CdSkeNsXnn1inFogJDtgIhCaI7A9H
	QO61GI+LNDK5rA4RbzY+BkejsEqW8DbjYX6JkYhkv8cp7dZMGWdJuiIDyh+rTAfgisuUdsHJMUR
	wufsC2E+WOFF1gYawEYG9pkmuJupjv/sZ0/lCzqM6X5lhFWleYH9F9Na6w9vhdsjoyqAGbcI1At
	tV6xP5u54VnA1bw7fnMCSw2ucNQbf5b0CAdSlHGRShfgyrKuzHUom2i7JEC5eqOQX0g0iJ46VSx
	EiM4YPNXgIO3xqGNJ4vEeU3P/e4xjOxNX+XCGuH41OjIkFyAR4vEzV555uv5iU1/wQ+GfublllI
	1BXxd2EPeKcM1Do1rAQ7qImDQdT52tvFhi38g==
X-Received: by 2002:a05:600c:8909:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-488fb78a385mr3876775e9.31.1776378804502;
        Thu, 16 Apr 2026 15:33:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 39/51] selftest/gdbserver: replace shutil.unpack_archive with tarfile extract
Date: Fri, 17 Apr 2026 00:30:22 +0200
Message-ID: <2a9d7bc66aafb111413331f5c510935b14a86c9b.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235468

From: Alexander Kanavin <alex@linutronix.de>

This is a followup to
https://lists.openembedded.org/g/openembedded-core/message/233609
as the same issue happened in a different selftest.

[YOCTO #16195]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7468e70c238b056acbe06ef722b62b02626db8f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/gdbserver.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 1c713331900..fe1fa6dac1f 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -7,6 +7,7 @@ import os
 import time
 import tempfile
 import shutil
+import tarfile
 import concurrent.futures
 
 from oeqa.selftest.case import OESelftestTestCase
@@ -41,7 +42,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
             shutil.unpack_archive(filename, debugfs)
             filename = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.tar.bz2" % bb_vars['IMAGE_LINK_NAME'])
-            shutil.unpack_archive(filename, debugfs)
+            with tarfile.open(filename) as tar:
+                tar.extract("./bin/kmod", path=debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
                 status, output = qemu.run_serial("kmod --help")

