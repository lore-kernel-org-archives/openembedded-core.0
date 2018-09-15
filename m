Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D23A745F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 20:06:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id n11-v6so5355816wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4DFDWHiRoRh6arvxMIzLKopu2lyg/l1VWPriSKF0FNQ=;
	b=rnnpbL9ueLFvnTzBdodTFbMMcwgsAyXwahS8bPlJ6G9BfpcRoDUno8hvsDTulpvjfD
	4CaObxSqdZS3ELpPFX8h9ldE/SPtFU21IYCBPWs7qEJQe9QdAmBaNL231IVDvbTpkZr1
	f5lcmSc7SHaA9stefpZ/49DIli8MrXc0NywZ+oEyaay/CI/CjnjtXOTzU9pGnNBWji7F
	2lP6U4f/ZNFsxFAipxezys2OPkVeYRx93pFDnzGsS9OZn2m1qiL+em/i66hoJAueBz9/
	PNrFqNw0opG7ptKwM/8IGOeYZkWi6DQQzlKzug8uuZOgvcTAO/pYosLedEu+RoTQJZjU
	cP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4DFDWHiRoRh6arvxMIzLKopu2lyg/l1VWPriSKF0FNQ=;
	b=iGs+EfsxAmBLW4Lz/1wHB0qXVctvolM9jPncDCB/xc3WLZtg/Qv3t1IDEwrKR9yxz2
	ZlkOXCaNLItoHjQgZ4gqgsBA7TT5HVpRyG8hJqo10EtTsbEDcvS5ukjVkOQui/w0l3XD
	PZ3tpQYKQFx7gcpBCGODBOdf9EAIhOyiDoaUekZC909OMcZXUjYxiO4DaNFd0YZ67z93
	lfvnRwcOLv3mDtYVPURSdadpSHSjAtUIY4z2wzrvIvk9ZDhP+tgyQAfd7zFHf5xostJL
	OBXoNOKSxl1AKpmBeHK2mv9CMqSsCoY9yGgzwwVQ0SbBWycGCr+0xOkde5mtbLri9Gkb
	s7cA==
X-Gm-Message-State: APzg51B7FqnZtrC5+jYei/CtJLiXhatn0e7rjjek8LNHedQ+f4ekp5m1
	zP/sSqvlbNyqSHbeDXCr84GKCvAf
X-Google-Smtp-Source: ANB0VdZ3bZPQCIJZlaG1dZvVWMRXHJlIQl0dzJgHmpFogWdC/4DSU/tG2pmRxqY7y0vYDrF0lnqd4Q==
X-Received: by 2002:a1c:b157:: with SMTP id
	a84-v6mr5831742wmf.18.1537041963560; 
	Sat, 15 Sep 2018 13:06:03 -0700 (PDT)
Received: from linuxdev2.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	p89-v6sm23835339wrc.97.2018.09.15.13.06.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 15 Sep 2018 13:06:02 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Sep 2018 22:01:00 +0200
Message-Id: <20180915200100.21639-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][Patch] package_manager: use normalized path when doing the filtered copy
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
X-List-Received-Date: Sat, 15 Sep 2018 20:06:03 -0000

The linking/copying of the package files failes if the deploy dir is set
in a non normalized way e.g. like this DEPLOY_DIR = "${TOPDIR}/../deploy"

Then the simple string replacement which is used to calculated the link
destination from the link source fails, as the link source is normalized
but the deploydir prefix is not.

Normalizing deploydir fixes this.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 7ae5e045df..8f4b42b0da 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -689,6 +689,7 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
         with open(manifest, "r") as f:
             for l in f:
                 l = l.strip()
+                deploydir = os.path.normpath(deploydir)
                 dest = l.replace(deploydir, "")
                 dest = subrepo_dir + dest
                 if l.endswith("/"):
-- 
2.13.6


