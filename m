Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.766.1614187542814204094
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 09:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iPNGcnKD;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id s15so2019582qtq.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 09:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/uH3LtIX0gBK4hLM+NbYZnikHxUXKJfuQGEXTvqIYbU=;
        b=iPNGcnKD1Ez2rVvwxQqsnHcHuQuavL2m/on0W0ujjOx5UTLtLMd1lqwCqrLCiJ6+Rw
         woterONeet0GvVz8f6KcMEHL6aiuTFTeLlDNvtZzsLi+UT1ut4mICOVxkVSTTBvzI51v
         MP66gBgLQFFUaBXmdR+B36QrfpTFM2EQh9uw/HzLCQI7FOdbImngWZ62IL5TctVhkQl+
         R9fl3b0obQF38PTJuYOaH2Ui0cqduSaMMX8R32WhNtM4TUItXAjaiVHja5J4tGMmagsp
         8npOPKr055WiluSJXdj9m3Jjj6X0CAaT1LHFeZMmVZE1tRV8wL9C4RxavleayH3qtA88
         AyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/uH3LtIX0gBK4hLM+NbYZnikHxUXKJfuQGEXTvqIYbU=;
        b=q1u/l8QfwsX1eh8an9JiePuEiC536YEbhUdOSZ+APFwRqMjtJRXWveNN3q9bJX1U+J
         kA74gzlHTjwIXl/v16Nf7txswg/Zy+VTBCCmxrll4He+X0xm9/rQElAad0Ro23o3IFmm
         wp8WsfBeV9PguIMoAu5NMkJONNkDHSTOJ0LbSSRL4zLaJb3c/VCfOfoBN2hSma9M1KDk
         eka4lTkah58ICJ73TEmYqWuBk3K+I76QK88WYl9+7lx4OMmbhstps7MyVchnxyqfW65Z
         odALp67g1AcJePuhREMXn44tV9n+KbFuaFWO0TcfOIlPaAQBdPDE5vnF+EEUJKGjwPFo
         2NJw==
X-Gm-Message-State: AOAM530ucYQR07WJ8Mdq2/07nrTSsNPk1uMeFP6lnTasnzoqW9gfyqNb
	C6oYIjprnRN7qMUgWr159vtm+Ujyo0w=
X-Google-Smtp-Source: ABdhPJwdK0iKbwGxzsvyD7pGLtbOzW50sOjmWv+GT8YOT4R2OMe6LUWIbw/PHivilHekkRDsENIDEg==
X-Received: by 2002:ac8:379b:: with SMTP id d27mr17489992qtc.89.1614187541552;
        Wed, 24 Feb 2021 09:25:41 -0800 (PST)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (modemcable249.105-163-184.mc.videotron.ca. [184.163.105.249])
        by smtp.gmail.com with ESMTPSA id k129sm1975597qkf.108.2021.02.24.09.25.41
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 09:25:41 -0800 (PST)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd: fix importd requirements
Date: Wed, 24 Feb 2021 12:25:40 -0500
Message-Id: <20210224172540.420223-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above the importd config states curl, which does not
exist in PACKAGECONFIG. Adding it results in the following error
(and then misleading compilation failures):

    WARNING: systemd-1_244.5-r0 do_configure: QA Issue: systemd: invalid PACKAGECONFIG: curl [invalid-packageconfig]

Support for curl is currently enabled through journal-upload:

    PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"

While it might be more appropriate to deprecate "journal-upload"
in favor of a "curl" PACKAGECONFIG entry, simply fix the importd
comment for now by stating upload-journal instead of curl.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index 8c95648ca0..70700820d7 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -131,7 +131,7 @@ PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
 PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
 PACKAGECONFIG[idn] = "-Didn=true,-Didn=false"
 PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
-# importd requires curl/xz/zlib/bzip2/gcrypt
+# importd requires journal-upload/xz/zlib/bzip2/gcrypt
 PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
 # Update NAT firewall rules
 PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
-- 
2.30.1

