Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C7AC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:50:02 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.28150.1658155797023633807
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZrkpY0oD;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso12876735pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Vg/ivvGs++S3ajIxvGc4MqYS185SB4tpaXnBIrYXZ4k=;
        b=ZrkpY0oDd2Xgzxze2eo5+8N588Qeyxj5P6v5vAev0y2Pu9uOirsrt0PPpUNvWVN+WG
         5atev6jDzY6cTW+5/UXjvgHN06Vuj2cQ1tKqWkryHb2KP8MiMNA/Bcmk4OERVb06rYtg
         Yiuh8ybRMEu/6QDCUp2ucRi48nBiZQPmWQJHzG2WHNs92ZxaoYOprZ2Fpj1rVbuJihzg
         WCfNaO7Nfxeh4d58G9NHQ58JFFTeAaZqi+tPD+EZRDsOWL8dM14eWqbjajeUYyso0Ltf
         PR/HUuCOoYoPdcZnnPZUIEmJuH5qGKSowGMIoGphrjTq3rdbX1M5js2VwUdLQjoZ+pAm
         XyEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vg/ivvGs++S3ajIxvGc4MqYS185SB4tpaXnBIrYXZ4k=;
        b=OYR+Hy74+9hLqDMhP3K+pD1Q1pf2b6CDdU+MWrPyiCL94FvvBcu3LZCG7VzMvt6you
         AgXpgTsBtdaKXHxGZGaUZWkkcBf6eASAfWSBXDeJj0iobqVhrri8RLJFNhxpsjD2NGqC
         R4Z1kIt54hXh1Ir4s4fR/oDyX4Q8iYI5YOBgOqGX2NsASEsiO2Tp6IwT0tA7w2McCjgE
         WZMNZpmiNnGZaocmD8zsCPV6OUa1kKMzylud5IrqQC0c+fieYaQDc9YUKXvuaCcwM0YY
         vzUS1a+ZsNMl46J+SObGhp0M8tJ6cAABCL1RZ+1vv/pfmZTYJWA+QMaJTQFc7/XADUJe
         LLDA==
X-Gm-Message-State: AJIora9bQxvyqMO60MSSxWG7AStYQQluhdYrh1PuqI4hYcXEsMpASbp2
	m8YkuKLMhSQAfahftyysP/0X+4aC77wwYUOs
X-Google-Smtp-Source: 
 AGRyM1uu+OOoeg1/OKB9mptDGUrW6xZmIVUPDITA874IalDnnK924Dxw2PzRaO/T+jP1CNaLdciSRA==
X-Received: by 2002:a17:903:3093:b0:16b:deea:4d36 with SMTP id
 u19-20020a170903309300b0016bdeea4d36mr28433752plc.126.1658155795733;
        Mon, 18 Jul 2022 07:49:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/35] package.bbclass: Fix kernel source
 handling when not using externalsrc
Date: Mon, 18 Jul 2022 04:48:40 -1000
Message-Id: 
 <8efd5e31670235f7c59af2a5ee14646f029f4d18.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:50:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168215

From: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>

Previous commit c725bdb29b266 broke kernel source handling, this was due
to the code expecting the sources to be in a different directory, this did
not happen when using externalsrc since sources were found in the expected
directories.

Pass work-shared to the check to allow sources to be found in the proper
directory, allowing these to be packaged in the next step.

To test this we grabbed a commit where we knew the buildpaths
QA test should flag a file inside the kernel sources, with the previous
commit the QA warning wasnt flagged since no sources where there, with
this fix the buildpaths QA warning gets flagged properly.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2714a8ef8c7b3c66d50f27f4f52fe2fe4db39b00)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 63887b34f8..97e97d2703 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -566,7 +566,7 @@ def copydebugsources(debugsrcdir, sources, d):
 
         # If S isnt based on WORKDIR we can infer our sources are located elsewhere,
         # e.g. using externalsrc; use S as base for our dirs
-        if workdir in sdir:
+        if workdir in sdir or 'work-shared' in sdir:
             basedir = workbasedir
             parentdir = workparentdir
         else:
-- 
2.25.1


