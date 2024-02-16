Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92382C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 10:45:59 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.15960.1708080354728085164
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 02:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RdVVwL1x;
 spf=pass (domain: linaro.org, ip: 209.85.208.45, mailfrom: andre.draszik@linaro.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563bb51c36eso1715587a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 02:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708080353; x=1708685153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wsLo3dgt5lyvRok9n21PiLK3zgqf1D2IjXxZidvD0Bg=;
        b=RdVVwL1xCdDiih+uOvWUPaTOovDrd5GnFZWTWPPwprWfU9kHdrI8/5FS2EjMndQemR
         b5yGRQLC1n399fdmx+9pAZGWgKiQSq4cH5zjj+VNlncGDCgTECrhyrDdUrSMac20jdpK
         7nUt5OkqbMQ7aby+/Rr9JDO/0kHe+JSCPOAtutRkBSAUq8CQPtBdzAOBkvhou0r4fpfL
         FUJlmueCY66SwpJHwjW2aq6ndiEbJ3+sEl+DAD+ccrTzHl/37zzvZKCBbQKkvOcu90JS
         TpfUihKTuiszj8VZoVYRSHh5tPyRBfqtBgdPUzqtd5ZabQzx71ElIp3i7Yr+Izf0KYhi
         eSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708080353; x=1708685153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wsLo3dgt5lyvRok9n21PiLK3zgqf1D2IjXxZidvD0Bg=;
        b=L4oONkz2d4nkrTIFkn9CqmnDPjSA7Q2omcSYuO4WxBq4AbSGpPK/MCjOmLkUim8bej
         OTIN3PToI06tj0poztW36eGDf7w5pmr+MfwJzq5LRnbrtDxjpc4oh1bitPd6HIpXV6jx
         Bno6tahRRiKfyazonlW2HDUrrK0LUqoVV/ZHdmpn5XYiLuEsnHVTB+PMxIPZu8q4bEli
         4jgjKtokYpyKTRIjBvvbclnwSSFhiyxT3yPmTqfj+GyDfMTns7Ohnxk8bV/JqKCFlGYB
         lM3Jbx1wIC0JU7HY/jbPVeT/qqsHvhoasxgGjoeszq3RDzETT9TEFCX9tq9j5g2+P7a6
         Vf6g==
X-Gm-Message-State: AOJu0YwfeUjwUXUJ2g+ckL7cyRasgnx78y8h8u1PYA8QChwzyxBL1gsi
	Aha9fxqvbGIWnSy29c59pPAsNt1qx+Kg2n9jkwnOaU4CwNtw4Il1/UsWf+yyRObmAZoAPbYCXQq
	e2tM=
X-Google-Smtp-Source: AGHT+IH2qJodpM8qRbaqQzXh0czHLlQUT8yiseG9YSs6s/uGqwFWV+Wp67WyFz1iCi9cmOME/2YeRQ==
X-Received: by 2002:a05:6402:120c:b0:560:e4d8:ccca with SMTP id c12-20020a056402120c00b00560e4d8cccamr3739030edw.28.1708080352969;
        Fri, 16 Feb 2024 02:45:52 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id ij9-20020a056402158900b005621bdbfdb0sm1369267edb.75.2024.02.16.02.45.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 02:45:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] sstate-cache-management: fix regex for 'sigdata' stamp files
Date: Fri, 16 Feb 2024 10:45:51 +0000
Message-ID: <20240216104551.2122943-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 10:45:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195744

Given file names like
    6.4.do_fetch.sigdata.821b6c62f9f2bd8b7e1378656b8319697a21f6f6e4a351f98dc325a18ef7ed0f,
I'm pretty sure we want to match the dot here, not any character.

Fixes: 2fa1b25d7485 ("sstate-cache-management: Rewrite in python") in oe-core
Fixes: b723fcaac52f ("sstate-cache-management: Rewrite in python") in poky
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 scripts/sstate-cache-management.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/sstate-cache-management.py b/scripts/sstate-cache-management.py
index 09b7aa2aefd8..d3f600bd28f6 100755
--- a/scripts/sstate-cache-management.py
+++ b/scripts/sstate-cache-management.py
@@ -147,7 +147,7 @@ def remove_by_stamps(args, paths):
     for stamps_dir in args.stamps_dir:
         stamps_path = Path(stamps_dir)
         assert stamps_path.is_dir()
-        re_sigdata = re.compile(r"do_.*.sigdata\.([^.]*)")
+        re_sigdata = re.compile(r"do_.*\.sigdata\.([^.]*)")
         all_sums |= set(
             [
                 re_sigdata.search(x.parts[-1]).group(1)
-- 
2.44.0.rc0.258.g7320e95886-goog


