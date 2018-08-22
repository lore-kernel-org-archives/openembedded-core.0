Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id EC34A794A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:10:01 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id c190-v6so3706489oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGyCiCx7loJQdm8YseD5aSR6THHe2V2FQsrDez2/1t8=;
	b=YVN2RXUzigEIClkgCFhgnwIcxEjKbdHkQprxFFa9S65jQjl8EgEixMsW4UsPIIw2cj
	ODwUIne82ohhJWELGdCf0StweYMBFj3HMst5lHkSZjSX4C16R3VsJINttH6bxQ6eff9A
	xpV2ND4NVWFkWZLLgblJhMYdcCVF9XcA19b+NF6QKd2XgnjZWnsLa+MbjdrNE4OC0ZMO
	t16dL9OgGzxeq6Ckhoxng67EXkseYPHSdiv2tX805BX/FYIZFFjs+j6z1by7TyXt0Cb9
	fdxzZJ8gd7I9mzncFPrmLV+/McrI7qtmLGUO20KGByifQ6jk6TaUr/qYUB7F1IH7dgA3
	Y10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGyCiCx7loJQdm8YseD5aSR6THHe2V2FQsrDez2/1t8=;
	b=XQ9F7yPmfM2MTO/2KmffCsPoJaBX4OP99qBDCj+/ouY/JS7tYng8adPeOshXwBFqoE
	CwcSsPqRUPssKtXQatyFTzar1KQiSM7uQpRraM0aYhFlX7kURLpX2D5cAZ7EpPP5YdIN
	2F3Y0AimmZmRxDQ0JXNkzfDGth03Z+8sy2X2/LEHY9jskLoT3TXckUKyAQxkD8tra2FJ
	wv/wmpUkwykLb2/yjSezJzkFpftBxFYF2luk5J7CM9CQ+tqoCIxukRcu6oY11LtuhL8Y
	LXxcW1oHSBagSPhYtb1ZGQiTpE59pJkfKWBJmfX6GiiRPCpmAS4AlWLxt9cba7oRiCNZ
	TJQQ==
X-Gm-Message-State: APzg51ATPGmrAm3JpMCvd3OQ9jDf/breZjyCf7psT/uzCLBfbt4y4o7A
	JIDrxsejgbwOA3qROT76mPcMB+VJ4bA=
X-Google-Smtp-Source: ANB0VdZEapukrRkyn5BNmf+bIgzRk63J5cpMs3MonQ3iL1KFtS05t4jX6t1yXLoEt+2mjY0NntXkhA==
X-Received: by 2002:aca:5714:: with SMTP id
	l20-v6mr3390074oib.100.1534950602745; 
	Wed, 22 Aug 2018 08:10:02 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.10.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:10:02 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:45 +0530
Message-Id: <1534950532-23850-27-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 27/34] perl: CVE-2018-6797
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 15:10:02 -0000

(perl #132227) restart a node if we change to uni rules within the node and encounter...
This could lead to a buffer overflow.

(cherry picked from commit a02c70e35d1313a5f4e245e8f863c810e991172d)

Affects perl >= 5.18 && perl <= 5.26

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../recipes-devtools/perl/perl/CVE-2018-6797.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-6797.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch b/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch
new file mode 100644
index 0000000..b56ebd3
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-6797.patch
@@ -0,0 +1,45 @@
+From abe1e6c568b96bcb382dfa4f61c56d1ab001ea51 Mon Sep 17 00:00:00 2001
+From: Karl Williamson <khw@cpan.org>
+Date: Fri, 2 Feb 2018 15:14:27 -0700
+Subject: [PATCH] (perl #132227) restart a node if we change to uni rules
+ within the node and encounter a sharp S
+
+This could lead to a buffer overflow.
+
+(cherry picked from commit a02c70e35d1313a5f4e245e8f863c810e991172d)
+
+CVE: CVE-2018-6797
+Upstream-Status: Backport [https://perl5.git.perl.org/perl.git/commitdiff/abe1e6c568b96bcb382dfa4f61c56d1ab001ea51]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ regcomp.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 3b9550b10d..a7dee9a09e 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -13543,6 +13543,18 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
+                          * /u.  This includes the multi-char fold SHARP S to
+                          * 'ss' */
+                         if (UNLIKELY(ender == LATIN_SMALL_LETTER_SHARP_S)) {
++
++                            /* If the node started out having uni rules, we
++                             * wouldn't have gotten here.  So this means
++                             * something in the middle has changed it, but
++                             * didn't think it needed to reparse.  But this
++                             * sharp s now does indicate the need for
++                             * reparsing. */
++                            if (RExC_uni_semantics) {
++                                p = oldp;
++                                goto loopdone;
++                            }
++
+                             RExC_seen_unfolded_sharp_s = 1;
+                             maybe_exactfu = FALSE;
+                         }
+-- 
+2.15.1-424-g9478a660812
+
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index e696910..dafd268 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -70,6 +70,7 @@ SRC_URI += " \
         file://CVE-2017-12837.patch \
         file://CVE-2018-6798-1.patch \
         file://CVE-2018-6798-2.patch \
+        file://CVE-2018-6797.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


