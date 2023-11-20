Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2456EC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.614.1700498375162132369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UkYbIB74;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5c210e34088so2217779a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498374; x=1701103174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=520WahFbhtKDJ8Yl98Jt7ndMsfdOC6iwzdv4xOjC0qc=;
        b=UkYbIB74FjiiB2RNfDECbCCY+mkdGoDwkf68T3h8FsIedw/PE3FaOxCsUHxWFDLP3U
         BidMvWmVyf45xiZGVIVWymfPSHC5iXQhWnB8B5WlIP0wJR1xsGFLh704L6sBRidETVhH
         MTQqQKj5exX72MTei6dilkMym3URxHUET86+LVvolAD3Ddza7k30WDyb/sAIUWROZeOl
         +rth5A1tCKOc5pmwuLYWSsfpapBCUQqMcIzDSsRWaH0tZC2ns9hhrl2UKBRGOqd3Pt5g
         DSSJ94Oh6GWlbzr4oIFuVT51QKTxAvreRfKE/8vCvqZEY89envb1BcEBeet753n/sK8L
         YN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498374; x=1701103174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=520WahFbhtKDJ8Yl98Jt7ndMsfdOC6iwzdv4xOjC0qc=;
        b=aXExP5a7GjYXgGETLE8PN8h2HcE6L2CIL1Uf1sOmmVV7fs+AKc5JuKfrqxucKXz6FN
         +MTsx4gWffJTKZjp/Jg0EmRqawfIVbSvVNHx6t7fdmY6FuFQpQcmZqeL11lI82jwqg91
         t2Yq48Su4qA1sbJ1PJAjvhz60vdw3t8NiGsmWSynT5Vi/D89QhSOGPZLf7SA0FXk8rYU
         o8zZKvEAwj89E0j8HCLp6qF+N5rwyZHvp5IDYyT/if9BOdrSW9N8MQHJYqSEA3FxDOJQ
         +djBBPD1EqyHhhPH66VKX1BCvbNAbO6y9+mbPau4QCYwgxgnndLkDFcOvKM3RNHJuomg
         skLw==
X-Gm-Message-State: AOJu0YykwtbdUp57sIG+DlcWAzaWhbJbeAt2EzUaeh+zQV1DUfNsrFuy
	WRTZyYBcg3lssQWdA1ccRedfEZ2+F8zWoP216wCL2g==
X-Google-Smtp-Source: AGHT+IHedxwc7o59pPtA7480YtVcr/1/1HEuBKKEuEfx9L1cbOOqstapHkefwbSp5iqzoPTxrGHzXw==
X-Received: by 2002:a05:6a20:9189:b0:184:26d8:db7e with SMTP id v9-20020a056a20918900b0018426d8db7emr10017019pzd.14.1700498374333;
        Mon, 20 Nov 2023 08:39:34 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 20/33] patchtest: fix lic_files_chksum test regex
Date: Mon, 20 Nov 2023 06:38:34 -1000
Message-Id: <2403d8ab38471a3c20cdb7722ba573b0b0774699.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190909

From: Trevor Gamblin <tgamblin@baylibre.com>

the test_lic_files_chksum_modified_not_mentioned test in patchtest
wasn't picking up on 'License-Update:' tags correctly. Use pyparsing's
AtLineStart class to simplify the regex setup and search.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc9126e45e74b915faaf296037e7ece41785bf4a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index cb3e7c9d34..fa4a28c7b2 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -12,8 +12,7 @@ class LicFilesChkSum(base.Metadata):
     metadata = 'LIC_FILES_CHKSUM'
     license  = 'LICENSE'
     closed   = 'CLOSED'
-    lictag   = 'License-Update'
-    lictag_re  = pyparsing.Regex("^%s:" % lictag)
+    lictag_re  = pyparsing.AtLineStart("License-Update:")
 
     def test_lic_files_chksum_presence(self):
         if not self.added:
@@ -71,5 +70,5 @@ class LicFilesChkSum(base.Metadata):
                     if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "%s" tag in commit message. Include it with a brief description' % (pn, self.lictag),
+                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
                               data=[('Current checksum', pretest), ('New checksum', test)])
-- 
2.34.1


