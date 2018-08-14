Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C8BBB78FBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:21:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g1-v6so17735350wru.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=/j7pBZJszqI8iXa9Py/a2P7hw1jUdgwQEUNoW+FO8Pw=;
	b=IvNGG8AkvdeeAzlFa20VEiR/Rc1GsL0200KiRWZj8Gei1Pqvi3zBPVVCQqt5vxodVa
	UE03uqrMivfUx6f69ZHrusARJpgjzupfp3XHamKr3pon/IhkyNi6kjsMtcYLfnEpbbfl
	5P5OE25k397PdGKLlhY667EVHEv27va29uovBg5anCh6Y48CXoa2QWDvdDSZBZvLDNtD
	aPcFYV20uenxIpBJ/g4I18RQsa8aMq2KtU+4TQ+OzXWmCdJcqxhHUV5DpdyeLsUYCyXd
	S2NeuE1nGza/DvwQupENHZHlflsqgByf7GJ7YAmiirK9DAGIMoRYR2AxlpsAZuR7u8hu
	gDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/j7pBZJszqI8iXa9Py/a2P7hw1jUdgwQEUNoW+FO8Pw=;
	b=NYtZ8nxAj58WLSJ1uD2tr0red2iJII/NCUGzPmoXZ2CXmMDgbbB0437EKPmqpLg31Y
	HNRen+irqtJYSsWoLRQjJxw0sE2W9/L/Qsc51HbGwHC7ZvsAKFmlayXnLJZ8KCoN9bJ6
	LnltHITKSN9234BZKOXBLsFgPUtDcmxWedTyPuo6eiDBHkjPjCZ2YK7/13ijNp9W23Fb
	6RFQiPXsPe19pGbO+iHONpPKDESHYPp9H6vvs94jNj4idQKhzpn7tNvcLclNO8pOVfUX
	Rr/vJFHoRLgtq/LMwCcUdrtCfY0wB46O7FLhyvwly19dpus3tFiQY8mB2XzVS9wSAtVa
	OkiA==
X-Gm-Message-State: AOUpUlFH2AO5K8y2t22xfvt09R4+yvxLBjzHhcAEhIiMip7YLCwK44t3
	Z6MKwfQB3wSfEBW/7n8e8b6tJAXoSIU=
X-Google-Smtp-Source: AA+uWPzjIwLcZ1FGcJwc6KP0qAwVJe/0WevwmQSlmPqIV3rMQuUhPugM3gXultyOL3jI9YMwTP7Ywg==
X-Received: by 2002:a5d:55c8:: with SMTP id
	i8-v6mr13510548wrw.38.1534263676103; 
	Tue, 14 Aug 2018 09:21:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x82-v6sm40273330wmd.11.2018.08.14.09.21.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:21:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 17:21:13 +0100
Message-Id: <20180814162113.22774-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oe-pkgdata-util: improve resiliance of lookup-recipe
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
X-List-Received-Date: Tue, 14 Aug 2018 16:21:16 -0000

If we can't find the pkgdata for a package, instead of erroring out just emit a
message and continue.

This makes it possible to pass long lists of packages to oe-pkgdata-util and
process the output.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/oe-pkgdata-util | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e6c9df94e83..5d2e328ee08 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -279,10 +279,10 @@ def lookup_recipe(args):
                 parse_pkgdatafile(pkgdatafile)
             continue
         pkgdatafile = os.path.join(args.pkgdata_dir, 'runtime-reverse', pkg)
-        if not os.path.exists(pkgdatafile):
-            logger.error("The following packages could not be found: %s" % pkg)
-            sys.exit(1)
-        parse_pkgdatafile(pkgdatafile)
+        if os.path.exists(pkgdatafile):
+            parse_pkgdatafile(pkgdatafile)
+        else:
+            print("The following packages could not be found: %s" % pkg)
 
 def package_info(args):
     def parse_pkgdatafile(pkgdatafile):
-- 
2.11.0


