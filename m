Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.6028.1611624877395764544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 17:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rdsa+EOO;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: dorindabassey@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id ke15so20748735ejc.12
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 17:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gsJLDGMUJq9uQXch5mRE/gsc+0x4MHveczzHET5Zeq0=;
        b=Rdsa+EOOLrzXfyOMSJ8YsPCnnPEwFTbyydHtq4SVmER9L0CAIIzZYWdr4te2lvp4du
         +DZ6931VjOM0LlGYlIhxkpRoYH/2fccsHDSvA0GdrVBveh9pip38O0wLAF8/cJi7ABB6
         dsFqN3RmS4bB+wvVaV7F/bheBXFHOS6iOQM7rwPqj5IZMIiUW06Q3ctD0aBETyrP/xP9
         A2w7uk8e49b41l93AmXieca4aMXXisiQy02tfbsXFv/kR8078GbT0XM9W0Zxx6qtMcFG
         E3l0trQ956cW/lW+PwPGokZfG6DdncGvaWVcLBbpr212x+hZzfxA4dcQ0FkHiaSf/Z39
         MWeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gsJLDGMUJq9uQXch5mRE/gsc+0x4MHveczzHET5Zeq0=;
        b=AzeTSiFP7LhM5jOcFsinWwSDN48Wd6gItplZLu7aHj7rwM8qWgt1DwwzYz5TShBVIy
         6fSVg9w1tjg5c3w0TQ6yTcUEqQJcLGKV+gsc9vpA5UWG9kJwDjLCrnXZOrwpruhn097/
         pn4U0Feu4dOyq7TUQ7EWVULl8LR3HUCWsOktVw5hgT2CRIwV2Wi3PZ3gE75UVaRpbzyx
         60pG/DXUeXh3M3nYDpxKmHf7gKFCLr5ETotWFOTrut2dp62SAvmNQV59tfeHgmkbXWuU
         yj/78BoT3nGVyj9uYphMjA8KqkW1D8JtO9oEmGVP04ciPujVQi15Fi4LBVFWucPzaZ2J
         bI/A==
X-Gm-Message-State: AOAM531JPUdAdKIBdKbii9sUvQSIFZfHIowvupi3tdB2F4qoZv8gqPol
	q27G3fmVYmdYebX+EWReV+1L/e5puz7JPw==
X-Google-Smtp-Source: ABdhPJxU9f5owQ0Y6HObRQXkhKCA59NTjovriapniLoDsOaH32xHhaRiPj+ShJvLDNdcQ5zgOolBHg==
X-Received: by 2002:a17:906:f98f:: with SMTP id li15mr1971218ejb.123.1611624875586;
        Mon, 25 Jan 2021 17:34:35 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.29.84])
        by smtp.gmail.com with ESMTPSA id v25sm8449972edx.49.2021.01.25.17.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 17:34:35 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 1/2] sanity.bbclass: sanity check for if bitbake is present in PATH
Date: Tue, 26 Jan 2021 02:33:59 +0100
Message-Id: <20210126013400.9752-1-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1

If a user executes the environment script instead of sourcing it, there's an error about an empty element in PATH. This is because bitbake isn't present in environment variable PATH. Hence, this patch adds a sanity check to verify if bitbake is present in PATH and if bitbake isn't present issue a warning message.

[YOCTO #13822]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d134b40a87..e527c13746 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -787,6 +787,11 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    #Check if bitbake is present in PATH environment variable
+    bb_check = bb.utils.which(d.getVar('PATH'), 'bitbake')
+    if not bb_check:
+        bb.warn("bitbake binary is not found in PATH, did you source the script?")
+
     # Check whether 'inherit' directive is found (used for a class to inherit)
     # in conf file it's supposed to be uppercase INHERIT
     inherit = d.getVar('inherit')
-- 
2.17.1

