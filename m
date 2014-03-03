Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D5CC6E717
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:42:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Mar 2014 07:42:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,578,1389772800"; d="scan'208";a="491324436"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2014 07:42:42 -0800
Date: Mon, 3 Mar 2014 17:42:41 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140303154240.GB21480@lpalcu-linux>
References: <cover.1393839480.git.laurentiu.palcu@intel.com>
	<bb06f92710d0567d5019cf13d6c11caa1fc91d32.1393839480.git.laurentiu.palcu@intel.com>
	<5314998B.8050102@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5314998B.8050102@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] package_manager.py: RpmPM: don't add smart channel if already added
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
X-List-Received-Date: Mon, 03 Mar 2014 15:42:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

On Mon, Mar 03, 2014 at 09:02:35AM -0600, Mark Hatle wrote:
> On 3/3/14, 3:43 AM, Laurentiu Palcu wrote:
> >Make sure the channel was not already added, before attempting to add.
> >
> >[YOCTO #5890]
> 
> When generating the rootfs/etc/rpm/platform file, the order should
> be in the order of highest to lowest priority as well.
> 
> Smart uses this order (via an RPM API) to help determine scores when
> two packages from repositories at the same priority (with different
> architectures) are selected.
Thanks for the info. This patchset should restore the behavior to the
one you describe. Python's sets messed up the order, so I reverted that
patch.

laurentiu
> 
> --Mark
> 
> >Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >---
> >  meta/lib/oe/package_manager.py |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> >index 6c133c3..ee42952 100644
> >--- a/meta/lib/oe/package_manager.py
> >+++ b/meta/lib/oe/package_manager.py
> >@@ -604,11 +604,11 @@ class RpmPM(PackageManager):
> >          # self._invoke_smart('config --set rpm-log-level=debug')
> >          # cmd = 'config --set rpm-log-file=/tmp/smart-debug-logfile'
> >          # self._invoke_smart(cmd)
> >-
> >+        ch_already_added = []
> >          for canonical_arch in platform_extra:
> >              arch = canonical_arch.split('-')[0]
> >              arch_channel = os.path.join(self.deploy_dir, arch)
> >-            if os.path.exists(arch_channel):
> >+            if os.path.exists(arch_channel) and not arch in ch_already_added:
> >                  bb.note('Note: adding Smart channel %s (%s)' %
> >                          (arch, channel_priority))
> >                  self._invoke_smart('channel --add %s type=rpm-md baseurl=%s -y'
> >@@ -617,6 +617,8 @@ class RpmPM(PackageManager):
> >                                     (arch, channel_priority))
> >                  channel_priority -= 5
> >
> >+                ch_already_added.append(arch)
> >+
> >          bb.note('adding Smart RPM DB channel')
> >          self._invoke_smart('channel --add rpmsys type=rpm-sys -y')
> >
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

