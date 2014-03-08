Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0686C6BC8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 08:23:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s288NQ8n003684
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Mar 2014 00:23:26 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Sat, 8 Mar 2014 00:23:25 -0800
Message-ID: <531AD37A.9030300@windriver.com>
Date: Sat, 8 Mar 2014 16:23:22 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
	<9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
	<1394142938.12327.18.camel@ted>
	<20140307063553.GA21125@lpalcu-linux>
In-Reply-To: <20140307063553.GA21125@lpalcu-linux>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] buildhistory.bbclass: Fix dependency files creation
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
X-List-Received-Date: Sat, 08 Mar 2014 08:23:34 -0000
X-Groupsio-MsgNum: 51041
Content-Type: multipart/mixed; boundary="------------060801010902080905030202"

--------------060801010902080905030202
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2014 02:35 PM, Laurentiu Palcu wrote:
> On Thu, Mar 06, 2014 at 09:55:38PM +0000, Richard Purdie wrote:
>> On Wed, 2014-03-05 at 14:39 +0200, Laurentiu Palcu wrote:
>>> Call the new python routines.
>>>
>>> [YOCTO #5904]
>>>
>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>> ---
>>>   meta/classes/buildhistory.bbclass |    9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>>> index ef4135b..01b0082 100644
>>> --- a/meta/classes/buildhistory.bbclass
>>> +++ b/meta/classes/buildhistory.bbclass
>>> @@ -319,6 +319,12 @@ python buildhistory_list_installed() {
>>>   
>>>       with open(pkgs_list_file, 'w') as pkgs_list:
>>>           pkgs_list.write(list_installed_packages(d, 'file'))
>>> +
>>> +    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
>>> +                                  "bh_installed_pkgs_deps.txt")
>>> +
>>> +    with open(pkgs_deps_file, 'w') as pkgs_deps:
>>> +        pkgs_deps.write(list_installed_packages(d, 'deps'))
>>>   }
>>>   
>>>
>>> @@ -338,7 +344,8 @@ buildhistory_get_installed() {
>>>   
>>>   	# Produce dependency graph
>>>   	# First, quote each name to handle characters that cause issues for dot
>>> -	rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
>>> +	cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
>>> +		rm ${WORKDIR}/bh_installed_pkgs_deps.txt
>>>   	# Change delimiter from pipe to -> and set style for recommend lines
>>>   	sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
>>>   	# Add header, sorted and de-duped contents and footer and then delete the temp file
>> With this patch, a bitbake core-image-minimal -c populate_sdk resulted
> No, not quite. The bug appears to be in
> RpmPM._pkg_translate_smart_to_oe(), which none of my patches touched.
>
> CCing Hongxu.

Hi Laurentiu and Richard,

The reason is pkg's arch was not found in the multilib arch list.

I could not reproduce the defect on my local build with these
patches applyed.

The attach a patch that add some trace code to see which
pkg's arch is not found in this situation.

//Hongxu

> laurentiu
>
>> in:
>>
>> ERROR: Error executing a python function in /media/build1/poky/meta/recipes-core/images/core-image-minimal.bb:
>>
>> The stack trace of python calls that resulted in this exception/failure was:
>> File: 'buildhistory_list_installed', lineno: 18, function: <module>
>>       0014:    with open(pkgs_deps_file, 'w') as pkgs_deps:
>>       0015:        pkgs_deps.write(list_installed_packages(d, 'deps'))
>>       0016:
>>       0017:
>>   *** 0018:buildhistory_list_installed(d)
>>       0019:
>> File: 'buildhistory_list_installed', lineno: 9, function: buildhistory_list_installed
>>       0005:    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
>>       0006:                                  "bh_installed_pkgs.txt")
>>       0007:
>>       0008:    with open(pkgs_list_file, 'w') as pkgs_list:
>>   *** 0009:        pkgs_list.write(list_installed_packages(d, 'file'))
>>       0010:
>>       0011:    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
>>       0012:                                  "bh_installed_pkgs_deps.txt")
>>       0013:
>> File: '/media/build1/poky/meta/lib/oe/rootfs.py', lineno: 721, function: list_installed_packages
>>       0717:    if img_type == "rpm":
>>       0718:        return RpmPM(d,
>>       0719:                     rootfs_dir,
>>       0720:                     d.getVar('TARGET_VENDOR', True)
>>   *** 0721:                     ).list_installed(format)
>>       0722:    elif img_type == "ipk":
>>       0723:        return OpkgPM(d,
>>       0724:                      rootfs_dir,
>>       0725:                      d.getVar("IPKGCONF_TARGET", True),
>> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 854, function: list_installed
>>       0850:            pkg = line.split()[0]
>>       0851:            arch = line.split()[1]
>>       0852:            ver = line.split()[2]
>>       0853:            pkgorigin = line.split()[3]
>>   *** 0854:            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
>>       0855:
>>       0856:            if format == "arch":
>>       0857:                output.append('%s %s' % (new_pkg, new_arch))
>>       0858:            elif format == "file":
>> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 476, function: _pkg_translate_smart_to_oe
>>       0472:
>>       0473:            if found == 1 and fixed_arch == fixed_cmp_arch:
>>       0474:                break
>>       0475:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
>>   *** 0476:        return new_pkg, new_arch
>>       0477:
>>       0478:    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
>>       0479:        for arch in feed_archs:
>>       0480:            arch = arch.replace('-', '_')
>> Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment
>>
>> ERROR: Function failed: buildhistory_list_installed
>> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.d
>>
>>


--------------060801010902080905030202
Content-Type: text/x-patch;
	name="0001-package_manager.py-add-trace-code-in-_pkg_translate_.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-package_manager.py-add-trace-code-in-_pkg_translate_.pa";
	filename*1="tch"

From 78f580e8f58ac852061b2b5879c4111607d20f45 Mon Sep 17 00:00:00 2001
From: Hongxu Jia <hongxu.jia@windriver.com>
Date: Sat, 8 Mar 2014 16:17:49 +0800
Subject: [PATCH] package_manager.py: add trace code in
 _pkg_translate_smart_to_oe

There is a error while invoking RpmPM._pkg_translate_smart_to_oe(),
the reason is pkg's arch was not found in the multilib arch list.

Add some trace code to see which pkg's arch is not found.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 76d0ce5..4cbf623 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -400,6 +400,7 @@ class RpmPM(PackageManager):
     '''
     def _pkg_translate_smart_to_oe(self, pkg, arch):
         new_pkg = pkg
+        new_arch = ""
         fixed_arch = arch.replace('_', '-')
         found = 0
         for mlib in self.ml_prefix_list:
@@ -426,6 +427,13 @@ class RpmPM(PackageManager):
             if found == 1 and fixed_arch == fixed_cmp_arch:
                 break
         #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
+
+        if new_arch == "":
+            bb.warn('%s, %s is not found' % (pkg, arch))
+            for mlib in self.ml_prefix_list:
+                bb.warn('%s: %s' % (mlib, ' '.join(self.ml_prefix_list[mlib])))
+            new_arch = arch
+
         return new_pkg, new_arch
 
     def _search_pkg_name_in_feeds(self, pkg, feed_archs):
-- 
1.8.1.2


--------------060801010902080905030202--
