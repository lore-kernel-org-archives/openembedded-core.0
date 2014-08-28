Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id CF7C871191
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1D9822E2D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MtsAklUcHfIM
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 360562E3D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 18F5E13E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 0C869C44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0AB5A3E049
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id s7SFB8vw015257
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 17:11:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id s7SFB7DI015256
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 17:11:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Aug 2014 17:11:02 +0200
Message-Id: <cover.1409238578.git.pkj@axis.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH 0/2] Serious regression in multiprocess_exec()
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
X-List-Received-Date: Thu, 28 Aug 2014 15:11:18 -0000

This fixes a serious regression in multiprocess_exec() which prevented
it from returning anything. This caused package_do_filedeps() in
package.bbclass to no longer add any runtime dependencies based on
what oe.package.filedeprunner() was supposed to return...

Since the change to multiprocess_exec() will _not_ trigger do_package
to be rerun for the affected packages, I have also included a small
typo correction to a comment in do_package so its sstate is
invalidated.

The following changes since commit c16795477ea7e2159b5d3808268912b572887e2d:

  qemu: add PACKAGECONFIG for numa (2014-08-27 12:13:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/multiprocess_exec
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/multiprocess_exec

Peter Kjellerstedt (2):
  lib/oe/utils: Make multiprocess_exec() return anything
  package: Correct two typos in a comment

 meta/classes/package.bbclass | 6 +++---
 meta/lib/oe/utils.py         | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.0


