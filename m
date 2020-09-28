Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.6060.1601328517251576728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 14:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 134.134.136.100, mailfrom: randy.e.witt@linux.intel.com)
IronPort-SDR: eSrPZqUU12jWmVjZZWMaaNrdgLJ3kNVN2o0t/Bsu53JLkgmR0BBtPQK+t2MMBeN7PKZlFG5t+3
 XZDR3W+1RRDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="226212840"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="226212840"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 14:28:36 -0700
IronPort-SDR: SfGYRZTYnj8Ou4lVS2J2XL2/1KaAFFfSBEMAfGzBooH5G2ZtaEKJMN02LA80FxW4DdAuw6apzu
 6yBS2GM1+OTw==
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="345028061"
Received: from wraymatt-mobl1.amr.corp.intel.com ([10.251.18.70])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 14:28:36 -0700
Subject: Re: [OE-core] RFC: Upgrading rt-tests requires numactl
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <711dd8de-1ea7-e3cd-d606-5f69faa7c8a3@linux.intel.com>
 <CAAnfSTsTXqEXVcoL+bdCU8wyRRSs_XL2HqQ0jiMCLrRNPOWEdg@mail.gmail.com>
 <CAMKF1spFrLCVpwqeWkhys5K4r8vav6GFpFNobwkRZW3Mt=NOUA@mail.gmail.com>
From: "Randy Witt" <randy.e.witt@linux.intel.com>
Message-ID: <ca04f6ae-b377-9295-5764-169f10200cf3@linux.intel.com>
Date: Mon, 28 Sep 2020 14:28:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spFrLCVpwqeWkhys5K4r8vav6GFpFNobwkRZW3Mt=NOUA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/23/20 11:00 PM, Khem Raj wrote:
> On Wed, Sep 23, 2020 at 2:40 PM Ross Burton <ross@burtonini.com> wrote:
>>
>> On Wed, 23 Sep 2020 at 18:23, Randy Witt <randy.e.witt@linux.intel.com> wrote:
>>> Another issue is that ARM is removed from COMPATIBLE_HOST in
>>> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/numactl/numactl_git.bb?h=master#n27.
>>> This may be for legacy reasons, but libnuma can be installed on most
>>> distributions running on an ARM host. Regardless, it would need to be changed to
>>> allow for rt-tests on ARM.
>>
>> Yeah, that's probably very old.
>>
>> $ lscpu
>> Architecture:                    aarch64
>> CPU op-mode(s):                  64-bit
>> Byte Order:                      Little Endian
>> CPU(s):                          256
>> On-line CPU(s) list:             0-255
>> Thread(s) per core:              4
>> Core(s) per socket:              32
>> Socket(s):                       2
>> NUMA node(s):                    2
>>
>> The recipe has done that since it was added, so I'd call this
>> historical and just delete it.
> 
> question is not aarch64 but arm (32bit) and I think answer is still no for arm.
> 

I compiled numactl on arm, and v1.8 of rt-tests. While the ptests for numactl 
fail, due to there being no actual numa support, the libraries and headers still 
work.

cyclictest from rt-tests seems to still set affinity appropriately and work. 
Should we make the ptests aware of the expected results when numa isn't 
supported? For example:

      root@qemuarm:/# /usr/lib/numactl/ptest/test/distance
      no numa support in kernel

I also tried v1.9 of rt-tests, but it fails due to the following 
https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/tree/src/oslat/oslat.c?h=v1.9#n72. 
I'm going to email the maintainer about that, since there is no way to disable 
any of the tests, outside of manually specifying each one. And it will break any 
architecture that isn't x86_64, i386, or PPC64.

>> Ross
>>
>> 
>>

