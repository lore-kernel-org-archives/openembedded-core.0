Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SGC62-0006cX-Lg
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 18:33:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Apr 2012 09:23:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138555201"
Received: from unknown (HELO envy.home) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2012 09:23:53 -0700
Message-ID: <4F7F1873.5040607@linux.intel.com>
Date: Fri, 06 Apr 2012 09:23:15 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120209 Thunderbird/10.0.1
MIME-Version: 1.0
To: "Cui, Dexuan" <dexuan.cui@intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
In-Reply-To: <A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
X-Enigmail-Version: 1.4
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Apr 2012 16:33:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 04/06/2012 12:48 AM, Cui, Dexuan wrote:
> Darren Hart wrote on 2012-04-06:
>> On 04/05/2012 09:41 PM, Cui, Dexuan wrote:
>>> Darren Hart wrote on 2012-04-06:
>>>> On 04/05/2012 08:20 PM, Cui, Dexuan wrote:
>>>>> In a typical Linux distribution, there is a build link(or directory)
>>>>> that specifies the directory where the kernel headers and kernel config
>>>>> are put.
>>>>>
>>>>> E.g. in my Ubuntu 11.04, a package linux-headers-2.6.38-8-generic
>>>> installs .config, include/ and Kconfig into
>>>> /usr/src/linux-headers-2.6.38-8-generic/ and makes a link
>>>> /lib/modules/2.6.38-8-generic/build to point to the directory.
>>>>>
>>>>> However, looks in Yocto, we don't have such a package? Do we have a
>>>>> plan to add it?
>>>>>
>>>>> I'm asking the question because in the ESDC contest, the students found in
>>>> Yocto they couldn't build the wifi driver's source code that was
>>>> downloaded from realtek.com:
>>>>
>>>> http://www.realtek.com.tw/downloads/downloadsView.aspx?Langid=1&PFid=4
>>>>
>> 8&Level=5&Conn=4&ProdID=226&DownTypeID=3&GetDown=false&Downloads
>> =true
>>>>> In Ubuntu, they can build the driver fine.
>>>>
>>>> There is an open bug:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1614
>>>
>>> Glad to know this is a know bug.
>>> I personally think it would be pretty nice if we can fix this bug soon
>>> since the students are being frustrated by this...
>>>
>>> And, in the Build Appliance (self-hosted-image) work, we want to
>>> enable the vmware guest's VMware Tools. This also requires the ability
>>> to build kernel module in the target.
>>>
>>
>> While I understand there are valid use cases, I think this is generally
>> contrary to workflow of the project. We build the OS, it runs on the
>> target. This is building a general purpose OS, and then having it build
>> itself out more. It doesn't feel like an embedded workflow.
> I totally agree with you.
> 
> Unluckily we'll have to face an imperfect world:
> E.g., in the ESDC contest, after the students boot the board with
> Yocto Linux, they attach a Realtek wifi device and try to build and
> install the driver.
> 
> What's bad is: the driver's source code is not integrated into the
> upstream linux. The students can only run a makefile of the driver
> tarball to build the driver.  To the students' surprise, there is no
> kernel headers in the running Yocto linux! :-(
> 
> Surely, the "standard" way is: we should write a recipe to
> cross-compile and install the driver. But this is difficult to the
> students:
> 1) They're not familiar with Poky at all, and actually the downloaded
> wifi driver's code here seems indeed complex.
> 
> 2) The students only have limited time so they intend to spend
> most of the time on things that could make them win a prize or
> money. :-)
> So this actually makes Yocto less appealing to them though the
> goal of Yocto is making developing on embedded easy...
> 

It seems to me some work is needed at ESDC to account for proper
development techniques and not reward sloppy development. Writing
maintainable code is an important part of professional software
engineers do every day. Rewarding shortcuts and deliverables by any
means necessary does students and the industry a disservice.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


