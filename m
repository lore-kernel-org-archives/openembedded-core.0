Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D583A6E79B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:52:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1J9q4F7009191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 01:52:04 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 19 Feb 2014 01:52:03 -0800
Message-ID: <53047EBC.50201@windriver.com>
Date: Wed, 19 Feb 2014 17:51:56 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
	<8581ec40c107111a8001742d8b636a76910f5f5f.1392716065.git.hongxu.jia@windriver.com>
	<20140218153617.GC22316@lpalcu-linux>
In-Reply-To: <20140218153617.GC22316@lpalcu-linux>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] rootfs.py: tweak _multilib_sanity_test for ipk incremental image generation
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
X-List-Received-Date: Wed, 19 Feb 2014 09:52:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I will rename _file_duplicate with _file_equal, and do
the necessary ajustment to avoid confusions.

Thank you for pointing out
V2 incoming

//Hongxu

On 02/18/2014 11:36 PM, Laurentiu Palcu wrote:
> On Tue, Feb 18, 2014 at 05:42:28PM +0800, Hongxu Jia wrote:
>> The _multilib_sanity_test installs multilib packages in a temporary
>> root fs, and compare with the current image to figure out duplicated
>> file that comes from different packages.
>>
>> While incremental image generation enabled and the previous image
>> existed, there was a Multilib check error:
>> ...
>> ERROR: Multilib check error: duplicate files tmp/work/qemux86_64-poky-
>> linux/core-image-minimal/1.0-r0/multilib/lib32/lib/libc.so.6 tmp/work/
>> qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/lib/libc.so.6
>> is not the same
>> ...
>>
>> The reason is the file in current image has been prelinked in previous
>> image generation and the file in a temporary root fs is not prelinked,
>> even though the files come from the same package, the Multilib check
>> considers they are different.
>>
>> [YOCTO #1894]
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/rootfs.py | 56 +++++++++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 52 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index 3d7adf9..5054d1e 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -3,6 +3,8 @@ from oe.utils import execute_pre_post_process
>>   from oe.utils import contains as base_contains
>>   from oe.package_manager import *
>>   from oe.manifest import *
>> +import oe.path
>> +import filecmp
>>   import shutil
>>   import os
>>   import subprocess
>> @@ -458,13 +460,61 @@ class OpkgRootfs(Rootfs):
>>   
>>           bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS', True), True)
>>   
>> +    def _prelink_file(self, root_dir, filename):
>> +        bb.note('prelink %s in %s' % (filename, root_dir))
>> +        prelink_cfg = oe.path.join(root_dir,
>> +                                   self.d.expand('${sysconfdir}/prelink.conf'))
>> +        if not os.path.exists(prelink_cfg):
>> +            shutil.copy(self.d.expand('${STAGING_DIR_NATIVE}${sysconfdir_native}/prelink.conf'),
>> +                        prelink_cfg)
>> +
>> +        cmd_prelink = self.d.expand('${STAGING_DIR_NATIVE}${sbindir_native}/prelink')
>> +        self._exec_shell_cmd([cmd_prelink,
>> +                              '--root',
>> +                              root_dir,
>> +                              '-amR',
>> +                              '-N',
>> +                              '-c',
>> +                              self.d.expand('${sysconfdir}/prelink.conf')])
>> +
>> +    '''
>> +    Compare two files with the same key twice to see if they came
>> +    from the same package. If they are not same, they are duplicated
>> +    and come from different packages.
> I'm kind of confused by this comment. Doesn't same = duplicate? There
> might be a small confusion of terms here because the function's behavior
> is not as the name implies.
>
>> +    1st: Comapre them directly;
>> +    2nd: While incremental image creation is enabled, one of the
>> +         files could be probaly prelinked in the previous image
>> +         creation and the file has been changed, so we need to
>> +         prelink the other one and compare them.
>> +    '''
>> +    def _file_duplicate(self, key, f1, f2):
> Shouldn't be better to rename this function to something else in order
> to avoid confusion? Let's say: _files_are_equal() ?
>
>> +
>> +        if not os.path.exists(f1) or not os.path.exists(f2):
>> +            return False
>> +
>> +        # f1 is the same with f2, both of them were not prelinked
>> +        if filecmp.cmp(f1, f2):
>> +            return False
> filecmp.cmp() returns True if files are equal. Hence the confusion:
> _file_duplicate() returns False here, if files are equal... I think the logic
> is a little bit the other way around! :)
>
>> +
>> +        if self.image_rootfs not in f1:
>> +            self._prelink_file(f1.replace(key, ''), f1)
>> +
>> +        if self.image_rootfs not in f2:
>> +            self._prelink_file(f2.replace(key, ''), f2)
>> +
>> +        # f1 is the same with f2, both of them were prelinked
>> +        if filecmp.cmp(f1, f2):
>> +            return False
>> +
>> +        # Duplicated
>> +        return True
> here the return value matches the comment and the function name! :)
>> +
>>       """
>>       This function was reused from the old implementation.
>>       See commit: "image.bbclass: Added variables for multilib support." by
>>       Lianhao Lu.
>>       """
>>       def _multilib_sanity_test(self, dirs):
>> -        import filecmp
>>   
>>           allow_replace = self.d.getVar("MULTILIBRE_ALLOW_REP", True)
>>           if allow_replace is None:
>> @@ -486,9 +536,7 @@ class OpkgRootfs(Rootfs):
>>                           if allow_rep.match(key):
>>                               valid = True
>>                           else:
>> -                            if os.path.exists(files[key]) and \
>> -                               os.path.exists(item) and \
>> -                               not filecmp.cmp(files[key], item):
>> +                            if self._file_duplicate(key, files[key], item):
>>                                   valid = False
>>                                   bb.fatal("%s duplicate files %s %s is not the same\n" %
>>                                            (error_prompt, item, files[key]))
>> -- 
>> 1.8.1.2
>>


