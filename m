Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70197C4707C
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:58 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.151532.1703864754665873729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zb7jcjMh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3eb299e2eso33039875ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864753; x=1704469553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4+/vtyaluaU0GbvUa7OSACFq3E5sp7wISPLd61ODu4=;
        b=zb7jcjMh9e2I2KvHqs+6bc6N+QXm/6MVWNrkxzQpn1EpQPgVVjofIcxHwMFXLTxx/d
         gQSB7AujKjJcUGFIIi20Ozu3zx3ZuMOS9FPAmIfz5nQbpV9jAdxiQEvssCwSywUUPObF
         4pwEgU5WyocfTZZWUYywcNzRvg+ACUA8kmKgYylZnKaLS9DdiHlEGIqxy4w0aG1ohH16
         foZkh7grpI5VJPM1D/pBWVp+WKlg4vKdN7mk0+HcTiMOcVI6WrXhfSVd8ZJKj6EDwBC/
         WrMsfpLk4pqOCoV4VG6Of65rjn0GUKtHF4qG72KIy6nozOR1fzuKPW5UnwT/74U3bjKw
         g9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864753; x=1704469553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4+/vtyaluaU0GbvUa7OSACFq3E5sp7wISPLd61ODu4=;
        b=GI5u3iKKq0rVijAHoRLo/OqgjNyCz0urZcNoxBWx7fZ1qEIEtI7rHxTPGBcozfw+1G
         iCbRLl9beEi57h6zAZuB0bHpy3M+3rTHwVqzKBILJvRZjLWaIkOxwKZJUl6sl3Giox2j
         GqARmaFCTMmbgBYCgMh17Vh8hhAPVRtXE8Q4GKvPO75T3xYQXtIUsIsfEq6+SRxC8RnB
         9YiGY2rEWSQ26Hdjf/+vLhSyhNb8+Rlo1UfW9YiZeMxZiDGn2TMg8ocA6PfraDHi3riY
         uaHUiAy9Msv7wvY/Lzb++l6C6IzuUOvrPX+44rDg+noaw0r5dkJf0C+OCUQNxdmptGKt
         /l7g==
X-Gm-Message-State: AOJu0YwkLOrVsGmFWrWmN8N6LaSKg6NySayjyVmgftb5KcjuoLEZyeUK
	2tJ7RVCH4OsdJqZmMiscIdDZ2Dg6inrEQnTymTOGWC/f/iYY0A==
X-Google-Smtp-Source: AGHT+IGseUtvOAux5Qjp9Os5plgX8ezNi/BIOnEJNl89yp19UOlZk6/VMI6qGxBise+0utL9Bvk0PQ==
X-Received: by 2002:a17:903:2443:b0:1d4:2b4a:5f1b with SMTP id l3-20020a170903244300b001d42b4a5f1bmr6152870pls.132.1703864753465;
        Fri, 29 Dec 2023 07:45:53 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:53 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 27/41] lib/oe/patch: ensure os.chdir restoring always happens
Date: Fri, 29 Dec 2023 05:44:41 -1000
Message-Id: <1680d1766445b21e35c6b874c4767b385862017f.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193044

From: Ross Burton <ross.burton@arm.com>

If we chdir(), do the chdir back to the original directory in a finally
block so they always run.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdc40292818683b6df1c814498c7589450a163fa)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/patch.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index ff9afc9df9..9b480b2b28 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -772,8 +772,9 @@ class NOOPResolver(Resolver):
             self.patchset.Push()
         except Exception:
             import sys
-            os.chdir(olddir)
             raise
+        finally:
+            os.chdir(olddir)
 
 # Patch resolver which relies on the user doing all the work involved in the
 # resolution, with the exception of refreshing the remote copy of the patch
@@ -833,9 +834,9 @@ class UserResolver(Resolver):
                             # User did not fix the problem.  Abort.
                             raise PatchError("Patch application failed, and user did not fix and refresh the patch.")
         except Exception:
-            os.chdir(olddir)
             raise
-        os.chdir(olddir)
+        finally:
+            os.chdir(olddir)
 
 
 def patch_path(url, fetch, workdir, expand=True):
-- 
2.34.1


