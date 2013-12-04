Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id E90E36162C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:57:57 +0000 (UTC)
Received: (qmail 18344 invoked by uid 1003); 4 Dec 2013 15:57:56 -0000
Received: from unknown (HELO ?192.168.1.113?)
	(philip@opensdr.com@108.44.82.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	4 Dec 2013 15:57:55 -0000
Message-ID: <529F5101.9090900@balister.org>
Date: Wed, 04 Dec 2013 10:57:53 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Fathi Boudra <fathi.boudra@linaro.org>
References: <2455395.bHzIGNWoWP@helios>
	<CAP71Wjy9-8pkU0bLKsn5L-SFDFeidW56ZEuLV25geN1_7ykgHA@mail.gmail.com>
	<CAGNsrLCxpsQm=MB4Qa+CxkD8qFniBcM1tU_YweaPxyVzJisuNg@mail.gmail.com>
In-Reply-To: <CAGNsrLCxpsQm=MB4Qa+CxkD8qFniBcM1tU_YweaPxyVzJisuNg@mail.gmail.com>
X-Enigmail-Version: 1.6
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Yocto list discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Automated testing on real hardware
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
X-List-Received-Date: Wed, 04 Dec 2013 15:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/02/2013 05:11 AM, Fathi Boudra wrote:
> Hi,
> 
> On 29 November 2013 18:31, Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
>> Paul,
>>
>> On Fri, Nov 29, 2013 at 4:58 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>>>
>>> LAVA
>>> -----
>>>
>>> A number of people had suggested I look at LAVA [1]. It is split into
>>> different
>>> components for each function, some of which should be usable independently
>>> so
>>> you don't have to use the entire framework. Many of the components could
>>> be
>>> useful assuming they are independent, but in terms of being able to
>>> actually
>>> run our tests, the one that stands out as being most relevant is lava-
>>> dispatcher. This is the component that deploys images, and boots the
>>> hardware
>>> in order to run the tests.
>>>
>>> I've looked at lava-dispatcher a couple of times; firstly at the code, and
>>> yesterday I looked at actually running it. Initially it looked very
>>> promising
>>> - reasonably licensed, written in Python, has some rudimentary support for
>>> OE
>>> images. However while looking at it I found the following:
>>>
>>> * It requires root to run, since it mounts the images temporarily and
>>> modifies
>>> the contents. We've done quite a lot to avoid having to run as root in OE,
>>> so
>>> this is a hard sell.
>>
>>
>> i have forwarded this email to the relevant people in Linaro working on
>> LAVA. I hope to be able to bring more information about that, as I am not
>> involved with LAVA, just a 'user' of it. By 'root' here, you mean on the
>> server side, e.g. the LAVA instance, which will typically not be the
>> 'builder', or do you want to couple build and test on the same 'server'?
>> LAVA jobs are generally submitted by a CI instance (Jenkins in our case).
>>
>>>
>>> * It expects images to be created by linaro-media-create, which in turn
>>> requires an "hwpack" [2]. The hwpack concept seems primarily geared to
>>> Ubuntu
>>> and distributions like it where you'd have a generic base image upon which
>>> you'd install some board-specific packages in order to make it work on the
>>> board. OE doesn't work that way - we just build images specific to the
>>> board,
>>> which makes this mechanism completely superfluous for our usage; but the
>>> tool
>>> appears to require it.
>>
>> that is no longer the case. we do have support for 'native' OE images, and
>> we've had that for a while.
> 
> Well, it has never been the case... We had deploy_linaro_image to
> deploy images since day 1, supporting hwpack + rootfs image or
> pre-built image.
> Support for 'native' OE images as you call it, fall into the pre-built
> image method.
> It has some assumption since we use our own baked images, but I'm
> pretty sure we can fix it if more people are using it for OE testing.
> 
> Some other deployment methods have been added like
> deploy_linaro_kernel, for network boot:
> http://validation.linaro.org/static/docs/dispatcher-actions.html
> 
>> That is what I am using for my project at
>> Linaro. None of our projects/jobs deliverable are 'public' at the moment, so
>> you won't find them, but i can confirm that what we deploy for our jobs is
>> the output of OE (e.g. what is in the deploy/image folder). hwpack was
>> something mostly meant to make it simpler to work with Ubuntu and Android
>> root FS, and is not suited for OE.
> 
> It isn't suited for OE is a personal opinion. As a matter of fact,
> there's use cases where we need only the rootfs and don't want to
> rebuild everything just to change the kernel.

Is there an example of using LAVA to test an OE rootfs with qemu (or
other form of vm). I've installed LAVA on a spare PC, but the install
has no sample test configs :)

It would be really helpful to ahve an example, prefably something OE
based, to try out.

Philip

> 
>>>
>>>
>>> * There is a general lack of abstraction and far too much hardcoding. For
>>> example, even at the most abstract level, the "Target" class (which is the
>>> base class for defining what to do for different types of targets) has
>>> hardcoded
>>> deploy_linaro / deploy_android functions:
>>>
>>> https://git.linaro.org/gitweb?p=lava/lava-dispatcher.git;a=blob;f=lava_dispatcher/device/target.py
>>>
>>> * It's not clear to me how well it will work across different host
>>> distributions that we want to support; the main LAVA installer quits if it
>>> isn't run on Ubuntu. For convenience I happened to be using an Ubuntu VM,
>>> and
>>> I wasn't running the full installer so I avoided this check altogether. It
>>> just concerns me that such a check would even be there.
>>
>>
>> I agree that this is a problem and we should fix. Our IT infrastructure is
>> largely based on Ubuntu servers, but that should not affect what we create
>> that much.
> 
> There's a work in progress on LAVA deployment. It has been
> re-organized to make it easier to package for distributions. LAVA does
> work on Debian/Ubuntu/Fedora and packages will be available for those
> distro.
> 
>>>
>>> Of course, none of these problems are impossible to overcome, if we're
>>> prepared to put a significant amount of engineering into resolving them.
>>> In
>>> terms of enabling the Yocto Project QA team to test images on real
>>> hardware in
>>> the 1.6 development cycle however, I don't believe this is going to be
>>> deliverable.
> 
> afaict, the non-root requirement is the blocker.
> The other issues reported will be resolved as part of our roadmap.
> 
> Cheers,
> Fathi
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

