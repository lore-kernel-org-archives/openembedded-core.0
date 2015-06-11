Return-Path: <mike.looijmans@topic.nl>
Received: from smtp03.mail.online.nl (smtp03.mail.online.nl [194.134.25.73])
	by mail.openembedded.org (Postfix) with ESMTP id DD020756A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 05:45:35 +0000 (UTC)
Received: from smtp03.mail.online.nl (localhost [127.0.0.1])
	by smtp03.mail.online.nl (Postfix) with ESMTP id 7CE4E1C0072;
	Thu, 11 Jun 2015 07:45:35 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp03.mail.online.nl (Postfix) with ESMTP;
	Thu, 11 Jun 2015 07:45:34 +0200 (CEST)
Message-ID: <5579207E.1050506@topic.nl>
Date: Thu, 11 Jun 2015 07:45:34 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Andrea Adami <andrea.adami@gmail.com>
References: <55641868.1080406@topic.nl>	<CADkTA4NaTjRoydVSh63HB6QgvSnQis-z9RnaYZkT3Ng1cm1bWg@mail.gmail.com>	<55641D0C.5020408@topic.nl>	<55642019.3060305@topic.nl>	<55642B75.8050909@topic.nl>	<55642EFB.4070102@topic.nl>	<CAAQYJAvzu1Jb76SgenWQPhs=9N_+aqqUece_hBhs-8_6nMbojg@mail.gmail.com>
	<556436D1.80906@topic.nl>
In-Reply-To: <556436D1.80906@topic.nl>
X-Online-Scanned: by Cloudmark authority (on m7-zaas-prd-smtp03.m7zaas.local)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "bitbake -c menuconfig virtual/kernel" fails on ncurses dependency
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
X-List-Received-Date: Thu, 11 Jun 2015 05:45:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26-05-15 11:03, Mike Looijmans wrote:
> On 26-05-15 10:40, Andrea Adami wrote:
>> On Tue, May 26, 2015 at 10:29 AM, Mike Looijmans
>> <mike.looijmans@topic.nl> wrote:
>>> On 26-05-15 10:14, Mike Looijmans wrote:
>>>>
>>>> On 26-05-15 09:26, Mike Looijmans wrote:
>>>>>
>>>>> On 26-05-15 09:13, Mike Looijmans wrote:
>>>>>>
>>>>>> On 26-05-15 09:02, Bruce Ashfield wrote:
>>>>>>>
>>>>>>> On Tue, May 26, 2015 at 2:53 AM, Mike Looijmans
>>>>>>> <mike.looijmans@topic.nl>
>>>>>>> wrote:
>>>>>>>>
>>>>>>>> I get this when running
>>>>>>>> bitbake -c menuconfig virtual/kernel
>>>>>>>>
>>>>>>>> scripts/kconfig/mconf.o: In function `show_help':
>>>>>>>> mconf.c:(.text+0x884): undefined reference to `stdscr'
>>>>>>>> scripts/kconfig/lxdialog/checklist.o: In function `print_arrows':
>>>>>>>> checklist.c:(.text+0x2c): undefined reference to `wmove'
>>>>>>>> checklist.c:(.text+0x4c): undefined reference to `acs_map'
>>>>>>>> checklist.c:(.text+0x54): undefined reference to `waddch'
>>>>>>>> checklist.c:(.text+0x66): undefined reference to `waddnstr'
>>>>>>>> checklist.c:(.text+0x76): undefined reference to `wmove'
>>>>>>>
>>>>>>>
>>>>>>> This has popped up on and off for several years now, and we have
>>>>>>> a few
>>>>>>> bugzilla
>>>>>>> entries that track it. The fix is never as simple as we would like.
>>>>>>>
>>>>>>> The most recent version is here:
>>>>>>>
>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7609
>>>>>>>
>>>>>>> If you have more details about your enviroment, adding them to
>>>>>>> that bug
>>>>>>> would
>>>>>>> be idea.
>>>>>>>
>>>>>>> The problem with using the -native version, or the host, is that at
>>>>>>> times
>>>>>>> menu
>>>>>>> config is rendered unusable. The fix isn't only in the dependencies,
>>>>>>> but in
>>>>>>> the
>>>>>>> way that menuconfig is build within the kernel environment.
>>>>>>>
>>>>>>> This older bug tracks the details of that:
>>>>>>>
>>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3898
>>>>>>
>>>>>>
>>>>>> I have an Ubuntu 14 system. The weird thing is, that I have several
>>>>>> almost
>>>>>> identical machines, and some of them fail and some don't.
>>>>>>
>>>>>> This one works fine:
>>>>>> MACHINE=topic-miami-florida-med-xc7z030
>>>>>>
>>>>>> This one fails:
>>>>>> MACHINE=topic-miami-florida-gen-xc7z030
>>>>>>
>>>>>> They all use the same kernel recipe, version, git tag, etc. These two
>>>>>> even
>>>>>> share the very same defconfig. Their builds run within the same OE
>>>>>> environment, so the native sysroot for both is the same too!
>>>>>
>>>>>
>>>>> I output "bitbake -c menuconfig virtual/kernel -e" for both
>>>>> machines into
>>>>> two
>>>>> files, then did a find/replace "med" with "gen", and then looked
>>>>> the the
>>>>> differences with meld. Both machines use the same environments all
>>>>> over,
>>>>> only
>>>>> differences are time stamps and task checksums.
>>>>>
>>>>> Next I'm gonna try the old "remove tmp" trick.
>>>>
>> I was there, it will fail (Ubuntu 14.04 fwiw).
>>
>>>>
>>>> Removing tmp did not help either. Forcibly rebuilding ncurses-native
>>>> also
>>>> did
>>>> not help.
>>
>> Yes, as strange as it is, you need to bitbake ncurses.
>
> Wow, indeed, "bitbake ncurses -c populate_sysroot -f" made the
> menuconfig work again.
>
> Looks like ncurses "fixes" something that ncurses-native broke.

Waaah. I just got this very same problem back, but whatever I try, I 
can't get it to work properly again using the above workaround.



-- 
Mike Looijmans

