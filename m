Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2167965C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 05:48:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1H5mOmQ019084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Feb 2015 21:48:24 -0800 (PST)
Received: from op3.wrs.com (128.224.56.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Feb 2015 21:48:23 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Feb 2015 00:47:43 -0500
Message-ID: <1424152066-23546-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.2.1
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH-v2 0/3] coreutils: facilitate generating real manpages
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
X-List-Received-Date: Tue, 17 Feb 2015 05:48:24 -0000
Content-Type: text/plain

As part of improving the end user experience for installs where the
end user interacts directly with the generated filesystem (e.g. the
build-appliance) these three commits ensure that we can have real
man pages for coreutils on the target if desired.

This has been problematic for everyone who cross compiles, since the
gnu folks use "help2man" -- which is a perl script that wants to run
the target binaries (e.g. "chmod --help") and then use the output from
that.  And unfortunately this doesn't appear likely to change.

Our current status is that we "hide" perl by defeating a perl check,
and also we have our own "help2man" script which unconditionally fails
(as part of an earlier solution to the manpages problem).  And then the
doc RPM gets useless stub manpages with a big "OOOPS" message in them.

Here we delete all stuff associated with the old solutions, and then
decouple the one makefile line triggering what would be the failed
attempt at generating manpages via help2man.  Then we add in sourcing
and using prebuilt manpages from the Gentoo project (which was their
solution[1] to the help2man cross-compile issue).

[v2: use update-alternatives in patch #2; patch #1 and #3 unchanged]

Paul.

[1] http://lists.gnu.org/archive/html/coreutils/2014-11/msg00001.html
---

Paul Gortmaker (3):
  coreutils: don't generate useless dummy stub manpages
  coreutils: import prebuilt manpages from Gentoo
  scripts: delete dummy help2man script

 .../coreutils/coreutils-8.23/dummy_help2man.patch  | 22 ---------------
 .../coreutils-8.23/fix-for-dummy-man-usage.patch   | 31 ----------------------
 .../man-decouple-manpages-from-build.patch         | 27 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.23.bb      | 24 +++++++++++++----
 scripts/help2man                                   |  3 ---
 5 files changed, 46 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.23/man-decouple-manpages-from-build.patch
 delete mode 100755 scripts/help2man

-- 
2.2.1


