Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 458257EAC3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2019 10:29:44 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f17so79424031wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2019 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=hBpJ/dbgJdw8b6SK8+8qFPIBTM+1bIe5Y3ebKwxrHq4ouyYIAVdWg4gJm7wzS+v+OX
	aCKwB+H0VQ+FKUIyoB0eBJ2bfGzTqsGrs6BvG5AtsNJ5FOWIBiCfBmrS8N3EUkCG/a1o
	9e0Pzay509qIe9qiS/3XqIPYMi87xNjCY/SATHfENjhPXMXsk52JRLQ7HQ7YE0hDxdt6
	9lL/wfRBiluyPFLAHxe0lgyjXvzwMp9Wq+Ab44ItWGWgn7YnvgGadkwevy5vGHef6YnD
	vpLw4t1GuFF5Mbq4Qx9gi3UGDv3fKKohbkStmwqHEy8dMEov1SnhVhJXOZ4kIIUyBen3
	4zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=KqDxzR/AgYzjBnfGrZEAJ5YzxchPsQ0M8BnBSWfvVYC9NyoNR8gglEgLA/VOV8zeWO
	zNAXc1vAP3imCvDn/HmNSy9IY+2NlhbKnmMk3nLSVUHklG+meenVU5gU5U4t6bdDRIlf
	vp6QN+UafKxHRHt0gjsnPT3cQXUy9+0pLE+5YBX+tO507yxAEbF21In5ve08Z7o+d11G
	+tyVEkKPrK3kMeMmpcB2oe77D+mp4DXhtU7kQKbI7L5lxoI9jJuFkl7CkcEuJtQlgjGi
	8IQnKZb8o+mNOiZZGl88WLGQLmqj//OcI1Xozq/gYF9/gbtlEyc/fSm5zT10NFxg8lni
	QRSQ==
X-Gm-Message-State: APjAAAV1I6+MjtTrEct+d2cFqtFZ9S8ayTM2xVGvF/yYAYtyhUiIrzn7
	f67a0ljcItYtyl/HtgJtX7GAw0UkhL+JvA==
X-Google-Smtp-Source: APXvYqyEyPXoL1rJnRa1MJGki3wGojXO/9l8YB32FVC0bcX8tTsgaY85Sn+MTai18QWd0HR4yxqaAw==
X-Received: by 2002:a1c:a101:: with SMTP id k1mr10242557wme.98.1565173784703; 
	Wed, 07 Aug 2019 03:29:44 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o3sm79705336wrs.59.2019.08.07.03.29.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 07 Aug 2019 03:29:44 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Aug 2019 12:29:33 +0200
Message-Id: <20190807102939.12760-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Wed, 07 Aug 2019 10:29:44 -0000

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


