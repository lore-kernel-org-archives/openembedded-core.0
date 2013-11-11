Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B55A6D757
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 16:13:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rABGD7TQ008270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 08:13:07 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 08:13:07 -0800
Message-ID: <52810212.3050302@windriver.com>
Date: Mon, 11 Nov 2013 10:13:06 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383974819.git.Qi.Chen@windriver.com>	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>	<1384038034.3798.46.camel@x121e.pbcl.net>	<52804662.1090605@windriver.com>
	<1384170804.16718.135.camel@phil-desktop.brightsign>
In-Reply-To: <1384170804.16718.135.camel@phil-desktop.brightsign>
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
X-List-Received-Date: Mon, 11 Nov 2013 16:13:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/13, 5:53 AM, Phil Blundell wrote:
> On Mon, 2013-11-11 at 10:52 +0800, ChenQi wrote:
>> On 11/10/2013 07:00 AM, Phil Blundell wrote:

...

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

There is a bug open for the Yocto Project 1.6 to explicitly do this.  Come up 
with an overall strategy for these kinds of things, as well as a test plan to 
verify that whatever we end up doing works properly long term.

As you said, busybox is not required on a system -- just something that has a 
reasonable set of software packages.  Also a lot of this stuff is simply limited 
to 'early boot'.  At some point we do need to define 'early boot'.  (Generally I 
define it as until /usr would normally be mounted.)

And unfortunately you will see patches in piecemeal at this point.  Until such a 
strategy is generated, everything is being done reactively.  We see a QA 
error/warning and someone is assigned to solve it.  Yocto Project Compliance 
(and our own internal) guidelines then indicate since we've patched something it 
has to go out to the community.

> To answer the particular question at hand it seems that someone would
> need to do some analysis of things like:
>
> - how many scripts actually need those commands
> - how hard would it be to change them to not need them
> - what would be the impact of moving them into ${base_bindir} (for
> example, would this cause a whole load of libraries to get dragged into
> ${base_libdir} as well?)

That was my thought exactly.  Lets look at moving things -or- stop using them. 
Whichever is more reasonable.

> Offhand I don't know the answer to any of those things.
>
>>> 4. this seems like distro policy and not something that really belongs
>>> in oe-core at all.  For systems where ${bindir} and ${base_bindir} are
>>> on the same filesystem (or even are the same directory) this script will
>>> just make bootup slower without achieving anything useful.
>
>> If /usr and / are on the same file system, this script has no real
>> effect because /usr will always be there. So I think it will not take
>> much time at boot.
>
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
>
> It is a valid configuration, and this is the way that most of the images
> I build are configured.  It probably is true that there are still some
> number of recipes in oe-core that don't support this properly, but I
> don't want to see that situation get any worse.

And yes, all scripts need to (at build time) bind to the bindir and base_bindir 
of that distribution.  Hardcoding those values into the scripts before build 
time is wrong.

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


