Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DDAB26079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 22:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489616021; x=1521152021;
	h=from:to:cc:subject:date:message-id;
	bh=DAOk2tVk5AWxrA/4FZ1flnfevUk0RHOfwx2Dcm04Imk=;
	b=R31Ea/DIpmMpjz42jrlNpz1kMxxhyCFLlDy07J1vHMuLG5VU2WYy3blO
	JiJdcgufYmohKmn9afYN9EJa+k2K/A==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 15:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="1108897478"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2017 15:13:40 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 15:13:35 -0700
Message-Id: <1489616018-8969-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/3] Build Appliance tweaks
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
X-List-Received-Date: Wed, 15 Mar 2017 22:13:40 -0000

The Build Appliance recipe needs several tweaks in order for the BA to build and
to function.

1. Use native pip3: Do not rely on pip3 being installed on host.
   This, of course, assumes there is already python-pip3-native support available.
   (a previous patch)

2. Remove symlinks before creating them to avid build errors, otherwise we may run
   into "File already exists" build errors. 

3. Ensure pod2man is present in the BA image, toaster will not run without it.
   

Even with all these changes, it may not be possible to use BA to build any image, unless
the sanity.bbclass accepts /bin/bash.bash as a viable shell. This has already been addressed
in another patch. The BA then needs to be rebuilt with SRCREV containing the sanity.bbclass patch.




Juro Bystricky (3):
  build-appliance-image: use pip3-native
  build-appliance-image: fix build errors
  build-appliance-image: ensure pod2man present in BA

 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.7.4


