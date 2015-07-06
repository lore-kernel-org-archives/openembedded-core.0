Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 312FB75DB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 16:07:06 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <5596A293.8020606@communistcode.co.uk>
	<559A67FE.4050000@communistcode.co.uk>
	<559A74E7.8080803@communistcode.co.uk>
	<559AA52F.9060505@communistcode.co.uk>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <559AA7BB.9080102@communistcode.co.uk>
Date: Mon, 6 Jul 2015 17:07:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <559AA52F.9060505@communistcode.co.uk>
Subject: Re: SDK extract errors on master
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
X-List-Received-Date: Mon, 06 Jul 2015 16:07:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/07/15 16:56, Jack Mitchell wrote:
> On 06/07/15 13:30, Jack Mitchell wrote:
>> On 06/07/15 12:35, Jack Mitchell wrote:
>>> On 03/07/15 15:56, Jack Mitchell wrote:
>>>> Built an SDK today on 7eb0abc5f4d971d9a511c93cfb2eb52b72e6f228 and 
>>>> when I tried to install it I got the following error:
>>>>
>>>> Setting it up...ls: cannot access 
>>>> /home/jack/Work/build/openembedded/sdk/1/x86_64/environment-setup-*: No 
>>>> such file or directory
>>>>
>>>> I have been messing about with the SDK install path and at one 
>>>> point it did spew out a load of files installed vs shipped warnings 
>>>> I assume due to a change of path and it getting upset about it, but 
>>>> since then I deleted the tmp directory and rebuilt a new SDK 
>>>> without warnings. However, both acted in the same way.
>>>>
>>>> The SDK then sits without installing, seemingly stuck on: grep 
>>>> OECORE_NATIVE_SYSROOT, which I assume means it's looking for the 
>>>> (non-existant) nvironment file.
>>>>
>>>> Any clues? Is this broken for anyone else?
>>>>
>>>> Cheers,
>>>> Jack.
>>>
>>> Ok, I figured out how I broke it; I used a relative path in SDKPATH. 
>>> i.e.
>>>
>>> SDKPATH=/path/to/sdk/../rel-sdk
>>>
>>> So, first off; should this be supported? Secondly, the use-case I 
>>> was trying to get at was to position an SDK relative to the build 
>>> dir, i.e.
>>>
>>> SDKPATH=${TOPDIR}/../sdk
>>>
>>> Is there a better way to do this. I guess this problem could be 
>>> solved somewhere in an SDK class by changing the relative path to an 
>>> absolute path. Ideas?
>>>
>>> Cheers,
>>> Jack.
>>
>> I found an ugly work-around but it would be nice for this to be 
>> supported in the future, or at least error on a relative path.
>>
>> SDKPATH := "${@os.path.abspath(d.getVar('TOPDIR', 
>> True)+"/../sdk/"+d.getVar('SDK_VERSION', 
>> True)+"/"+d.getVar('SDK_ARCH', True))}"
>>
>> Cheers,
>
> The saga continues... so, using a relative path is what causes bitbake 
> to spew the 'installed vs shipped' warnings; which I thought were the 
> root cause of the SDK failing to install, but apparently not. I'm 
> appending a custom recipe like this:
>
> TOOLCHAIN_HOST_TASK += "nativesdk-fastboot"
>
> Which seems to be the root cause of the SDK failing to install. I have 
> grepped the output of bitbake -e image -c populate_sdk and I get:
>
> TOOLCHAIN_HOST_TASK="nativesdk-packagegroup-sdk-host 
> packagegroup-cross-canadian-diffusion nativesdk-fastboot"
>
> Which looks perfectly reasonable to me; the fastboot recipe also 
> builds without issue and the resulting package looks sane. So, why is 
> this breaking the SDK and causing other packages not to be installed, 
> it looks specifically like it nullifies the 
> packagegroup-cross-canadian-diffusion as that is what brings in 
> meta-environment and as such environment-setup-* which is what is 
> claimed to be missing on SDK extract.
>
> I'm totally out of my depth now as on the surface everything looks OK. 
> Any input would be much appreciated.
>
> Cheers,
>

Turns out it's one of the magic variables that requires an _append 
rather than just a +=.

The example above turns out to be from my tests using _append and I 
didn't realise it was different with just a plain +=.

To conclude, TOOLCHAIN_HOST_TASK += "nativesdk-package" will overwrite 
TOOLCHAIN_HOST_TASK to just hold nativesdk-package, as such 
nativesdk-packagegroup-sdk-host and 
packagegroup-cross-canadian-diffusion won't be present anymore which 
makes a whole lot of sense now. Using append, like so:

TOOLCHAIN_HOST_TASK_append += "nativesdk-fastboot"

Will give you the whole list and result in:

TOOLCHAIN_HOST_TASK="nativesdk-packagegroup-sdk-host 
packagegroup-cross-canadian-diffusion nativesdk-fastboot"

Which is correct. Sorry for the noise; but just a heads up that I now 
feel strongly that this should be in the Yocto Docs somewhere, there is 
no mention of extending the SDK at all from what I could see and current 
examples found online specify just a plain += is fine to use, which it 
isn't.

