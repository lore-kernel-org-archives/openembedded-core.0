Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D9B1F77026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 18:47:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t82Il99l019650
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Sep 2015 11:47:10 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 2 Sep 2015 11:47:09 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Sep 2015 13:47:07 -0500
Message-ID: <cover.1441219463.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] v2 pseudo 1.7 (now 1.7.1)
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
X-List-Received-Date: Wed, 02 Sep 2015 18:47:12 -0000
Content-Type: text/plain

So, this is just like the previous pseudo 1.7.0 patch, except
that the very strange and sporadic failures that were showing up
in the RPM backend are now fixed.

The actual issue: realpath(foo, NULL) is supposed to allocate storage.
When I stopped having path canonicalization allocate new storage, I
fixed the points where the returned values were being freed, but I
did not spot this particular instance of a place where the value was
being returned with the expectation that the caller would free it.

Also changed the lstat() calls in path canonicalization so they will
use lstat64 where appropriate (such as all the time on Linux), because
otherwise lstat() can fail if a file has an *inode value* out of range,
which is distinct from the "size out of range" issues previously corrected.
This may have broken path lookups in some cases on XFS.

The xattrdb stuff has not been otherwise changed, so it's still
considered experimental.

The following changes since commit bdeb32b4cdbe316f17c2fd854d59e05e8f2e8ffc:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:43:38 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo171
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo171

Peter Seebach (1):
  pseudo_1.7.1.bb: New version of pseudo

 meta/recipes-devtools/pseudo/pseudo_1.7.1.bb | 19 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.1.bb

-- 
2.3.1


