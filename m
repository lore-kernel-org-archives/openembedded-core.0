Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.8168.1623853715465676741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:28:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cQz5RL4T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so1814456wmq.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6cnC4QKa/TWUquSHVx4of+Jgtrr33RA9RHvSLOB6nw=;
        b=cQz5RL4TwmiFyZtf/lbItj1aYuk5Ig2qenAibeOWBgzvlviD2F6leyS0JOVxywIhU1
         S996ebMPUsPpqeosEpOFLBLAzG3hcHqWgnOegIte/RSmOMkMt3xrpdTI3Wah1Lz+Zp1l
         OihHX/X7hEj1PIcURCkUqoNbe5g/WEe9RPQFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6cnC4QKa/TWUquSHVx4of+Jgtrr33RA9RHvSLOB6nw=;
        b=MB8itD4a1aLctqHf8aokotvFSV/TlNRdoTuDNZS3+Je8cKa1NeaCEixgGgPKwJxOlf
         AUMPd28UC08c5u1BAoUa2hPfyR8+0RJ71yY1aPRwgpTLYMRvxHnKxMQrppdCCGs9LUwX
         v47gJTJFjDQsSFSzQENB5C+6DAzzxzp42MwS3HrAw50FHpZs3k4+jTympNbZYvKq+hde
         jwQxjy/koQJJve/zXLXZeU/wGA/HXVgWEgHiZtOopodXTL+0rUsDne8DxZxrVTqU1Hb9
         UnIpTpA7jH600qMq6yr33XBuaFZHwGAsPTZH3FkgZi6HQhZl7a0wtb3EqcRlP+UiKtdM
         orZw==
X-Gm-Message-State: AOAM533i9NnMZ12IZBVgXpCXxbD0XZXBDPlRjy94evS+NvDpZ1HF7qyg
	aSBA7WGROVEYwKRpR2k2LBeN2htUzS6O5A==
X-Google-Smtp-Source: ABdhPJwazBgb3xVLkYWB8K0q4tLDenDQsfYMqQoMpGPcPEHdRXgk59rcdi2/8v/0dyeIiWcbfUPofQ==
X-Received: by 2002:a05:600c:a4c:: with SMTP id c12mr11527956wmq.38.1623853713608;
        Wed, 16 Jun 2021 07:28:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:31b6:9a4e:bc39:a574])
        by smtp.gmail.com with ESMTPSA id v16sm2463928wrr.6.2021.06.16.07.28.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:28:33 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Use python3targetconfig to ensure we use target libraries
Date: Wed, 16 Jun 2021 15:28:32 +0100
Message-Id: <20210616142832.3341934-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We've seen some reproducibility issues on the autobuilder in perf where the
size of the python module varies slightly between systems. After some head
scratching and removing the --quiet option to the python module build,
you can see it using -Lrecipe-sysroot-native in the linking commandline
for the module. This means it is linking against the native library
on systems where that works, skipping it and using the target one
otherwise, probably with warnings in logs we've not seen.

The fix is to inherit the python3targetconfig class which ensures
that the target sysroot is used, then the byte differences between
the builds go away and things are sane(r) again.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2dfd798ef7d..99808d636b3 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.30.2

