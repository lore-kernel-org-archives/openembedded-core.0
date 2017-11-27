Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0D5F78301
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 15:56:49 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 70so18869016pgf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0dqv64kB53G2l3EY+gBM8pL8uJiIKh4pmacikeQxFBg=;
	b=YfK+LuvCBs5gBX+zg/D+ZfsJ83+8GMLxZP7+isa5Sznjqza74OMkwetOZYQyhvpnA1
	SQGZ+sXq21s05wkXefpK01cWvwVqd8f8P7lSAvEuv3sY2llMgAryZBWoztDHEMr08WjC
	DkdV7TAXDO3g0EHIolAxr3gHLcofLx5/Fbad51Mg48DhJ4wY/TEzTrwdZ8oW5qvemaLw
	0u++X/sYCnctKgwmNswvstiavejwTSsXnwxkbEru4hP3jlb5SSoOka9w0qPZD6nsSNW0
	mAqoPH9f+CyattdKaY3/GFHU32U3r1zzvvbhIYwix58i5JhbF5I+2XbQetvvmp9PwRch
	6QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0dqv64kB53G2l3EY+gBM8pL8uJiIKh4pmacikeQxFBg=;
	b=ZJOdkNAJ+WoShT5ij8g6Mhh/VXdGBxAg1MYXTz88g4Es6Psvi/k2YInCG1S5Y84e9h
	14MSZ6SqYb6vFG93ty9bXw+oDf8nVRJWginQsWTKmcQZqnGV4fGXFQHgsu3PZIAi2kTA
	uiUjTlI2R0INB43TrjsNjwjhsWEQgSSBFDbY3GAUK+mFmozsLAZXXJ1x4/GIaLTIrzBN
	4wprX/AZyJH2OK8Oz4Wi98D8Dh4t1sDIptJUW0eN0Mt33cG7EmH0YwEFudDVnS60W2Zg
	sVi4xPPOi7oygeNBWcWuT2W+5XD/kgycuFbWx/6OQzqWL9wV12dX/H4o5/H6c+BM2ngK
	Gpnw==
X-Gm-Message-State: AJaThX6qDIeL0+YUtQ5cj6/04YpI0WZaQe62kiaS1h6zF2s/LvBE7UrQ
	+/ETPbadB7AyuNQt/TLtuizDgiM=
X-Google-Smtp-Source: AGs4zMaW3SNtTgZmTA1o4NdjeThUMnddXmGrHgoLMeWOjFda7cT/Tq6hzRLTzPs23RyJSq8j43zu7A==
X-Received: by 10.101.67.140 with SMTP id m12mr36362110pgp.51.1511798210859;
	Mon, 27 Nov 2017 07:56:50 -0800 (PST)
Received: from pohly-desktop.fritz.box (p54BD51E2.dip0.t-ipconnect.de.
	[84.189.81.226]) by smtp.gmail.com with ESMTPSA id
	m87sm40889460pfi.88.2017.11.27.07.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 07:56:49 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 16:56:40 +0100
Message-Id: <cover.34dd9130ccff96d177d10e8e7e414aa4ebbb71c2.1511796276.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/2] fixes for read-only rootfs
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
X-List-Received-Date: Mon, 27 Nov 2017 15:56:50 -0000

When investigating in refkit why /etc/machine-id was getting
permanently modified in a rootfs despite read-only-rootfs in
IMAGE_FEATURES, I noticed two things:
- the boot parameters did not include "ro", the initramfs thus
  mounted the rootfs read/write, and systemd then wrote
  /etc/machine-id before mounting read-only due to the options
  in /etc/fstab; this explains the issue I was seeing
- one bogus check for read-only-rootfs crept into connman.inc

Let's make sure that "ro" gets added to the boot parameters to avoid
the issue. I prefer to keep related functionality together, so I
decided to put that into rootfs-postcommands.bbclass next to the fstab
change. It could also go into image.bbclass itself.

The special case in connman.inc doesn't seem to be needed, therefore I
propose to remove it without trying to find a different solution.

Patrick Ohly (2):
  connman.inc: do not check IMAGE_FEATURES
  rootfs-postcommands.bbclass: ensure that rootfs gets mounted ro

 meta/classes/rootfs-postcommands.bbclass      | 8 ++++++++
 meta/recipes-connectivity/connman/connman.inc | 3 ---
 2 files changed, 8 insertions(+), 3 deletions(-)

base-commit: 3b413a80578caacd9a7f405f3c51a3921d78a60d
-- 
git-series 0.9.1

