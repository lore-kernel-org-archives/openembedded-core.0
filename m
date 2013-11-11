Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1039D6D12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 12:40:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rABCeKjv008732
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 04:40:20 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Nov 2013 04:40:19 -0800
Message-ID: <5280D037.1060607@windriver.com>
Date: Mon, 11 Nov 2013 20:40:23 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
	<1384038034.3798.46.camel@x121e.pbcl.net>
	<52804662.1090605@windriver.com>
	<1384170804.16718.135.camel@phil-desktop.brightsign>
In-Reply-To: <1384170804.16718.135.camel@phil-desktop.brightsign>
X-Originating-IP: [128.224.162.213]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
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
X-List-Received-Date: Mon, 11 Nov 2013 12:40:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phil,

First of all, thank you for your careful review and explanation.
To conclude, you suggest modifying the init scripts and moving commands 
around if needed, right?

And please see comments inline.

On 11/11/2013 07:53 PM, Phil Blundell wrote:
> On Mon, 2013-11-11 at 10:52 +0800, ChenQi wrote:
>> On 11/10/2013 07:00 AM, Phil Blundell wrote:
>>> 1. initscript doesn't obviously rdepend on busybox so it's not obvious
>>> that the latter will always be available;
>> Yes. Initscript doesn't rdepend on busybox. But note it also doesn't
>> rdepend on sed or awk or grep.
>> So I think it's reasonable to assume the presence of busybox.
> I think one could argue that it's also a bug that it doesn't rdepend on
> the three things you mentioned (and indeed on /bin/sh itself, for
> non-rpm systems).  However, the usage of grep and sed in particular, and
> perhaps to a slightly lesser extent awk, is so deeply ingrained into so
> much software that I think it's probably fair to say those utilities
> will almost always be present.
>
> By contrast, it is perfectly feasible to build a system which doesn't
> use busybox (by using the full GNU implementations of everything that
> busybox provides) and indeed I think there might even be a task package
> in oe-core which does exactly that.  So it seems entirely possible
> that /bin/busybox might not be installed unless you have a dependency on
> it.
>

Agree. I'm gonna drop this patch and try to come up with another solution :)

>>> 2. it should probably be using ${base_bindir} and ${bindir} rather than
>>> hardcoding absolute paths.
>> In init scripts, we usually "hardcode" things, because these scripts
>> are destined to run on target.
>> In recipes we try not to hardcode things because the recipe may need
>> to extend to "native" or "nativesdk".
> I'm not quite sure I follow the logic here.  Even if the script is
> intended to run on the target it still ought to be respecting the values
> of ${bindir}, ${sysconfdir} and such like.
>
>>> 3. the whole idea of creating a shadow "/usr/bin" underneath what's
>>> meant to be a mountpoint seems rather dubious to me.
>> Agree.
>>
>> The problem here is that the init scripts under /etc/rcS.d/ need to
>> execute commands like awk, dirname, and readlink which are from /usr.
>>
>> As it's not appropriate to move these commands into /bin, basically
>> there are only two options I can see here. One is to modify these
>> scripts to use only commands from /bin or /sbin; the other is to make
>> use of busybox, as busybox is located under /bin as it provides these
>> commands.
>> I chose to the latter one because I thought that solution would have
>> the less impact.
>>
>> What do you think? Do we need to modify the init scripts? Or any other
>> solution?
> I thought that last time this topic came up on the mailing list, the
> eventual conclusion was that Wind River (being more-or-less the only
> people who seemed to feel strongly that supporting / and /usr on
> different partitions was important) were going to come up with some sort
> of overall strategy for solving the whole problem rather than just
> fixing up individual bits in a piecemeal fashion.  I think that strategy
> would need to include a policy for which utilities initscripts can
> legitimately expect to be available before /usr is mounted, and if this
> set is different from what we have today then it would need to include a
> plan for sorting that out.

Basically we don't have any problem if /usr is going to be mounted, 
because the mountall.sh takes place really early.

What I want to achieve here is that we can boot into single user mode 
for recovery or repair if /usr is not available (maybe just because the 
drive's broken).

>
> To answer the particular question at hand it seems that someone would
> need to do some analysis of things like:
>
> - how many scripts actually need those commands
> - how hard would it be to change them to not need them

Only init scripts that have links under /etc/rcS.d/ need to be examined, 
so that wouldn't be a lot of work.
I'm just not sure whether we should make such a restriction of which 
commands could be used and which could not. After all, commands like 
`readlink', `dirname' and `awk' are also very commonly used commands.

> - what would be the impact of moving them into ${base_bindir} (for
> example, would this cause a whole load of libraries to get dragged into
> ${base_libdir} as well?)

If I can easily modify the init scripts to make things work, I don't 
want to move things around.
But I guess statements using awk are hard to be replaced unless I use a 
block of codes ....

> Offhand I don't know the answer to any of those things.
>
>>> 4. this seems like distro policy and not something that really belongs
>>> in oe-core at all.  For systems where ${bindir} and ${base_bindir} are
>>> on the same filesystem (or even are the same directory) this script will
>>> just make bootup slower without achieving anything useful.
>> If /usr and / are on the same file system, this script has no real
>> effect because /usr will always be there. So I think it will not take
>> much time at boot.
> Just spawning a new copy of the shell and reading the script does take a
> finite (and measureable) time.  If you can determine statically at build
> time that the script isn't going to do anything useful then I don't
> think it's appropriate to install it.
>
>> If ${base_bindir} and ${bindir} are the same, that means that there's
>> no /usr. In this case, there should no /usr/xxx entries
>> in /etc/busybox.links, so this script should also function correctly
>> and it will not take much time at boot.
>>
>> (I just configured ${bindir} and ${base_bindir} to be the same and
>> performed a build, it failed. I'm not sure whether it's valid to make
>> such configurations in OE.)
> It is a valid configuration, and this is the way that most of the images
> I build are configured.  It probably is true that there are still some
> number of recipes in oe-core that don't support this properly, but I
> don't want to see that situation get any worse.
>
> p.
>
>
>
>

Could you please share your configuration so that when I make V2 I can 
test the case of ${bindir} and ${base_bindir} being the same.
(Currently I really can't build out an image with such configuration ... )

Best Regards,
Chen Qi

