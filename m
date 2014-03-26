Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF486F800
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 11:45:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2QBjenn005207
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Mar 2014 04:45:40 -0700 (PDT)
Received: from [128.224.170.184] (128.224.170.184) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 26 Mar 2014 04:45:39 -0700
Message-ID: <5332BDE4.9050300@windriver.com>
Date: Wed, 26 Mar 2014 13:45:40 +0200
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
	<9b59e3360cdf97a4bcde6bf979aa30dc56a84be4.1394023121.git.laurentiu.palcu@intel.com>
	<1394142938.12327.18.camel@ted>
	<20140307063553.GA21125@lpalcu-linux>
	<50D17BD22A23EE4A887974F6B5882038B5484ADC@ALA-MBB.corp.ad.wrs.com>
	<20140326100929.GB32501@lpalcu-linux>
In-Reply-To: <20140326100929.GB32501@lpalcu-linux>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 26 Mar 2014 11:45:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/26/2014 12:09 PM, Laurentiu Palcu wrote:
> On Wed, Mar 26, 2014 at 09:15:43AM +0000, Sarbu, Florin-Ionut (Florin) wrote:
>> I get the same error on do_rootfs for a rpm based image:
>>
>> Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment
> Does this happen on latest master?
Yes.
> Do you have the 4 patches, starting with this one
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d91e35640d19471213122d36288315f071c37432
>
> in your tree?
Yes, I have that commit in poky.
>   Did you activate buildhistory? Can you provide more info
> regarding the steps you followed to reproduce this?
I am trying to build the gemini-image from the meta-ivi layer 
git@git.yoctoproject.org:meta-ivi.git The build steps are those from the 
README.md file

Florin
>
> laurentiu
>> Florin
>> ________________________________________
>> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Laurentiu Palcu [laurentiu.palcu@intel.com]
>> Sent: Friday, March 07, 2014 8:35 AM
>> To: Richard Purdie
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 2/3] buildhistory.bbclass: Fix dependency files creation
>>
>> On Thu, Mar 06, 2014 at 09:55:38PM +0000, Richard Purdie wrote:
>>> On Wed, 2014-03-05 at 14:39 +0200, Laurentiu Palcu wrote:
>>>> Call the new python routines.
>>>>
>>>> [YOCTO #5904]
>>>>
>>>> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>>>> ---
>>>>   meta/classes/buildhistory.bbclass |    9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
>>>> index ef4135b..01b0082 100644
>>>> --- a/meta/classes/buildhistory.bbclass
>>>> +++ b/meta/classes/buildhistory.bbclass
>>>> @@ -319,6 +319,12 @@ python buildhistory_list_installed() {
>>>>
>>>>       with open(pkgs_list_file, 'w') as pkgs_list:
>>>>           pkgs_list.write(list_installed_packages(d, 'file'))
>>>> +
>>>> +    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
>>>> +                                  "bh_installed_pkgs_deps.txt")
>>>> +
>>>> +    with open(pkgs_deps_file, 'w') as pkgs_deps:
>>>> +        pkgs_deps.write(list_installed_packages(d, 'deps'))
>>>>   }
>>>>
>>>>
>>>> @@ -338,7 +344,8 @@ buildhistory_get_installed() {
>>>>
>>>>      # Produce dependency graph
>>>>      # First, quote each name to handle characters that cause issues for dot
>>>> -   rootfs_list_installed_depends | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp
>>>> +   cat ${WORKDIR}/bh_installed_pkgs_deps.txt | sed 's:\([^| ]*\):"\1":g' > $1/depends.tmp && \
>>>> +           rm ${WORKDIR}/bh_installed_pkgs_deps.txt
>>>>      # Change delimiter from pipe to -> and set style for recommend lines
>>>>      sed -i -e 's:|: -> :' -e 's:"\[REC\]":[style=dotted]:' -e 's:$:;:' $1/depends.tmp
>>>>      # Add header, sorted and de-duped contents and footer and then delete the temp file
>>> With this patch, a bitbake core-image-minimal -c populate_sdk resulted
>> No, not quite. The bug appears to be in
>> RpmPM._pkg_translate_smart_to_oe(), which none of my patches touched.
>>
>> CCing Hongxu.
>>
>> laurentiu
>>
>>> in:
>>>
>>> ERROR: Error executing a python function in /media/build1/poky/meta/recipes-core/images/core-image-minimal.bb:
>>>
>>> The stack trace of python calls that resulted in this exception/failure was:
>>> File: 'buildhistory_list_installed', lineno: 18, function: <module>
>>>       0014:    with open(pkgs_deps_file, 'w') as pkgs_deps:
>>>       0015:        pkgs_deps.write(list_installed_packages(d, 'deps'))
>>>       0016:
>>>       0017:
>>>   *** 0018:buildhistory_list_installed(d)
>>>       0019:
>>> File: 'buildhistory_list_installed', lineno: 9, function: buildhistory_list_installed
>>>       0005:    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
>>>       0006:                                  "bh_installed_pkgs.txt")
>>>       0007:
>>>       0008:    with open(pkgs_list_file, 'w') as pkgs_list:
>>>   *** 0009:        pkgs_list.write(list_installed_packages(d, 'file'))
>>>       0010:
>>>       0011:    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
>>>       0012:                                  "bh_installed_pkgs_deps.txt")
>>>       0013:
>>> File: '/media/build1/poky/meta/lib/oe/rootfs.py', lineno: 721, function: list_installed_packages
>>>       0717:    if img_type == "rpm":
>>>       0718:        return RpmPM(d,
>>>       0719:                     rootfs_dir,
>>>       0720:                     d.getVar('TARGET_VENDOR', True)
>>>   *** 0721:                     ).list_installed(format)
>>>       0722:    elif img_type == "ipk":
>>>       0723:        return OpkgPM(d,
>>>       0724:                      rootfs_dir,
>>>       0725:                      d.getVar("IPKGCONF_TARGET", True),
>>> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 854, function: list_installed
>>>       0850:            pkg = line.split()[0]
>>>       0851:            arch = line.split()[1]
>>>       0852:            ver = line.split()[2]
>>>       0853:            pkgorigin = line.split()[3]
>>>   *** 0854:            new_pkg, new_arch = self._pkg_translate_smart_to_oe(pkg, arch)
>>>       0855:
>>>       0856:            if format == "arch":
>>>       0857:                output.append('%s %s' % (new_pkg, new_arch))
>>>       0858:            elif format == "file":
>>> File: '/media/build1/poky/meta/lib/oe/package_manager.py', lineno: 476, function: _pkg_translate_smart_to_oe
>>>       0472:
>>>       0473:            if found == 1 and fixed_arch == fixed_cmp_arch:
>>>       0474:                break
>>>       0475:        #bb.note('%s, %s -> %s, %s' % (pkg, arch, new_pkg, new_arch))
>>>   *** 0476:        return new_pkg, new_arch
>>>       0477:
>>>       0478:    def _search_pkg_name_in_feeds(self, pkg, feed_archs):
>>>       0479:        for arch in feed_archs:
>>>       0480:            arch = arch.replace('-', '_')
>>> Exception: UnboundLocalError: local variable 'new_arch' referenced before assignment
>>>
>>> ERROR: Function failed: buildhistory_list_installed
>>> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.d
>>>
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


