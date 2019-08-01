Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CED537F22D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 23:42:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Aug 2019 16:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,336,1559545200"; d="scan'208";a="348254992"
Received: from jaisharm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.36.125])
	by orsmga005.jf.intel.com with ESMTP; 01 Aug 2019 16:42:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20190801011038.4416-1-zangrc.fnst@cn.fujitsu.com>
	<ee26bc1bf769ab46b9f6f9f503cd192f4ae0611a.camel@intel.com>
	<ac388709-9edd-3f06-ff2b-dfd0910bbcf5@intel.com>
	<7a8f13032f1e892d865c6bcf95c8f58f141001a3.camel@linuxfoundation.org>
	<7b27b073050445e38d1a1558eeac023f030496f8.camel@linuxfoundation.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6ad2ef0a-6b56-9d96-b265-9901a71fb6d4@intel.com>
Date: Fri, 2 Aug 2019 00:42:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b27b073050445e38d1a1558eeac023f030496f8.camel@linuxfoundation.org>
Subject: Re: [PATCH] libx11:upgrade 1.6.7 -> 1.6.8
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
X-List-Received-Date: Thu, 01 Aug 2019 23:42:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 01/08/2019 12:37, Richard Purdie wrote:
> On Thu, 2019-08-01 at 10:22 +0100, Richard Purdie wrote:
>> On Thu, 2019-08-01 at 10:03 +0100, Ross Burton wrote:
>>> On 01/08/2019 02:24, Mittal, Anuj wrote:
>>>> An earlier patch for the same upgrade didn't make it in and
>>>> probably
>>>> fell through the cracks. Can we pick those upgrades?
>>>>
>>>> https://patchwork.openembedded.org/series/18658/
>>>
>>> Already in MUT, I'll prod RP.
>>
>> They failed in testing, see my reply on patch #1, two different
>> problems.
> 
> Ross asked me to retest:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/888
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1116/steps/8/logs/step2b
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/885
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/886
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/870
> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/881
> 
> (beaglebone, build-appliance, musl, musl-64, x32, pkgman-deb-non-deb)
> 
> and others are still running and likely to fail.

Solved!

src/util/makekeys is a native tool, that for reasons is built with 
libtool -all-static. The machines where this fails don't have libc.a 
available.

Workaround in build testing now, and bug upstream filed.

Ross

