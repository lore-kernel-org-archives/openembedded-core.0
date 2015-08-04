Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1E9D6E5D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 17:32:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t74HWQ8m009345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Aug 2015 10:32:27 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Tue, 4 Aug 2015 10:32:26 -0700
To: "Bystricky, Juro" <juro.bystricky@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jurobystricky@hotmail.com"
	<jurobystricky@hotmail.com>
References: <1438634128-4347-1-git-send-email-juro.bystricky@intel.com>
	<55C0E631.7070703@windriver.com>
	<6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55C0F729.5000908@windriver.com>
Date: Tue, 4 Aug 2015 12:32:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6101D46F3@ORSMSX109.amr.corp.intel.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [PATCH 0/2] Support for VirtualBox guest additions
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
X-List-Received-Date: Tue, 04 Aug 2015 17:32:30 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/4/15 12:25 PM, Bystricky, Juro wrote:
> I agree, the name "kernel-headers" may not be the most fortunate, "linux-headers" 
> is probably more fitting.  The recipe installs the files in a similar fashion that is done by 
> 
> apt-get install linux-headers-$(uname -r)
> 
> Typical contents can be viewed for example here:
> https://www.archlinux.org/packages/core/i686/linux-headers/
> 
> These files are needed to allow building  of kernel drivers against the running
> Linux kernel. In a way, it is a subset of kernel-devsrc, but including
>  ".config" file used for the actual running kernel.

Again this is part of the purpose of the existing kernel-devsrc package.  So
what is missing preventing this from working.  It likely needs to be added to
the kernel-devsrc package instead (or a sub package that is created by the
kernel-devsrc recipe.)

> Having these files installed, it is possible  to compile additional
> kernel drivers that are not part of the kernel-devsrc .
>  VirtualBox compiles some of their own drivers this way, others as well. 
> There are many other scenarios where you may want to add a new kernel 
> driver to an already installed Linux kernel. 

Yes, this was part of the design behind the kernel-devsrc, make sure the sources
and components used to build the running kernel were made available to the
target so that out-of-tree/external kernel modules could be built to match the
running system -- as well as the ability to reconfigure and rebuild the kernel
itself.

Bruce is on vacation this week and may not be around to respond, but adding yet
another package is not the right answer here.  Lets fix what may be broken in
what we have.

--Mark

> Juro
> 
> 
> 
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: Tuesday, August 4, 2015 9:20 AM
>> To: Bystricky, Juro; openembedded-core@lists.openembedded.org;
>> jurobystricky@hotmail.com
>> Cc: Purdie, Richard
>> Subject: Re: [OE-core] [PATCH 0/2] Support for VirtualBox guest additions
>>
>> On 8/3/15 3:35 PM, Juro Bystricky wrote:
>>> In order to support VirtualBox guest additions, kernel headers need to
>>> be present in the VM. I am aware we already have two packages/recipes
>>> that are somewhat similar (kernel-devsrc.bb, linux-libc-headers), but none
>> of them is suitable for this purpose.
>>> Besides the kernel headers, some additional files (scripts, Makefiles,
>>> .config, etc) are also required.
>>
>> linux-libc-headers is only for building applications.  kernel-devsrc is for
>> building modules on the target.
>>
>> What do these specific modules need that are not present in kernel-devsrc?
>> (I really don't want 'yet another' confusing package added to the system.)
>>
>>> The new recipe "kernel-headers.bb" can in principle be used by other
>> images as well.
>>> It is not limited to the Build Appliance and hence is not a part of
>>> the Build Appliance recipe.
>>
>> I think kernel-headers is a bad name for a package.  It could be confusing.
>>
>> --Mark
>>
>>> Juro Bystricky (2):
>>>   kernel-headers: linux kernel headers
>>>   build-appliance-image: support for VirtualBox guest addtions
>>>
>>>  .../README_vbox_guest_additions.txt                | 78
>> ++++++++++++++++++++++
>>>  .../images/build-appliance-image_12.0.1.bb         |  4 +-
>>>  meta/recipes-kernel/linux/kernel-headers.bb        | 66
>> ++++++++++++++++++
>>>  3 files changed, 147 insertions(+), 1 deletion(-)  create mode 100644
>>> meta/recipes-core/images/build-appliance-
>> image/README_vbox_guest_addit
>>> ions.txt  create mode 100644
>>> meta/recipes-kernel/linux/kernel-headers.bb
>>>
> 


