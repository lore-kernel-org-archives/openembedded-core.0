Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.60747.1629318603523611296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Aug 2021 13:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rLr4SxCZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id f13-20020a1c6a0d000000b002e6fd0b0b3fso3595450wmc.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Aug 2021 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pZhHbx5oadJ3VpCEZrduUz6R4vArLBS5TuHEus9BbL0=;
        b=rLr4SxCZxZmcERX75bbzBvT8V1JKAr+vgw3duLn8QNSamRVIGzCfLubdBRknyopteb
         D0LUzbFs2AnQUvQu/cMOFGJCHkMVQv1SpsOU+BBwm8i8ELs97+FIoTqrLFAqBDiKpj+Q
         xaK9Ww2c6tTaT7QiFu8+dXK8K894htRhyF1yBFgywVZ7nYRF/MMu4bRcQ8YUhUr+b1mf
         AZgsc3DALssU0kmK3OZXb6up+MiDHmg5YPStxChzEN55ax8DJA4THN9NbhattD99XRM7
         OdC1EfHZUxJ1tcy5IRhJy4UiCFNemnb+TSeRkkZLb9/H6SDrQ6GwZaVp/BeCYvYF2+Xr
         IUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pZhHbx5oadJ3VpCEZrduUz6R4vArLBS5TuHEus9BbL0=;
        b=QLL1gEeUJVyd5q3oyTwghgogkJKCrwVI1SWkADVUz5Kk3WDg7YqGp8qSJcLFEHJbK3
         LhleO0QRe5ROL9OouXnZEL0AjOoOeumYmFvpJAUOnMHkFAFmwDY4wCyLQFlath0TfcXd
         OfxG22lzy4gZGfugfIXWXrxovgVadYenAL5dp2Jh0AnYpEgEsJKajpK0h9/uTAA9n9lc
         ZzvjPBT0D8hFdrhU4ruSpYg9m+zEer4Gbxwy8i/Uw7tSNPgCHzKmyB7tOyVN5uS1hXjD
         ZJQxV0OyvsHly05aoNkQC5jeUkIxLykhAPopBwrLKJGMxgttbbH2ivBL5UHoO7FbgiMi
         Xz3Q==
X-Gm-Message-State: AOAM531TjFchOI8RfDwsGfEYLbZ0sWB2IxdzDwIk5oIJrmOPiOlcZlk1
	7IdxenTC1xVm1RB5NhagaYwzU7f1OqA=
X-Google-Smtp-Source: ABdhPJxwmPpthVcQN+HxJG8U8KM+iLEssjr3vC/6A6b/R8ubVz83eCLcEl5vbL5aDWGN6NesyNXZuw==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr10111333wmb.59.1629318601860;
        Wed, 18 Aug 2021 13:30:01 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id d145sm5966189wmd.3.2021.08.18.13.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 13:30:01 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 2/4] sstate.bbclass: only search on the mirrors for the missing files
Date: Wed, 18 Aug 2021 21:29:52 +0100
Message-Id: <20210818202954.143099-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210818202954.143099-1-quaresma.jose@gmail.com>
References: <20210818202954.143099-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the first search we found some files on the local sstate cache.
The missing files are know as well when this step finish.
When we have sstate mirrors we don't need to iterate all files again
because we already know what's missing.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/classes/sstate.bbclass | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2575750247..c3c145e7f3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -949,11 +949,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 bb.debug(2, "SState: Successful fetch test for %s" % srcuri)
                 foundMirrors += 1
                 found.add(tid)
-
-                if tid in missed:
-                    missed.remove(tid)
+                missed.remove(tid)
             except:
-                missed.add(tid)
                 bb.debug(2, "SState: Unsuccessful fetch test for %s" % srcuri)
                 pass
             if len(tasklist) >= min_tasks:
@@ -961,9 +958,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
         tasklist = []
         min_tasks = 100
-        for tid in sq_data['hash']:
-            if tid in found:
-                continue
+        for tid in missed:
             spec, extrapath, tname = getpathcomponents(tid, d)
             sstatefile = d.expand(extrapath + generate_sstatefn(spec, gethash(tid), tname, siginfo, d))
             tasklist.append((tid, sstatefile))
-- 
2.33.0

