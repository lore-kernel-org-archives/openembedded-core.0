Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED824CD492A
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:33 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web11.3192.1695249090554967258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=o/6TFnKU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.46, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6bf298ef1f5so237528a34.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249089; x=1695853889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=o/6TFnKUnkOjE4gzqD64jVYCXDfTOM48dN8Zym/B65wOV1FSR5o/zGoeV3kBVeU7+Z
         zPGgFcF+F2zdC89ekS3pT3e4bpB8KdypL2L9lQZMeigcIPRQy//LnWsMC94jMKZ3Zs3W
         7EqrCIEam/UDAGlMRnn8AvCv8+nikw9TiOjWEEl4Sf3JWeIqvCdLX0hEDRu/4Txih6yw
         qp1b6VOK9MeWRZtySTkwA3N/ds0I4KrJSNSrEbq6hGaFBfRJUuV65elHdhL4/mYekeRW
         FXZhivyxj+WntQNZT05HHjaLD8X0OeC++P+vVJp8Qw+7BCgItD0RjAlJ3DHYSn+0UKbk
         QvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249089; x=1695853889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cpfLymLVzyGgNxX4vxTBoNY6rRHH5XQQwCD7Ms1ZMM=;
        b=jSHL8pq1oBBOxsHTZ1b0XkH/ayrpaXu4xkEDToBFvFNrW8oQTt1/IgcGFiNlB2f2BE
         zFQiKzp5MegGUoq24Fx8peJuk/OPaJ1PVRhERLkaPwxazEHj0e/m5tLajenKMRRhthGz
         J4hKbQRH6uLD1MG2E+6mllUER7YdaBo6yhCJRbLpCK/p1AyOCQeKb7JwVrPRXAyHvD6H
         sBV0gtRjrQ8uWcBcyfx4w9HvDueEkMwsEGxtuXMfvAmGDzSww7IsrYRbeQUTm8EsxxJR
         nrsyyPvqvcD/GbITr7R/hRAivzcC300EGE66gMb3nNbN+OyXgGCigvpnjKfVksuQItgT
         IcqA==
X-Gm-Message-State: AOJu0YzfeW4iKxjR5QUyMFI6/IMHYpUHjl5wX4EET23SycGpw92ur/2a
	i0+KlSAgq5s9iP9dr7C24rlg2ROeZISeHpjKiOE=
X-Google-Smtp-Source: AGHT+IFo+UKNGGK7XzT/UiE2/UTCE3xaIZ+PVa7eN8/IlMyU4ZmuKkeOy53uEQaxPKdg9zXB8Mzv4A==
X-Received: by 2002:a05:6358:93a7:b0:139:d24c:ed28 with SMTP id h39-20020a05635893a700b00139d24ced28mr5054117rwb.12.1695249089309;
        Wed, 20 Sep 2023 15:31:29 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/20] resulttool/report: Avoid divide by zero
Date: Wed, 20 Sep 2023 12:30:52 -1000
Message-Id: <b95c6a5278d44fddfbaea45cc78324f1e099187c.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187963

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid a divide by zero traceback if unfortunate test counts are encountered.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c5aeea53dfacb53dedb8445cb3523dc3a8cb6dca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/report.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/report.py b/scripts/lib/resulttool/report.py
index f0ca50ebe2..a349510ab8 100644
--- a/scripts/lib/resulttool/report.py
+++ b/scripts/lib/resulttool/report.py
@@ -176,7 +176,10 @@ class ResultsTextReport(object):
             vals['sort'] = line['testseries'] + "_" + line['result_id']
             vals['failed_testcases'] = line['failed_testcases']
             for k in cols:
-                vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                if total_tested:
+                    vals[k] = "%d (%s%%)" % (line[k], format(line[k] / total_tested * 100, '.0f'))
+                else:
+                    vals[k] = "0 (0%)"
             for k in maxlen:
                 if k in vals and len(vals[k]) > maxlen[k]:
                     maxlen[k] = len(vals[k])
-- 
2.34.1


