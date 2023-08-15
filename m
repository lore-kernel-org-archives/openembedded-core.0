Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D46C41513
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:25:13 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.138702.1692116706547846849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zIzvqqYG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bee82fad0fso2049265ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116705; x=1692721505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9wLOEPH+7RnsMvXqkp+t1rGHDpKsx1w+wYTxxCptDQ=;
        b=zIzvqqYGEcKavT6YFCkaiWdXJ2lP5mNnK6pCveODsqEa+EhaE/PbF5IkhMmlHOHFmh
         putL73LpTDLvjX0W7W8PbEP5zKrRZrF4uGlKketz5t5EepT40tZfcvLbhL9S6R4uNGTn
         lyiJf5pekXeBzy7m7Jz7i0SPcwdpMsqN2RQaUH8ZQJLcYAIJJLlkS7iMdlzsvKRCNjRY
         DshK1d9n1ZrC1xNFG4LVYKIiLRO7KO9aOYi+VbeUMoGMlqr/EArcVCtVJAiN5clbMkps
         biPyBXx5ItdfAdpR2M0/2sF7cKVMozIB8yKYNGqJm3UZjg+fzkTWjyllgMAI6oC7kbwc
         gEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116705; x=1692721505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9wLOEPH+7RnsMvXqkp+t1rGHDpKsx1w+wYTxxCptDQ=;
        b=HhxfQTEqgkTghI/oZKO6fbrHd3IWHtad6oh5m5GTrxyEzVXeI4xyQBKyoXXpt7Rxv7
         texcpvrKVgE3KrVmE8jA3r6JM0B0UTo/l9SC1j8iAGzCKwpBo7vV0IhepJcmyMa3wXIr
         6owvVNlR0kERVsC/4FE2HkQusS/9cRqvMK5oT3TLMYXKh0nm87D0OdTiHcRYG78DDRW5
         GDKdyDKqV6SNfK88mYOt1qi2CvK+rHiJERWhPm+NJgCFtIgyFyXraqFWne5adu11UY9K
         Vu/gs5M+9JNVUv9B2qINNu0BfcXkhBAHAPuqLbKUcfmsi5Um+Rjo5Jm5KQhAD7HnIMNe
         ftsw==
X-Gm-Message-State: AOJu0Yx9aq2sqfmQxLRZ3Uka3DtAM4LlUV/zEpLWPxyzS49C+JLwHhy/
	EcKWmgWBJuZw7ig6ZpRQqI2q1ki/3zooFqtCO14=
X-Google-Smtp-Source: AGHT+IGouABJ/mzVbbn/QZI2oAP4HsLiza/Y/jLGSQqTtYUJYsFtnYdBzO/Ddkm4iG+i6rDkA8GdpA==
X-Received: by 2002:a17:902:ea0c:b0:1b8:b3f9:58e5 with SMTP id s12-20020a170902ea0c00b001b8b3f958e5mr14412843plg.38.1692116705665;
        Tue, 15 Aug 2023 09:25:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:25:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/18] curl: ensure all ptest failures are caught
Date: Tue, 15 Aug 2023 06:24:26 -1000
Message-Id: <066576439bf0799188d6f0901971639d858cfdcf.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186096

From: Alexander Kanavin <alex.kanavin@gmail.com>

Piping results through sed is masking failures that aren't
picked up by sed expressions.

One such failure probes the source tree, and so isn't
relevant for target testing, and can be disabled.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 86c96cbf68d986b44fdb45e988343ce29d6b8cc7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl/disable-tests | 2 ++
 meta/recipes-support/curl/curl/run-ptest     | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-support/curl/curl/disable-tests
index 92056bd8ca..b687b2bb76 100644
--- a/meta/recipes-support/curl/curl/disable-tests
+++ b/meta/recipes-support/curl/curl/disable-tests
@@ -18,6 +18,8 @@
 1165
 # This CRL test is looking for src files
 1185
+# This test is scanning the source tree
+1222
 # These CRL tests need --libcurl option to be enabled
 1400
 1401
diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
index 614e822922..2c74c58f5d 100644
--- a/meta/recipes-support/curl/curl/run-ptest
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 cd tests
-./runtests.pl -a -n -s | sed \
+{ ./runtests.pl -a -n -s || echo "FAIL: curl" ; } | sed \
      -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
      -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
      -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
-- 
2.34.1


