Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 212567E553
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 11:15:27 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id s19so6578996lfb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=GwEOWOCzwh38ESpY8vfrZE0QPNr6DLe3i5f+5gcA+uPoISTibDs/y4Ane9L/1N85CR
	pGL0nEiLkn3oZ09YpJk/QeAC66qU6hKRYGXSwM/TZO2ordkerB04dkEqx/M4DRi2Scha
	JAzJQMWhDFqEjAY91JiKdk3z+VXZ1caY95YU2iWSTaq5iex0gMj5yxISKN1NBslQP5xC
	KZx7+hGde6RM1JcVmWKpHhpJWAIqJs0vV6eniIhhcd39HR5L805ktNZgDZ1pc2bAjpOq
	5fNljoWdBZEW6ZTk39K5MBC/k2kFkJF0CBbcyqjs0J+jGFDEXUcuTKWBdFzEl3AoUNuR
	APQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=YNR9H7fE1czlx4XWwaRtPrJI9mJIRe0mMOh2U6VGD/StQmanL2oGDsVnXrI4ZtMdC1
	oCbOjuG6qhIlB/Bjq9Ld/VRsnk+qY3Zb+Ipdlcr/dB7GeDbo3sB1z9/V5uyJWGX55lL9
	3hsDOjhK90giYtuohPUT5abyWHMkIpLLpJujmBqMBHBYNmHol3CViOYqSe4hGVsATqrK
	Wyf0JaX99HJntlYUkvpcH0jzPHhURh3qJ7qvCdWESVgJgJ+7PV3avtroTZFzo4cJcYii
	hj9TeV1jb7SI6uRB/SXVq8AkqnyNBobch9XOAHKCMlJNK08+ljt6TymSDS1qGMsNMqfo
	6kjQ==
X-Gm-Message-State: APjAAAVU+cFcKXgMcJzCkIFT9JOHl1k5uJXKYuBhLgbAwCQkmLbDhCE6
	WQqqAKpcCjNrdtxVO4sgQEtEmU02B+enfA==
X-Google-Smtp-Source: APXvYqxsbsPz/2lU/+6loL/UWgOr+TKhqOyQcq3yjFN1jpWe93y0VtzqI+HFVycfyR2d8298LXnVIg==
X-Received: by 2002:ac2:46f8:: with SMTP id q24mr12542122lfo.89.1565349327566; 
	Fri, 09 Aug 2019 04:15:27 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id y5sm19265313ljj.5.2019.08.09.04.15.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 04:15:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 13:15:19 +0200
Message-Id: <20190809111519.54789-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809111519.54789-1-alex.kanavin@gmail.com>
References: <20190809111519.54789-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Fri, 09 Aug 2019 11:15:27 -0000

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


