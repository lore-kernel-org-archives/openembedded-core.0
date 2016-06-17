Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC4BE731E6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 14:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AC054181C8;
	Fri, 17 Jun 2016 16:59:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id YfyagbDo9X6X; Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id AE1AA181B5;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 97AE21B93;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 8BC5119F8;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 89D77FCE;
	Fri, 17 Jun 2016 16:59:04 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u5HEx4nL009525;
	Fri, 17 Jun 2016 16:59:04 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u5HEx4mf009524;
	Fri, 17 Jun 2016 16:59:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 16:58:58 +0200
Message-Id: <cover.1466175510.git.pkj@axis.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCHv2 0/5] Fixes for useradd-staticids.bbclass
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
X-List-Received-Date: Fri, 17 Jun 2016 14:59:06 -0000

The main change here is to fix the regression reported in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9777 which resulted
in setting USERADD_ERROR_DYNAMIC having no effect if the user or group
was not listed at all in a passwd or groups file.

In the ticket discussion there was also a suggestion to allow the
error to be turned into a warning. I have implemented this as well,
whereby one can now set USERADD_ERROR_DYNAMIC to either "error" or
"warn" to decide which behavior one wants. (It is of course still
possible to set it to "1" for backwards compatibility.)

The change to USERADD_ERROR_DYNAMIC requires some updates to the
documentation, which is provided in the final commit. This is intended
for the yocto-docs repository.

PATCHv2: Added a first commit to update the documentation of
USERADD_ERROR_DYNAMIC and USERADDEXTENSION per Mark Hatle's suggestion.
This is also intended for the yocto-docs repository.

//Peter

The following changes since commit 4799e1e89fd9b0f8b606e3c502fe89f32d45fe76:

  gtk+3: Add patch for --disable-opengl (2016-06-17 11:17:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/useradd-staticids-regression
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/useradd-staticids-regression

Peter Kjellerstedt (5):
  Update the documentation of USERADD_ERROR_DYNAMIC and USERADDEXTENSION
  documentation.conf: Add information about USERADD variables
  useradd-staticids.bbclass: Restore failure on missing UIDs/GIDs
  useradd-staticids.bbclass: Allow missing UIDs/GIDs to generate
    warnings
  Update the documentation of USERADD_ERROR_DYNAMIC

 documentation/ref-manual/ref-variables.xml | 27 +++++++++++++++------------
 meta/classes/useradd-staticids.bbclass     | 22 ++++++++++++++++------
 meta/conf/documentation.conf               |  4 ++++
 3 files changed, 35 insertions(+), 18 deletions(-)

-- 
2.9.0


