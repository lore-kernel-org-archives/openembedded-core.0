Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8E31571AB4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:55:34 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 02:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="207991921"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2018 02:55:33 -0800
Date: Thu, 1 Mar 2018 12:58:37 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180301105836.GA14042@mbabyjoh-desk.ger.corp.intel.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 01 Mar 2018 10:55:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


>Also fails on musl:
>
>ERROR: Nothing RPROVIDES 'glibc-utils' (but /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/meta/recipes-kernel/linux/kernel-devsrc.bb RDEPENDS on or otherwise requires it)
>
>Ross
>
>On 1 March 2018 at 08:28, Maxin B. John <maxin.john@intel.com> wrote:

 >On Wed, Feb 28, 2018 at 02:20:45PM -0500, Bruce Ashfield wrote:
 >> The existing kernel-devsrc package starts with a full copy of the kernel
 >> source and then starts to strip out elements that are not required.
 >>
 >> This results in extra time (I/O) and extra space being taken up in the
 >> final package. The main purpose of the kernel-devsrc package has been to
 >> build modules against the running kernel, not to include a full copy of
 >> the source code for re-building the kernel. The end result was a
 >> 600M kernel-devsrc package.

 Other failures are listed below:
 
 arm64:
 https://autobuilder.yocto.io/builders/nightly-arm64/builds/790/steps/Running%20Sanity%20Tests/logs/stdio

 RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED

HOSTCC  scripts/sortextable
 scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
#include <tools/be_byteshift.h>
  ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
make: *** [Makefile:557: scripts] Error 2
----------------------------------------------------------------------

Similar on qemuarm - poky-lsb :

https://autobuilder.yocto.io/builders/nightly-arm-lsb/builds/812/steps/Running%20Sanity%20Tests/logs/stdio

HOSTCC  scripts/recordmcount
HOSTCC  scripts/sortextable
scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
    #include <tools/be_byteshift.h>
              ^~~~~~~~~~~~~~~~~~~~~~
              compilation terminated.
              make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
              make: *** [Makefile:557: scripts] Error 2
-------------------------------------------------------------------------

Also on PowerPC:

https://autobuilder.yocto.io/builders/nightly-ppc-lsb/builds/814/steps/Running%20Sanity%20Tests/logs/stdio

scripts/sortextable.c:31:10: fatal error: tools/be_byteshift.h: No such file or directory
 #include <tools/be_byteshift.h>
           ^~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.host:102: scripts/sortextable] Error 1
make: *** [Makefile:557: scripts] Error 2

Best Regards,
Maxin

