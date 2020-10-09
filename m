Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.14722.1602252622312072503
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DBuzjiIY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id n18so10459440wrs.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dnTUPGWe00uhV8LX+Tnv18qLyC+aHz5mtFVGOo6nIy0=;
        b=DBuzjiIYSn6cRlL9mmm5yoWr/0ro5SScHwI0Ql5wazfuyFy3ER3yZasTq7Ec0P8npm
         +eOkYasib0Agcr8GPmVwsF1Vi6NWRPgnuuGYv8YX1CPoO0pNuFK/oVeb2c2v+Dn1ptaf
         cRtaVSte60bi7/KgvqJuo+DlTxw/flg6eqIaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnTUPGWe00uhV8LX+Tnv18qLyC+aHz5mtFVGOo6nIy0=;
        b=M37OBMI1DkmkSXmRD5As5/m5F6fxuTykKZFqft6kSWp0r2ElVSPen+gh5g8y44fqf1
         QzO2NfIhDPcRWHT05L1qGUQFAyLhmN57SeAUNtn26DVTweEpvw/cEbo2/X1Z3t4gkjv5
         NO3+3zVBo+C+99yNHkGoIx6XC3+Ei7KFdRRl4JFS1szMGdxTpT+lYovAg87LtpXmz0ev
         5iB5Oi3GSyTpdljm3LJ/0SAAChOgM3V7YM3VpSMMN3uu98IqEHHIWQolU5wydZVwLTQu
         Z66VENciIFdcG9V68XcJTPyuoBDIZReA/W2CeILZn4hCdhvy9bOZyl9CHfn5yn3RGdsJ
         rX/A==
X-Gm-Message-State: AOAM530KITPkEXRornybYGPT2+O2P5z5R1JlW15uOpH70ThLVmQd/AP9
	FbKfq6JAM0CzzQM7MgLlh0YKM9Ik7gXRxw==
X-Google-Smtp-Source: ABdhPJwTRRbS6xa2RLSGAOAJCpjbICa4v35IlEjnA3CKomIvj8mfOi7DMjboZYvzUxPBX+xWkmN2YA==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr14993413wrv.224.1602252620726;
        Fri, 09 Oct 2020 07:10:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id u81sm11343780wmg.43.2020.10.09.07.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:10:20 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oe-build-perf-report: Ensure correct data is shown for multiple branch options
Date: Fri,  9 Oct 2020 15:10:18 +0100
Message-Id: <20201009141018.3288420-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201009141018.3288420-1-richard.purdie@linuxfoundation.org>
References: <20201009141018.3288420-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If --branch and --branch2 are the same, there is extra confusing data plotted
onto the graph. Only do that if the branches are actually different.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-build-perf-report | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index b46d61869c0..7812ea45407 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -509,7 +509,7 @@ def main(argv=None):
 
     revs = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
                                     branch=args.branch, machine=args.machine)
-    if args.branch2:
+    if args.branch2 and args.branch2 != args.branch:
         revs2 = gitarchive.get_test_revs(log, repo, args.tag_name, hostname=args.hostname,
                                          branch=args.branch2, machine=args.machine)
         if not len(revs2):
@@ -533,7 +533,7 @@ def main(argv=None):
     else:
         index1 = len(revs) - 1
 
-    if args.branch2:
+    if args.branch2 and args.branch2 != args.branch:
         revs2.append(revs[index1])
         index1 = len(revs2) - 1
         revs = revs2
-- 
2.25.1

