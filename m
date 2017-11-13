Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6671B7833E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:41:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vAD8f8Fx012313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Nov 2017 00:41:08 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 00:41:07 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<65b92ba827b1b5252355bb8d656b73286ec182fb.1510275834.git.liezhi.yang@windriver.com>
	<6adc72a1-8fd1-7e85-36c4-565d659fb438@linux.intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <1110a3c8-f1b7-e37b-73e9-be14561f2042@windriver.com>
Date: Mon, 13 Nov 2017 16:40:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <6adc72a1-8fd1-7e85-36c4-565d659fb438@linux.intel.com>
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
X-List-Received-Date: Mon, 13 Nov 2017 08:41:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/10/2017 10:21 PM, Alexander Kanavin wrote:
> On 11/10/2017 08:27 AM, Robert Yang wrote:
> 
>> -        if arch_var == None:
>> -            self.archs = 
>> self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
>> +
>> +        if arch_var:
>> +            self.archs = self.d.getVar(arch_var).replace("-","_").split()
>> +        else:
>> +            self.archs = 
>> self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_").split()
>> +        # Reverse archs to ensure the -best- match is listed firstly, but need
>> +        # make sure not mixed with multilib archs, and let multilib archs have
>> +        # higher a priority for multilib image:
>> +        # For non-multilib image: (e.g., core-image-minimal)
>> +        # machine_arch:package_archs:multilib_archs:allarch_archs
>> +        # For multilib image: (e.g., lib32-core-image-minimal)
>> +        # machine_arch:multilib_archs:package_archs:allarch_archs
>> +        package_archs_var = 
>> self.d.getVar('PACKAGE_ARCHS').replace("-","_").split()
>> +        machine_arch_var = [self.d.getVar('MACHINE_ARCH').replace("-","_")]
>> +        package_archs = []
>> +        allarch_archs = []
>> +        ml_archs = []
>> +        machine_arch = []
>> +        for arch in self.archs:
>> +            if arch in machine_arch_var:
>> +                bb.note("Found MACHINE_ARCH: %s" % arch)
>> +                machine_arch.append(arch)
>> +            elif arch in package_archs_var:
>> +                bb.note("Found PACKAGE_ARCH: %s" % arch)
>> +                package_archs.append(arch)
>> +            elif arch in 'all any noarch'.split():
>> +                bb.note("Found allarch: %s" % arch)
>> +                allarch_archs.append(arch)
>> +            else:
>> +                bb.note("Found multilib arch: %s" % arch)
>> +                ml_archs.append(arch)
>> +        package_archs.reverse()
>> +        if machine_arch:
>> +            self.archs = machine_arch
>> +        mlprefix = self.d.getVar('MLPREFIX')
>> +        if ml_archs:
>> +            ml_archs.reverse()
>> +            if mlprefix:
>> +                self.archs += ml_archs + package_archs
>> +            else:
>> +                self.archs += package_archs + ml_archs
>>           else:
>> -            self.archs = self.d.getVar(arch_var).replace("-","_")
>> +            self.archs = package_archs
>> +
>> +        self.archs += allarch_archs
>> +        self.archs = ' '.join(self.archs)
>> +        bb.note("The archs used by package manager: %s" % self.archs)
>> +
> 
> Can you place all of this in a helper function please?

Thanks, updated in the repo:

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index e28f321..f3cb123 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -467,10 +467,14 @@ class RpmPM(PackageManager):
          self.target_rootfs = target_rootfs
          self.target_vendor = target_vendor
          self.task_name = task_name
-        if arch_var == None:
-            self.archs = 
self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_")
+
+        if arch_var:
+            self.archs = self.d.getVar(arch_var).replace("-","_").split()
          else:
-            self.archs = self.d.getVar(arch_var).replace("-","_")
+            self.archs = 
self.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS').replace("-","_").split()
+        self._arch_reverse_helper()
+        bb.note("The archs used by package manager: %s" % self.archs)
+
          if task_name == "host":
              self.primary_arch = self.d.getVar('SDK_ARCH')
          else:
@@ -489,9 +493,52 @@ class RpmPM(PackageManager):
          if not os.path.exists(self.d.expand('${T}/saved')):
              bb.utils.mkdirhier(self.d.expand('${T}/saved'))

+    def _arch_reverse_helper(self):
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
+        for arch in self.archs:
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
+            self.archs = machine_arch
+        mlprefix = self.d.getVar('MLPREFIX')
+        if ml_archs:
+            ml_archs.reverse()
+            if mlprefix:
+                self.archs += ml_archs + package_archs
+            else:
+                self.archs += package_archs + ml_archs
+        else:
+            self.archs = package_archs
+
+        self.archs += allarch_archs
+        self.archs = ' '.join(self.archs)
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

