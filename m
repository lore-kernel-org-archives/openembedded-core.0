Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 998167F2E4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p77so4312377wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=nQAgbeinL4/KXMkDKWgkelnjsysfehjdSKKmtv6Aq6BLBQ49sf+EKqjHRDDOmOKFOK
	3489cDBCR9Wkw2Ss+E33AKX2oBLa+JXhQAHdiolXsotWxMWfjiVDdXYYGIM6ySyerzWf
	FPYiU3t4BFpyMDNhlKtQtLXOg4JLP7xOZHW2YHDmTfQMvaCf1F5ggdiMtIHKgXukpkH0
	aL47H/pRk/or+n3I4X+5HWmeYAPo22I0E2LC3K2r2SszyXfu7hpTLFO3mWS/6EkKQ8pz
	0C5QXM1YGa2N0xHeNmXXS2h5kku5J8trihhq1VTkNCKlAvGDTaQgq+16vx7PKOiXLFbN
	lyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=mIyqWKA8TPLbGowdh0Ie6yjkmXQIxJ0h/dFb5hVm+eLwe1t48yQwljWvs9en+sDASA
	cP94YJBorRnPPtrlEgG5QzUEkSQFAdNymECIfreqB4ypptWsgkaSKuxp1ZoCRvCQ3MJe
	DCcfDGWXTUGY700GzTVqMa/fjPqwyjy974Qjmp6dPl38mL3hA9623XRKEsd0ozbj47lC
	6x8/BbNemx0CfCWmY0QsKvjUa//w4SJ1hh0UX7+bE/UxWbxWDDlU44T3HdNIzFU83m9Z
	THam6r3DPdRPsi3Sv6urXmU5iEfkaAdkO3mRY8chPTGLx+Zx5VazM/dqK6tlYGTtNMXr
	JXvQ==
X-Gm-Message-State: APjAAAUqgjowRczO4BSs1Rhbo32AkKpViLSJ9qPsl9Nhk/06IEsYFUyp
	xk1NcQCmsLsHBmaTQCOMcd5J/EhzPKg=
X-Google-Smtp-Source: APXvYqxylf25Wm6hR5AlHlQjf3iocZi6pv9mEZp2iqzPLB/NBWeK/QQd0/3u4ZUZ+9B6+kBtQ08KvQ==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr5092048wmk.108.1565280716333; 
	Thu, 08 Aug 2019 09:11:56 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:45 +0200
Message-Id: <20190808161150.44877-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:56 -0000

Recursive RDEPENDS resolution requires that all of the dependent
recipes' packaging has completed. There is no mechanism to ensure that
and therefore races were observed.

This change effectively requires recipes to list their runtime file
dependencies explicitly rather than have them pulled indirectly.
This may require a bit of fixing in layers, but should result
in a better definition of runtime file dependencies.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/insane.bbclass | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 35c4fdb4913..9b886d13805 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -722,25 +722,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                             filerdepends[subkey] = key[13:]
 
             if filerdepends:
-                next = rdepends
                 done = rdepends[:]
-                # Find all the rdepends on the dependency chain
-                while next:
-                    new = []
-                    for rdep in next:
-                        rdep_data = oe.packagedata.read_subpkgdata(rdep, d)
-                        sub_rdeps = rdep_data.get("RDEPENDS_" + rdep)
-                        if not sub_rdeps:
-                            continue
-                        for sub_rdep in bb.utils.explode_deps(sub_rdeps):
-                            if sub_rdep in done:
-                                continue
-                            if oe.packagedata.has_subpkgdata(sub_rdep, d):
-                                # It's a new rdep
-                                done.append(sub_rdep)
-                                new.append(sub_rdep)
-                    next = new
-
                 # Add the rprovides of itself
                 if pkg not in done:
                     done.insert(0, pkg)
-- 
2.17.1


