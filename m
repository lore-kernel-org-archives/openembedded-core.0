Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27A4C605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Nov 2016 20:17:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTP id uACKHQx9009155;
	Sat, 12 Nov 2016 12:17:26 -0800 (PST)
Received: from soho-mhatle-m.local (128.224.60.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 12 Nov 2016 12:17:26 -0800
To: <openembedded-core@lists.openembedded.org>, "Robert P. J. Day"
	<rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <ca53cb96-5c1e-35f1-55f3-8f61897de18f@windriver.com>
Date: Sat, 12 Nov 2016 15:17:25 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1611121436420.20479@localhost.localdomain>
Subject: Re: WRL error: "Can't locate Config_heavy-target.pl in @INC" -- OE versus WRL
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
X-List-Received-Date: Sat, 12 Nov 2016 20:17:34 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/12/16 2:45 PM, Robert P. J. Day wrote:
> 
>   (note: this is actually an error i'm getting under wind river linux
> 8, i'm just curious as to why OE works just fine.)
> 
>   as mentioned, when trying to build a trivial hand-rolled perl recipe
> under wind river linux 8, i'm getting:
> 
> | Can't locate Config_heavy-target.pl in @INC (@INC contains: ... long
> path snipped ...) at
> .../tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Config.pm
> line 88.

My suspicion is that you are not using the buildtools-tarball with your OE
build, but Wind River Linux automatically uses this in an attempt to avoid host
incompatibilities with all of the random hosts our customers use.

To use the OE version of buildtools-tarball, you will have to build it, extract
it and then source the environment file.

>   but building precisely the same recipe under regular OE (actually,
> poky) works just fine. i did some searching, and found this:
> 
> https://patchwork.openembedded.org/patch/111047/
> 
> but i have no idea what it means. i also notice that the standard
> bitbake.conf (which i haven't looked at in a while), now contains a
> few more ASSUME_PROVIDED entries, including:
> 
>     hostperl-runtime-native \
>     hostpython-runtime-native \

f4dade8e meta/conf/bitbake.conf         (Ed Bartosh                2016-01-07
13:39:39 +0200 179)     hostperl-runtime-native \
8a474057 meta/conf/bitbake.conf         (Ed Bartosh                2016-01-13
10:03:04 +0200 180)     hostpython-runtime-native \

These are newer then Wind River Linux 8, which is based on Yocto Project 2.0 /
Jethro which was released around Nov 2015.

> while the WRL version contains:
> 
>     perl-native-runtime \
>     python-native-runtime \

You you look at Jethro you will see:

34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
15:04:06 +0000 174)     perl-native-runtime \
34927dfa meta/conf/bitbake.conf         (Richard Purdie          2007-12-18
15:04:06 +0000 175)     python-native-runtime \

So you are attempting to compare apples to oranges (master/morty/krogoth against
jethro.)

--Mark

> i have no idea what to make of this. thoughts?
> 
> rday
> 


