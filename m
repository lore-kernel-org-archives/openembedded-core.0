Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90681C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 15:43:47 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.10176.1698421421364259566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 08:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=QP/a+SkH;
 spf=pass (domain: baylibre.com, ip: 209.85.219.54, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-66d17fd450aso27489216d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 08:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698421420; x=1699026220; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3nV8mUNitZEgSD7oYwi1KMwuuMBVWn1gdki93Dx3knM=;
        b=QP/a+SkHhAK8ayhcRXlDuvTv7k/3VWpjsRva3MOD1xElbw99N5mSdF7ElybtAsnD07
         tkcKpuMnw3Tm5n+w7fpoFhUMw7pfdBzZSX9wqFtc9jVBbUHKQr/BHgsKYHKUbcaxO9s2
         cSy0zdO0FlfoK6Slp92htPSGOQaDI5wTVWVP56Neq8CAxJdUghIY+RJpq70P/H/bxYQb
         jt1QHmDl7ZjYjDvG6NK5u1tch83DJemUFFP7kVFZH+aQOAtkGRijVClBrXDvj1LNZx4Z
         OOmjIvUBot03gpVllZa6nuSe3dUA0SbWUuHhFPQL2xWCcZncAEN2dD+OYq+qIipuyI52
         iQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698421420; x=1699026220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nV8mUNitZEgSD7oYwi1KMwuuMBVWn1gdki93Dx3knM=;
        b=pPCMHiMWr0p57aw7QnlC3XvnX9gLtLQXrWSHKGMlPSm2Yw+ETji+/fJRkCGZYqxUe+
         Qcb5cv27sYhh13nX5UmKbUiR3/RukhKDjbaBmmBaE26Tq2d0U6JeInce/G87zQkwtNHm
         HsaapImV6Y7ctE6n5HhtgJQcXELWmg5graetS2ndIJfucQTg5SJ42aoAVfqH+Ad+t+2i
         KV+H699+WmxYeNhF9rNEZ1Ww8lwwE7UUBe/X8n+RpAoWQkXPCXLezPIxYLW4/+6Z8tAr
         weB8X9+jN2e8dDcU5JzBhclkbmXioZ+M3icEJnJ+QwnoEfCejTHARVK2aEoRfM3450Rl
         Likw==
X-Gm-Message-State: AOJu0YwxojMpiTJeQ45/QJ3YxKFx0FtxGwbcibK5cFKMi0YqUuhuvPDB
	+k4KOmqTlge7vyttA2X00toJ9edfx+35MB+1XjI5KQ==
X-Google-Smtp-Source: AGHT+IGqw40s6cPpmk3rzSnOplbEuiVkM6wVQFX66KWDIfGr6eANmKubW7t7gCIHbGccSEOO5lCqnQ==
X-Received: by 2002:a05:6214:248e:b0:66f:b7ff:1e12 with SMTP id gi14-20020a056214248e00b0066fb7ff1e12mr3246367qvb.20.1698421419798;
        Fri, 27 Oct 2023 08:43:39 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id c17-20020a0ce651000000b0065b231b2cb4sm684590qvn.105.2023.10.27.08.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 08:43:39 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: reduce checksum test output length
Date: Fri, 27 Oct 2023 11:43:38 -0400
Message-ID: <20231027154338.182629-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 15:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189750

The test_lic_files_chksum_modified_not_mentioned test in TestMetadata is
outputting very long lines that fail the maximum length check when
sending email results, preventing the actual errors from being
displayed. Reduce the length of the failure message by rewording and
removing redundant information.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index 34e119174fe..3742760b451 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -116,7 +116,7 @@ class TestMetadata(base.Metadata):
                     if self.lictag_re.search_string(commit.commit_message):
                        break
                 else:
-                    self.fail('LIC_FILES_CHKSUM changed on target %s but there is no "License-Update:" tag in commit message. Include it with a brief description' % pn,
+                    self.fail('LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message',
                               data=[('Current checksum', pretest), ('New checksum', test)])
 
     def test_max_line_length(self):
-- 
2.41.0


