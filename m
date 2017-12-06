Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFDC07874D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 10:03:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB6A3I22003544
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Dec 2017 02:03:18 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Dec 2017 02:03:17 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1512104695.git.liezhi.yang@windriver.com>
	<2b4e2875e667df753c33418eefc437d9d0da6216.1512104695.git.liezhi.yang@windriver.com>
	<CAJTo0LZV1bVDcebUx=oDBhtZi-xCH5Cv+pFyxFYD0eeJ7=PJ6A@mail.gmail.com>
	<0c0d8839-930b-4124-bab8-58e33274c8af@windriver.com>
	<efad492f-551d-1f89-5160-e889b35a9162@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <a77eee56-b016-23d2-f271-7c0486c2f194@windriver.com>
Date: Wed, 6 Dec 2017 18:02:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <efad492f-551d-1f89-5160-e889b35a9162@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 V2] targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM
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
X-List-Received-Date: Wed, 06 Dec 2017 10:03:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Ross,

On 12/06/2017 11:11 AM, Robert Yang wrote:
> 
> 
> On 12/06/2017 09:37 AM, Robert Yang wrote:
>>
>> On 12/06/2017 12:10 AM, Burton, Ross wrote:
>>> On 1 December 2017 at 05:13, Robert Yang <liezhi.yang@windriver.com 
>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>
>>>     So that both QEMU_USE_KVM = "True" and "1" will work.
>>>
>>>     [YOCTO #12343]
>>>
>>>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>>>     <mailto:liezhi.yang@windriver.com>>
>>>     ---
>>>       meta/classes/testimage.bbclass | 2 +-
>>>       meta/lib/oeqa/targetcontrol.py | 2 +-
>>>       2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>>     diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
>>>     index 45bb2bd..7260ad4 100644
>>>     --- a/meta/classes/testimage.bbclass
>>>     +++ b/meta/classes/testimage.bbclass
>>>     @@ -215,7 +215,7 @@ def testimage_main(d):
>>>           # Get use_kvm
>>>           qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>>>           if qemu_use_kvm and \
>>>     -       (qemu_use_kvm == 'True' and 'x86' in machine or \
>>>     +       (oe.types.boolean(qemu_use_kvm) and 'x86' in machine or \
>>>               d.getVar('MACHINE') in qemu_use_kvm.split()):
>>>               kvm = True
>>>           else:
>>>     diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
>>>     index f63936c..3fc3870 100644
>>>     --- a/meta/lib/oeqa/targetcontrol.py
>>>     +++ b/meta/lib/oeqa/targetcontrol.py
>>>     @@ -107,7 +107,7 @@ class QemuTarget(BaseTarget):
>>>               dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>>>               qemu_use_kvm = d.getVar("QEMU_USE_KVM")
>>>               if qemu_use_kvm and \
>>>     -           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
>>>     +           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE")
>>>     or \
>>>                   d.getVar("MACHINE") in qemu_use_kvm.split()):
>>>                   use_kvm = True
>>>               else:
>>>
>>>
>>> https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/665/steps/Running%20oe-selftest/logs/stdio 
>>>
>>>
>>>    File 
>>> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/targetcontrol.py", 
>>> line 110, in __init__
>>>      (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
>>> UnboundLocalError: local variable 'oe' referenced before assignment
>>
>> Sorry, I had tried testimage and oe-selftest before and just now locally,
>> didn't see this error, need more investigations.
> 
> I can reproduce it now:
> 
> Add QEMU_USE_KVM = "1" to con/local.conf
> $ oe-selftest  -r devtool.DevtoolTests.test_devtool_deploy_target

I fixed it in the repo:


   git://git.openembedded.org/openembedded-core-contrib rbt/use_qemu
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/use_qemu

Robert Yang (1):
   targetcontrol.py: use oe.types.boolean for QEMU_USE_KVM


diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 45bb2bd..7260ad4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -215,7 +215,7 @@ def testimage_main(d):
      # Get use_kvm
      qemu_use_kvm = d.getVar("QEMU_USE_KVM")
      if qemu_use_kvm and \
-       (qemu_use_kvm == 'True' and 'x86' in machine or \
+       (oe.types.boolean(qemu_use_kvm) and 'x86' in machine or \
          d.getVar('MACHINE') in qemu_use_kvm.split()):
          kvm = True
      else:
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index f63936c..59a9c35 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -91,6 +91,8 @@ class QemuTarget(BaseTarget):

      def __init__(self, d, logger, image_fstype=None):

+        import oe.types
+
          super(QemuTarget, self).__init__(d, logger)

          self.rootfs = ''
@@ -107,7 +109,7 @@ class QemuTarget(BaseTarget):
          dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
          qemu_use_kvm = d.getVar("QEMU_USE_KVM")
          if qemu_use_kvm and \
-           (qemu_use_kvm == "True" and "x86" in d.getVar("MACHINE") or \
+           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
              d.getVar("MACHINE") in qemu_use_kvm.split()):
              use_kvm = True
          else:

// Robert

> 
> // Robert
> 
>>
>> // Robert
>>
>>>
>>> Ross

