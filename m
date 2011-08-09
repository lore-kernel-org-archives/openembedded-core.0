Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1828G+sLcAa2Jl4174jRXFvT7PfBHA798w=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqrEb-0004Af-VZ
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:41:02 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79IaX3E029906
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 13:36:33 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 13:36:29 -0500
Message-Id: <1312914992-18260-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
References: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 1/4] python-dir: specify am_cv_python_pythondir & am_cv_python_pyexecdir
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
X-List-Received-Date: Tue, 09 Aug 2011 18:41:02 -0000

autoconf will try and set these to via python.m4:

am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages

However this is problematic as this doesnt respect libdir and where
we've actually set python's site package dir to.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/python-dir.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index 1ceb929..526b3bf 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,3 +1,6 @@
 PYTHON_BASEVERSION ?= "2.6"
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
+
+EXTRA_OECONF += "am_cv_python_pythondir=${PYTHON_SITEPACKAGES_DIR}"
+EXTRA_OECONF += "am_cv_python_pyexecdir=${PYTHON_SITEPACKAGES_DIR}"
-- 
1.7.3.4



