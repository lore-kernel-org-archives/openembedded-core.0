Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9386011C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 02:17:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w842Hi1g008669
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Sep 2018 19:17:45 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 3 Sep 2018 19:17:44 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tom Rini <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
	<20180831135228.GN26633@bill-the-cat>
	<3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <ea8d1d09-85f9-503a-49c7-8e21bcaafe5b@windriver.com>
Date: Tue, 4 Sep 2018 10:15:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
X-Originating-IP: [128.224.162.214]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] wic:bootimg-efi:try other place for efi
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
X-List-Received-Date: Tue, 04 Sep 2018 02:17:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


在 2018年09月03日 10:01, Lu.Jiang 写道:
> 在 2018年08月31日 21:52, Tom Rini 写道:
>> On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:
>>
>>> When there is no useful efi in $kerneldir, try copy
>>> all efi from EFI/BOOT into boot image.
>>>
>>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>>> ---
>>>   .../wic/files/wic/plugins/source/bootimg-efi.py | 12 ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git 
>>> a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py 
>>> b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>>> index 0eb86a0..d435268 100644
>>> --- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>>> +++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>>> @@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
>>>               else:
>>>                   raise WicError("unrecognized bootimg-efi loader: 
>>> %s" %
>>>                                  source_params['loader'])
>>> +            os.listdir("%s/EFI/BOOT/" % hdddir)
>>> +            found_efi = False
>>> +            for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
>>> +                if x.endswith(".efi"):
>>> +                    found_efi = True
>>> +                    break;
>>> +            if not found_efi:
>>> +                cp_cmd = "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" % 
>>> (kernel_dir, hdddir)
>>> +                try:
>>> +                    exec_cmd(cp_cmd, True)
>>> +                except:
>>> +                    pass
>>>           except KeyError:
>>>               raise WicError("bootimg-efi requires a loader, none 
>>> specified")
>> I'm not sure this is the right approach.  If you don't have things set
>> up for automagic finding you should use bootimg-partition and
>> IMAGE_BOOT_FILES.  I'm doing this right now for some EFI projects
>> because it's also bad form to dump everything into EFI/BOOT and some
>> things should end up in EFI/vendorname or similar.
>>

Hi Tom,

By indicating IMAGE_BOOT_FILES for bootimg-partition, can perform copy 
file work. While we still need the code in bootimg-efi to re-generate 
grub.cfg.

I prefer use bootimg-efi for this case, but we can add a new parameter 
to distinguish kernel dir & bootloader dir(for efi files)

Thanks
Jiang Lu

> I will take a look about bootimage-partition. Thanks for remind.
>
>
> Thanks
>
> Jiang Lu
>


