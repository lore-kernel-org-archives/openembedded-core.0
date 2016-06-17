Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id C1A2C65CC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 13:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 863AD2E2DB;
	Fri, 17 Jun 2016 15:41:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id KoTSv0Gagbbo; Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id B19812E21B;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 9B8FF1BAF;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 90DCF1B88;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8EFF7DFA;
	Fri, 17 Jun 2016 15:41:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HDfIp2001936;
	Fri, 17 Jun 2016 15:41:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HDfITV001932;
	Fri, 17 Jun 2016 15:41:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 15:41:02 +0200
Message-Id: <cover.1466170741.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 0/4] Fixes for useradd-staticids.bbclass
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
X-List-Received-Date: Fri, 17 Jun 2016 13:41:21 -0000

The main change here is to fix the regression reported in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9777 which resulted
in setting USERADD_ERROR_DYNAMIC having no effect if the user or group
was not listed at all in a passwd or groups file.

In the ticket discussion there was also a suggestion to allow the
error to be turned into a warning. I have implemented this as well,
whereby one can now set USERADD_ERROR_DYNAMIC to either "error" or
"warn" to decide which behavior one wants. (It is of course still
possible to set it to "1" for backwards compatibility.)

The latter change requires some updates to the documentation, which is
provided in the last commit. This is intended for the yocto-docs
repository.

//Peter

The following changes since commit 4799e1e89fd9b0f8b606e3c502fe89f32d45fe76:

  gtk+3: Add patch for --disable-opengl (2016-06-17 11:17:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd-staticids-regression
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd-staticids-regression

Peter Kjellerstedt (4):
  documentation.conf: Add information about USERADD varaibles
  useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs
  useradd-staticids.bbclass: Allow missing UIDs/GIDs to generate
    warnings
  Update the documentation of USERADD_ERROR_DYNAMIC

 documentation/ref-manual/ref-variables.xml | 19 +++++++++++--------
 meta/classes/useradd-staticids.bbclass     | 22 ++++++++++++++++------
 meta/conf/documentation.conf               |  4 ++++
 3 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.9.0


