Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7E4F7D5AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 16:34:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v14so5967841wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Jcjt4KynFQVBL47RmVWsIBo8/rC68WfWLLKfnCyRJzg=;
	b=kvjDJ/Y9g0s3FPmD2Xd0ngHoKXPKGt+0D8rDN6Ksp3Y5LTADUpRCbRA8p83QAhn55p
	sPyh1i/GwlT1QcbglD0xQByqKKLTNUZqgoeEHOq/5faZNLh+S/GzSsUhFtweLIamDP0V
	5ZiGHuW5BBYfxFOVDdOM0SdoAzc+b4lu7quyNWljAs8NfmkFwnriyGjMKtIuY57zSzH4
	crjsDVfqmB8cS3YJTtx6rsAwCKD93TpuR601H+fKrct4KkSxejrPlqqwXdo0RrmgTvYG
	ShWgqfOg6wsU9zT/jMGfziP85JCIwX4Uf9fNvFf2wyTtULWfkHZChpnCX/LF++QP8cjU
	kl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jcjt4KynFQVBL47RmVWsIBo8/rC68WfWLLKfnCyRJzg=;
	b=g2riSIB1Fh3mF/FD//LrUyCCCCfDbzsjQpuVFI7oBuzlugW7EQT9pIB6nL2LeWoxLa
	EbJzCnNZVUYxAcqjKpGiLYl5eMVeifbyMypAow8gQyQ1uZLY60sfiJybOMkN39sVlSok
	JNmWHvGkrsu66HbAHHlXt+o03BQYgWcSk3X4kPvVPba70hSvUDtJFYqIik5TS0FqdU36
	NSANECrMqM35caBZs3KxaWnmxxvtN4JZdCVG8hznYmqkTwsRTRKtkzHDoXxsaVtwGBl7
	wsiyQVEyxrGS50dw54vzPWg90P7eKvPU8cBOx0OCFwAFkdcwa2yu0pnd2LRaeI+F5UDV
	Hg2g==
X-Gm-Message-State: APjAAAX+iT1BBz43hqPB5cx5IQBTfV4i07ZKFSI6eOPJZN+yos8KZlVD
	YQZBrv9kMZ+ivWLG6b9LJGTZgJyWECQ=
X-Google-Smtp-Source: APXvYqwTfKpmPuI/CzjM//sbE1XTeNknfSAtGO429QRREchG52/bGvG7eq8SLL9m2BEZ6+wNwNm+Hg==
X-Received: by 2002:a1c:4845:: with SMTP id v66mr7824583wma.144.1556123661157; 
	Wed, 24 Apr 2019 09:34:21 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	r18sm30065408wme.18.2019.04.24.09.34.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 09:34:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 18:34:15 +0200
Message-Id: <20190424163415.126844-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] buildhistory: call a dependency parser only on actual dependency lists
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
X-List-Received-Date: Wed, 24 Apr 2019 16:34:21 -0000

Previously it was also called on filelists and possibly other items which
broke the parser.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/buildhistory_analysis.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index ad7fceb8bbc..d3cde4f6509 100644
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
2.17.1


