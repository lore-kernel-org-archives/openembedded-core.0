Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SSHKJ-00045o-3H
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:33:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 May 2012 17:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164204781"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.13.30])
	by fmsmga002.fm.intel.com with ESMTP; 09 May 2012 17:22:51 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2012 17:22:48 -0700
Message-Id: <934fed48b0c07e606c80023ba045c6c2471bf1b0.1336608479.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
In-Reply-To: <cover.1336608479.git.josh@linux.intel.com>
References: <cover.1336608479.git.josh@linux.intel.com>
Subject: [RFC PATCH 3/3] sstate.bbclass: ensure sstate files are easily shared
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 00:33:51 -0000

In order to make sstate cache's more easily shared ensure any user of
the system has rwx permission by calling chown on sstate files after
they're created.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sstate.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a8c98e5..6707ecf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -454,6 +454,7 @@ sstate_create_package () {
 	else
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
+	chmod 0777 $TFILE
 	mv $TFILE ${SSTATE_PKG}
 
 	cd ${WORKDIR}
-- 
1.7.7.6



