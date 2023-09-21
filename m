Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FD0E7106C
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 13:14:36 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.16863.1695302069863991519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 06:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JDLGs358;
 spf=pass (domain: baylibre.com, ip: 209.85.128.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-59be9a09c23so11813827b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 06:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695302069; x=1695906869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5dcwdGOEQ3FMkLbuKYb9miesB5db7dBW+XyJi8ZxkZU=;
        b=JDLGs358/ASBVRC7y4mlo0pFu0eTPZfLVbDy5+t8wZILX1u+1//ga985HDqoh/bHfC
         vU+g0kPMpJ6i+t8XWuIuJaQ+hV9Td/PRN6b6tweYX7LZZcFOVFVtJkh9JP0if7Cs5WjY
         QSc9L5DrhtpOC39IRWhCD4G1VYJARlU4I+a47m1vkirggA03OSyrMHAjfQPXKu77zSdb
         bMks43MMTbXsaJiUhfRIsFkuWHmvDMVSPazo9/23njNno6bch6JFkQrEIGcvuzUrGECB
         mYYSbig3TnA0RIPY4Dcn36KjlzxDJevrXSLrmOo6PvcV1dKUR5rr/H+tx3Qehs0NyffM
         saig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695302069; x=1695906869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dcwdGOEQ3FMkLbuKYb9miesB5db7dBW+XyJi8ZxkZU=;
        b=Uf2r/a+5JYD46goNsqazSlsvhBKi3u0O2rz2pvUZizS1KaJ6qPvifjy2qVQdVYmL8n
         6NDhtwluVZt5np7SLakXod/q3xyWrLCpbuPx26jV8YidGPJB1Fp87R0HgJMM18kS2nUo
         jnNRzRQwlErXwf9YYX5VsNyCtLWWvmYeycAO6k4skGTAHrcyEm95tpg9ZjuwhxH9qg/J
         5TuW8s35D7RJsi3P/o3+60Xh3jx761DEcUXaynezwu9H4LuRSV7qXe+MA77//cK7da3z
         I9ssnvUr0VQXbpeuvh7ZKBZWV1OI7FHZybG9Oh4UsHultyEQNEN95DDm2pq1QV0KmoeY
         xq8A==
X-Gm-Message-State: AOJu0YwgeD/y05a1yqvI/vUOOR/hh7FpPgQlC4TZFiMqAwomTKJ0A2Y7
	Vcgnuy5tbio4dcV7fp5xnS/erU/MRGyEUXqaD6bxKgmb
X-Google-Smtp-Source: AGHT+IGSaHSVVNl4RendjpODdVRJXtjnPat1WSYA5x54lOSXDncFoRsyaWPbYW93vtVPYgNo22jK0g==
X-Received: by 2002:a25:7413:0:b0:d72:80bc:d3b2 with SMTP id p19-20020a257413000000b00d7280bcd3b2mr5760070ybc.32.1695302068884;
        Thu, 21 Sep 2023 06:14:28 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id f2-20020a0cf3c2000000b006583cc236aasm550106qvm.76.2023.09.21.06.14.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 06:14:28 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest/selftest: only split resultlines once
Date: Thu, 21 Sep 2023 09:14:27 -0400
Message-ID: <20230921131427.55396-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187995

selftest assumes that the test result output lines will consist of two
tokens separated by whitespace, which are the actual result and the name
of the test run. As a result, the script fails if any verbosity is added
to the output of patchtest itself (e.g. by including a failure reason).
Make the call to split() only do so once in order to ensure that two
tokens are obtained.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/selftest/selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index ba8e1623ee..d2b61e951a 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -63,7 +63,7 @@ if __name__ == '__main__':
 
             for resultline in results.splitlines():
                 if testid in resultline:
-                    result, _ = resultline.split()
+                    result, _ = resultline.split(' ', 1)
 
                     if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
                         xfailcount = xfailcount + 1
-- 
2.41.0


