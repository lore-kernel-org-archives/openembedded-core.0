Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBD2978F73
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 02:03:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8323Q3D022484
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Sep 2018 19:03:26 -0700 (PDT)
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 2 Sep 2018 19:03:26 -0700
Reply-To: <lu.jiang@windriver.com>
To: Tom Rini <trini@konsulko.com>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
	<20180831135228.GN26633@bill-the-cat>
From: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
Date: Mon, 3 Sep 2018 10:01:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180831135228.GN26633@bill-the-cat>
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
X-List-Received-Date: Mon, 03 Sep 2018 02:03:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

在 2018年08月31日 21:52, Tom Rini 写道:
> On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:
>
>> When there is no useful efi in $kerneldir, try copy
>> all efi from EFI/BOOT into boot image.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>> ---
>>   .../wic/files/wic/plugins/source/bootimg-efi.py              | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>> index 0eb86a0..d435268 100644
>> --- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>> +++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
>> @@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
>>               else:
>>                   raise WicError("unrecognized bootimg-efi loader: %s" %
>>                                  source_params['loader'])
>> +            os.listdir("%s/EFI/BOOT/" % hdddir)
>> +            found_efi = False
>> +            for x in os.listdir("%s/EFI/BOOT/" % hdddir) :
>> +                if x.endswith(".efi"):
>> +                    found_efi = True
>> +                    break;
>> +            if not found_efi:
>> +                cp_cmd = "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" % (kernel_dir, hdddir)
>> +                try:
>> +                    exec_cmd(cp_cmd, True)
>> +                except:
>> +                    pass
>>           except KeyError:
>>               raise WicError("bootimg-efi requires a loader, none specified")
> I'm not sure this is the right approach.  If you don't have things set
> up for automagic finding you should use bootimg-partition and
> IMAGE_BOOT_FILES.  I'm doing this right now for some EFI projects
> because it's also bad form to dump everything into EFI/BOOT and some
> things should end up in EFI/vendorname or similar.
>
I will take a look about bootimage-partition. Thanks for remind.


Thanks

Jiang Lu


