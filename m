Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id CE3E775C40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 15:45:10 +0000 (UTC)
Received: (qmail 24120 invoked by uid 1003); 29 Jun 2015 15:45:09 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@108.44.109.161)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	29 Jun 2015 15:45:09 -0000
Message-ID: <55916803.40209@balister.org>
Date: Mon, 29 Jun 2015 11:45:07 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: =?windows-1252?Q?Jo=E3o_Henrique_Ferreira_de_Freitas?=
	<joaohf@gmail.com>, openembedded-core@lists.openembedded.org
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>	<1435053182-8028-5-git-send-email-ed.bartosh@linux.intel.com>	<55894189.50102@balister.org>	<20150624152317.GA28330@linux.intel.com>
	<558F21A9.1050605@gmail.com>
In-Reply-To: <558F21A9.1050605@gmail.com>
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
X-List-Received-Date: Mon, 29 Jun 2015 15:45:14 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

On 06/27/2015 06:20 PM, João Henrique Ferreira de Freitas wrote:
> Hi,
> 
> Maybe using an environment variable?
> 

Handle it the same way we handle PARALLEL_MAKE and BBTHREADS.

Philip

> 
> 
> On 24/06/2015 12:23, Ed Bartosh wrote:
>> On Tue, Jun 23, 2015 at 07:22:49AM -0400, Philip Balister wrote:
>>> Can you add a way to enable multiple threads for xz? I found this helps
>>> speed up file creation.
>>>
>> I thought about this and other compressor options, but didn't find a good
>> way to add them. Introducing new commandline option or config value
>> doesn't
>> look convenient to use from my point of view.
>>
>> Can you propose something better than that?
>>
>> Regards,
>> Ed
>>
>>> Philip
>>>
>>> On 06/23/2015 05:53 AM, Ed Bartosh wrote:
>>>> Implemented compressing result image with specified compressor.
>>>> Updated reporting code to show compressed image.
>>>>
>>>> [YOCTO #7593]
>>>>
>>>> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>>>>
>>>> diff --git a/scripts/lib/wic/imager/direct.py
>>>> b/scripts/lib/wic/imager/direct.py
>>>> index f3f20e0..2ea7e4e 100644
>>>> --- a/scripts/lib/wic/imager/direct.py
>>>> +++ b/scripts/lib/wic/imager/direct.py
>>>> @@ -33,6 +33,7 @@ from wic.utils.partitionedfs import Image
>>>>   from wic.utils.errors import CreatorError, ImageError
>>>>   from wic.imager.baseimager import BaseImageCreator
>>>>   from wic.plugin import pluginmgr
>>>> +from wic.utils.oe.misc import exec_cmd
>>>>     disk_methods = {
>>>>       "do_install_disk":None,
>>>> @@ -71,6 +72,7 @@ class DirectImageCreator(BaseImageCreator):
>>>>           self.bootimg_dir = bootimg_dir
>>>>           self.kernel_dir = kernel_dir
>>>>           self.native_sysroot = native_sysroot
>>>> +        self.compressor = compressor
>>>>         def __get_part_num(self, num, parts):
>>>>           """calculate the real partition number, accounting for
>>>> partitions not
>>>> @@ -318,6 +320,13 @@ class DirectImageCreator(BaseImageCreator):
>>>>                                                          
>>>> self.bootimg_dir,
>>>>                                                          
>>>> self.kernel_dir,
>>>>                                                          
>>>> self.native_sysroot)
>>>> +        # Compress the image
>>>> +        if self.compressor:
>>>> +            for disk_name, disk in self.__image.disks.items():
>>>> +                full_path = self._full_path(self.__imgdir,
>>>> disk_name, "direct")
>>>> +                msger.debug("Compressing disk %s with %s" % \
>>>> +                            (disk_name, self.compressor))
>>>> +                exec_cmd("%s %s" % (self.compressor, full_path))
>>>>         def print_outimage_info(self):
>>>>           """
>>>> @@ -328,7 +337,11 @@ class DirectImageCreator(BaseImageCreator):
>>>>           parts = self._get_parts()
>>>>             for disk_name, disk in self.__image.disks.items():
>>>> -            full_path = self._full_path(self.__imgdir, disk_name,
>>>> "direct")
>>>> +            extension = "direct" + {"gzip": ".gz",
>>>> +                                    "bzip2": ".bz2",
>>>> +                                    "xz": ".xz",
>>>> +                                    "": ""}.get(self.compressor)
>>>> +            full_path = self._full_path(self.__imgdir, disk_name,
>>>> extension)
>>>>               msg += '  %s\n\n' % full_path
>>>>             msg += 'The following build artifacts were used to
>>>> create the image(s):\n'
>>>>
> 

