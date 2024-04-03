Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEACC6FD1F
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 05:13:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4140.1712121228031315599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 22:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ORVOYCfT;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e27c303573so10764945ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712121226; x=1712726026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdJfJaJk5utwxHmFtjuTR+Xxc9rdN49lm2V9KhI+C9g=;
        b=ORVOYCfT34iai4BmLVWgbVqxzS2LqCaY/vjTls/tyo0bK1L71QPTsWUVMfoetKufa9
         CPLeU4FRNXiLfmcLYbzfbXaNtHgGVLFb0JeJI7yvdi+A4oKIe97QdfaeyjE4+2heItAr
         PvtHtbHTVWJY7HHeGWEJGjuCilGUFqKCrEY4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712121226; x=1712726026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdJfJaJk5utwxHmFtjuTR+Xxc9rdN49lm2V9KhI+C9g=;
        b=rppu30/YY6jVGUsn+EATnd7LGljPXZl5hPk35Hs7LvzftohJ/F1MBd9ALKZHY1Eqc9
         xY8Y37cIW57wkyMU6emAMWQ5FomqLxPk/hbXatf3Ci+AX3zvyuMWBNMOAQ8ezmK94poV
         IxXizhloFNarj9ty1iH80jSypSzwptgo5w+QhCXZc1GIRMRFRAzsSXXCKqlB2dZqa3To
         5D1ieIKeXW+eauzJQDt6thT1vi6weV8ohZhWxAhccIqUBEdzpZAtVtMt/FJBxH5Qc55M
         9K6ageSa7+Bf5DpLR8/v41sA45cSKr75d+HBL+bgo/cSB7CQGx+5wQ22LcdItDgzuZBQ
         1CGg==
X-Gm-Message-State: AOJu0Yz4m3j/EzAjgDej9+BbRlC3i+86tZLTm/lXc2+40Hr3qqqzhoWo
	xRvRsaFLCY+AQlj3EYKYUVrVucAVA0ab/mGvwH8Ps/MHSdV7ajbs9GmpSPb+BiAot357tezPCXs
	3
X-Google-Smtp-Source: AGHT+IFn3xv0tTakbF7hYaPx3VOf913Qm6yYzJSDBkzwClVIxnWoKx1biypYwK28o/Fei0q3Mi6C0Q==
X-Received: by 2002:a17:902:6806:b0:1e2:87ef:8263 with SMTP id h6-20020a170902680600b001e287ef8263mr2194240plk.29.1712121226242;
        Tue, 02 Apr 2024 22:13:46 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:b5b7:aec2:114e:7ead:13e6])
        by smtp.gmail.com with ESMTPSA id p16-20020a1709027ed000b001dd88a5dc47sm12373264plb.290.2024.04.02.22.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 22:13:45 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] ncurses: Backport fix for CVE-2023-50495
Date: Wed,  3 Apr 2024 10:43:27 +0530
Message-Id: <20240403051327.504390-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 05:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197903

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc

Reference: https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 79 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..58c23866d1
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,79 @@
+Fix for CVE-2023-50495 from upstream:
+https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc
+
+Reference:
+https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz
+
+Upstream-Status: Backport [import from suse ftp.pbone.net/mirror/ftp.opensuse.org/update/leap-micro/5.3/sle/src/ncurses-6.1-150000.5.20.1.src.rpm
+Upstream commit https://github.com/ThomasDickey/ncurses-snapshots/commit/efe9674ee14b14b788f9618941f97d31742f0adc]
+CVE: CVE-2023-50495
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index 23574b66..56ba9ae6 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -110,7 +110,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	/* Well, we are given a cancel for a name that we don't recognize */
+ 	return _nc_extend_names(entryp, name, STRING);
+     default:
+-	return 0;
++	return NULL;
+     }
+ 
+     /* Adjust the 'offset' (insertion-point) to keep the lists of extended
+@@ -142,6 +142,11 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	for (last = (unsigned) (max - 1); last > tindex; last--)
+ 
+     if (!found) {
++	char *saved;
++
++	if ((saved = _nc_save_str(name)) == NULL)
++	    return NULL;
++
+ 	switch (token_type) {
+ 	case BOOLEAN:
+ 	    tp->ext_Booleans++;
+@@ -169,7 +174,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	TYPE_REALLOC(char *, actual, tp->ext_Names);
+ 	while (--actual > offset)
+ 	    tp->ext_Names[actual] = tp->ext_Names[actual - 1];
+-	tp->ext_Names[offset] = _nc_save_str(name);
++	tp->ext_Names[offset] = saved;
+     }
+ 
+     temp.nte_name = tp->ext_Names[offset];
+@@ -337,6 +342,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
+ 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
+ 	if (is_use || is_tc) {
++	    char *saved;
++
+ 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
+ 		|| _nc_curr_token.tk_valstring[0] == '\0') {
+ 		_nc_warning("missing name for use-clause");
+@@ -350,11 +357,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 			    _nc_curr_token.tk_valstring);
+ 		continue;
+ 	    }
+-	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
+-	    entryp->uses[entryp->nuses].line = _nc_curr_line;
+-	    entryp->nuses++;
+-	    if (entryp->nuses > 1 && is_tc) {
+-		BAD_TC_USAGE
++	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
++		entryp->uses[entryp->nuses].name = saved;
++		entryp->uses[entryp->nuses].line = _nc_curr_line;
++		entryp->nuses++;
++		if (entryp->nuses > 1 && is_tc) {
++		    BAD_TC_USAGE
++		}
+ 	    }
+ 	} else {
+ 	    /* normal token lookup */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core/ncurses/ncurses_6.2.bb
index 33285bcb5b..dbff149f55 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://CVE-2021-39537.patch \
            file://CVE-2022-29458.patch \
            file://CVE-2023-29491.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a669013cd5e9d6434e5301348ea51baf306c93c4"
-- 
2.25.1


