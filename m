Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D79C61D97
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 14:42:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.46667.1674657759742666645
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 06:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=b6nT4xai;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id s67so13525877pgs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 06:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lY40y7YXeEmR/vTdVWTLTY/+UpjtPXChcs4v+eOlkxg=;
        b=b6nT4xaiinPN9C3HnvZjhiwhjdkc+IlAcG3rDemaTI7Bq0MVTDYJLHrSL97kGw1L5N
         dja7SrdA/3Wxr4fABH9jlU0V8VBhhWU70EjwY7A/CLlIADKNTfEblPi0MNaLf+DslloA
         EMJNMbwqcucVXupOTS28r38sRp/gYx2yrJnjTATJYGwIT0YDd23VftqQ0spJyjlHR0AE
         gJfvCtC2XPWNNPfb/j940z81Z1CDckTLFHnA0mlfc3rDVbMdIaPf8PmF6uydEas4MnpK
         KCCN5uJTFYTAOM1Lc+4qmmQ7P1TXQcd+bF5rxp6jcimvp5KcBmriEF/81exnr13DIRAp
         Ja4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lY40y7YXeEmR/vTdVWTLTY/+UpjtPXChcs4v+eOlkxg=;
        b=TGK1jRY8WE+nldU/KR52s318lYsYefai0FV7UqQkxy9VHjdSCUqLJme26PvXfaODYC
         y/i7PWRerGgk63yU1A9Cleek/3jwdZUSOM3KxTghAwChc1415WkoBuoug1Fpe6xVRPpn
         pzkj1H538anDbHzLuh50fDTJ7e0RyGlEmMokavpcQb3OLGfWTRjII5rRG/3deDm+I05t
         0VK7brqIVbsjGH4Fs9Il5Exk0ydMC6HGW5Sh7Fv8gxxzXgHu83w1GU8ws0Qf+jauhM5l
         gv+HkVeYzwMJcPK+VQNLh204knCSFcICTJNC060I1t477WfG69MWxvMxJ4GW3dN9SVek
         7bFQ==
X-Gm-Message-State: AFqh2krlBkSl8oHIGOFkjbJi0q1SK+U6WB/cZdUuU+AXYXI/r9yIai8M
	baLgk5829TaxaIt8i4nlRFaaapLLbHgpklBFjPI=
X-Google-Smtp-Source: AMrXdXv7q7ZT5rjSz3HEaAJFOmthruQ3kBWLLlPIU4EQoYIhXsGnSEmwD7Mdvrm+/PsaZzphSHS5qQ==
X-Received: by 2002:a62:4e0e:0:b0:588:94f3:f564 with SMTP id c14-20020a624e0e000000b0058894f3f564mr32907670pfb.30.1674657758731;
        Wed, 25 Jan 2023 06:42:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d2-20020aa78142000000b005810c4286d6sm3723703pfn.0.2023.01.25.06.42.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:42:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/16] selftest/virgl: use pkg-config from the host
Date: Wed, 25 Jan 2023 04:41:58 -1000
Message-Id: <f0f0abd0b59e4ffba075603a6a96e7dd9954a2c7.1674657501.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674657501.git.steve@sakoman.com>
References: <cover.1674657501.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 14:42:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176366

From: Alexander Kanavin <alex.kanavin@gmail.com>

The check needs to report dri location on the host machine,
so pkg-config binary needs to be capable of finding the needed
dri.pc file on the host, and therefore needs to know where
host .pc files are located.

This may not be the case when using pkg-config from buildtools,
so this forces usage of host pkg-config.

runqemu already does the same PATH tweak, so this simply brings
the two in sync.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0521f8a3ba7e15482756529ee7b0a95b3d53e7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index aeda01848a..5439bd426b 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -236,7 +236,7 @@ class TestImage(OESelftestTestCase):
         except FileNotFoundError:
             self.skipTest("/dev/dri directory does not exist; no render nodes available on this machine.")
         try:
-            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.skipTest("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
-- 
2.25.1


