Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DF9C3DA41
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.26474.1688656037561510634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e5MUSd7g;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso539170b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656036; x=1691248036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xlfUt5NtSgMJtBjUU4hzIrSwwsYVP6tV4OWzSgnNVV0=;
        b=e5MUSd7gddh/z/tszEk4wgaCW4xy1ltQ1Zb1bEU2kWawLKndv3YHmsHBmdYirswYP7
         VkfSeWEj2/eld4mtTrHFYh+zcHD00uV0wR4JyZodcJcEIlepOzNYjvhv0lGColB+C/DG
         qdAGvJCAW9bHZGDfljD8zkpRz6J3z4m3aCwWPgWYok+TVd2v2kcQ8DQ1s4u4TKzqTOG2
         XJpZg7inFjGUtdUJ6bq1V2CUuN+0Emp5H3oDwJuOuaLpFR9j5KqXdDoZzQEq/tBB4tLo
         md88eIiPB3vudQ5L7w8MeIrazsBj2SIDc0imbxqVfLHTBhMR2DNRF9XR4IjYbcObT4pd
         yJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656036; x=1691248036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlfUt5NtSgMJtBjUU4hzIrSwwsYVP6tV4OWzSgnNVV0=;
        b=Yi5W1Vl+69c4WCEucu8STTDJk2O9S3jrmt6hotqDwrBWz3oXajqpKGNt8cHQDYfjuH
         KE0Np/Gzr2A6DojdMGoINwDebPeGPcvA+H5M6WUL8QjnB/hmVxcWUxZvjN7gKQzzG5le
         gpWUoBW5tpw85an0a76FvHtAdfagXnOuzpnkFr+R3uUIM+MHbHaQpsjK4Zn9VaNBMQ1b
         nfrxP0dIWWMi8+4XHgThldqSJW3KHqaJyq0cLCy5r2amDJulNZxRGk12MzLy5zTZpMo9
         6RBMnBQ/X/q+5srSALAYxmk1xSgNonCPQFWxsfG3QCrqR7Nr8ux8wqR1V0DsPTSQ881Y
         7h9g==
X-Gm-Message-State: ABy/qLYG9ZTxuoGSSYmSjug0t8EG3yWKdr7rMXJxRqUqWVXEaWxiLKuR
	QOfgDpOdqfznMfwF1kx4EkjlflIYxlK5pLW1jSA=
X-Google-Smtp-Source: APBJJlGtOLvzSCqjNigzp9gcX3VtU1r47fWNSjpnCs2ZG5fKVqRWg1sAb/sJLjC/ivxNQSEIJZD06g==
X-Received: by 2002:a05:6a20:3d90:b0:126:9f02:da6f with SMTP id s16-20020a056a203d9000b001269f02da6fmr1798878pzi.14.1688656036615;
        Thu, 06 Jul 2023 08:07:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/28] oeqa/selftest/bbtests: add non-existent prefile/postfile tests
Date: Thu,  6 Jul 2023 05:06:21 -1000
Message-Id: <ef732d6dd735ad06c229eb4e2a4aca295490ec53.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183971

From: Fabien Mahot <fabien.mahot@smile.fr>

Fixes [YOCTO #10725]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0c33655fad5b2e7d96a45b6210527dfb766797b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index b42bbb651d..d91c8ea82b 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -188,6 +188,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     def test_prefile(self):
+        # Test when the prefile does not exist
+        result = runCmd('bitbake -r conf/prefile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified prefile didn't exist: %s" % result.output)
+        # Test when the prefile exists
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
@@ -198,6 +202,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertIn('localconf', result.output)
 
     def test_postfile(self):
+        # Test when the postfile does not exist
+        result = runCmd('bitbake -R conf/postfile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified postfile didn't exist: %s" % result.output)
+        # Test when the postfile exists
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
-- 
2.34.1


