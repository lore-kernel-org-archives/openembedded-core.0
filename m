Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CD2C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 12:29:06 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.10099.1646310541912504486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=JPKR9Kvi;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 3EDBC5C03ED;
	Thu,  3 Mar 2022 07:29:01 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Thu, 03 Mar 2022 07:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; bh=PZQnltq1ZHL5gCpRb3U6vgS9JjUYsbDJ6EvyH5
	8vU3Y=; b=JPKR9KviXP7ylOphVq6kRvTYEU7lDRd2QsXSptgv83+BqWGY9QT87J
	ZgPJU3Wnw/ljQCS75YKbT3NbVH1ZBmdgRpH+Br595usG4kMBgZpo5eLBJ7nidbTE
	mqM+tZVmjW86Nq5pVBXAioARAf6fuyX1ihQnmvDXWvqGrlEOciOLo6KaHRjsgROS
	kMiy2+9fm/NAE++I7sFo1kV+gIgRzrAQcZdYGQgCzqUz3+1l+MBGVO8Vyg0XMxKG
	/+ERQpOh2Gdt6gh7IZWpPTi98UDorXUXT8iqoLTLVj0XRrr2vi0H0yDsX5XNDpMR
	QLeW0HEiZhWERRcfeglrW/qojDzzsDVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PZQnltq1ZHL5gCpRb
	3U6vgS9JjUYsbDJ6EvyH58vU3Y=; b=Y163ZXzL2aUTlEQep154IeLiFlRoJ0IHh
	IkvSNTV2ScgcjCCsDm/952PfiycuBRGu49ZFp0wl50Z+UXeyEd6LwAU0qjT1NNaj
	mwjVVguPt5Baq+Bs1dri3QTdrQlzHZOYCTfeus4f8xw1eCdxrz+koFBmBwtW82WL
	AQ2vezGgr5IpIE9ceCFziuWeLnryMriH8JzF2KySMlUV0ERHoBkOIBGOR0/xg3qH
	y5ILZZXj4JF/uVr5zY7hh74oZQSgaO9x84U/2HCD9P1lCozCoozOirnE0eOUbbhh
	hXq7wpGVI9et06S74VThnLpggSvFvpjvH8ObVU65RO7CfuITG0eSg==
X-ME-Sender: <xms:jbQgYlMHM3U5_HN4XjluxJSfMe7Gbztst9eaeKoXCCUcpX4u6lTVkw>
    <xme:jbQgYn_MyMFpEBGURZpk3SEtZwCSICsp97DW0nDjpAW4uwefCMkJUtC4eOEPfN_wf
    W0e7fGih2umbCFwVDE>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhveeiieelvdfgteejueegjefgueegieeuhfefhefhteekhfeh
    uedufedtfeduieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgoh
    hlrghnghdrohhrghdpghdrsgihpdhprhhogiihrdhorhhgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrd
    gtohhm
X-ME-Proxy: <xmx:jbQgYkSErYj_xA94FW3E2LwaTvSk-i3vJSa1LlZKZJtpXS9UsPRJCg>
    <xmx:jbQgYhvVSUKaOJfbMIN-iBxChnSGTgMdwdc49lamyXOnpH7ei9CjCg>
    <xmx:jbQgYtfCDaorST7HnOlAq1BwxcbkTTaBKYBxaLjWC_jitxNVF9CX3w>
    <xmx:jbQgYtFIHhRNEYFG8Rkbj1_aUysm1F_sWH-LBKH8nI4VYgO8XFDh9g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ECB253C00CF; Thu,  3 Mar 2022 07:29:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <db160b37-2c62-4601-a47b-8bc8890d96f5@www.fastmail.com>
In-Reply-To: 
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
References: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
 <3986.1646150091898772204@lists.openembedded.org>
 <CADkTA4NKK0OXXnJSrpD7Vg-UQoygUR1ZPXaGOqKtJ9kmyGSukg@mail.gmail.com>
 <9a15b064-6962-4f12-aa41-890f9890d64b@gherzan.com>
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
Date: Thu, 03 Mar 2022 12:28:41 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: lukas.funke@weidmueller.com,
 openembedded <openembedded-core@lists.openembedded.org>,
 zygmunt.krynicki@huawei.com
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 12:29:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162654

On Thu, 3 Mar 2022, at 03:34, Bruce Ashfield wrote:
> On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>>
>> Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>
>> > On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
>> >>
>> >> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
>> >>
>> >> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >>
>> >>
>> >> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>> >>
>> >> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>> >> lists.openembedded.org
>> >> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>> >>
>> >>
>> >> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>> >>
>> >>
>> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >>
>> >> Compile pulls in the go.mod list requiring network. Without this, do
>> >> compile would fail with a similar error to the following:
>> >>
>> >> dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>> >>
>> >> This is something that needs to be carried in your own layers, IMHO it
>> >> isn't appropriate for core.
>> >>
>> >> It isn't about the fetching, it is the entire gap in functionality
>> >> that we are missing if go starts fetching dependencies during compile.
>> >>
>> >> A further thought is that if this is for go.mod issues, there is the
>> >> go-mod.bbclass.
>> >>
>> >> Perhaps enabling it in that class and doing a bbwarn about go fetching
>> >> dependencies would be appropriate ?
>> >>
>> >> Otherwise, someone may not know that this is happening and that a no
>> >> network configuration has no chance of working.
>> >>
>> >> I reckon that is reasonable. I'll personally go down the recipe level to workaround this change but understanding and agreeing with the reasoning behind this change, I want to invest a bit into trying to find a proper solution in the core. Bruce, I know you invested a fair amount of time into this already. Would you be willing to sync up and see how we can work together in tackling this?
>> >>
>> >> Definitely, more ideas are good. In fact, I think there are probably
>> >> several approaches that can co-exist, depending on what a
>> >> recipe/developer needs.
>> >>
>> >> I'm in the Eastern time zone here, and will try and grab folks on IRC
>> >> to have a level set
>> >>
>> >> Bruce
>> >>
>> >> Added Zyga to CC as he is also interested in this as part of his go development activities.
>> >>
>> >> Thanks,
>> >> Andrei
>> >>
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >>
>> >> The problem in allowing downloads during compile (e.g. by go) is, that it leads to non-reproducable builds. I'm currently facing the same issue and would like to have a reproducable go *offline* build.
>> >> I would like to propose two ideas to workaround the go-compile fetching issue:
>> >>
>> >> First:
>> >> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. by writing a seperate go fetcher or a wget-fetcher) and unpack the dependencies into go projects 'vendor' folder. This forces go to compile offline. However, one have to generate the 'modules.txt' file in the vendor folder 'manually' during unpack. This is error prone, as there is no official documentation how this format should look like. Anyway, I've tried this approach and it works for me.
>> >>
>> >> Second:
>> >> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. by writing a seperate go fetcher) and unpack the dependencies into a local (workdir) go-path. This seemed a good solution for me as the go-path is well defined. But for some reason 'go'  fetches the zip-files during compile into it's download-cache AGAIN, even if the source is already unpacked in the go-path. I'll assume this is required to verify the source files integrity?! With this approach one have to adapt 'go' to suppress this download behaviour.
>> >>
>> >
>> > I've been doing offline builds using a constructed vendor/ directory
>> > and generated modules.txt.
>> >
>> > The only difference between what I have working and what you are
>> > suggesting (type 1), is that I've gone directly to the sources and
>> > constructed the vendor directory using the OE git fetcher. That allows
>> > all functionality to continue to work that is part of OEcore, and the
>> > build to continue.  Switching out the git fetches for tarballs would
>> > be possible, I just wasn't sure how to use the proxied modules (and I
>> > wanted the history for debug).
>> >
>> > I've never had any issues with the modules.txt, as I generate it at
>> > the same time as the git fetch lines for the SRC_URI. I've also not
>> > been using information from the go.mod directly from go.proxy.org, it
>> > is information I've generated from a clone of the project and dumped
>> > via go mod. There's likely improvements I can do there, but with what
>> > I'm doing, I'm going directly to the source of the projects and doing
>> > clones, which keeps everything clear of the go infrastructure.
>> >
>> > I have a utility that I'm still cleaning up that generates the SRC_URI
>> > lines, as well as the modules.txt, when I resolve a few nagging
>> > issues, I'll make the WIP scripts available.
>> >
>> > Other projects (BSD, etc), have been doing different sorts of
>> > constructed vendor directories, but they are similar in approach.
>> >
>> > For the short term (i.e. the upcoming release), that is pretty much
>> > all we can do. There isn't enough time to implement a new go fetcher
>> > backend for bitbake.
>> >
>> > In the end, how we fetch and place the dependencies is a transport, so
>> > whether or not we fetch them ourselves, or let go do it, that part is
>> > largely the same.
>> >
>> > For now (short term), I favour vendor/, as it is workable, but not
>> > perfect. It isn't exactly efficient or pretty, but at least it seems
>> > to produce correct output, and allows all of the project capabilities
>> > to work. And of course, the approach will continue to work regardless
>> > of development on other go.mod elements.
>>
>> After reflecting on this for a while I reckon this is the fastest way forward while addressing the reproducibility issue. I'm wondering what we can do in terms of compliance? Maybe we can turn the script you were talking about into a recipe generator that also deals with this by querying the licenses of all the dependencies (direct and indirect).
>
> That was my rough plan, generate a recipe or have it generate  an
> include that recipes pull in, there are some repeating patterns go
> modules, so there is some re-use to be found.
>
> I roughed out a process for it to work with k3s, and have a working
> updated recipe that creates a vendor/ directory and doesn't touch the
> network during the actual build.
>
> There's definitely efficiencies to be found, as the first fetch is
> quite long, and there's some i/o required as the fetches secondarily
> shuffled into place that go expects in a vendor directory.
>
> I'm trying to complete a second recipe with the generated SRC_URI
> entries now (nerdctl) and I ran into an issue with the script where
> some repeated fetches were breaking the vendor directory creation. I
> need to spend time with that on Thursday, but after I sort that out,
> I can remove the curse words from the script and do a bit of cleanup.
> There's plenty of bugs, and alternate ways things can operate (maybe
> some of the packaged go modules versus git, etc, etc), but since those
> choices don't required bitbake/fetcher or other core changes, we have
> a bit of time to iterate on a workable approach.

That sounds good. Keep me in the loop and once you have a patch set pushed, I try it out and squeeze some of the bugs you'll leave in intentionally :)

Cheers,
Andrei

