Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC2B6E79B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:44:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1J9iYF1012974
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Feb 2014 01:44:34 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 19 Feb 2014 01:44:34 -0800
Message-ID: <53047CFA.4000801@windriver.com>
Date: Wed, 19 Feb 2014 17:44:26 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
	<228a24a4f36d6f6dc16858ad7233fef292c73985.1392716065.git.hongxu.jia@windriver.com>
	<20140218150300.GB22316@lpalcu-linux>
In-Reply-To: <20140218150300.GB22316@lpalcu-linux>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] rootfs.py: fix BAD_RECOMMENDATIONS for ipk incremental image generation
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
X-List-Received-Date: Wed, 19 Feb 2014 09:44:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2014 11:03 PM, Laurentiu Palcu wrote:
> On Tue, Feb 18, 2014 at 05:42:27PM +0800, Hongxu Jia wrote:
>> While incremental image generation enabled and the previous image existed,
>> if BAD_RECOMMENDATIONS is changed, the operation on the existed image is
>> complicated, so remove the existed image in this situation.
>>
>> The same with PACKAGE_EXCLUDE and NO_RECOMMENDATIONS.
>>
>> [YOCTO #1894]
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oe/rootfs.py | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
>> index 5561bb9..3d7adf9 100644
>> --- a/meta/lib/oe/rootfs.py
>> +++ b/meta/lib/oe/rootfs.py
>> @@ -443,7 +443,7 @@ class OpkgRootfs(Rootfs):
>>           self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
>>   
>>           self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True)
>> -        if self.inc_opkg_image_gen != "1":
>> +        if self._remove_existed_image():
>>               bb.utils.remove(self.image_rootfs, True)
>>               self.pm = OpkgPM(d,
>>                                self.image_rootfs,
>> @@ -546,6 +546,34 @@ class OpkgRootfs(Rootfs):
>>                   bb.note('incremental removed: %s' % ' '.join(pkg_to_remove))
>>                   self.pm.remove(pkg_to_remove)
>>   
>> +    '''
>> +    Compare with previous (existed) image creation, if some conditions
>> +    triggered, the previous (existed) image should be removed.
>> +    The conditions included any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
>> +    and BAD_RECOMMENDATIONS' has been changed.
>> +    '''
>> +    def _remove_existed_image(self):
> s/existed/existing/
>
> Also in the comment above.

Sorry for the typo

>
>> +        # Incremental image creation is not enable
>> +        if self.inc_opkg_image_gen != "1":
>> +            return True
>> +
>> +        vars_list_dir = self.d.expand('${T}/vars_list')
> s/vars_list_dir/vars_list_file/ in the line above and the code below.
> Leaving this variable with a 'dir' suffix while we're opening a file for
> reading/writing, is a little misleading.

Sorry for the misleading

V2 incoming

//Hongxu

>> +
>> +        old_vars_list = ""
>> +        if os.path.exists(vars_list_dir):
>> +            old_vars_list = open(vars_list_dir, 'r+').read()
>> +
>> +        new_vars_list = '%s:%s:%s\n' % \
>> +                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').strip(),
>> +                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip(),
>> +                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
>> +        open(vars_list_dir, 'w+').write(new_vars_list)
>> +
>> +        if old_vars_list != new_vars_list:
>> +            return True
>> +
>> +        return False
>> +
>>       def _create(self):
>>           pkgs_to_install = self.manifest.parse_initial_manifest()
>>           opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
>> -- 
>> 1.8.1.2
>>


