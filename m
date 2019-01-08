Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id EA86E7BFAA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 21:56:05 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b20so4087574lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=cEFqSl+2mtbMlVoYAc5G4su9rIM/PWkXCAT7e4qAIaY=;
	b=FRlvjgxY69HdswLXB1mOzRyKAIt/zyGtPGA01YTKGV7f90ICAACXC7ssg16jXCKm7n
	ER/6ESLJrsJj0EIZ6UgTJptlaIEA8Mueyu7g5aszsCNZV6xwBRVa9PnCmpmUGFXTdZhU
	DOm1BuFi93Uf2gMhq/iACzSnxetBYRk28m5jo7CtdzfPGW9UJgl6Vd6PY+xs4do/LGLs
	F+7lJ+7stNnSoPuHxqW2f0h/wWV9F78F835Uz4oV1ZbMYcEBjxZrSa2PBtOI2dffgTsX
	7G5h0+q0dFjETSxcAx8zICyIQnfYHBY1LK+OpxJ/E54BxY/kK7ov6zcTQqRoePUY8jsb
	Akrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=cEFqSl+2mtbMlVoYAc5G4su9rIM/PWkXCAT7e4qAIaY=;
	b=k9U6PqeqHw9BGyYCT8nZDaVUu6Vo5BZuRdWSYrADVTihWHN/9yCr2yY1PFF/PQkoPc
	ediolIKItLIYZZNryoH/71FXclSuVkngl/ElpPOdHApY3HvNZtLcTOlZdrhumM7s/xzg
	vdP315ZLH+tVdTbwKOq6S1DgDYyxKPrnJhjkO+ZB9iih3lDGQyO1QURVmv0lSx02QKOH
	teG4HNtp64i2GC0l4Ob1uCMiaKOYTfB3gKS34+Gi+HugknkKnVe6YCLIMZYM/yrXZ14o
	NhAwkE8aeZigj5SfVcunjf4LjxhlniqJ0ylssL2A/JmG6yqzIKAtjXo6dgx5gP+IKP6N
	JfUw==
X-Gm-Message-State: AJcUukc0Hr/mYM9J6eKmtSM2pFW0J5ouTPQCUbuNnnszuvtDcZQujIqr
	Uf13Ur/GMPNAHELONbMxR1ueoKDx+eM=
X-Google-Smtp-Source: ALg8bN5CP3S70DB3qClSusAdNTO7RuQvLTaNvCYBcBhKCMvSKXoVrqen23hmr9f87s2yCM1Qypvdcw==
X-Received: by 2002:a19:1bd2:: with SMTP id b201mr1904018lfb.136.1546984565230;
	Tue, 08 Jan 2019 13:56:05 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	t144sm13193235lff.53.2019.01.08.13.56.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 13:56:04 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 22:55:56 +0100
Message-Id: <20190108215556.12951-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] package.bbclass: Sort FILES_INFO by key
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
X-List-Received-Date: Tue, 08 Jan 2019 21:56:06 -0000

Observing depsig.do_package for a package inbetween rebuilds indicated
that FILES_INFO was changing content order randomly. Force it to be
deterministic by sorting with respect to the keys when serializing.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 0fe9576b4d..322c4ec77f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1438,7 +1438,7 @@ fi
             if fstat.st_ino not in seen:
                 seen.add(fstat.st_ino)
                 total_size += fstat.st_size
-        d.setVar('FILES_INFO', json.dumps(files))
+        d.setVar('FILES_INFO', json.dumps(files, sort_keys=True))
 
         subdata_file = pkgdatadir + "/runtime/%s" % pkg
         sf = open(subdata_file, 'w')
-- 
2.11.0


