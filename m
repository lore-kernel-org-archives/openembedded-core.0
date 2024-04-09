Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9139CD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 12:03:09 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.134360.1712664186907181022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 05:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ntt5O/4k;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-696609f5cf2so32878656d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712664186; x=1713268986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SQeLYxpM0zV3Qdcxyxce8GmjvEsP1kIUxoVIqAeQNIU=;
        b=ntt5O/4kcRD5dpZmggbJDJayTUUvfWdvs4EWH9vT+kii+UGcxMOrZDkT/iSryCmF1Q
         P8JytJB2UWLZ11/eybHdxU+xvw6vf0UT39dDXrnuGE8eSqw5npIg2G1pXmcnT9cfXTz9
         NS3W/XN2IywwYRRhxAPC5Ax3N8ux0RDFxe+z1qbPElDqUCQHbmu7wf4hpWBuufO1SCRT
         zTLK98s96PNYhdXwlTPuFdENfwRWX9MaRBGVciUr+M90j4Vz4bRlChdkzY92VOhVKFpy
         JqCv4ATUaTx6cJGNZ8lvR5zc+r+JNfdmox65fFeBLtclDW49Cs2/aXwHr2fe8y++y2Oq
         JfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664186; x=1713268986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQeLYxpM0zV3Qdcxyxce8GmjvEsP1kIUxoVIqAeQNIU=;
        b=ndKDEkrpLayF66ELdqk+uoZ0r7PT6w9Gn0+mxEsOEKNJEQk4Bf8Pmu4PGyOMIKpvjS
         hbKmr1+lOUJzuZ5+kg25gRT8YzD3gdgCRGA3B+pOZDWMq3BZ0QfYFkUYuU2qC6cIGfuE
         5JD3tmPv9MBzioSlzKj0T6TJVYhlxkMw6mAMBXufDiV53PoArdGHtnvA/r5YqCn46fbW
         3RhiT370ESu+mumGsK+ov43TMDCuQpt431Xqi1UZdP3WS6R0iqfvBrfuHTw4RiG77Lqn
         nyJX3laz901Riaj8oBrsMTEqpxOqt8YAZckKJWaqlGeyeriYQYAyxi/gW3MlCKJ15XHB
         wGHw==
X-Gm-Message-State: AOJu0YzEP5J2D4oIwusYA33XwldWH1JjxDZ1VQ9nvA2aABUEHvbHYy/P
	PrMssLWsio8AW9HD1oSsTq2RJA/2i8v0blZBh6sdKREycpDb8zo7HgnQlLZkqMqrOvm5Ua5DtgK
	Ez0E=
X-Google-Smtp-Source: AGHT+IHUjnRSXbZu5u2uhwBnCCWxACDFFefn0RpyuUk6wH1OtwEuS1+vj6jUMOtqJLPYfOaxFkwnYA==
X-Received: by 2002:a05:6214:415:b0:69b:143d:7702 with SMTP id z21-20020a056214041500b0069b143d7702mr7212040qvx.63.1712664185773;
        Tue, 09 Apr 2024 05:03:05 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d6-20020a0ce446000000b0069945e9d305sm3455287qvm.42.2024.04.09.05.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 05:03:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: test_metadata: fix invalid escape sequences
Date: Tue,  9 Apr 2024 08:03:03 -0400
Message-ID: <20240409120304.1256734-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 12:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198063

Clear up the following warnings seen during patchtest runs:

|/workspace/yocto/poky/meta/lib/patchtest/tests/test_metadata.py:21: SyntaxWarning: invalid escape sequence '\+'
|  add_mark = pyparsing.Regex('\+ ')
|/workspace/yocto/poky/meta/lib/patchtest/tests/test_metadata.py:26: SyntaxWarning: invalid escape sequence '\:'
|  git_regex = pyparsing.Regex('^git\:\/\/.*')

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/test_metadata.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_metadata.py b/meta/lib/patchtest/tests/test_metadata.py
index be609dbd048..f5dbcf01ed6 100644
--- a/meta/lib/patchtest/tests/test_metadata.py
+++ b/meta/lib/patchtest/tests/test_metadata.py
@@ -18,12 +18,12 @@ class TestMetadata(base.Metadata):
     lictag_re  = pyparsing.AtLineStart("License-Update:")
     lic_chksum_added = pyparsing.AtLineStart("+" + metadata_chksum)
     lic_chksum_removed = pyparsing.AtLineStart("-" + metadata_chksum)
-    add_mark = pyparsing.Regex('\+ ')
+    add_mark = pyparsing.Regex('\\+ ')
     max_length = 200
     metadata_src_uri  = 'SRC_URI'
     md5sum    = 'md5sum'
     sha256sum = 'sha256sum'
-    git_regex = pyparsing.Regex('^git\:\/\/.*')
+    git_regex = pyparsing.Regex('^git\\:\\/\\/.*')
     metadata_summary = 'SUMMARY'
     cve_check_ignore_var = 'CVE_CHECK_IGNORE'
     cve_status_var = 'CVE_STATUS'
-- 
2.44.0


