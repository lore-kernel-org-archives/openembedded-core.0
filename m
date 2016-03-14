Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2B55A65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:42:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2016 14:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,337,1455004800"; d="scan'208";a="910269040"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2016 14:42:34 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 14:29:10 -0700
Message-Id: <1457990951-32467-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: PATCH 0/1] ncurses: Improved installation
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
X-List-Received-Date: Mon, 14 Mar 2016 21:42:34 -0000

The installation on ncurses calls "make install.libs install.includes"
Turns out, install.libs implicitly installs header files as well,
so calling install.includes is redundant. 

The description in INSTALL explicitly says:
...
'make install.includes' installs the headers.
'make install.libs'     installs the libraries (and the headers) 
...

Not needing to call install.includes has an additional benefit: It     
automatically removes a potential race condition between the two targets.



Juro Bystricky (1):
  ncurses_6: Improve installation

 .../ncurses/files/fix-include-files-race.patch     | 32 ----------------------
 meta/recipes-core/ncurses/ncurses.inc              | 11 ++++++--
 meta/recipes-core/ncurses/ncurses_6.0+20160213.bb  |  1 -
 3 files changed, 8 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/fix-include-files-race.patch

-- 
1.9.1


