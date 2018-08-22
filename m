Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id 49BF679257
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:47 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id b15-v6so2454993oib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pTC6zo1n5E49UQcWc0XZ418ufE24Ai2vjTy32bXRdnA=;
	b=AXGthL4zAj+UPDFTWEEfoNkdPyncZaHgpjPo+iXe2Hwu8U4Tk2tN9NbQHLO/ZozQw5
	Vc9oJPpv1u0btbFagz5UN1vnBAKwCh8n1c2N8N3th6AjokZ3LWAGgYZYbAstwd1RbM2/
	a4/ZRdgadY1iYf+XwUrSjpSrObJ74v1aAfLJxCcHJ72gZMN7Tcrg94Z9A5Qp/1C1BNlq
	x7mOrATUq3IoFLD1qT/R7navCzwEr7O68uakV3fU/OLYNldot7C2/Y1xeY8maidt4JAa
	tcc15YGeynAbBZnZTznuqQTHB3GyGc4/oyR0B9bMzvAoaZbZHOOMIX5JhuTw01G8gahb
	7w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pTC6zo1n5E49UQcWc0XZ418ufE24Ai2vjTy32bXRdnA=;
	b=WQNbvUUdJsi9r390lAUEyrkav1SgfKPiD/++Cdl/z59FB3HMTmPHJ1W8NRxvZnufxm
	x1Ek9cWbvvWo8fFhlL3bv5jjbdrTKy1jO/iLWhdhrXUtsAvjaer5xl7R25FCQN7zkSF8
	P7yMXUWTEgNlboEAiVl0Sgno1ASshJHQTQcVlE+YFKdksMffEw250qebHcs6WcwLmaUF
	G0fGlBDX0Dwl2nXlqSLWC+fcqg57Kzkko+/+8XoHUPx7/pkQL6oW9BhiVwiUHvJJ27Ig
	IvUhpsfO4bW36YEdR/JUkO5sfO0WctT8zgX3SFYqp4Gb8LdXH8uaxdYh75c1nlTiOduC
	EuuA==
X-Gm-Message-State: APzg51AJvJ/epXP9n46FW5F9fGyNprvbAAkdToRytt+Z8KUe50rxH9VG
	yLW4MsdSozG9NyWuw2Q/759q58jSKt4=
X-Google-Smtp-Source: ANB0VdbDb6kQE2DCeES+YFyh8NxtRPd8ARIVScv0y7xiOUV7NMK3pjgmmQS2wlc52wtvH5Piee1LCA==
X-Received: by 2002:aca:c00b:: with SMTP id
	q11-v6mr3261238oif.330.1534936668132; 
	Wed, 22 Aug 2018 04:17:48 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:47 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:49 +0530
Message-Id: <1534936615-11658-13-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
Subject: [SUMO][PATCH 13/19] perl: CVE-2018-6797
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:47 -0000

From: Ferret on Shark <shark_admin@mvista.co>

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
index 311df40..882c1cf 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -68,6 +68,7 @@ SRC_URI += " \
         file://CVE-2017-12837.patch \
         file://CVE-2018-6798-1.patch \
         file://CVE-2018-6798-2.patch \
+        file://CVE-2018-6797.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


