Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1SNwP0-0004H2-N2
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 03:24:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 Apr 2012 18:15:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134609767"
Received: from edwin-gen.sh.intel.com (HELO [10.239.36.17]) ([10.239.36.17])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2012 18:15:06 -0700
Message-ID: <4F9B44A2.1090007@intel.com>
Date: Sat, 28 Apr 2012 09:15:14 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20120426075321.GG1450@edwin-gen>	
	<20120427082009.GH1450@edwin-gen> <1335523550.20130.56.camel@ted>
In-Reply-To: <1335523550.20130.56.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pango multilib issue
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
X-List-Received-Date: Sat, 28 Apr 2012 01:24:46 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2012 06:45 PM, Richard Purdie wrote:
> On Fri, 2012-04-27 at 16:20 +0800, Zhai, Edwin wrote:
>> Any comments?
>> I'd like a agreement before any patch:)
>>
>> Thanks,
>> Edwin
>>
>>
>> On Thu, Apr 26, 2012 at 03:53:22PM +0800, Zhai, Edwin wrote:
>>> RP,
>>>
>>> I have found one common issues for multilib when system config file differ
>>> between multilibs.
>>>
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2356
>>> This bug caused by modules mechanism in pango:
>>>
>>> pango utils, pango-querymodules produce a system config file to indicate where
>>> to find the modules when 1st boot, like /usr/{lib64|lib}/pango/1.6.0/modules/
>>> for {x86-64|lib32}-pango respectively.
>>>
>>> When installing lib32-pango on sato-image-qemux86-64, lib32 version of
>>> pango-querymodules override x86-64 version and produce a system config file
>>> with path for lib32 version of modules. Then x86-64 matchbox-desktop failed to
>>> open these modules and loaded corrupted fonts.
>>>
>>> To resolve this conflict, one possible solution is put the config file and
>>> binary under different dir: $LIBDIR for config file, and
>>> /usr/{libexec|lib64exec} for config binary(or create different dir under
>>> /usr/bin/ for different multilib)
>>>
>>> Any comments for this?
>
> /libexec and /lib aren't really the correct locations for a
> configuration file like this.
>
> I think in the mutlilib cases I'd like to move the config file a
> directory deeper so /etc/pango/${baselib}/pango.modules in the mutliib
> cases. The standard system file would remain in its existing location.


This is okay. We should use /usr/bin/${baselib}/pango-querymodules as well.


>
> Cheers,
>
> Richard
>
>



