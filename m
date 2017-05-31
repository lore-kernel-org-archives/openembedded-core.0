Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 80B2078049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 12:42:49 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id o12so2119433iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mW51Y+V9Pbc+zcIhGJR34waDta6HjD36GTkHei8Q0YY=;
	b=hIpbgh+B4uZaLieLwIVC46PyInBdRM1+kERqCnqnfUbnlqEmQ/JCla/TQx1FoAWS1v
	SCYtzwBzSWgfwQ8wHz+CIweZBey2kJUYJdOU3wXHMaPXhMfVj2B816NgHLNPTL3NP++5
	4hS6QrcvnEW+iVhLLMVryQ1nFOa7lf3WqSEX8n0Yf8BMeMLmiKxLC20XfWEN6r0ulXSD
	LN/KasYbZy6KMfYZxNnNtF9zon4CwHBSlwi3xStArlrNrfKGNAb8rHs6gDZi/D/YmAC8
	LkDTLtsOA+15Q1MsavwQNd0Jqdx9NRp3P8UwV8T7TlO2XqN5z4isZ88YQ+q77UsNyR8x
	GBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mW51Y+V9Pbc+zcIhGJR34waDta6HjD36GTkHei8Q0YY=;
	b=Lz9qEq5jC5ROC4kRWFMZjIaVYwJFCYwAJF8YWY147lfCG0t7XFlb23qp3WRq+g5SzK
	iBp3bHPo2K2bnSpCpkR5Cd3EJ+KA80N8OVl+bAUtFttL8xo+llcCvHm9JGxMvRdP79h1
	JU9+klDnumsxnHBgMtBtD//iVwEgHCTL2pVtDxgng2jWrBvgZhXYDMG6PmohgajXmmxi
	aPMSmtYjhmugCrdYZe+tGRdz0MK9fSH0pzmRUGgg4ZB+CHQXut2DtgScU//B9rWDVZpk
	421iXMTta9IZAAlm3gTKKtpSDvimyyexT7TlHcweNHmociqiYOq8hmNiEiBQi1tIp+tf
	Y3jw==
X-Gm-Message-State: AODbwcCtFFZv0wh9CMrfcGQb2NyJEfPPvYm41A/rZRegQnGn1FhClUtd
	9njzUeilwEcZJFwkEp0=
X-Received: by 10.107.175.37 with SMTP id y37mr22021212ioe.38.1496234570977;
	Wed, 31 May 2017 05:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	g198sm10973931itb.29.2017.05.31.05.42.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 May 2017 05:42:50 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 07:42:37 -0500
Message-Id: <20170531124237.16501-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] archiver: Escape recipe name in regex
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
X-List-Received-Date: Wed, 31 May 2017 12:42:50 -0000

The recipe name needs to be escaped when using it in a regular expression so
that and special characters are treated literally

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/archiver.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2c04557..9cc9fb5 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -349,8 +349,8 @@ python do_ar_recipe () {
     bbappend_files = d.getVar('BBINCLUDED').split()
     # If recipe name is aa, we need to match files like aa.bbappend and aa_1.1.bbappend
     # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
-    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
-    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
+    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" % re.escape(pn))
+    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
     for file in bbappend_files:
         if bbappend_re.match(file) or bbappend_re1.match(file):
             shutil.copy(file, outdir)
-- 
2.9.4


