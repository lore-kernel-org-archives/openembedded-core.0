Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2527CCF2C4
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 18:25:22 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1814.1792261520874408710
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 11:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pQTkzzzH;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35943f55c06so1261701eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792261520; x=1792866320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0hoo1FfbYslCgZ2iNgWt3/tBgu3pquytFwB+DEu6uc=;
        b=pQTkzzzH9uXUeA72LEk/aq4+H8aq8ksHG13gkom7I1ZtvComwABmjChbAeQe2JX88M
         ika+XJmUB8KdGr3tXENeogS/Hvi3/sz1moy64BcNUTgpiqzubr9m+15azrwbng2tV0FN
         LK5NnfvmSoCnwEceI/ftinT8DOJRydQ3Z8fJ5psWtbZldN6mERZgUHqskLYmF25GfaRS
         0V0gH5uYGgNo+6RUN7SU50fhZheKUg8Y71mlwrCCYDjV3MOtGcHnwa+enjFZ9kTku3Ne
         ZNACvI6r1x4Z9Fy4X9lPsYxmRbgdo38Dy2woXWMXzGjWy8kTfNEdrLPsZIWAXWTmukoa
         FqNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792261520; x=1792866320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0hoo1FfbYslCgZ2iNgWt3/tBgu3pquytFwB+DEu6uc=;
        b=JFUrnN6HlxPP+F+AwOhp40BwstIdsPUoK1PFsWcU/7eQjNi/43zUAuy+mcdiItfJjH
         Lh+tV9Li7a8Fc5ezXhJXlhLH4HPNqMICbnPh4857msCym5m6jfewYn221O0pEtAgjWlr
         P5XLlX+85jBrqT3bNngouZG5aHj/WeQwHz7fYmWPpDFAl/oFRCsLRiVHLgz8OKziRQGO
         cki3MepjrBdYgSxYs8RhIV/5+9ijHKBa9JlpEdhvwKdKJVWWKL6hGN/Fy6XQ2yqJ098g
         yFoPoIORGS+O35ibhh4tibVo8LFortN6iSHHrfawTuLYvIJhoKA2oLdi162y3tp6Ez8b
         X0Ug==
X-Gm-Message-State: AFq9FYIk3RXr2bDJEco7g6WBlbopwtL4z68sNZXg55yq+ZI9Y3XQMf2l
	qgvuf8LArN29Ed5xAAFLa0vkc5dSXw1opGxKgOL51vxf6kfMdWeqM298ZXq+ZIXjrtM=
X-Gm-Gg: AYBFou0F0PlPSYX/oJffwrhHcR57OkOP4zPzPF+AMOTBACLcAt3/7EXVtUDhKubG/TN
	YIqd8cC8XhOcpcj0Qbv9y6yxmXNNBZ48nWyfV22l5rCYv5Q74i088y9ajg2Zk3+v3my1YRcb5iB
	BS+ZCPzDWJxwB5N8P5GVBpBALYoFxsnir3a2oletZ1eb1fbktuvY8YFdiSOagJVl0g98eG9X3Nn
	eMuYRA9LQlRdVs0PknuY/DVMRYsFOTMj+HB0HtMJKKmvgnNC2LGRv8LGtyEWn6HL1y8Zvg6vlZy
	rZH03QrBBgGnRz7OH5Unh+oGiF6GJBzqQn5kbYd5au/H7+VW2GafHkLvShsl3G3hR+Sb3oD+fSe
	HrYP5TMGkXmyex3rG4/7keZyCPkLnwOm9HcrAndUhIafyuTLBgZjbiU36e7xMCSkbUk1BCXqc1d
	2pE2IveCjmc5GQab05tirpTvz6xe1BIZWm3Y6WNYSflPxVnkQKNAOopQwYkXq16hX7vIu2OrQAP
	6vtfApi5C4ssJg6bs0S0tP748ISlOuU8w1VQkloH9Eu0UyOGp9QE0tSoAKIXGD7BQVyqdl5Ncnr
	ymuM03I/jq6103slI4L3AkGNYdNv4SaSt5ptHdheGDpzD4/Vr5HMH5ps1PzUBd1m6vJek7kJukV
	KecYyioWW3YlUeUhaNpws0sZfhUTzGuBo2mjRkL6yKtj6cfAyLLqjnUtrbIPjF6avo2FvyrGEAi
	4Gtigf0q53rQHfrjtyK7IjVs/IciBXcXulu25vnM2KXD814W9tpIxO04mE
X-Received: by 2002:a05:7301:e2f:b0:354:53af:7f2 with SMTP id 5a478bee46e88-3602ddd1da9mr8614073eec.11.1792261520121;
        Sat, 17 Oct 2026 11:25:20 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm19173325eec.8.2026.10.17.11.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:25:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 3/3] python3-sphinxcontrib-applehelp: Add missing runtime dependencies
Date: Sat, 17 Oct 2026 11:25:13 -0700
Message-ID: <20261017182513.3727673-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017182513.3727673-1-khem.raj@oss.qualcomm.com>
References: <20261017182513.3727673-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 18:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248096

The applehelp builder imports plistlib and shlex, and sphinx loads it
by default, so any sphinx app fails to initialize on target:

  ModuleNotFoundError: No module named 'plistlib'

Seen in python3-breathe ptests.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-sphinxcontrib-applehelp_2.0.0.bb          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
index 544b5ffc09..7be829a0d3 100644
--- a/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb
@@ -7,4 +7,9 @@ SRC_URI[sha256sum] = "2f29ef331735ce958efa4734873f084941970894c6090408b079c61b2e
 
 inherit pypi python_flit_core
 
+RDEPENDS:${PN} += "\
+    python3-plistlib \
+    python3-shell \
+"
+
 BBCLASSEXTEND = "native nativesdk"

