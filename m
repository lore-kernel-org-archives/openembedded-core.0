Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1D6C3DA6B
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.51548.1661624806510236878
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bFwF8cp+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id x23so4355607pll.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=4ZhH6rZ5uF2K36uLqKHEHB44Si8fEcVJW5VtrrSAoZY=;
        b=bFwF8cp+0B+ARt/wfzCsB9xSs+6juZQryUY3ozzX23KR7qRGrG7nPSWvWjl5FD1n2o
         FvKNLYaPuu/KHuvxFIJyB8rLxkhza5Mym6R+2dkCOviQqFoMVixpy5a4bdYWEA2S+emZ
         iCa+b6SF8h2q1VRJY0wzbVTIX1DAFRS/NaNGLhK6mkmxIC5isAoy71ejbv5NG6XXps3G
         rwpCUqN4t/c6zKWZdBYlnuUtFaQ0IoSS+bs6wah5/uJnVdNTRjGtLmRhkqq8/xNbDP1a
         BKuLH2+4TV6RX3hImm80GmkZ6iZf9ul+VHq/vB/s4BHCrej1Pj9ijAZwCttryhWa9rKA
         rXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=4ZhH6rZ5uF2K36uLqKHEHB44Si8fEcVJW5VtrrSAoZY=;
        b=Wj8ncZ/XWm66uX0dg1PNpiumnAkvF09M2tzQEvt8dqJEJTlzIQA/VAvxuHtmltUlaT
         zey8sbG7QrO7QyKD9N2pPFwXom3NQOzzDdSDFnGekvamoR/qw7Wbpt+VjqBQ0AfefksU
         Px4KHYoso5tHzvFMO9XQxhivFusYi++iFKLGFfR8ka9achs+PelUCuzkrzEgDNyNSwcl
         JMESZ8StexKntCaLS7VFQeInNpiAyRthx0txoR+Uh68UJN5Bm5Vcl8quxNWvGyJa+/kI
         wcusLj/28ppYevj1rjxQpAMO13haAdCxQ0sP6L3E6EqMh0Xzy9fpJMGnkbNJ7pTAVw5u
         K4ug==
X-Gm-Message-State: ACgBeo0tg+/2LZFLEMikJLxHaavO0ZadXqHibqfNWNRVgCf23ky7MVXv
	O9mhmIRTEXwq7c3UjBE4lNW3aSa9Gke+v7hE
X-Google-Smtp-Source: 
 AA6agR5VptLlT+EqqM6CRdntgz0WB7hkJVsbWssRI0NNOeKKh5wHm/2D0wSLQmtX5DnYKWRzH+nDXA==
X-Received: by 2002:a17:90b:35c5:b0:1fd:9087:6a70 with SMTP id
 nb5-20020a17090b35c500b001fd90876a70mr3424418pjb.158.1661624805601;
        Sat, 27 Aug 2022 11:26:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/24] oeqa/gotoolchain: put writable files in
 the Go module cache
Date: Sat, 27 Aug 2022 08:25:44 -1000
Message-Id: 
 <28c3586bce441bc0e202886c4f3a19dffe07bee8.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169961

From: Ross Burton <ross.burton@arm.com>

By default 'go mod' creates read-only files, but that just complicates
things.  Add -modcacherw to make the cache read/write, so it can be
cleaned up without needing to chmod.

(From OE-Core rev: 7ff30e0d9fe8527cbc2f8ca84e0300fdc84663b6)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index c809d7c9b1..345f533379 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -43,12 +43,6 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
 
     @classmethod
     def tearDownClass(cls):
-        # Go creates file which are readonly
-        for dirpath, dirnames, filenames in os.walk(cls.tmpdir_SDKQA):
-            for filename in filenames + dirnames:
-                f = os.path.join(dirpath, filename)
-                if not os.path.islink(f):
-                    os.chmod(f, 0o775)
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
         super(oeGoToolchainSelfTest, cls).tearDownClass()
 
@@ -56,6 +50,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         cmd = "cd %s/src/%s/%s; " % (self.go_path, proj, name)
         cmd = cmd + ". %s; " % self.env_SDK
         cmd = cmd + "export GOPATH=%s; " % self.go_path
+        cmd = cmd + "export GOFLAGS=-modcacherw; "
         cmd = cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
 
-- 
2.25.1


