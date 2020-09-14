Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.62234.1600092757427127806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eDagfSKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id w7so12755764pfi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EPMHfFL+09xLQGOC2pl/x7RjWrz80hq8pstCNBQhfuc=;
        b=eDagfSKXKf36v0NmnEDohc54NERE2ODqdFD2JO+glmJYsv+XzffUb5t8+3vpZzTEPb
         SmldD2cw1Ia5qCtzTAK0gWXwEfy4LCO1rPX5fdw0mTcOt5O4gcUB98AL4LglMHLUWtX6
         CXIIzxpdTsqqAgASal5bh77FMSG94Wg1jOsab8w48gFpgvdVxU82XWa52a1S4lqb2+lc
         8nFJVhk+NFhdQFQOGajckJPOMTo/GreDGmDX1dLGvDrb+xxUR+GAqTlDQAszPIPp7vQH
         ROHAhxld34xtFSmPmpSIVJ92Q+lJlc7ei5quxQXSRpWESEtNg0nVXWvt5Ic5ef+PnVo0
         RodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EPMHfFL+09xLQGOC2pl/x7RjWrz80hq8pstCNBQhfuc=;
        b=AHGSb90WmfonVy/cqbm99K1MWPOkh3KtY7bjVoHc6o0+SgVxLMLOVyCKkcC8VGDfei
         emf876cAlvgxf6S+srcZoYhE23OIzYJ4qA4DmjCKvnoE3Zswj4cYKgKZMpTw3TCiIMtB
         cLgeKePjJ8pZezNuYJwh0boVjOz9lXM73ly61uWajB62FEhjie2vUAuhQVW+7oFjKelR
         jmn84Kl7qrKY5LsjShxF3znPpbIVI/2qI6TRaiNnnl9Y7CWuprlUMGAxjwM3klOYz7JX
         GyzMGbKP6jld35zfkwbDQwVax2Wsrm4Nyl4cMDewuSiDWy2mg7MmlXytHfcu5AKYSW6R
         ioJA==
X-Gm-Message-State: AOAM533xzKGA43kiXintOUANc3mMq90Pc7v6lN7qukdqpF0yLOJH08MG
	uqMBFHaSoruRohJVNB15HL37VF+3x157uAC8Fts=
X-Google-Smtp-Source: ABdhPJzbHHbCOQo05DLXnyHYnpu3TAHiOGNrRcLoARHtUtvWGpPBD9hlgaMYJCRZA7K0CuX1ky+2LQ==
X-Received: by 2002:a17:902:76c1:: with SMTP id j1mr10959651plt.168.1600092756613;
        Mon, 14 Sep 2020 07:12:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/24] oeqa/concurrencytest: Improve builddir path manipulations
Date: Mon, 14 Sep 2020 04:11:32 -1000
Message-Id: <ea48c3f81cc978df0e130256c649a6b0fe41dfd2.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Its possible some patterns may cause problems with the current path
manipulations, make a small tweak to try and avoid potential pathname
overlap issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 889005dc17d3e3b8eadee907ee2c05b8ff613285)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 9baad58321..33557b1240 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -82,7 +82,9 @@ class OESelftestTestContext(OETestContext):
         oe.path.copytree(selftestdir, newselftestdir)
 
         for e in os.environ:
-            if builddir + "/" in os.environ[e] or os.environ[e].endswith(builddir):
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
+            if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         subprocess.check_output("git init; git add *; git commit -a -m 'initial'", cwd=newselftestdir, shell=True)
-- 
2.17.1

