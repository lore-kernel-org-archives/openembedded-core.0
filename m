Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B08570100
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 10:52:44 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
	<CAMKF1sqVdGwXPX-hg2NCgY-VxL_1bBVQL3vpzC00033ah1N7WQ@mail.gmail.com>
	<f8d7dc4e-2788-f061-447c-67916f215aab@embed.me.uk>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <b645b26d-a60f-f42e-8545-13d3b36b0596@embed.me.uk>
Date: Mon, 5 Dec 2016 10:54:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <f8d7dc4e-2788-f061-447c-67916f215aab@embed.me.uk>
Subject: Re: non-standard library locations and rpath
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
X-List-Received-Date: Mon, 05 Dec 2016 10:52:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/12/16 10:44, Jack Mitchell wrote:
> On 02/12/16 07:08, Khem Raj wrote:
>> On Thu, Dec 1, 2016 at 8:18 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>>> I'm having some troubles with shared library, shared library
>>> dependencies
>>> and rpaths. I have libfoo, which depends on libbar when I try to link
>>> libfoo
>>> with my app, it requires libbar to be found. libbar is in a non-standard
>>> location, /usr/local/bar when I compiled libfoo, I used -Wl,rpath-link
>>> ${STAGING_SYSROOT}/usr/local/bar and -Wl,rpath /usr/local/bar. Now
>>> when I
>>> come to try link my app with libfoo, it fails to link as it can't find
>>> libbar, which I assume means the rpath in libfoo isn't being properly
>>> prepending with sysroot what is the proper way to support this in OE? My
>>> library has the following rpath information:
>>>
>>> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>>>
>>> So why isn't the rpath being prepended with the sysroot when I
>>> compile my
>>> app and link libfoo? The apps build system is using cmake, but this
>>> should
>>> be a built in linker feature, correct?
>>
>> Only first path ( before :) is relative to location of binary at runtime
>>
>
> Exactly, so how can you make an OE build use the rpaths of libs that
> point to the build sysroot. What I have at the moment is
>
> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>
> Which would be correct if I was linking on the target. However when OE
> sees the rpath in it's cross compile environment it should prepend it
> with the build sysroot so you end up with something like
>
> 0x0000000f (RPATH) Library rpath:
> [$ORIGIN/../lib:/path/to/build/sysroot/usr/local/bar]
>
> And then the SDK should end up with something like
>
> 0x0000000f (RPATH) Library rpath:
> [$ORIGIN/../lib:/path/to/sdk/sysroot/usr/local/bar]
>
> Is this what is expected to happen, or am I stumbling into an
> unsupported scenario.
>
> Cheers,

I think basically what I'm saying is that does the linker prepend it's 
--sysroot value to absolute rpaths, and if not, should it?

