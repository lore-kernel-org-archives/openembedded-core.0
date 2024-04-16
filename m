Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85481C05052
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:07:21 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.19022.1713269234155274860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0vDdMjhV;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ece8991654so3857524b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 05:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713269233; x=1713874033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5p1lw2bPmiGgWRkjw/Btgq9/VYLI+3c7VvWBf6uePck=;
        b=0vDdMjhVB5maAO5ZnLR5FcAAUGd8VzZzahsk7VaqI20KnnnR+tLR833vzDuYYNNKrE
         ZVJ7q83SzgSxMt07ZITgmVoy79xw7UWZAtJEOvKaSmMmSLWg4eUBfs/OKZLQdah3vhhc
         zKmgkpPyJuu78skVx6uM248kK2EOOSSRlHQxuPro8o3z8uTLbw7msNlcyKmlPMZQxHSB
         FZLjJRrL2vrh5HqeG4HCXMct/Zw6SGOamidBK6rWuCAr7TRns345RrSqFwWeH1HJc31R
         asxcWBvmdulKgPOednTnfOq2/TfD0msSJmV6KNZf9pAOShX8wWcZ7p7w29CjeYVw42GA
         AWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269233; x=1713874033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p1lw2bPmiGgWRkjw/Btgq9/VYLI+3c7VvWBf6uePck=;
        b=wLO4uXs3LpU2tfXeIRHKNy50FzH++LfOLfIiaPrqhlOkr78jhtSgwIC3yuZhVvy4N+
         qu4SJNO+LmUfQx5nIlyEcoPKLv7F2cBuJIssylGCEDatlhcElE9II2p9q0zgIhzd+UQA
         VURj2YBbjk1XTe9HlxJ1JpQy3pNIGLjd3ATRMxR4uH/5wWhzM6KY3H8/8nWGBkZMg3f/
         baB3IQ9NWOYe+6vV7zzYPOKWmuMqa5HR8shhfDVJYJQv9DjFLARhTy+k0U2e9dk/ii1Z
         PrG/gDHehK1hRDs0oLStz+JxZl/UjE4NinFjUCV4M8XWDPY6USV5oGJyWFN0KvaAqAlU
         fjuQ==
X-Gm-Message-State: AOJu0YwrTP8t64BFf2zVywUIvfp4vDPGn6tehfY+c4jfjEhqR8wp/IkZ
	TRy0iQcdy0qlvrYYpUqfe8+mSzfJIttCZvqpQVMU9EfVXOTAXAzDifvc1DJMHqXycN5ZU8oHMsE
	J+IQ=
X-Google-Smtp-Source: AGHT+IFLxDYOV3Rae2wmu+EBwF3+6/Rv5gM5//gPGq49actbDX1uFJkIowK5n/QiOIEY0smHkZ0fEA==
X-Received: by 2002:aa7:8888:0:b0:6ea:8b0c:584 with SMTP id z8-20020aa78888000000b006ea8b0c0584mr17436222pfe.9.1713269233402;
        Tue, 16 Apr 2024 05:07:13 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id j5-20020aa78d05000000b006edd9339917sm8746111pfe.58.2024.04.16.05.07.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:07:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] ncurses: patch CVE-2023-50495
Date: Tue, 16 Apr 2024 05:06:53 -0700
Message-Id: <6a54788ebe147ecd8e347ff8d2ba95a1c461d27d.1713268959.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713268959.git.steve@sakoman.com>
References: <cover.1713268959.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 12:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198443

From: Peter Marko <peter.marko@siemens.com>

backport relevant parts from
https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 81 +++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..e5a8f43b01
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,81 @@
+commit ebc08cff36689eec54edc1ce2de6ebac826bd6cd
+Author: Peter Marko <peter.marko@siemens.com>
+Date:   Fri Apr 12 23:56:25 2024 +0200
+
+check return value of _nc_save_str(), in special case for tic where
+extended capabilities are processed but the terminal description was
+not initialized (report by Ziqiao Kong).
+
+Only parts relevant for this CVE was extracted from upstream patch.
+
+CVE: CVE-2023-45853
+Upstream-Status: Backport [https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index a77cd0b..8ac02ac 100644
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
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index a34a7bdfdc..da1e6d838d 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2023-29491.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.34.1


