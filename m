Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7C7A37DE82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 18:24:21 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so108651530wrr.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 11:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=fRcnRUDRQWk1q2zq813NjhI+wthf/15Y+4m2e/MEYhwfBjcR6/EvNsPxKIUIl1JgCX
	++jSqHBzzROdIFSCXvIV1IzRw9nw1ybB8iAN83CIi0WnNgREOWV5fRYM8gHcgtrTQDWZ
	hq7r9EGRRRbraREZBKT68KH+1NTiSozdmoWQtcjEro1qi2MFs2nkn1+7Om1G9aNKdO4r
	3BvqNmvxBdaeDkXrhR8/oQVs8YpAcHZWD0x1r8Osg7OrSN5VTt6zosRRbOQtaIrCzXc2
	PTTDgDEt2h2IxDreKhm+PK+jsosxiv2ZrWSCGLoP3Yv2OGdd5rF8lmJVnWMw4SwsIxyT
	AgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bZGD8uhAVOoM+ur6uABzwcAAiWhPzHqGEzom28TnJa0=;
	b=eKXP3cVeWRI1WA2cZ7WSJ/K9D154opkDMTCg66U8ikyyKXsUcMNPztM7yM3RBYv/hM
	G9f9kDjnX9UgX9mgfoYQl52I56L560SxuOyyS8zRov4lLa63tDPzllW8HZI98fWx7ZIx
	21H3VsswpL01Whd3i15tcKvOAXCODWVrfYST5nBHMip30IHKkhJwRHCey0x8Fm1sk3Pd
	oUf/M5soNDDc5J92Pr2F7/2fH/wHiS0FMBH9AtHwfpC0DQqC57weIcB+0UlwLNKsSM6e
	tBqvhzbPz6koWANEuE2UtBipI1CUdQborsAmbRcB+rBqPVRb1OPCN/Wa9/jSRBiJiRVA
	MkMA==
X-Gm-Message-State: APjAAAU8o7mQS+ysvQDkfZonC1NAg9AioPs79hPJnj0qxPCyvL9ti2SV
	o9bFG2guB0PyRvbdQXrS1AoNnwv9LTE=
X-Google-Smtp-Source: APXvYqx1B7d/yJmWhsuHaJfGZ682vFvipts0V6hyjUYg0B5OyDTZUV8TempB7xAJ5hdGDk5KGGIpGg==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr49160248wrk.98.1565720662007; 
	Tue, 13 Aug 2019 11:24:22 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id c6sm3218230wma.25.2019.08.13.11.24.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Aug 2019 11:24:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 20:24:11 +0200
Message-Id: <20190813182414.2952-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190813182414.2952-1-alex.kanavin@gmail.com>
References: <20190813182414.2952-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively
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
X-List-Received-Date: Tue, 13 Aug 2019 18:24:21 -0000

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


