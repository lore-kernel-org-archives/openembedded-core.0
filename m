Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C6BAE784F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 10:24:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vADAOVfA003851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Nov 2017 02:24:31 -0800
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 02:24:30 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<65b92ba827b1b5252355bb8d656b73286ec182fb.1510275834.git.liezhi.yang@windriver.com>
	<6adc72a1-8fd1-7e85-36c4-565d659fb438@linux.intel.com>
	<1110a3c8-f1b7-e37b-73e9-be14561f2042@windriver.com>
	<4e79c869-8af8-0135-c249-ce21d6107ff5@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <74e96cef-3591-da4a-93b1-e74ea4b0460e@windriver.com>
Date: Mon, 13 Nov 2017 18:23:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <4e79c869-8af8-0135-c249-ce21d6107ff5@linux.intel.com>
Subject: Re: [PATCH 13/23] package_manager.py: reverse archs correctly
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
X-List-Received-Date: Mon, 13 Nov 2017 10:24:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/13/2017 05:04 PM, Alexander Kanavin wrote:
> On 11/13/2017 10:40 AM, Robert Yang wrote:
>>> Can you place all of this in a helper function please?
>>
>> Thanks, updated in the repo:
>> +        self._arch_reverse_helper()
> 
> Don't make the helper update class variables. It makes the code hard to 
> understand or reason about. Instead, call like this:
> 
> self.archs = _determine_archs(arch_var)
> 
> and do the rest in the helper. So that self.archs is assigned to only once.

Thanks, updated in the repo:

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e28f321..7674af8 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -467,10 +467,10 @@ class RpmPM(PackageManager):
          self.target_rootfs = target_rootfs
          self.target_vendor = target_vendor
          self.task_name = task_name
-        if arch_var == None:
-            self.archs = 
self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
-        else:
-            self.archs = self.d.getVar(arch_var).replace("-","_")
+
+        self.archs = self._determine_archs(arch_var)
+        bb.note("The archs used by package manager: %s" % self.archs)
+
          if task_name == "host":
              self.primary_arch = self.d.getVar('SDK_ARCH')
          else:
@@ -489,9 +489,56 @@ class RpmPM(PackageManager):
          if not os.path.exists(self.d.expand('${T}/saved')):
              bb.utils.mkdirhier(self.d.expand('${T}/saved'))

+    def _determine_archs(self, arch_var):
+        if arch_var:
+            archs = self.d.getVar(arch_var).replace("-","_").split()
+        else:
+            archs = 
self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_").split()
+        # Reverse archs to ensure the -best- match is listed firstly, but need
+        # make sure not mixed with multilib archs, and let multilib archs have
+        # higher a priority for multilib image:
+        # For non-multilib image: (e.g., core-image-minimal)
+        # machine_arch:package_archs:multilib_archs:allarch_archs
+        # For multilib image: (e.g., lib32-core-image-minimal)
+        # machine_arch:multilib_archs:package_archs:allarch_archs
+        package_archs_var = self.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
+        machine_arch_var = [self.d.getVar('MACHINE_ARCH').replace("-","_")]
+        package_archs = []
+        allarch_archs = []
+        ml_archs = []
+        machine_arch = []
+        for arch in archs:
+            if arch in machine_arch_var:
+                bb.note("Found MACHINE_ARCH: %s" % arch)
+                machine_arch.append(arch)
+            elif arch in package_archs_var:
+                bb.note("Found PACKAGE_ARCH: %s" % arch)
+                package_archs.append(arch)
+            elif arch in 'all any noarch'.split():
+                bb.note("Found allarch: %s" % arch)
+                allarch_archs.append(arch)
+            else:
+                bb.note("Found multilib arch: %s" % arch)
+                ml_archs.append(arch)
+        package_archs.reverse()
+        if machine_arch:
+            archs = machine_arch
+        mlprefix = self.d.getVar('MLPREFIX')
+        if ml_archs:
+            ml_archs.reverse()
+            if mlprefix:
+                archs += ml_archs + package_archs
+            else:
+                archs += package_archs + ml_archs
+        else:
+            archs = package_archs
+
+        archs += allarch_archs
+        return ' '.join(archs)
+
      def _configure_dnf(self):
          # libsolv handles 'noarch' internally, we don't need to specify it 
explicitly
-        archs = [i for i in reversed(self.archs.split()) if i not in ["any", 
"all", "noarch"]]
+        archs = [i for i in self.archs.split() if i not in ["any", "all", 
"noarch"]]
          # This prevents accidental matching against libsolv's built-in policies
          if len(archs) <= 1:
              archs = archs + ["bogusarch"]

// Robert

> 
> Alex
> 

