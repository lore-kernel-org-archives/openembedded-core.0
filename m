Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7AE7D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j11so4403656pff.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=GnR4R3ImOWuXSTrXT9qzvt0tI0HHbiYZReGRSH7RpdyHoCpnbQr6Xoa+wEOekigvSD
	8BPCG/BbiyR+lawxshJZTGGzFDgDijqgLhabt1855FkjEkUHreIpELzkjKhgc+LfMqO2
	Y1OcakRQoNrNZWRfq9fFUNdbeYsBYGtPoGnRGT7RcImflNTI79wkjPtpWTvJfA0W64Pc
	brvehKnwGqJLOnrLxxcIi+EWeRSkGrC/cD1nXQ1pq+HjGBzHCqWUwB97l7ulcjpb9zQw
	V1i4tX4huhvIe+gwLGVTH0yDbID3KZex/5SnCrnz0RF9HFhGRB8Ug5BdDB8W+lOzl28T
	wIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ymkRFCWUx10ycgLFNunG7/yu1TjVc3WwCcaBRFt8fM8=;
	b=BfG3NuRLt1UUlh/f7vbpVH6eCLh2Do1I13wWOjXZIMio2VjMW8Ljf6/ALpEAuJIqdV
	8QfNPdp+w+Us17i2Igag60cAnmgG/eAaF8v3ZtGafrMbPHi07pGgJS6F3uZHAMs+pH40
	hZlLBw9hKjB5lzLA9onsMI3gt9JEeC6GY3M1ADFLLLccon7GZaymkBBOqKxcgt5Eh51R
	u4q8Go8V7NJnsTfRmQJhNkrGVvBSOxAgr4wDN/osOkWVPFUy2ilIWCR/i+1Qt7rpiR06
	FCoCJetDriFe/2AbjCw6UzCOxW4DZ9v65UCj6MzNVXOuyLyimUVSC3Us3z2LOHV6g5FS
	qhQg==
X-Gm-Message-State: APjAAAUVsWT2nBCkZMxLeqUtzV9GHIOjGMMDBSL0vh4+pGvSbzVcxep/
	CLsIKbZqyXLBKVRQu1q0y7GiFprp
X-Google-Smtp-Source: APXvYqyBvKVlpT/T2+3Y52KDPf6cvyMVCxvTxrpvbXPt+L2E12qLRxdf1vDC7LiFbZ9GPm84whDe5g==
X-Received: by 2002:a62:ee09:: with SMTP id e9mr20173305pfi.247.1556983663408; 
	Sat, 04 May 2019 08:27:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:42 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:53 -0700
Message-Id: <cf525cbbc4277ba08415963cfa7dca384ad501dd.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 17/43] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Sat, 04 May 2019 15:27:42 -0000

From: Alexander Kanavin <alex.kanavin@gmail.com>

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb..d3cde4f 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -127,7 +127,7 @@ class ChangeRecord:
             removed = list(set(aitems) - set(bitems))
             added = list(set(bitems) - set(aitems))
 
-            if not removed and not added:
+            if not removed and not added and self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 depvera = bb.utils.explode_dep_versions2(self.oldvalue, sort=False)
                 depverb = bb.utils.explode_dep_versions2(self.newvalue, sort=False)
                 for i, j in zip(depvera.items(), depverb.items()):
-- 
2.7.4


