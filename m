Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.61394.1600092745303677202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=f5nJY+Gt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d6so12741932pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X304NoV2ADedFEqQa6I1pvFM3jU1X2KgO4DWoPPz03k=;
        b=f5nJY+GtbaLHg7pksR0IFxwi16DXSyCqxxQNdsMxTgXpvaMy9kyePe3OQ7UQpftbKI
         XKpbzq45Ngu8RgId3VbGhovdM1PLDlohxBxcOFf7EtvmFSN4peJnqHNFxjP39hgyCR1n
         7Nz8lTZqxxC0SZFYSbqBGRa4b0Q8mYnnxMsBUvKe0WO/cnd/v+3WR3tyIA3NTdY27Vnq
         N11x7kjSUr599xnwBVHxXRxMDMyc5vBP0wm2jKEN94uGesvAU9dXsX3qQKihIqOpOkA6
         GEdi/pa44GCnmrnzCuJI6YLf2b+/outq75H/F7ntL8r/JoqLNasH7pPxqRGVHVfU7xwk
         KiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X304NoV2ADedFEqQa6I1pvFM3jU1X2KgO4DWoPPz03k=;
        b=uf24xnWH66oxMmCG5oQJkyKQ70L58qKN63EcCTV4TbY1aauEKMPLUIgLKRrHY9q4VL
         zzcsLfOX3RrIyj0XM8si8oZEwQEkl+7KixV6fF2+rpXDpcyJ9oRhkB38IllzbuvtNFk/
         GI9Q/2oAr+4ug6uj4KBJuErl1xBlpTlM0aRCR3j6r15OnQBBQJjOuFeGOH0O3lg/aWn2
         d8S3h93Qq/d+Ybfb+LzWE1EDbUpnBOoQaE08D9yP0ffzbUC8a0wbOTIbAf/1FMTA2Qqt
         eWdcWVTDt5I8nLhwMMsm+8URFOb4sA2EvDAqhB8ypynXNZuzEZiPbRQZE+WHmgSh6SII
         qSUA==
X-Gm-Message-State: AOAM5309MaJuQSoBtZdmCZfw87YZFrl3cMtQwJzoQ+7rEkX8fdYIwt4Q
	1+xIPrCW14tlu5z9TurUv6yU2QZENbJE8FqrVzg=
X-Google-Smtp-Source: ABdhPJwMheIi1c2uolOXHQt62dDL+3bGhfuyApd/6MLqExByUiqt3crHU6RsosCcnrZBoytnBoBpxg==
X-Received: by 2002:a17:902:c393:b029:d0:89f4:6228 with SMTP id g19-20020a170902c393b02900d089f46228mr14757860plg.16.1600092744300;
        Mon, 14 Sep 2020 07:12:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/24] runqemu: Add a hook to allow it to renice
Date: Mon, 14 Sep 2020 04:11:27 -1000
Message-Id: <829443b3fafa000e330c06ebb144641bd2d20ad1.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have an issue where qemu is being starved of resources on our autobuilders.
We can't raise its priority without special capacilties, therefore add a hook
which if present can allow this to happen using an executable
"~/runqemu-renice".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 141a3c9ce93bc3d526303021ecf0460c6e9fea8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index b24ac1c804..cc87ea871a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1507,6 +1507,11 @@ def main():
     try:
         config = BaseConfig()
 
+        renice = os.path.expanduser("~/bin/runqemu-renice")
+        if os.path.exists(renice):
+            logger.info('Using %s to renice' % renice)
+            subprocess.check_call([renice, str(os.getpid())])
+
         def sigterm_handler(signum, frame):
             logger.info("SIGTERM received")
             os.kill(config.qemupid, signal.SIGTERM)
-- 
2.17.1

