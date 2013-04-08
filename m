Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Michel.Thebeau@windriver.com>) id 1UPJob-0002HF-Vd
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 23:41:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r38LO4d6010837
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Apr 2013 14:24:04 -0700 (PDT)
Received: from [128.224.146.59] (128.224.146.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Apr 2013 14:24:03 -0700
Message-ID: <51633572.6080202@windriver.com>
Date: Mon, 8 Apr 2013 17:24:02 -0400
From: Michel Thebeau <michel.thebeau@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1365452153-21650-1-git-send-email-michel.thebeau@windriver.com>
	<1365452153-21650-3-git-send-email-michel.thebeau@windriver.com>
	<1365454473.12407.51.camel@ted>
In-Reply-To: <1365454473.12407.51.camel@ted>
Cc: Bruce.Ashfield@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] kernel.bbclass: do_strip: allow recipes to strip the kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 21:41:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



On 13-04-08 04:54 PM, Richard Purdie wrote:
> On Mon, 2013-04-08 at 16:15 -0400, michel.thebeau@windriver.com wrote:
>> From: Michel Thebeau <michel.thebeau@windriver.com>
>>
>> Allow recipes to specify sections to be stripped from the kernel output
>> using KERNEL_IMAGE_STRIP_EXTRA_SECTIONS.  For example:
>>
>> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS = ".comment .unwanted"
>>
>> The file to be stripped is a copy of ${KERNEL_OUTPUT} and will be given
>> the same name with an additional ".stripped" suffix.  The suffix can be
>> overridden using KERNEL_STRIP_SUFFIX.
>>
>> Since the toolchain does not give indication when the specified sections
>> are absent, we read the sections first and make this report by issuing a
>> warning to the developer.
>>
>> The toolchain by default strips the image with the -s option (even
>> when -s is not specified):
>> -s --strip-all       Remove all symbol and relocation information
>>
>> For example, these sections are always removed:
>> .debug_aranges
>> .debug_info
>> .debug_abbrev
>> .debug_line
>> .debug_frame
>> .debug_str
>> .debug_loc
>> .debug_ranges
>> .symtab
>> .strtab
>>
>> In addition to these, the sections listed in
>> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS will also be removed.
>>
>> Only stripping of vmlinux (elf) is supported at this time.  A warning
>> will be given if the image type is not vmlinux.
>>
>> Stripping the image could also be done in the kernel, but that would
>> only work for linux-yocto based kernels, so it's not the route we
>> decided to go.
>>
>> [YOCTO 3515]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
> 
> Can we please just have one output kernel, not two. Is the unstripped
> version useful anywhere?
> 


The unstripped image is bootable, and it is conceivable that someone may
even want to do load -m tftp from the boot script.

But, if a single image is desirable then I'd go with the image stripped
in place.  Here is that other patch...   I'll make sure to add text to
the log so it is clear about what happened to the image.

M


> Cheers,
> 
> Richard
> 
> 
> 


