Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F506C0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:52:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.58044.1697817127669096799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y6Jb9Gyz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cace3e142eso3891415ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817127; x=1698421927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLHlchBRaavFWGuZm31ieZupkuZW8njd6NWWnDWFpco=;
        b=y6Jb9Gyz7x5jBpuwk6u2rFXQVBXRsdiSBcprqBHn3Ym+OISxPPy8UE1zl5YyNrWa9C
         ErytOeb43cqNWekqpFSB5xmvUomsZhPm4A5zX7EQ4GgijmLaTAgNrg1m6ZOT8S6WEBjZ
         kNBTgn4JomZJSHy/JzygQvbc6WJuEzxCYJNCEDmxN9VOVCG8Tvef/4tLZDpNxE7B6cfD
         QhwCXbMBv5EJ6XVqsPY1T2O9ey7ek6M8iOButG/z3tgbD4vLEM4vNyAZ/iLeZsco5l4G
         3bsr9Cp9Bx91cKutGgc6/5d1qXyy9HigSW0T56GAhk26bRKcIt7NDeDen4G0fzuhPKqw
         hADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817127; x=1698421927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLHlchBRaavFWGuZm31ieZupkuZW8njd6NWWnDWFpco=;
        b=MTlqQnRT+5dJmN+vRy1BM8NW38qvsCrwviySlbr8MuFZryKbeUcxDPiao7DhliDlKM
         xOs/GjNiD1q6DsasQwMJAhUZNEqjrqpFdhFMUlkxnNxkTFfOcHudBHe5QnFvFF/05IIE
         wu3CPtkbys+JhTi6Dz622fRxe5SpqbKPocFBovNP+H3Wu6s6UV00chRIcZ6GfhHdGQ6r
         UNptZGSZjtxXXc6ngpCwVCnoAo4bCEvnpoE7Fak5fGabtLM/BTEqSe/8jLt/Wz5cuuuv
         JpL9nPv/x0qE5pDh2vUPV8EC+ujGtCS0fq95AOBuxUsZBaeA0Lp8TlYm24gPHWcD1CHn
         I54w==
X-Gm-Message-State: AOJu0YwOWjX3pDkypzVKEmIxfkqvug4HNL23jgSv0hfYsXDcXPs52X01
	bUu/zYeITliypUuOVw+59FFhiviImyIcbJ7+3IQ=
X-Google-Smtp-Source: AGHT+IGoAtwi0dr6rvF9dYG0Lfm14SOzL/2Pp0OsL06Fsrluy1+qFKXSWgNaglsw7cA5AzT4PSqBUw==
X-Received: by 2002:a17:902:d054:b0:1c9:d8b6:e7ad with SMTP id l20-20020a170902d05400b001c9d8b6e7admr1935809pll.56.1697817126708;
        Fri, 20 Oct 2023 08:52:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.52.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:52:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/24] insane.bbclass: Count raw bytes in shebang-size
Date: Fri, 20 Oct 2023 05:51:20 -1000
Message-Id: <76efaa1e177a5051cfec87f288c8c7372f142fe2.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189563

From: Jan Garcia <j@n-garcia.com>

Operating systems limit the shebang to a maximum number of bytes.
This patch makes the shebang-size check count raw bytes instead of UTF-8 characters.

Signed-off-by: Jan Garcia <j@n-garcia.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4ac66c5cdaf971fb717cc5c5bf9aa51a787d412)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/insane.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index ee34d5208d..e3a7d05ec3 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -94,9 +94,8 @@ def package_qa_check_shebang_size(path, name, d, elf, messages):
         return
 
     if stanza.startswith(b'#!'):
-        #Shebang not found
         try:
-            stanza = stanza.decode("utf-8")
+            stanza.decode("utf-8")
         except UnicodeDecodeError:
             #If it is not a text file, it is not a script
             return
-- 
2.34.1


