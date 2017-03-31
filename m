Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD2E371CA7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 02:30:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2V2UmsV005365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Mar 2017 19:30:48 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 19:30:47 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 21:30:25 -0500
Message-ID: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/4] yocto-compat-layer.py updates
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
X-List-Received-Date: Fri, 31 Mar 2017 02:30:50 -0000
Content-Type: text/plain

The changes in this series fix a number of issues with the yocto-compat-layer
script.

- When a layer is skipped due to missing dependencies, it was difficult to
  see this without inspecting the whole log.

- There needs to be a way to pass in a list of layers that can be used
  for dependencies, but should not be evaluated in this pass.  The overall
  evaluation is very time consuming and having to parse/validate 15
  dependent layers to see if the layer you are working on passes is not
  useful!

- The dependency processing was not working properly.  It was only processing
  dependencies at one level.  Move this to a recursive process so we're
  sure that all needed dependencies are present.

- Change how the initial signatures are stored to be compared to the layers
  signatures for distro/BSP checks.  Before the signatures were stored very
  early (before any dependencies were calculated), causing the dependencies
  for a BSP layer to trigger a failure in signature validation.

Mark Hatle (4):
  yocto-compat-layer.py: Add status for skipped items
  yocto-compat-layer.py: Add --dependency argument
  compatlayer/__init__.py: Allow add_layer to process recursive deps
  yocto-compat-layer.py: Fix the signature validation

 scripts/lib/compatlayer/__init__.py | 47 ++++++++++++++++++++++++++++++-------
 scripts/yocto-compat-layer.py       | 47 +++++++++++++++++++++++++++----------
 2 files changed, 73 insertions(+), 21 deletions(-)

-- 
1.8.3.1


