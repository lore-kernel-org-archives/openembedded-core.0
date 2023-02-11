Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AE3C636D7
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.19573.1676150667005374941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=mSVBaOxH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id r17so5686806pff.9
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/baCti/MBoVDRiJxsVy8ITg0iiQ7MUsd23iajgMLqc=;
        b=mSVBaOxH87F49Chg7nq3bfLL2/OBFUIGHn217CWUoPksztT9lPQOxhNOBnaq8vOFyr
         zG1Gfm68bNn1juFosAjZgNmclVfqMbHRqbvZydcKcZUC6Zm4cmzed2CeyWhgejvxsYd4
         2VZV7BBx74mxwvXMlNDQoRyQDiP9styzFB6kuZ8ENKTzNWGEUZ9/AajM5zx/6JVciRZ0
         lGDeiE9nGJHqj1MAMaHhRhQCnQBTzCKpvAf1oQfcnWKI3fT9V0FYIuNl7WfYPUgSev9i
         2+ybTxdSnIKxkAOVenLYlrcrDwyl/MKJKeqFmT+0uYlNOhwGgY1mPrUpjcLQr3dfscIk
         lTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o/baCti/MBoVDRiJxsVy8ITg0iiQ7MUsd23iajgMLqc=;
        b=6OlySfpAFcAlWbwcfuZvt2KaEUTt4hqLTgBEaCRRlrHlIRh+wmQMlWDdIGSHV2YREG
         9kqsA+8qqrqHNklmn1DnwHZXWg9d0Jdg++1cSOaa08KGbN0npyGU9EUPYEfzsV6X4a6L
         0+zhYA1EjQA3NuQXWD/sGFp1C+ah0rj1TNu8QkLaA1/K0HLIASUCtyqGOPgOHVSQ+h6U
         x4PT/GQETeom9WkxVEoYQcIWsoELjMjxjWCyk7zk7iwvFLjTwgqap7vV1lI/ohTQlMuV
         8XeYF5twb3mxhl54CjsuKWNmMVZ90OVVdeq4qOhbpkTTAzvreFb6zKeuDZRI0/dsg4Gh
         DIDQ==
X-Gm-Message-State: AO0yUKUnNDlklFyoXqGk7zvI9pYgibPmb+uVhJp6dgfInwKkYHDHJstC
	cwoZRU1EB6niUJ9M73FhJYwO4kNNC0055jnIMG8=
X-Google-Smtp-Source: AK7set8ciYhBDSAVuha1oEmV67Xr2Qap/TlSXJA0NZXfNHkehIpMuT2jLj0rvIMINZ+x1Aij217evg==
X-Received: by 2002:a62:4eca:0:b0:580:ffa0:bfcf with SMTP id c193-20020a624eca000000b00580ffa0bfcfmr19315242pfb.6.1676150666137;
        Sat, 11 Feb 2023 13:24:26 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/28] httpserver: add error handler that write to the logger
Date: Sat, 11 Feb 2023 11:23:39 -1000
Message-Id: <d3656cf1f749fea837ac2e263f505fcb18965839.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177026

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a4bcca3123685f410fc99e5cc23f2b8f39fd0a63)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/httpserver.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 8ce1dd42f4..5860b0a383 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -40,6 +40,12 @@ class HTTPService(object):
             self.port = self.server.server_port
         self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir, self.logger])
 
+        def handle_error(self, request, client_address):
+            import traceback
+            exception = traceback.format_exc()
+            self.logger.warn("Exception when handling %s: %s" % (request, exception))
+        self.server.handle_error = handle_error
+
         # The signal handler from testimage.bbclass can cause deadlocks here
         # if the HTTPServer is terminated before it can restore the standard 
         #signal behaviour
-- 
2.34.1


