Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B840C04E69
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:27 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web10.21392.1691683525604523360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VYh1Ljoc;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.170, mailfrom: steve@sakoman.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3492905f546so3768905ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683524; x=1692288324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=VYh1LjocVoDg4sEk7AM2TkDuqC6nU6cqV3sQyOmCarBrbIVKqA4qa7nDJaOlqDNkDt
         PKM33gQpAoIarWkFpPNyNZhswyP3D+hPHE5A+sf4QF4Oe/HPPMQkrTfvsjJf27rxoB7G
         tIX98umv1yIMLbCAh4SHyOh2dg2ykhgQ8mI4+oGUlg9M4NI2XxTBTZzhufzn3dMUeKZs
         k4RPDxk0ZxD4agwbeGlTlKA1DmlRS8m7ZgEkYcPQFvS+aVCZlvtbSklsU+ihYuclS0ip
         AifeU+AwRkg2eKd0bUQSiTNOR59S7wmkkGnOjPe/4wB8GiGJlGacqdTnjgki706shd4J
         Oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683524; x=1692288324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5Lt/aIGN0lUea1VQZEIJWVoZgtFWlby/ygCrm151ms=;
        b=XqKLdJ8ReF81NRt+89r+LeO7M4UtEnbdqTdNCp+M9accJo06w3uwPJ+4yLC8mbG67z
         MuheqZ5SpSXS2t0v2ssIEk5IhvsC/DiFHdsMFdOGzZMRUmk/W5sKbYbJiwTRUZZWhWQ/
         b+WLfOcxtvQgRmPaHVJqq4OgF8LugIDzSkAMVZKIR8XFqUiSNDB5Xx2ZqLDfHNENehGx
         3XPG7rHLjTLFr0K8f25y9tFh4zkfhLAXUnafPlkahTb8PQ5cJxbnD8z+KEhGLP+0vJkt
         VPXDoJSgKQI4AIQijbIHYqhOyRYDKhR21UX90eDXvdDJEByZOcOPjVvaJMP9firIW8zR
         Lv+w==
X-Gm-Message-State: AOJu0Yzi4290li+0d+ihXOL3N0UGiy4wbLALsNdTIgivRXq6gvFBL6JH
	J1XJWdzbKfnzvWyS1txid7vsYQEp6/uzZXOSk7s=
X-Google-Smtp-Source: AGHT+IGJ48hLHSBZpJ4rO13DLDmBwAH2Z3ekLwEtrslyS7SW/hPc9U5mkLMYIF08/9mUozq72YQQAg==
X-Received: by 2002:a05:6e02:154c:b0:349:2c56:a474 with SMTP id j12-20020a056e02154c00b003492c56a474mr4032411ilu.30.1691683524511;
        Thu, 10 Aug 2023 09:05:24 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/37] resulttool/resultutils: allow index generation despite corrupt json
Date: Thu, 10 Aug 2023 06:04:17 -1000
Message-Id: <ea6c9e6a91df553e88e34a990ea15f80f469893e.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185780

From: Michael Halstead <mhalstead@linuxfoundation.org>

non-release indexes will continue to generate when test output is
corrupted.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a9157684a6bff8406c9bb470cb2e16ee006bbe9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 7666331ba2..c5521d81bd 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -58,7 +58,11 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
             testseries = posixpath.basename(posixpath.dirname(url.path))
         else:
             with open(f, "r") as filedata:
-                data = json.load(filedata)
+                try:
+                    data = json.load(filedata)
+                except json.decoder.JSONDecodeError:
+                    print("Cannot decode {}. Possible corruption. Skipping.".format(f))
+                    data = ""
             testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
-- 
2.34.1


