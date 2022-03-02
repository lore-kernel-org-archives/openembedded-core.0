Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F381C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 21:57:18 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.3768.1646258237239709300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 13:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=R8bBOA/T;
 spf=pass (domain: gherzan.com, ip: 66.111.4.28, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 53B8A5C01AD;
	Wed,  2 Mar 2022 16:57:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 02 Mar 2022 16:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; bh=WC/9g+kUWfqXtE
	vhN+5fuDL3dD0DR5klbExW3553ouo=; b=R8bBOA/TFznCaxT06MRMM4mrnebOyQ
	Hgv17aDR3JXuIJ2qhMS4WDPPGvKHkAzY665AKLWNPt258DjVgQogeima9T7wKh1M
	VbpJVa9egjTBu7EXQQlAAdaJcAr57lpiKp6RPAm6fppsU1woyhanrmCTDjbk29Kr
	o/pr/IbqsWsmfP0Ilkefja2q+AZ0PP/YchXi7eKFb/atrgwjR3r1lEQ0oLbxVWr6
	jaIm0FR4r1rbDF6eXtn+qqE4ZTVw9Ie08fqbQBGUNWJ+hUyMN0AHCJizg+4UNF1D
	9yF5AqLPVpssxClOZOzcW+k1X/O9PY5h8I6i0idfRc33MLYi5EtmYIZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=WC/9g+kUWfqXtEvhN+5fuDL3dD0DR5klbExW3553o
	uo=; b=F5hBqItNwE5rk9/oeGcRPhz7Drc/oZ/Lx6PXJjvofW58luGC7E/RGJI8f
	ESaEPKQuv460O4DfTpNLuPCcAWKCH6iAAPff/8lXJ/WWo5a5weMYgGOMYwivscS7
	4vSqvwPMhSLy1olLoTITYLqNgjZNKYtw58s+uGiYUzsMtVmAfdkH2ZLwggJRm8Jc
	mCw9V0xap8BoBgNE7d/ihQPJrIfnSZL+Wh61jzI1U6++KHrBgctOQtOS+F6Y2qdB
	Ob5Hpy3dTQkV7/NcgSV1SYKNCCakh2J5fnyBBwYdrseCmG87PkLUxbzkrniTA9Vl
	P+LpybtLwuNjT8foG+rMLI+fYY/bw==
X-ME-Sender: <xms:OugfYv5flzPLjdQFwa6dpSEztjOab1aX1VzHlIkGy3_UfMVCKBn8vg>
    <xme:OugfYk4v0AHDuH9ouASyUt5zio4GjcHDp9yV8QWKT120qOoN5qyH1duMqL097RCts
    EpQL3BsgidseGBQw6Y>
X-ME-Received: 
 <xmr:OugfYmeQbAfFtT_RE-ME4gt-UTNCbBDi5ZDCLh6EhEedzofH9GzZ8qfmxW08wQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtgedgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvkfgjfhfugggtgfesthhqredttddtjeenucfhrhhomheptehnughr
    vghiucfihhgvrhiirghnuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenucggtf
    frrghtthgvrhhnpeehjeefvdekfefhfeefkeffhefhhfehudehffejjeeugedutdekhefh
    tdfgueetueenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhgohhlrg
    hnghdrohhrghdpghdrsgihpdhprhhogiihrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrdgtoh
    hm
X-ME-Proxy: <xmx:O-gfYgJyzWiiyZ5VrkoPwitq3uFq26znoefhNt6M0ZqxC_37alvAOQ>
    <xmx:O-gfYjIbA0a-WCE5xQDkm-EKWtZsVtRg5T1oaP8KIuC4VpkDxgmdGw>
    <xmx:O-gfYpwcwIiACkTpUEtVQbV6jabPZ9fIBJ1_ICwlqGc4EnDLi2uhTw>
    <xmx:O-gfYpj76-9md86E6M5uJCMPkYbiiyw88-gUcIkVbyvz2qKFIdLJQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Mar 2022 16:57:14 -0500 (EST)
Date: Wed, 2 Mar 2022 21:57:13 +0000 (UTC)
From: Andrei Gherzan <andrei@gherzan.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: lukas.funke@weidmueller.com,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Message-ID: <9a15b064-6962-4f12-aa41-890f9890d64b@gherzan.com>
In-Reply-To: 
 <CADkTA4NKK0OXXnJSrpD7Vg-UQoygUR1ZPXaGOqKtJ9kmyGSukg@mail.gmail.com>
References: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
 <3986.1646150091898772204@lists.openembedded.org>
 <CADkTA4NKK0OXXnJSrpD7Vg-UQoygUR1ZPXaGOqKtJ9kmyGSukg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <9a15b064-6962-4f12-aa41-890f9890d64b@gherzan.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 21:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162626


Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:

> On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
>>
>> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
>>
>> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote=
:
>>
>>
>> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>>
>> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>> lists.openembedded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>>
>> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrot=
e:
>>
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> Compile pulls in the go.mod list requiring network. Without this, do
>> compile would fail with a similar error to the following:
>>
>> dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>>
>> This is something that needs to be carried in your own layers, IMHO it
>> isn't appropriate for core.
>>
>> It isn't about the fetching, it is the entire gap in functionality
>> that we are missing if go starts fetching dependencies during compile.
>>
>> A further thought is that if this is for go.mod issues, there is the
>> go-mod.bbclass.
>>
>> Perhaps enabling it in that class and doing a bbwarn about go fetching
>> dependencies would be appropriate ?
>>
>> Otherwise, someone may not know that this is happening and that a no
>> network configuration has no chance of working.
>>
>> I reckon that is reasonable. I'll personally go down the recipe level to=
 workaround this change but understanding and agreeing with the reasoning b=
ehind this change, I want to invest a bit into trying to find a proper solu=
tion in the core. Bruce, I know you invested a fair amount of time into thi=
s already. Would you be willing to sync up and see how we can work together=
 in tackling this?
>>
>> Definitely, more ideas are good. In fact, I think there are probably
>> several approaches that can co-exist, depending on what a
>> recipe/developer needs.
>>
>> I'm in the Eastern time zone here, and will try and grab folks on IRC
>> to have a level set
>>
>> Bruce
>>
>> Added Zyga to CC as he is also interested in this as part of his go deve=
lopment activities.
>>
>> Thanks,
>> Andrei
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>> The problem in allowing downloads during compile (e.g. by go) is, that i=
t leads to non-reproducable builds. I'm currently facing the same issue and=
 would like to have a reproducable go *offline* build.
>> I would like to propose two ideas to workaround the go-compile fetching =
issue:
>>
>> First:
>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. =
by writing a seperate go fetcher or a wget-fetcher) and unpack the dependen=
cies into go projects 'vendor' folder. This forces go to compile offline. H=
owever, one have to generate the 'modules.txt' file in the vendor folder 'm=
anually' during unpack. This is error prone, as there is no official docume=
ntation how this format should look like. Anyway, I've tried this approach =
and it works for me.
>>
>> Second:
>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. =
by writing a seperate go fetcher) and unpack the dependencies into a local =
(workdir) go-path. This seemed a good solution for me as the go-path is wel=
l defined. But for some reason 'go'=C2=A0 fetches the zip-files during comp=
ile into it's download-cache AGAIN, even if the source is already unpacked =
in the go-path. I'll assume this is required to verify the source files int=
egrity?! With this approach one have to adapt 'go' to suppress this downloa=
d behaviour.
>>
>
> I've been doing offline builds using a constructed vendor/ directory
> and generated modules.txt.
>
> The only difference between what I have working and what you are
> suggesting (type 1), is that I've gone directly to the sources and
> constructed the vendor directory using the OE git fetcher. That allows
> all functionality to continue to work that is part of OEcore, and the
> build to continue.=C2=A0 Switching out the git fetches for tarballs would
> be possible, I just wasn't sure how to use the proxied modules (and I
> wanted the history for debug).
>
> I've never had any issues with the modules.txt, as I generate it at
> the same time as the git fetch lines for the SRC_URI. I've also not
> been using information from the go.mod directly from go.proxy.org, it
> is information I've generated from a clone of the project and dumped
> via go mod. There's likely improvements I can do there, but with what
> I'm doing, I'm going directly to the source of the projects and doing
> clones, which keeps everything clear of the go infrastructure.
>
> I have a utility that I'm still cleaning up that generates the SRC_URI
> lines, as well as the modules.txt, when I resolve a few nagging
> issues, I'll make the WIP scripts available.
>
> Other projects (BSD, etc), have been doing different sorts of
> constructed vendor directories, but they are similar in approach.
>
> For the short term (i.e. the upcoming release), that is pretty much
> all we can do. There isn't enough time to implement a new go fetcher
> backend for bitbake.
>
> In the end, how we fetch and place the dependencies is a transport, so
> whether or not we fetch them ourselves, or let go do it, that part is
> largely the same.
>
> For now (short term), I favour vendor/, as it is workable, but not
> perfect. It isn't exactly efficient or pretty, but at least it seems
> to produce correct output, and allows all of the project capabilities
> to work. And of course, the approach will continue to work regardless
> of development on other go.mod elements.

After reflecting on this for a while I reckon this is the fastest way forwa=
rd while addressing the reproducibility issue. I'm wondering what we can do=
 in terms of compliance? Maybe we can turn the script you were talking abou=
t into a recipe generator that also deals with this by querying the license=
s of all the dependencies (direct and indirect).

That being said, how can I help? It seems that there is an existing WIP sta=
te on this. Can I take something from it? Maybe help with cleaning up the s=
cript?
--
Andrei Gherzan
gpg: rsa4096/D4D94F67AD0E9640

