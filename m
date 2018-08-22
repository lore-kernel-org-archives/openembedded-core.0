Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id B986279379
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:19:25 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 8-v6so2539200oip.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGyCiCx7loJQdm8YseD5aSR6THHe2V2FQsrDez2/1t8=;
	b=U4dX7Ht1US7tWPNeaW7fWc9dqKslJO3PjBiwIDI+Msk/E1EYxj54a1eOQuLIigcWM2
	Gc5umX1z2C8vSlvMVab8ce3CmgEc2/3nSJdNtDalUe1w838EkAklrVhIgckmaEbctpIY
	54WaXqu1dPNu1BXuTrpFckLvfgra/o2PHpH74gOUYIYUFNYruZo1ewv8/JPkPyReF9QD
	LTD9gZwhurYvMRVAQcZ9Xvg+GbwXlltzQBgd8bqPh5DH5IEGZo9mKWpai5hupk2IaQJ6
	vCSR/S9wOSpIf8AXjevYk0jKzZd5QjLCkc5EgjyEhReIzKZha993pQe4BOHPccvAzkJV
	wyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGyCiCx7loJQdm8YseD5aSR6THHe2V2FQsrDez2/1t8=;
	b=UFyPiVtpzoiMCU0WdwOAsEyYKl6E6bQ+KS3ga6wPYJm13rDUh9cpM3tP17+FYKiowQ
	UrsaIwC/rczi4BiESHSrrJhqKwoKeg/c1JVh3a8C7pqZvNrrNWAEIStuX9BIXBv0aHy3
	Ir6dSa9MG+OHnaPp33+6L+ynK+B/+NNwtye7X1IyCbutOeEtx7m/GKD5QoUp+IFqI/FS
	6hSCQjmwdJrKT/byHZ2YMYoGvzdUGQftI+4EU+CbqXBp0DwXUFjBTga+HZLoXZk/6+os
	ilMuefG4jyuXHLjrW6YbNaBGn+hgzneL2OvsiwRK0GI6/e1gRLbGoUErPeXGGkYwEw7j
	XP3Q==
X-Gm-Message-State: APzg51BlxaxNDjWFPWLO0PMOdeOmKuOzg38jEE+nBU+oUO79WXcTX27Q
	nAq/NHcPfKkFiY8wedzs1Upqp2EaWuQ=
X-Google-Smtp-Source: ANB0VdbxLWzFk4H/u+8RJ7E19RBC7BKZ3a3h9Q69SqwCuPjHB9kOO1E4t2h8IaZFM82CBvd8Ru6RaQ==
X-Received: by 2002:aca:4784:: with SMTP id
	u126-v6mr3487449oia.229.1534936766701; 
	Wed, 22 Aug 2018 04:19:26 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	c9-v6sm862308oia.1.2018.08.22.04.19.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:19:26 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:48:05 +0530
Message-Id: <1534936692-11736-27-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936692-11736-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH 27/34] perl: CVE-2018-6797
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
X-List-Received-Date: Wed, 22 Aug 2018 11:19:25 -0000

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


