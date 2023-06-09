Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076BCC8300C
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.171.1686329690611500543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=JCedzkd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-652699e72f7so1708964b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329690; x=1688921690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jjf8hFaSIOS/6f+NCfCnPBnBT6rsc7NP/NxAy2q/bk=;
        b=JCedzkd2Yfq7liszwqAERUwaop01KW1l9f4/3fGJSb6iIeZY+b1q+R/QD75ylCW+oH
         WR2wsm3I+Qf8v3q4dyQ+g4+Px739OAPnS8PEkNPxx3AKOTlYsJ5kvU6HXdXrntYjahbp
         q0UmFo98jX9cNCsMmrzWxXBsx09ZZu4sLHciFvVTKdKO4f2snxRQAARCZipYzkseuKhj
         e54JQiPfbSQOy+sCApvQ2eBxvAH5HXwFJu2/AQRFFRRsNhJraSC0BvGnXwoYDdJCOYzh
         BFgDs6eWTWOCfA7E79kJez0hx56ze9VcaF1lyu4HZNLyczun/r/uVJdR8u5s4gfNFJMw
         /xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329690; x=1688921690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jjf8hFaSIOS/6f+NCfCnPBnBT6rsc7NP/NxAy2q/bk=;
        b=KbV523YGoUZjpHpp+9iA0d93hWpdUqXSlm7KQRHFFxEIHZvggVbh0yHdYwhauA4CG6
         4uFKzUmrCbA+7B3WxmBlQ5IdrbCXyi+KRLFgVbJdWMakfFBrL/K6OISoumSjORXzrc2n
         2dGALIm/TDctITUmYMHZOSW1j7EdwYC+E292ZsPLGVNhZnigSi+HGUIya7Qvr7NN1Y8K
         6VXs+XA72wALLx4tQXekM3j7ys+SCvs2/LElvvY6qkGapyq3P9QZr4a9C4fJQIo+TJJs
         4XXYL3jtgSU55frH6LZvOT4188n/x7LFCvEPSgKuWP8E7f/LNDtdyAKMCQW5cGcdUzrF
         HjVw==
X-Gm-Message-State: AC+VfDzVRqO43wSuw/Ozz2eR2vAAw7SYYH0G6UfufotavfE1NMTt0sSw
	esOhQJye9JFyCDOvs2ohhDu+l7qNlxTOpyWOqGU=
X-Google-Smtp-Source: ACHHUZ7iLBtBJfCecydRdcrdujdv45Wo/R0LWOcZ7I5qw0u1pNG4tAtBBl+YIUOul0OAk3rMqB8tHA==
X-Received: by 2002:a05:6a21:797:b0:119:10a3:d79d with SMTP id mg23-20020a056a21079700b0011910a3d79dmr1376660pzb.14.1686329689643;
        Fri, 09 Jun 2023 09:54:49 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 28/30] selftest/reproducible: Allow native/cross reuse in test
Date: Fri,  9 Jun 2023 06:53:55 -1000
Message-Id: <ea3d21235633dc5b01c6ce39e768d00d1da5d87a.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182594

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't compare reproducibility of the native/cross components, only the
target ones. With the long build times of rust-native, the test now takes
crazy lengths of time so this tweak should allow us to reuse native/cross
artefacts from sstate whilst still testing the target output is
reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b494d83c639a877cefeb7cbab6d37195e492f059)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index cd7aa8aafa..1f0ed32fa0 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -151,7 +151,7 @@ class ReproducibleTests(OESelftestTestCase):
 
     def setUpLocal(self):
         super().setUpLocal()
-        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS']
+        needed_vars = ['TOPDIR', 'TARGET_PREFIX', 'BB_NUMBER_THREADS', 'BB_HASHSERVE']
         bb_vars = get_bb_vars(needed_vars)
         for v in needed_vars:
             setattr(self, v.lower(), bb_vars[v])
@@ -225,7 +225,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRRORS = ""
+                SSTATE_MIRRORS = "file://.*/.*-native.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH file://.*/.*-cross.*  http://sstate.yoctoproject.org/all/PATH;downloadfilename=PATH"
                 ''')
 
         self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
-- 
2.34.1


