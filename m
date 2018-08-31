Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E114379448
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 23:27:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7VNRrBQ029227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Aug 2018 16:27:53 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 31 Aug 2018 16:27:52 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, srikanth krishnakar
	<skrishnakar@gmail.com>
References: <CALDxG5gxGqHP7S1fK-NmFrvQt9KRgjH+u4t+xHF=3m=UvUY=bQ@mail.gmail.com>
	<1482748609.9843.136.camel@linuxfoundation.org>
	<CALDxG5h=3iZTJp=d_4RKGs6pOC=W6MJeFeJ6_-ykayqWv1i3nw@mail.gmail.com>
	<CALDxG5hjMaUwmRTR9GLoYb7nmvMUKi08ZMNog5jviJrnJ42naw@mail.gmail.com>
	<CALDxG5ihGZU3f4ipau1nm19_p-C+XRTGxq71OvapTC6J4-8yMQ@mail.gmail.com>
	<1482857351.9843.141.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <fa4538e1-82c1-d48b-adfb-b81acdb9def5@windriver.com>
Date: Fri, 31 Aug 2018 19:27:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1482857351.9843.141.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Yocto-2.2 build failures on Ubuntu 14.04.5 & 16.04.x hosts due to crash of unity-settings-daemon followed by restart of lightdm
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
X-List-Received-Date: Fri, 31 Aug 2018 23:27:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 12/27/2016 11:49 AM, Richard Purdie wrote:
> On Tue, 2016-12-27 at 15:18 +0530, srikanth krishnakar wrote:
>> Hello Richard,
>>
>> I was under impression that installing Ubuntu-14.04.4 (+lastest
>> updates) would give me stable build environment, unfortunately that
>> is not the case ! I could see the logout issue on this installation
>> too. So I believe that issue should be reproducible on any 14.04.x
>> installation including 16.04.x with all latest updates installed. The
>> second attempt of build on "Ubuntu-14.04.4" shows the status of
>> bitbake as halted at libvorbis when logout happened:
>>
>> ---------------------------------------------------------
>> NOTE: Running task 2460 of 4212 (/home/poky/meta/recipes-
>> core/ncurses/ncurses_6.0+20160625.bb:do_packagedata)
>> NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Started
>> NOTE: recipe ncurses-6.0+20160625-r0: task do_packagedata: Succeeded
>> NOTE: Running task 2461 of 4212 (/home/poky/meta/recipes-
>> core/readline/readline_6.3.bb:do_package)
>> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_package: Succeeded
>> NOTE: Running task 2462 of 4212 (/home/poky/meta/recipes-
>> graphics/jpeg/libjpeg-turbo_1.5.0.bb:do_packagedata)
>> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Started
>> NOTE: recipe libjpeg-turbo-1_1.5.0-r0: task do_packagedata: Succeeded
>> NOTE: Running task 2463 of 4212 (/home/poky/meta/recipes-
>> multimedia/libvorbis/libvorbis_1.3.5.bb:do_package)
>> NOTE: recipe readline-6.3-r0: task do_package: Started
>> NOTE: recipe libvorbis-1.3.5-r0: task do_package: Started
> 
> 
> None of these look particularly suspicios for causing your X session to
> die.
> 
> Some further questions:
> 
> a) Is anything showing in the dmesg logs? Is the OOM killer the thing
> which is killing processes?
> b) How are you measuring free memory? You mentioned it was low, it
> would depend on the disk cache size and swap status too.
> c) Have you tried a lower BB_NUMBER_THREADS and lower PARALLEL_MAKE
> values to rule out resource problems and perhaps identify more
> specifically which task is causing your problem?
> 
> As I mentioned previously, this problem should reduce to a specific
> recipe+task causing the problem, unless its a general resource issue in
> which case the threads/parallel make will stop the problem occurring.
> 
> We have autobuilders running various versions of Ubuntu and we don't
> notice problems with processes dying, admittedly we don't run X
> desktops on them in general though.

Google found this old thread...

A co-worker is encountering this problem now as well on oe-core-2.4.


Srikanth,

Did you ever manage to identify the cause or a work-around?

Of course if you ssh to localhost and then do the build
that will work-around the issue.

More when we've had a chance to narrow down
the issue now that we have a system where we are
able to reproduce the problem.

../Randy

> 
> Cheers,
> 
> Richard
> 
> 


-- 
# Randy MacLeod
# Wind River Linux

