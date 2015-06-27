Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id D88A060125
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 22:20:28 +0000 (UTC)
Received: by ykfy125 with SMTP id y125so86981364ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jun 2015 15:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=I6F2733Bz8MaMxUfcio10cKrZ8IrfFBA1kOvM8LCaOQ=;
	b=j9JPAdPasVwKvcXipO+8kwkzjQbPQfyL27KrYihoWnm9uOF+PHPvthG8qYcNxcULnR
	62EYJwzFKIBInFr0IlW06xQpA/fUnv+0Vb7dCNSOHT9eJKkNjZHKs7IX/5qgMd8xOCI0
	FSJPoQLRJ2ZQadDHOwaBeRnZ+zHKrfgsY81MGs7riWAAwg4bN1vT31+0byH3scOFM7a2
	ZiWLkd2rgxfiwAMZtvCbTTntdB+Ao2KztANGIk9T9OgB4MCeL0QrX41u0BMtnUOO+8Vo
	yUxPrYvJsjiM5a6Y2U8z+TnN1eYYkBlqxrjej4PM89SfP5ckVZzPdI92lZIcJZSOSWin
	I0PQ==
X-Received: by 10.13.226.75 with SMTP id l72mr10473777ywe.89.1435443629310;
	Sat, 27 Jun 2015 15:20:29 -0700 (PDT)
Received: from [192.168.0.16] ([187.106.6.17])
	by mx.google.com with ESMTPSA id w6sm31175166ywf.31.2015.06.27.15.20.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Jun 2015 15:20:28 -0700 (PDT)
Message-ID: <558F21A9.1050605@gmail.com>
Date: Sat, 27 Jun 2015 19:20:25 -0300
From: =?windows-1252?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>	<1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>	<55894189.50102@balister.org>
	<20150624152317.GA28330@linux.intel.com>
In-Reply-To: <20150624152317.GA28330@linux.intel.com>
Subject: Re: [wic][PATCH 4/6] wic: Implement image compressing
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
X-List-Received-Date: Sat, 27 Jun 2015 22:20:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Maybe using an environment variable?



On 24/06/2015 12:23, Ed Bartosh wrote:
> On Tue, Jun 23, 2015 at 07:22:49AM -0400, Philip Balister wrote:
>> Can you add a way to enable multiple threads for xz? I found this helps
>> speed up file creation.
>>
> I thought about this and other compressor options, but didn't find a good
> way to add them. Introducing new commandline option or config value doesn't
> look convenient to use from my point of view.
>
> Can you propose something better than that?
>
> Regards,
> Ed
>
>> Philip
>>
>> On 06/23/2015 05:53 AM, Ed Bartosh wrote:
>>> Implemented compressing result image with specified compressor.
>>> Updated reporting code to show compressed image.
>>>
>>> [YOCTO #7593]
>>>
>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>
>>> diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
>>> index f3f20e0..2ea7e4e 100644
>>> --- a/scripts/lib/wic/imager/direct.py
>>> +++ b/scripts/lib/wic/imager/direct.py
>>> @@ -33,6 +33,7 @@ from wic.utils.partitionedfs import Image
>>>   from wic.utils.errors import CreatorError, ImageError
>>>   from wic.imager.baseimager import BaseImageCreator
>>>   from wic.plugin import pluginmgr
>>> +from wic.utils.oe.misc import exec_cmd
>>>   
>>>   disk_methods = {
>>>       "do_install_disk":None,
>>> @@ -71,6 +72,7 @@ class DirectImageCreator(BaseImageCreator):
>>>           self.bootimg_dir = bootimg_dir
>>>           self.kernel_dir = kernel_dir
>>>           self.native_sysroot = native_sysroot
>>> +        self.compressor = compressor
>>>   
>>>       def __get_part_num(self, num, parts):
>>>           """calculate the real partition number, accounting for partitions not
>>> @@ -318,6 +320,13 @@ class DirectImageCreator(BaseImageCreator):
>>>                                                           self.bootimg_dir,
>>>                                                           self.kernel_dir,
>>>                                                           self.native_sysroot)
>>> +        # Compress the image
>>> +        if self.compressor:
>>> +            for disk_name, disk in self.__image.disks.items():
>>> +                full_path = self._full_path(self.__imgdir, disk_name, "direct")
>>> +                msger.debug("Compressing disk %s with %s" % \
>>> +                            (disk_name, self.compressor))
>>> +                exec_cmd("%s %s" % (self.compressor, full_path))
>>>   
>>>       def print_outimage_info(self):
>>>           """
>>> @@ -328,7 +337,11 @@ class DirectImageCreator(BaseImageCreator):
>>>           parts = self._get_parts()
>>>   
>>>           for disk_name, disk in self.__image.disks.items():
>>> -            full_path = self._full_path(self.__imgdir, disk_name, "direct")
>>> +            extension = "direct" + {"gzip": ".gz",
>>> +                                    "bzip2": ".bz2",
>>> +                                    "xz": ".xz",
>>> +                                    "": ""}.get(self.compressor)
>>> +            full_path = self._full_path(self.__imgdir, disk_name, extension)
>>>               msg += '  %s\n\n' % full_path
>>>   
>>>           msg += 'The following build artifacts were used to create the image(s):\n'
>>>


