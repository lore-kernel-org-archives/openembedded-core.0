Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qm5dA-0002mx-Nz
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:02:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6REtquD020652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 07:58:25 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 27 Jul 2011 07:58:14 -0700
Message-ID: <4E302785.9070705@windriver.com>
Date: Wed, 27 Jul 2011 09:58:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311777255.30326.347.camel@phil-desktop>
In-Reply-To: <1311777255.30326.347.camel@phil-desktop>
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 15:02:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 7/27/11 9:34 AM, Phil Blundell wrote:
> I just looked at this again and here are a few more comments:
> 
> On Tue, 2011-07-26 at 13:44 +0100, Richard Purdie wrote:
>> +PACKAGE_EXTRA_ARCHS_tune-armv4tb = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv4tb"
> 
> That should be "${PACKAGE_EXTRA_ARCHS_tune-armv4b} armv4tb", I think.
> Otherwise you will get a mixture of big and little endian in there.
> 
>> +++ b/meta/conf/machine/include/arm/arch-armv5-dsp.inc
>> @@ -0,0 +1,40 @@
>> +ARMPKGSFX_DSP = "${@bb.utils.contains("TUNE_FEATURES", [ "armv5", "dsp" ], "e", "", d)}"
>> +
>> +require conf/machine/include/arm/arch-armv5.inc
>> +
>> +# Little Endian
>> +AVAILTUNES += "armv5e armv5te"
>> +TUNE_FEATURES_tune-armv5e ?= "armv5 dsp"
>> +TUNE_FEATURES_tune-armv5te ?= "armv5 dsp thumb"
>> +PACKAGE_EXTRA_ARCHS_tune-armv5e = "${PACKAGE_EXTRA_ARCHS_tune-armv5} armv5e"
>> +PACKAGE_EXTRA_ARCHS_tune-armv5te = "${PACKAGE_EXTRA_ARCHS_tune-armv5t} armv5e armv5te"
>> +
>> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
>> new file mode 100644
>> index 0000000..55cbe03
>> --- /dev/null
>> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
>> @@ -0,0 +1,51 @@
>> +# Little Endian
>> +AVAILTUNES += "armv5 armv5t armv5e armv5te"
>> +TUNE_FEATURES_tune-armv5 ?= "armv5"
>> +TUNE_FEATURES_tune-armv5t ?= "armv5 thumb"
>> +PACKAGE_EXTRA_ARCHS_tune-armv5 = "${PACKAGE_EXTRA_ARCHS_tune-armv4} armv5"
>> +PACKAGE_EXTRA_ARCHS_tune-armv5t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} armv5 armv5t"
> 
> There seems to be some duplication of AVAILTUNES going on here.
> 
> Also, I think this v5 stuff is more complex than it needs to be because
> it seems to be trying to cater for architecture combinations that are
> possible in theory but don't actually exist in the wild.  For example, I
> can't immediately think of any ARMv5 implementations that lack Thumb or
> the E instructions.

For the tune names..  armv5 means I want classic ARM instructions, while armv5t
means I was thumb instructions.

So armv5 and armv5t are distinct in the contents of the tunings.

There were armv5's without thumb support.. but that doesn't matter much.  A
machine with thumb is compatible (run-time) with one that does not.  A machine
w/o thumb is not necessarily compatible with thumb executables.

>> +# Little Endian + VFP/DSP
>> +AVAILTUNES += "armv5-vfp armv5t-vfp armv5hf-vfp armv5thf-vfp"
> 
> The comment doesn't seem to match the code here since this is the
> section for chips without DSP.  Incidentally, the name "dsp" for this
> feature seems quite a bad one: maybe we should just call it "armv5e".

Yes, the mention of DSP should be using the 'e'.  What I'm not sure of is does
the "dsp" capabilities actually change any of the code or support generated.  If
not then we can ignore it.

For armv5 this gives us:

armv5, armv5t, armv5e, armv5te... add in their VFP variants and the hard float
EABI...

--Mark

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



