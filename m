Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.21196.1611496612271117211
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 05:56:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RVLa3vAB;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id m1so8941124wrq.12
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Jan 2021 05:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/vkuZ5XkUCYNLL6Xm9909wzf0Lad/2tlqM82R/uol5s=;
        b=RVLa3vABnVYntly4lyuRgpZrhQtS8lNRNVay1DFIrCR9DjQpBAKHJgtympENKvr/gv
         LE0NhpTIZDvzfSGUWGdmr5oXGhlwKHX2vwD4rMRq8FFt3FNP5IJ4pYjXcbLBlBWtNHRk
         SvGDf5bPcTIZNaIdQg+RiUAD+XxLOGble4SKtfzPyhMbTTGUIfNAwjziO6ljvIHRE8Fq
         b2WyMunOu+voXMoq6ngACtSEIRroNm5ypPEJpHK+tea4IILI5G/7c9pwu+2eq6NWOgdU
         jqlfBFOt9HhSGRZOlEz4CHRakC7KX5tj0a8ZH4lSARfCaFRRRcOgvgD09mFxboGmJD5B
         LLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/vkuZ5XkUCYNLL6Xm9909wzf0Lad/2tlqM82R/uol5s=;
        b=n8jFaFapDuVXYVs5tmnw++YBZb6xxLd9qcbl25QlyHvO8hecpZWrHNQ4qXPALKKXeP
         mv9LWHP6gqiRks+4IrM8L1y02YL/TN2S63MmW5Oip/sM5buN666ZMqDKFfAmyylOfcTD
         phYFNo0N0NgyhhkPibDGaaygway7lZ8kE/4Jj518cQpve9Lwt0ir0FjKS08Exjw0s6aM
         7F1ln0On3qkZBrnyC968n0RjEi9L6/Dfg5W03U6LVGVMPtIg1G7z3QwJ5xWOC85OyrqW
         0NHqCRiaikfwtdTiWzTOgVyrBcv8lSHdv39iLw/wQZaI+NvQwfyBFEc9E0tjFGVP2t8m
         rdyg==
X-Gm-Message-State: AOAM533stqUM6YHcfJBhGKHoJrfZgMuBLkJ6VxeovfU6ObzEjvPRnJwO
	kD2xPQ7Lw7caVvh01D0EVy7S/UDB4LIKsQ==
X-Google-Smtp-Source: ABdhPJxveHN5CnLS78Me9Ts0Zz7DVI+SAQ5Sx4pF4YKQ11RpBvVIzEsQzoWKsvaJ5V07lHo6D4CyUg==
X-Received: by 2002:adf:8145:: with SMTP id 63mr2836382wrm.8.1611496610622;
        Sun, 24 Jan 2021 05:56:50 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from localhost.localdomain ([197.210.64.211])
        by smtp.gmail.com with ESMTPSA id x11sm17650186wmi.4.2021.01.24.05.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 05:56:50 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 4/5] sanity.bbclass: sanity check for bitbake in PATH
Date: Sun, 24 Jan 2021 14:55:58 +0100
Message-Id: <20210124135559.21894-4-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210124135559.21894-1-dorindabassey@gmail.com>
References: <20210124135559.21894-1-dorindabassey@gmail.com>

added a sanity check to verify if bitbake is present in PATH

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13822#

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index d134b40a87..2040b48595 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -787,6 +787,11 @@ def check_sanity_everybuild(status, d):
     if "." in paths or "./" in paths or "" in paths:
         status.addresult("PATH contains '.', './' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
 
+    #Check if bitbake is present in path
+    bb_check = bb.utils.which(d.getVar('PATH'), 'bitbake')
+    if not bb_check:
+        bb.warn("bitbake binary is not found in path, did you source the script?")
+
     # Check whether 'inherit' directive is found (used for a class to inherit)
     # in conf file it's supposed to be uppercase INHERIT
     inherit = d.getVar('inherit')
-- 
2.17.1

