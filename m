Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.207.1611859375744068874
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 10:42:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gMDGGvFG;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id l12so6466431wry.2
        for <Openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 10:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FqxUaDXqudvtw0B/Qplh/SuNTlQ0E8FtHefm5VarZ6k=;
        b=gMDGGvFG/qIUJ/hJWqQUF2VTxqo8JjUsbSHtyoc1nl8zIxgAxIiaApiw1u2TfBp/ZW
         l9I3rzLhHQHZNlaTCwYyz56H/cXeozk7caY8kh6k1V+4aJ6b/Jh9vI2mlGR8QasaFDZ7
         Xd4dyEuABtKtTYHosMuRlrckTz34nul2rMpSlILcx5QW0RB4VOqrZshR63K1x80V3Ig5
         epP28vUdZ4bXUnz9PgOcSz3GIiWqf74zAY7exlJLHIGduwD1mGi7GB4Zlbxlf2UKVtQa
         ZgYx9JH9P95BHNvRO8ed3Fa5qdiBHaZi3eyn2Qfzl3TANWga5A0hm9qN3FTHPF893sPX
         SuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FqxUaDXqudvtw0B/Qplh/SuNTlQ0E8FtHefm5VarZ6k=;
        b=D3stMnUIVESwAvq5Z8tBQ8qEmHUNcypK15sh0wi5NLIl5DtwOmats8fLxeYQkhtf5Q
         b2Ds0B1Gjay1scCBDvVaz7pr/3wAOdW5S3ARcGAEmZ9q3DlL+S68bMAdJwGBHDuOUM2m
         srclhPHULjBX7yIA+jYzqu7YPMuVGigfmln/Q2V51mQe6cEKnU+AW9nLbtMNV1E9hlkZ
         hhaL4wbFYmjP8s2aAVyQz0kFB5XWlayyfztajgpyV+zlVq3kGkz5KfpUvc1NbnqUlZkB
         mJa4e9Jkr4pCTrEgAfleLKtthBafsRvow0uxPBJF55OG6VOo2CnXjhooXCfG1xw4FfuX
         52OQ==
X-Gm-Message-State: AOAM530TwYXfKVLm1omJx8YpfRJWiXjH6P+SimP+MJNk2n+dYdRKoDmc
	Fs3FPDDoyCMaKve90FXYHP4a2AQSlsttCQ==
X-Google-Smtp-Source: ABdhPJw4wgqi0ZyVZczQ8NHvLthz/z539WQFay8eW0QlGWamMPU04Cj26ISNhUNz8xBO/LJP3tQiJg==
X-Received: by 2002:adf:f1c3:: with SMTP id z3mr529817wro.96.1611859373939;
        Thu, 28 Jan 2021 10:42:53 -0800 (PST)
Return-Path: <uvv.mail@gmail.com>
Received: from slackware.local (dslb-002-205-007-157.002.205.pools.vodafone-ip.de. [2.205.7.157])
        by smtp.gmail.com with ESMTPSA id t205sm7020683wmt.28.2021.01.28.10.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:42:53 -0800 (PST)
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2] npm.bbclass: use python3 for npm config
Date: Thu, 28 Jan 2021 19:42:46 +0100
Message-Id: <20210128184246.68716-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python2-native executable is not available in sysroot anymore, which
causes compilation of some nodejs modules to fail. Switch to python3 as a
default python version.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/npm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index d3dd1a9ab8..79f55febcc 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -17,6 +17,8 @@
 #  NPM_INSTALL_DEV:
 #       Set to 1 to also install devDependencies.
 
+inherit python3native
+
 DEPENDS_prepend = "nodejs-native "
 RDEPENDS_${PN}_prepend = "nodejs "
 
@@ -248,9 +250,7 @@ python npm_do_compile() {
         sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
         nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
         configs.append(("nodedir", nodedir))
-        bindir = os.path.join(sysroot, d.getVar("bindir_native").strip("/"))
-        pythondir = os.path.join(bindir, "python-native", "python")
-        configs.append(("python", pythondir))
+        configs.append(("python", d.getVar("PYTHON")))
 
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
-- 
2.28.0

