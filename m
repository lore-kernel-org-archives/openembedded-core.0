Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C4811600BC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 23:16:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2018 15:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,499,1508828400"; d="scan'208";a="20898467"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2018 15:16:23 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jan 2018 15:16:12 -0800
Message-Id: <1514934973-80578-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] rpm_4.14.0: clamp timestamps
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
X-List-Received-Date: Tue, 02 Jan 2018 23:16:22 -0000

The recipe for RPM has been upgraded to version 4.14.0.
This version introduced a new macro "clamp_mtime_to_source_date_epoch".
The macro allows the RPM packages to set buildtime and mtime of files to
values as specified by SOURCE_DATE_EPOCH. This, however, is not the enabled by default:
The default setting for "clamp_mtime_to_source_date_epoch" is "0".
This patch sets the macro to "1", thus allowing clamping of the timestamps.
As the user needs to jump through some hoops to set SOURCE_DATE_EPOCH in
the environment, clamping the timestamps is very likely what the user wants.

I am aware that the macro can be set on command line.
This would involve patching the file package_rpm.bbclass, something like:

cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"

However, I think a better approach was to patch the upgraded recipe for the RPM,
in order to keep package_rpm.bbclass as RPM version agnostic as possible.

I tested this patch by a simple test, adding to local.conf:

export SOURCE_DATE_EPOCH
SOURCE_DATE_EPOCH="0"
PACKAGE_CLASSES = "package_rpm package_deb"

Then I ran twice (in two different folders, same machine, different times, no SSTATE):

$ bitbake core-image-minimal

The build created 3952 target packages (RPM and Debian each).

Without this patch the binary package comparison for RPM packages was:

Same: 538
Different: 3414
Total: 3952

With the patch the results were substantially better (same numbers for RPM and Debian):

Same: 3917
Different: 35
Total: 3952

Few caveats:
You need two additional patches by Alex Kanavin:
"rpm: update to 4.14.0"
"package.bbclass: replace rpm/debugedit with dwarfsrcfiles"

The resulting numbers need to be taken with a grain of salt, as there are
addional factors that can cause different results.
I realize SOURCE_DATE_EPOCH should be determined based on source code,
instead of setting it to "0", but that is not crucial to test the patch.

Finally, RPM 4.14.0 supports yet another macro "_buildhost" which should be used
to define some kind of a "standard" buildhost name in order to improve
reproducibility. (Otherwise, I think, buildost is taken from /etc/hosts).
But that's a subject of a separate patch.


Juro Bystricky (1):
  rpm_4.14.0: clamp timestamps by default

 .../recipes-devtools/rpm/files/0001-support-sde.patch | 19 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.0.bb               |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-support-sde.patch

-- 
2.7.4


