Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.1209.1602189563972901058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 13:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VAUDhxVW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id n15so8023617wrq.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 13:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BM3Mzs/5Ac2hRE6WiLtYwyxBLgOW1c1iQI3fA2/01L8=;
        b=VAUDhxVWB1JvV2h2h74EUuklBiyxkqq+nyzXSTBV9kIDHXAECg41JEV4Jx0xeaPL53
         7wd6GFUTDUZJMdUpKGbHYbClhLiblwVTlKC8/a6nAL6IjcrZLDPsAfdrICPPxXTDBm9P
         zW392YLWxrY0BzGgnFKrUL6bzC73LSghCq4Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BM3Mzs/5Ac2hRE6WiLtYwyxBLgOW1c1iQI3fA2/01L8=;
        b=oexRkzz9iE/eLtIeM6JIn2hqJC5aUPrJHxEPrMkGGzoOiy3UmTxZ80IAiLWrulwDnT
         MErYReBk8bo68r3OWETNKi2Yp/tV6RwhloLV6NnqrXF0DvJp2tNFSTaAdpa9Xxd73Uja
         H68EoMgHsiLkk+Xqrct1MfB6Y8xMnBZ9494sriZDxSeBftrMwzXGXyuQsv6/Q/P9fteu
         Itu7v9ceIae5KWhEzEpYDWcS8aLT/AVipcv9KHfjWrFTxtQpFkuKO/XssKuKhYxpT0AJ
         BQJ9msPlLLUFY+3KYD/jVqFYZD3NYwhlz8oAMaxbvWcJM3Gote+apDBgR8lBAUQolEfq
         tM9g==
X-Gm-Message-State: AOAM533+81Y1zM9G3vNIJnY/rb+yMQLEic9vTnHKeGylmgw8qIBksOc8
	mBFfq1zWohjdDblH++is5gdskbiYc+j0SA==
X-Google-Smtp-Source: ABdhPJxpFEN9wr9NDovXa12LHZBeTlPeY8FO5kaJJvFWaLOW31H+AdzVLw0/5KwFAX8z7hUHi+KzbA==
X-Received: by 2002:adf:a415:: with SMTP id d21mr1968756wra.408.1602189562032;
        Thu, 08 Oct 2020 13:39:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id g144sm8954511wmg.30.2020.10.08.13.39.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 13:39:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] abi_version,sanity: Tell users TMPDIR must be clean after pseudo changes
Date: Thu,  8 Oct 2020 21:39:20 +0100
Message-Id: <20201008203920.3240279-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201008203920.3240279-1-richard.purdie@linuxfoundation.org>
References: <20201008203920.3240279-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the recent path ignore changes, there are invalid entries in exiting
pseudo databases which will trip up users with the new abort() (proving
how common the pseudo potential corrpution is!). Inform them a clean TMPDIR
is needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 3 +++
 meta/conf/abi_version.conf  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 0eee89d71ce..75e188e2209 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -619,6 +619,9 @@ def sanity_handle_abichanges(status, d):
                 f.write(current_abi)
         elif int(abi) <= 11 and current_abi == "12":
             status.addresult("The layout of TMPDIR changed for Recipe Specific Sysroots.\nConversion doesn't make sense and this change will rebuild everything so please delete TMPDIR (%s).\n" % d.getVar("TMPDIR"))
+        elif int(abi) <= 14 and current_abi == "14":
+            status.addresult("TMPDIR changed to include path filtering from the pseudo database.\nIt is recommended to use a clean TMPDIR with the new pseudo path filtering so TMPDIR (%s) would need to be removed to continue.\n" % d.getVar("TMPDIR"))
+
         elif (abi != current_abi):
             # Code to convert from one ABI to another could go here if possible.
             status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index e04343b47c1..5318a101902 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -4,7 +4,7 @@
 # that breaks the format and have been previously discussed on the mailing list 
 # with general agreement from the core team.
 #
-OELAYOUT_ABI = "12"
+OELAYOUT_ABI = "14"
 
 #
 # HASHEQUIV_HASH_VERSION is injected into the output hash calculation used by
-- 
2.25.1

