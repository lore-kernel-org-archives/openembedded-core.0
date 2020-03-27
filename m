Received: from hel-mailgw-01.vaisala.com (hel-mailgw-01.vaisala.com [193.143.230.17])
 by mx.groups.io with SMTP id smtpd.web12.18363.1585331693146275686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: vaisala.com, ip: 193.143.230.17, mailfrom: nandor.han@vaisala.com)
IronPort-SDR: lykzfIzCNP0KB7x50I1F+S8Qreq+tsO3utHDoO71Z5zPql0CjyHrI/Df1EytbNrVz0/vBZwDzS
 6NCLgDy0KqGQ20yo4K0ewZIYZtj2XJSZUftpko4nyPoBA9JFac/JDqH2NwWTSB5t76cwlmrQzx
 8iYK5lIl5ZBly8sCnZx1AG9Xfb5acjpxe4yibiktAFIEqeHnLfbirLz4nv9GWuegUMgwckzd1l
 ikv6P6ShO6vGC0+zvhGbFmRbhXhZoayYfZDRgzz/5dDhy/WRJ9zijdaDqafwpz1XnrG+mk/Q0A
 hkE=
X-IronPort-AV: E=Sophos;i="5.72,313,1580767200"; 
   d="scan'208";a="274845135"
Subject: Re: [OE-core] [PATCH v2] classes: Add a new bbclass that abstracts the generation of FIT blobs
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200326214308.1042374-1-nandor.han@vaisala.com>
 <20200327071550.1200675-1-nandor.han@vaisala.com>
 <CAO5Uq5TjhSR+nu7GcLNs5dZYdRBt5e4PSk6m3dqvXq3ddAKqhg@mail.gmail.com>
From: "Nandor Han" <nandor.han@vaisala.com>
Message-ID: <bfec2793-94da-e73e-176e-4ea97a4acb60@vaisala.com>
Date: Fri, 27 Mar 2020 19:54:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5TjhSR+nu7GcLNs5dZYdRBt5e4PSk6m3dqvXq3ddAKqhg@mail.gmail.com>
Return-Path: nandor.han@vaisala.com
X-OriginalArrivalTime: 27 Mar 2020 17:54:50.0633 (UTC) FILETIME=[CFF52790:01D60460]
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-03-27 19:23, Alex Kiernan wrote:
> On Fri, Mar 27, 2020 at 7:16 AM Nandor Han <nandor.han@vaisala.com> wrote:
>>
>> FIT format is very versatile allowing various combination of booting
>> sequences. In the same time different U-Boot boot stages can use FIT
>> blobs to pack various binaries (e.g. SPL supports reading U-Boot from a
>> FIT blob). Because of the allowed level of customization, the generation
>> of a FIT blob using a fixed image tree source, becomes challenging and
>> increase the level of complexity where different configurations and
>> combinations are needed.
>>
>> This bbclass will know how to generate a FIT blob, leaving the mechanics
>> of the process (dependencies, task order...) to be handled by the users
>> of the bbclass. In the same time will allow to separate the knowledge of
>> the FIT format leaving the user code cleaner and more readable.
>>
>> Signed-off-by: Nandor Han <nandor.han@vaisala.com>
>> ---

<snip>

>>      ```
>>      2. Build the kernel: `bitbake virtual/kernel`
>>      3. Verify that `image-fit.itb` is present in the build directory: PASS
>>      4. Disassemble the image using the command: `dtc -I dtb -O dts image-fit.itb`
>>      5. Verify that the FIT source contains the expected configuration: PASS
>>

Hi Alex and thanks for feedback.

> 
> Whilst I'm definitely interested in this, building the its file
> through dozens of variables is fragile and ugly...
> 
> What I had in a class that I'd started, but hadn't got anything like
> this far was something like a .its.in file which got passed through
> bitbake's expand.
> 

For most of the users or better say for a normal user, these variables 
will be probbly almost invisible. Like I mention in other answers, my 
plan is to refactor `kernel-fitimage` class to use this class. This way 
we can very easily customize the FIT source based on the user needs.

I started also by using an `its.in` template, however it turns out very 
quickly that is hard to maintain and hard to extend, given the FIT 
format possibility and user needs. For example in my situation in some 
conditions I wanted to have kernel as loadable image or my conf to 
contain or not a signature...


Nandor

