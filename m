Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.487.1616012705158008902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 13:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ozTWvKLf;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 205so291489pgh.9
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FeAoov9CYT1Is1Fq5GsDSB1Re6SST+NmNjJAnAjriGI=;
        b=ozTWvKLfsXkzHl5cYeMB9lQHF2qCaqfrV/TqdjLfwtMyK2/699d9f6R/UAUg0Ghj90
         CegJktUwE/sW6KLBL6seWk/BR2XR5xzsd7+LA15il+k8No2hA6lnUlLurZOxLHyAq3aM
         o5lAT3DVmxgRPR/G669f9mm3uVZTkjLhWNSVqcbR9GANEmLvtcW5GEMOo6+NBWRykgJw
         L6hUCDspRaSgWwAlg2dlhjsInh++Q5NujroKM3ZSYhktw/P6RV6HAgddryUkPsHA1a74
         +SNOLMQvkf9l3r15VLrS3CmhJOGwmYgPhWkfnYFOktWnoqrlTzial6fqRDGk63ZBhB2W
         57oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FeAoov9CYT1Is1Fq5GsDSB1Re6SST+NmNjJAnAjriGI=;
        b=Dt4fhVoE+JwyHp6XbX14zN/DnRg6FobwnR20IChFjMEWAdGto0hHLAfFmIcjsmmGZE
         0+jyT4ne1ELeLH+0soWxweBGCN1yNx5YOPmQWiWuS3SVapi2CyYSydblqZkXopRPwGSJ
         r2hlRskgfdnpyMxetFnk0LsB0LBeINIgSNC4lE6wXrK2F6ndLOoDnF/SGa5nFVeJSsLp
         zg7VepIS+V0UbzCFGsclYF4I60Q/GDsEG3x+6RdNQvmswU/uaM859zA23SBzMiQ1h/3/
         E47O/EChWhtUZm7CpMM1/XiumNxpiRv43h30ffEHnfE75x8stW5Bxx5bS6+H0zEEQs+C
         9k5w==
X-Gm-Message-State: AOAM5315pBMAUtgUqW2S3asL+ZUONb4sTXNc8DsNFfXeggTNadBnr28i
	R/hxP+n99CU90c3X8wiAH1YCRn/c2WcxjQ==
X-Google-Smtp-Source: ABdhPJyrdBpZeKImVGbu4S+fj4otWYEmoj/bacpmOTG6NTC/33TYprPzeTlmoPSdyDUGFqmm4LrWBQ==
X-Received: by 2002:aa7:8d04:0:b029:1ed:2328:f677 with SMTP id j4-20020aa78d040000b02901ed2328f677mr726144pfe.26.1616012704346;
        Wed, 17 Mar 2021 13:25:04 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id m7sm3922045pjc.54.2021.03.17.13.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 13:25:03 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] webkitgtk: Add packageconfig to chose between size and speed
Date: Wed, 17 Mar 2021 13:24:58 -0700
Message-Id: <20210317202459.213685-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210317202459.213685-1-raj.khem@gmail.com>
References: <20210317202459.213685-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This packageconfig when selected will use -Os -DNDEBUG instead of -O2
-DNDEBUG, which should generate smaller binaries and libs but perhaps at
the expense of some runtime performance, defaults are kept as it is

size reduction when enabled

--rwxr-xr-x root       root         23503680 ./usr/lib/libjavascriptcoregtk-4.0.so.18.17.13
+-rwxr-xr-x root       root         17536152 ./usr/lib/libjavascriptcoregtk-4.0.so.18.17.13
--rwxr-xr-x root       root         53314616 ./usr/lib/libwebkit2gtk-4.0.so.37.49.9
+-rwxr-xr-x root       root         40195672 ./usr/lib/libwebkit2gtk-4.0.so.37.49.9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
index 36d33f550d..ff4c496e2a 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
@@ -59,6 +59,7 @@ PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 PACKAGECONFIG[woff2] = "-DUSE_WOFF2=ON,-DUSE_WOFF2=OFF,woff2"
 PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
+PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
@@ -70,7 +71,6 @@ setup_python_link() {
 
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
-		-DCMAKE_BUILD_TYPE=Release \
 		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		${@bb.utils.contains('GTKDOC_ENABLED', 'True', '-DENABLE_GTKDOC=ON', '-DENABLE_GTKDOC=OFF', d)} \
 		-DENABLE_MINIBROWSER=ON \
-- 
2.31.0

