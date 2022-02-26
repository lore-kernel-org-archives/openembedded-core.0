Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F60C433FE
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:02:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.6613.1645887742614471761
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EmgJH0xO;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id p9so16351548ejd.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxNHs+XDED+hvkMqXane4i1xP/emvOLGAcF7CS6PC+g=;
        b=EmgJH0xOFznRcRQk2LBbGeg6OC8cQSP9zMFH2u+KmmxEmXmE9b3t/GXTwgUwKsJrHt
         Lm8spWZqu2MxobP/8uwIFWfZAHLvtF0uxHV8zw2gR4ACWsP+lx6d0Ib9zmV6QZIbvmJE
         IS673NUU/EUZAZS1xTl16pCcJBOVbRiwwtZ1i8IqAFSvNK1mpkRWKLzb96kAaspL6d+f
         polJjVaDVNpVFEh/mVeP9k6WtTZzDXkPcI4oXheyH3BJMA+gS940z62GKDGWOY+DqtAD
         B7KUBHVsJ0kw6sZUueEG+OQKghB+6+gPCfP6ZmOwY0lmzIxqllbo8EMzAi7N2cgqmZ33
         OrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxNHs+XDED+hvkMqXane4i1xP/emvOLGAcF7CS6PC+g=;
        b=IgudaNgJ67//QNiZOiHs0bTVocdKG+3SC7rdxTtyRinhZyfhRJlduwo0aHZwFOShWs
         t4IJDfmOJTEEqYQ791o1k2tAxxRzpSMYMByB0u8FzSSs3JqTpQGqDMO5BbWYQGmsUFy6
         iJCyq3mqL+z2clXWQjJVm1vRfzPeS8RJVCTIOH7lCV0NpftlfMfMTC92uDZoh1/tVpKB
         jKxGNY0q0qd0lb/Yf7CjolfaxW6t57hQcpBOPX/MYVbr06LHDydIJzf1ka0muAs4Hcn7
         tj1An+FC9ak84OcMKFAuIQWC0y8GmL0aq4Z46s0BwHGAxkbf53FQMAsJpEd6nRrVteFB
         AC1w==
X-Gm-Message-State: AOAM53131a5Kayr/BFIT4ox/i4y2463/SOtfVKOuUJW0C9qe+L/X2cAg
	DgRAxwjK+v8i01qiWkvKJd2ACNF3FoE=
X-Google-Smtp-Source: 
 ABdhPJyG08eb212Dhti3QKd534tP4wJ8VjBabvEPctyva7ZgpByE3jyj/96NGKbuXly2u01tJApKdw==
X-Received: by 2002:a17:906:b757:b0:6cf:86c7:a301 with SMTP id
 fx23-20020a170906b75700b006cf86c7a301mr9535721ejb.431.1645887741065;
        Sat, 26 Feb 2022 07:02:21 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 hc43-20020a17090716ab00b006c7622abe73sm2306847ejc.216.2022.02.26.07.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:02:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] OELAYOUT_ABI: bump,
 avoid tmp/ breakage by removing old cross manifests
Date: Sat, 26 Feb 2022 16:02:17 +0100
Message-Id: <20220226150217.2793953-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220226150217.2793953-1-alex@linutronix.de>
References: <20220226150217.2793953-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 15:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162426

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/sanity.bbclass | 23 ++++++++++++++++++++++-
 meta/conf/abi_version.conf  |  2 +-
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 773902e619..92807dc88e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -559,6 +559,24 @@ def sanity_check_conffiles(d):
                 bb.fatal(str(e))
             d.setVar("BB_INVALIDCONF", True)
 
+def drop_v14_cross_builds(d):
+    import glob
+    indexes = glob.glob(d.expand("${SSTATE_MANIFESTS}/index-${BUILD_ARCH}_*"))
+    for i in indexes:
+        with open(i, "r") as f:
+            lines = f.readlines()
+            for l in reversed(lines):
+                try:
+                    (stamp, manifest, workdir) = l.split()
+                except ValueError:
+                    bb.fatal("Invalid line '%s' in sstate manifest '%s'" % (l, i))
+                for m in glob.glob(manifest + ".*"):
+                    if m.endswith(".postrm"):
+                        continue
+                    sstate_clean_manifest(m, d)
+                bb.utils.remove(stamp + "*")
+                bb.utils.remove(workdir, recurse = True)
+
 def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
@@ -577,7 +595,10 @@ def sanity_handle_abichanges(status, d):
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


