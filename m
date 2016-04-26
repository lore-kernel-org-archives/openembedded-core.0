Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E4B19731E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 19:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 9D5572E113
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id e2g8jatBzgKy
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id A8F762E062
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 8B9BBF88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 80DB5A2A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F0E7106F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3QJo0s4022767
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 21:50:00 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3QJo0Ho022766
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2016 21:50:00 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Apr 2016 21:49:57 +0200
Message-Id: <cover.1461700116.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Improve how to determine METADATA_REVISION
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
X-List-Received-Date: Tue, 26 Apr 2016 19:50:04 -0000

We noticed that METADATA_REVISION was always set to '<unknown>' in our
builds. It turned out that this was because the code in
metadata_scm.bbclass that sets it assumed that ${COREBASE} contains a
repository. This may be true when working with Poky, but is not
necessarily true for other setups. E.g., in our setup we clone Poky,
OpenEmbedded and other repositories using the repo tool and then
create symbolic links from the base directory to the parts that we
want. Since ${COREBASE} is defined based on the path to the meta
layer, it should be a better option to use ${COREBASE}/meta when
looking for the SCM meta information.

Since this works as expected for Git but not SVN, I removed the option
to call base_get_metadata_svn_revision() from
base_detect_revision(). I doubt this should affect anyone (partly
based on the comment in base_get_metadata_svn_revision()), but if this
is not acceptable, it should be trivial to change the code so the meta
directory is only used when looking for Git meta information. However,
since it would require the introduction of two functions to wrap the
Git functions, I refrained from this option until requested otherwise.

//Peter

The following changes since commit a9b503b268e94d311f892fa00c5d6bd9ffdb228e:

  license.bbclass: make sure that image manifest dir exists (2016-04-22 16:28:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/metadata_scm
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/metadata_scm

Peter Kjellerstedt (1):
  metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo

 meta/classes/metadata_scm.bbclass | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.1.0


