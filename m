Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 475FA786BC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 21:31:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Dec 2017 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,398,1508828400"; d="scan'208";a="12082173"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 13 Dec 2017 13:31:42 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 13:31:12 -0800
Message-Id: <1513200676-59900-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/4] Refactor usage of gcc -ffile-prefix-map
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
X-List-Received-Date: Wed, 13 Dec 2017 21:31:41 -0000

The gcc that comes with OE-core supports a compiler option -ffile-prefix-map.
This option is essential in order to support binary reproducibility of packages
built from sources containing absolute paths due to various __FILE__ macros.
These can contain absolute path names of source code files as encountered on
the build host machine.
This affects basically all 150+ packaged kernel-module*, out of tree modules
(everybody inheriting module.bbclass, i.e. lttng-modules) and potentially individual
recipes.

While this compiler options is very useful, the presence cannot be assumed as
we may be building using an external toolchain. The detection code was already present
in kernel.bbclass. Since we may want to use this option (if present) in additional places,
it makes sense putting the detection code in a separate bbclass as opposed to replicating it
each time.
Not being aware of any better place, I put the code into a new bbclass "compiler-options.bbclass"

This patchset refactors kernel.bbclass and module.bbclass to use the new compiler-options.bbclass.
For a good measure the patcheset also contains a modified recipe for pulsaudio, demonstrating
how to use the compiler-options in a recipe.


Juro Bystricky (4):
  compiler-options.bbclass: provide and validate options
  kernel.bbclass: use class compiler-options
  module.bbclass: improve reproducibility
  pulseaudio: improve reproducibility

 meta/classes/compiler-options.bbclass              | 24 +++++++
 meta/classes/kernel.bbclass                        | 15 +----
 meta/classes/module.bbclass                        |  5 +-
 .../pulseaudio/pulseaudio/no-builddir.patch        | 74 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  | 12 +++-
 5 files changed, 115 insertions(+), 15 deletions(-)
 create mode 100644 meta/classes/compiler-options.bbclass
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/no-builddir.patch

-- 
2.7.4


