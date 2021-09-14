Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.7260.1631609829918906290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 01:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=acIXyiXk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id s24so8595405wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLSt+fJWOwUKAan7muk7SrZxI3IfIU1y/Pvnx2Z6aIc=;
        b=acIXyiXk2N0LjRfeGMTbnjvhRr5HV8UcWMDrsiFCsREedJjRFaStRmxOP4CS96OF/E
         tCd3tUVmgBpnvOUFrwABfSId+RNxj9WzJN8hoE7pAtgee+14w4iWozuxSrKPzx9GL1qF
         kR+QKqPxON1O1os0Eg8gb+FwCwmKy6dKj5JoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BLSt+fJWOwUKAan7muk7SrZxI3IfIU1y/Pvnx2Z6aIc=;
        b=7z6N9gNdDk5EmWwkyikjcZcQavgSoHB9wtwAJghglTKK3ovPiqXpk6oBtZo2xceA+k
         yHX9C0c2LK/4A6V+SuUhigDcME8Wo/9wPUGOGuHMcHkk+fudjHmYqokk5diEDOBq3WIa
         t/tE+tzxhPhPTngPXI5FLXBeXxNmJYYKRbqeWWWhwOerIM4NyHz/B+aIi5mQIqbVq+1F
         Ku7hiPcBXC4iwDJmquJ19FaIU3a3ga9aqLwETdyRVHoAxU/lJ7R+OdlusvYf6la7ZylD
         NZxxPwCecXpzCVkNq4cD6+G4pduXE7CkaUD96ygiTnCVv54hFkxDRQfs1z2zTQj0H+1b
         s8tg==
X-Gm-Message-State: AOAM5339cUPYOnnb44PH7419T13z6ABiN0Miwb3sGyw/cEjOl1yUAZ7Q
	JufNUBwkwIAE7I9yqaRyJK/CFInZ7PdPtrxI
X-Google-Smtp-Source: ABdhPJw80b86zDc3FcgmZLQaYsDcTstl6mtERMpLXPrWqRfx5dGk4W5+HVkcSt7m4FDGlzkloZV5ug==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr940059wma.72.1631609828198;
        Tue, 14 Sep 2021 01:57:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2da1:111a:66bf:1f1])
        by smtp.gmail.com with ESMTPSA id k19sm484683wmr.21.2021.09.14.01.57.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:57:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] package: Fix pkgdata determinism issues
Date: Tue, 14 Sep 2021 09:57:04 +0100
Message-Id: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkgdata output isn't entirely deterministic since the sorting of some of the
variables can change. This likely doesn't have any real world effect but fix
this with some additional sorting as it allows better hash equivalency of
task output.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3a78e48da46..460997ad543 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1690,11 +1690,11 @@ fi
                 val = write_if_exists(sf, pkg, var)
 
             write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-            for dfile in (d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split():
+            for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) or "").split()):
                 write_if_exists(sf, pkg, 'FILERPROVIDES:' + dfile)
 
             write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
-            for dfile in (d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split():
+            for dfile in sorted((d.getVar('FILERDEPENDSFLIST:' + pkg) or "").split()):
                 write_if_exists(sf, pkg, 'FILERDEPENDS:' + dfile)
 
             sf.write('%s:%s: %d\n' % ('PKGSIZE', pkg, total_size))
@@ -1797,9 +1797,9 @@ python package_do_filedeps() {
             d.appendVar(key, " " + " ".join(requires[file]))
 
     for pkg in requires_files:
-        d.setVar("FILERDEPENDSFLIST:" + pkg, " ".join(requires_files[pkg]))
+        d.setVar("FILERDEPENDSFLIST:" + pkg, " ".join(sorted(requires_files[pkg])))
     for pkg in provides_files:
-        d.setVar("FILERPROVIDESFLIST:" + pkg, " ".join(provides_files[pkg]))
+        d.setVar("FILERPROVIDESFLIST:" + pkg, " ".join(sorted(provides_files[pkg])))
 }
 
 SHLIBSDIRS = "${WORKDIR_PKGDATA}/${MLPREFIX}shlibs2"
-- 
2.32.0

