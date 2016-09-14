Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B3C9273D46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 17:06:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2016 10:06:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,334,1470726000"; 
   d="scan'208";a="8544631"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 14 Sep 2016 10:06:03 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 10:05:45 -0700
Message-Id: <1473872746-38158-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <CAJTo0LaR5V+yFUr33G+h1=Ja=PpGTC0OtbSQOn9M06tz38vbCg@mail.gmail.com>
References: <CAJTo0LaR5V+yFUr33G+h1=Ja=PpGTC0OtbSQOn9M06tz38vbCg@mail.gmail.com>
Cc: 00, From, 17, Sep, 7119256339f3bff9f412c55024b2b016e0a88ca5, 2001, Mon,
	jurobystricky@hotmail.com
Subject: From: Juro Bystricky <juro.bystricky@intel.com>
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
X-List-Received-Date: Wed, 14 Sep 2016 17:06:05 -0000

(Resending updated patches... hopefully got it right this time)

There is an occasional race observed when building Busybox.
It has been discussed on Busybox mailing list (see:
https://www.mail-archive.com/busybox@busybox.net/msg23244.html )

There were several Busybox attempts to fix this issue:
0dddbc1a59795a77679d8c5ef48a2795cb470563 ("build system: always rewrite NUM_APPLETS.h")
d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 ("build system: different fix for include/applet_tables.h/include/NUM_APPLETS.h")

Although the patches alleviated the problem somewhat, the race can still be observed.
The error is consistently the same:

libbb/appletlib.c:164:13: error: 'NUM_APPLETS' undeclared (first use in this function)
  while (i < NUM_APPLETS) {

The reason is the include file where NUM_APPLETS is defined is not yet generated (or is being modified)
at the time libbb/appletlib.c is compiled.
The attached patch fixes the problem by assuring libb is compiled as the last directory.


*** BLURB HERE ***

Juro Bystricky (1):
  busybox: Avoid race building libbb

 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   | 53 ++++++++++++++++++
 .../commit-applet_tables-fix-commit-0dddbc1.patch  | 61 ++++++++++++++++++++
 .../busybox/busybox/makefile-libbb-race.patch      | 34 +++++++++++
 .../busybox/busybox/parallel-make-fix.patch        | 65 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  4 +-
 5 files changed, 151 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 create mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/parallel-make-fix.patch

-- 
2.7.4


