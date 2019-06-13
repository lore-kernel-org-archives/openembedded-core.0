Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 07D3E7E6E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 23:42:54 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y17so429436lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 16:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=HmPkbsHr6dmtV+BK186flOLObg2p8TiuEiNd0kz033U=;
	b=18FePdXzpNxHeJIUzUngos+OAQPwnQa16vXZXLU+zLoEY0YGMwYTlF7hEOq1w+LLXI
	GSJwyUOk7kXgq/XV9JZLq5IqbWR10tQsw1iVtCXPlOy0sCfhNBKaAGUtGwBrORn6eBc8
	wacAwwO4BFkGf6TdYdHZOvy4X2gKqLG+Vc7h0Rw6/GgZ2W2JW79CimsZ7GkJGlmsqM9g
	2eHurcLOB3Rvndi5IUEuXqKAvMJBcUV6LLpitTM8Q7Hmc7PHiUiDIaT5RmBySKGjBw5S
	zdd3cS1zqKe4rWohp4uAHWgweGihgH7Byxn4kErbLa4xff1qSFBApzoVKt9OGVOIXGvU
	HzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HmPkbsHr6dmtV+BK186flOLObg2p8TiuEiNd0kz033U=;
	b=MxTVCPahbwpTa6sTnuF47e+5tUwrsg7HvdYnQaDPWBla9A/pvQqMcBl5Rr5VUJukRB
	Jd7xO4FBo5lV5ad7opBAloK1vlNXJoAx2RlHXM6amHj6cZx2ctCXHRbZklPG0WBUAKkZ
	zItEGyAFQQ5nxXfSB4otF9QAtgl/jGRrLXSxMrxHnC6kD/ew/3vmZd49SDzgZ0e+rwUY
	Pj5ughEDWBOL41GKfX7yAS/eQ32521SonTJbwtrFSaJ1nVJ8yfn9U/rCZrQuwgOB+v8g
	seuPCDyNFjsswV2ap2S2gaLdRfB2OG7Lt73KAn1WKRg/IHJCEzbptz6PbVeHSBgtTt8i
	i6xg==
X-Gm-Message-State: APjAAAXiUCsniTTaWPXLS2JQ7UXkzX+JfVTxFsprw4mRWNoDPV5Mr3kE
	uT1tDtrOvijj5pRz7arrGFB9YjirsW4=
X-Google-Smtp-Source: APXvYqzhxYfR9fhV6Uyt8OQed4bfnDN7zhcvnlt1xcbj19spASkB4QCnurxJ1u9b2sEGZcIdlCDPfA==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr11105482lfc.60.1560469375055; 
	Thu, 13 Jun 2019 16:42:55 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id v7sm249466ljj.3.2019.06.13.16.42.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 16:42:54 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 01:42:51 +0200
Message-Id: <20190613234251.8494-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bitbake: cooker: list all nonexistent bblayer directories
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
X-List-Received-Date: Thu, 13 Jun 2019 23:42:55 -0000

Check existence of all the bblayer direcotories at once and print them
all, so if there are multiple nonexistent directories, user does not
have to correct bblayers.conf and restart bitbake multiple times.

[YOCTO #11647]

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 bitbake/lib/bb/cookerdata.py | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/cookerdata.py b/bitbake/lib/bb/cookerdata.py
index f8ae41093b..be1c332eb5 100644
--- a/bitbake/lib/bb/cookerdata.py
+++ b/bitbake/lib/bb/cookerdata.py
@@ -342,14 +342,24 @@ class CookerDataBuilder(object):
             data = parse_config_file(layerconf, data)
 
             layers = (data.getVar('BBLAYERS') or "").split()
+            broken_layers = []
 
             data = bb.data.createCopy(data)
             approved = bb.utils.approved_variables()
+
+            # Check whether present layer directories exist
             for layer in layers:
                 if not os.path.isdir(layer):
-                    parselog.critical("Layer directory '%s' does not exist! "
-                                      "Please check BBLAYERS in %s" % (layer, layerconf))
-                    sys.exit(1)
+                    broken_layers.append(layer)
+
+            if broken_layers:
+                parselog.critical("The following layer directories do not exist:")
+                for layer in broken_layers:
+                    parselog.critical("- %s", layer)
+                parselog.critical("Please check BBLAYERS in %s" % (layerconf))
+                sys.exit(1)
+
+            for layer in layers:
                 parselog.debug(2, "Adding layer %s", layer)
                 if 'HOME' in approved and '~' in layer:
                     layer = os.path.expanduser(layer)
-- 
2.17.1


