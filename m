Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED64C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 19:52:57 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.1811.1645818776885565836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 11:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kStG2NEP;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id hw13so12824628ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JkAd83xsDWyVuV0jARnqvlEATURxi2+Vjr1gb0hH238=;
        b=kStG2NEPxbUv1YpO4SB3GAIx52UmiYv1RC+O3Mesr1urI+uDiDdFQk2oJ+S1iXDSiV
         z6xhNiPxdTbUpFheXYCy0XXOfBUL68konIVrZQI9/KkSMd58PpUb7IkCYfjKVeFB2kJn
         PRT6Zd1vVXSV1OYyMTkT1EHRjhDg84tUx5EQTnyKsZbS15uN0cUrEgDbusmxjc52M6U9
         KpXUEyyVhy7bxhqGaK/TusILt4p5vpIUX7aLFVCJJstfXX+MmINppyWKQkkRBgDkyMCy
         zFOJzRlD68s074eTzNEJl7r9FzWk0776LI2CVJbfZ24t1yCosszLSyZ6kCfCa216//eo
         pn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JkAd83xsDWyVuV0jARnqvlEATURxi2+Vjr1gb0hH238=;
        b=LBycuh0SmpyzU72N4qKBYUSUIfkVTVRzEm2kpdj0BRa7GiFdne6BrhI8eftX1vUG2J
         pOW6B7y3ZgEH/sthB7WH94O/v8dvmnJImzYL6uALkqxpvVjvUH1JVYAZVUhsso2SN7p0
         A3BjNlpWsZaFCGu2M5NTIe4uFAlNz7KJQvAQPXTiv3eZF3a6w/CFLKYWLOeeZeCDG5iA
         I/e8xNLhh0sh84YS/8ow+PMwNQJ8W5zZX42NZmS05OcKs++0FG8kEUT5DNIFwOCK/cv3
         Z9PkygwztQ7I1w5Bw7xU0CnLlEAfcwrgpWbdpjBcs0LOqqqo3vxzqtq6tbnEamwY9h5j
         cmjw==
X-Gm-Message-State: AOAM530UZet+np/RtY5E6ym58cd7jZbAsSt2uXi8CiPkzCq+lc0tjzdh
	/e2eLnxvsM1Ao2JABCIdnqU8VWji8Hs=
X-Google-Smtp-Source: 
 ABdhPJxuIn0fn3vAbkwDiY5lFts+A3hj3i9IOiP2y6q9C/AVSzQiw3KGaVMX0qU/y5gAIh3m2ws7JQ==
X-Received: by 2002:a17:906:1244:b0:6cf:118c:932f with SMTP id
 u4-20020a170906124400b006cf118c932fmr7262900eja.563.1645818775370;
        Fri, 25 Feb 2022 11:52:55 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d25-20020aa7d699000000b004128cfcc228sm1839387edr.5.2022.02.25.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 11:52:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] OELAYOUT_ABI: bump,
 avoid tmp/ breakage by removing old cross manifests
Date: Fri, 25 Feb 2022 20:52:51 +0100
Message-Id: <20220225195251.2433615-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220225195251.2433615-1-alex@linutronix.de>
References: <20220225195251.2433615-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 19:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162410

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/sanity.bbclass | 22 +++++++++++++++++++++-
 meta/conf/abi_version.conf  |  2 +-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 773902e619..9dd829512a 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -559,6 +559,23 @@ def sanity_check_conffiles(d):
                 bb.fatal(str(e))
             d.setVar("BB_INVALIDCONF", True)
 
+def drop_v14_cross_builds(d):
+    i = d.expand("${SSTATE_MANIFESTS}/index-${BUILD_ARCH}_${TARGET_ARCH}")
+    with open(i, "r") as f:
+        lines = f.readlines()
+        for l in reversed(lines):
+            try:
+                (stamp, manifest, workdir) = l.split()
+            except ValueError:
+                bb.fatal("Invalid line '%s' in sstate manifest '%s'" % (l, i))
+            import glob
+            for m in glob.glob(manifest + ".*"):
+                if m.endswith(".postrm"):
+                    continue
+                sstate_clean_manifest(m, d)
+            bb.utils.remove(stamp + "*")
+            bb.utils.remove(workdir, recurse = True)
+
 def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
@@ -577,7 +594,10 @@ def sanity_handle_abichanges(status, d):
             status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please delete TMPDIR (%s).\n" % d.getVar("TMPDIR"))
         elif int(abi) <= 13 and current_abi == "14":
             status.addresult("TMPDIR changed to include path filtering from the pseudo database.\nIt is recommended to use a clean TMPDIR with the new pseudo path filtering so TMPDIR (%s) would need to be removed to continue.\n" % d.getVar("TMPDIR"))
-
+        elif int(abi) == 14 and current_abi == "15":
+            drop_v14_cross_builds(d)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index 66df69bb8d..2a08b1208b 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,7 +4,7 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "14"
+OELAYOUT_ABI = "15"
 
 #
 # HASHEQUIV_HASH_VERSION is injected into the output hash calculation used by
-- 
2.20.1


