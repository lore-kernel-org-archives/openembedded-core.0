Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 189E1731D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 02:21:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Mar 2016 18:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,318,1455004800"; d="scan'208";a="931449355"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga002.jf.intel.com with ESMTP; 10 Mar 2016 18:21:11 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 18:07:35 -0800
Message-Id: <1457662056-18208-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] Race condition in ncurses install
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
X-List-Received-Date: Fri, 11 Mar 2016 02:21:12 -0000

There is a race condition in ncurses installation. Two targets (install.libs and install.includes)
install the same files, resulting in a race condition when running parallel make.
One way to fix the race is to install the targets sequentially. 
The other way is to ensure only one of the targets actually installs the files.  
The second approach is more invasive, but more efficient: Not only we are still
able to use parallel make, but also the files are installed only once.
This race is addressed in a patch file, making sure only one of the targets 
(install.includes) installes the include files.
This will work properly (i.e.ncurses will install as intended by the recipe) as 
long as we always install both targets.


Juro Bystricky (1):
  ncurses_6: Fix an install race condition

 .../ncurses/files/fix-include-files-race.patch     | 32 ++++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.0+20160213.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/fix-include-files-race.patch

-- 
1.9.1


