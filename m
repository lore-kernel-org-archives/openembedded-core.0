Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 650906074F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 10:25:45 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 943E1B30FE055;
	Tue, 20 Sep 2016 11:25:32 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Tue, 20 Sep 2016 11:25:34 +0100
To: Robert Yang <liezhi.yang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1474283673-48449-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<266d3484-6a50-7e5b-6a1e-9efc2eebb50f@windriver.com>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <a43ab46c-1fad-0d5e-d536-3ed9a4c84012@imgtec.com>
Date: Tue, 20 Sep 2016 11:25:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <266d3484-6a50-7e5b-6a1e-9efc2eebb50f@windriver.com>
X-Originating-IP: [192.168.154.45]
Subject: Re: [Patch] arch-mips: Restructure mips64 and add mips64r2
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
X-List-Received-Date: Tue, 20 Sep 2016 10:25:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/20/2016 03:33 AM, Robert Yang wrote:
> Hi,
>
> It seems that this one causes build failures on qemumips64 + multilib:
>
> config:
> http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/64/steps/CreateAutoConf_5/logs/stdio
>
> error:
> http://autobuilder.yocto.io:8010/builders/nightly-multilib/builds/64/steps/BuildImages_5/logs/stdio
>
> ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
>     Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
>
>     Toolchain tunings invalid:
> Tuning 'mips32r2' has no defined features, and cannot be used.

Thank-you. I've noticed a subtle error in the include file sequence marked below

>
> // Robert
>
> On 09/19/2016 07:14 PM, Zubair Lutfullah Kakakhel wrote:
>> The current file structure felt slightly unsuitable for adding
>> MIPS64r2. So I restructured it slightly and added MIPS64r2
>> support
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> ---
>>  meta/conf/machine/include/mips/arch-mips.inc | 60 --------------------
>>  meta/conf/machine/include/tune-mips32.inc    | 22 +++++++-
>>  meta/conf/machine/include/tune-mips64.inc    | 80 +++++++++++++++++++++++++-
>>  meta/conf/machine/include/tune-mips64r2.inc  | 84 ++++++++++++++++++++++++++++
>>  4 files changed, 184 insertions(+), 62 deletions(-)
...
>> diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
>> index 9be0e0f..e0c9d2c 100644
>> --- a/meta/conf/machine/include/tune-mips64.inc
>> +++ b/meta/conf/machine/include/tune-mips64.inc
>> @@ -1,3 +1,81 @@
>>  DEFAULTTUNE ?= "mips64"
>>
>> -require conf/machine/include/tune-mips32r2.inc
>> +require conf/machine/include/mips/arch-mips.inc

Here. Even though this is mips64.inc. It builds up using
mips32r2.inc to include all previous tune configurations
in mips32r2

Regards,
ZubairLK



