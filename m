Return-Path: <california.l.sullivan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C63274531
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:55:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2018 16:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,378,1517904000"; d="scan'208";a="39299082"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 29 Mar 2018 16:55:30 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180329231918.25272-1-california.l.sullivan@intel.com>
	<CAJ86T=VbYnLPa=JZiYVC0zpr06Gzgvm0+NdCBjSMCusEF=Zhgg@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <54bd76e3-bde3-f0fd-0f69-5a9f930266c5@intel.com>
Date: Thu, 29 Mar 2018 16:55:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=VbYnLPa=JZiYVC0zpr06Gzgvm0+NdCBjSMCusEF=Zhgg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] default-distrovars: set default KERNEL_IMAGETYPE(S)
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
X-List-Received-Date: Thu, 29 Mar 2018 23:55:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/29/2018 04:36 PM, Andre McCurdy wrote:
> On Thu, Mar 29, 2018 at 4:19 PM, California Sullivan
> <california.l.sullivan@intel.com> wrote:
>> With the change from assuming kernels will be named "vmlinuz"
>> everywhere, to instead using KERNEL_IMAGETYPE, we require that
>> KERNEL_IMAGETYPE is set to something. Instead of setting the default in
>> multiple individual files, set it in default-distrovars.inc.
>>
>> Also set KERNEL_IMAGETYPES, as we will eventually be switching away from
>> KERNEL_IMAGETYPE.
>>
>> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
>> +
>> +KERNEL_IMAGETYPE ??= "bzImage"
> Isn't bzImage x86 specific? Setting it as the default also disagrees
> with meta/conf/documentation.conf:
>
>    KERNEL_IMAGETYPE[doc] = "The type of kernel to build for a device,
> usually set by the machine configuration files and defaults to
> 'zImage'."
>
> It might be nice to have an arch specific default (e.g. bzImage for
> x86, vmlinux for MIPS and zImage for everything else?).

Doing so would require a nasty setVar python block due to overrides taking priority.

E.g.,
KERNEL_IMAGETYPE_x86 ??= "test1"
KERNEL_IMAGETYPE = "test2"
results in KERNEL_IMAGETYPE getting "test1".

That or accept the difficulty of overriding it afterwards.

This patch is primarily in order to set /any/ default globally so that getVar calls on it don't break parsing.
Its still customary to set the variable in machine confs as well.

I can send a v2 that sets the default to zImage instead. That way it matches the docs, though I don't know how accurate they were previously.

Thanks,
Cal


