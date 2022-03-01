Return-Path: <lukas.funke@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC1BC433F5
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 15:54:53 +0000 (UTC)
Subject: Re: [PATCH 1/1] go.bbclass: Allow network in do_compile
To: openembedded-core@lists.openembedded.org
From: lukas.funke@weidmueller.com
X-Originating-Location: Sonneberg, Thuringia, DE (87.129.248.106)
X-Originating-Platform: Windows Chrome 98
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 07:54:51 -0800
References: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
Message-ID: <3986.1646150091898772204@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RTcujccYRzaKRXvpPgD5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 15:54:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162562

--RTcujccYRzaKRXvpPgD5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:

>=20
> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>=20
>>=20
>> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>>=20
>>> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>=20
>>>>=20
>>>> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wr=
ote:
>>>>=20
>>>>=20
>>>>>=20
>>>>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>>>>=20
>>>>> Compile pulls in the go.mod list requiring network. Without this, do
>>>>> compile would fail with a similar error to the following:
>>>>>=20
>>>>> dial tcp: lookup proxy.golang.org: Temporary failure in name resoluti=
on
>>>>=20
>>>> This is something that needs to be carried in your own layers, IMHO it
>>>> isn't appropriate for core.
>>>>=20
>>>> It isn't about the fetching, it is the entire gap in functionality
>>>> that we are missing if go starts fetching dependencies during compile.
>>>=20
>>> A further thought is that if this is for go.mod issues, there is the
>>> go-mod.bbclass.
>>>=20
>>> Perhaps enabling it in that class and doing a bbwarn about go fetching
>>> dependencies would be appropriate ?
>>>=20
>>> Otherwise, someone may not know that this is happening and that a no
>>> network configuration has no chance of working.
>>=20
>> I reckon that is reasonable. I'll personally go down the recipe level to
>> workaround this change but understanding and agreeing with the reasoning
>> behind this change, I want to invest a bit into trying to find a proper
>> solution in the core. Bruce, I know you invested a fair amount of time
>> into this already. Would you be willing to sync up and see how we can wo=
rk
>> together in tackling this?
>=20
> Definitely, more ideas are good. In fact, I think there are probably
> several approaches that can co-exist, depending on what a
> recipe/developer needs.
>=20
> I'm in the Eastern time zone here, and will try and grab folks on IRC
> to have a level set
>=20
> Bruce
>=20
>=20
>> Added Zyga to CC as he is also interested in this as part of his go
>> development activities.
>>=20
>> Thanks,
>> Andrei
>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

The problem in allowing downloads during compile (e.g. by go) is, that it l=
eads to non-reproducable builds. I'm currently facing the same issue and wo=
uld like to have a reproducable go *offline* build.
I would like to propose two ideas to workaround the go-compile fetching iss=
ue:

First:
- Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. by =
writing a seperate go fetcher or a wget-fetcher) and unpack the dependencie=
s into go projects 'vendor' folder. This forces go to compile offline. Howe=
ver, one have to generate the 'modules.txt' file in the vendor folder 'manu=
ally' during unpack. This is error prone, as there is no official documenta=
tion how this format should look like. Anyway, I've tried this approach and=
 it works for me.

Second:
- Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. by =
writing a seperate go fetcher) and unpack the dependencies into a local (wo=
rkdir) go-path. This seemed a good solution for me as the go-path is well d=
efined. But for some reason 'go'=C2=A0 fetches the zip-files during compile=
 into it's download-cache AGAIN, even if the source is already unpacked in =
the go-path. I'll assume this is required to verify the source files integr=
ity?! With this approach one have to adapt 'go' to suppress this download b=
ehaviour.

Please let me know your opinion on these two approaches.

--RTcujccYRzaKRXvpPgD5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:<br />
<blockquote>On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan &lt;andrei@gherza=
n.com&gt; wrote:<br />
<blockquote><br />On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:<br />
<blockquote>On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via<br />lists.o=
penembedded.org<br />&lt;bruce.ashfield=3Dgmail.com@lists.openembedded.org&=
gt; wrote:<br />
<blockquote><br />On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan &lt;andrei=
@gherzan.com&gt; wrote:<br />
<blockquote><br />From: Andrei Gherzan &lt;andrei.gherzan@huawei.com&gt;<br=
 /><br />Compile pulls in the go.mod list requiring network. Without this, =
do<br />compile would fail with a similar error to the following:<br /><br =
/>dial tcp: lookup proxy.golang.org: Temporary failure in name resolution</=
blockquote>
This is something that needs to be carried in your own layers, IMHO it<br /=
>isn't appropriate for core.<br /><br />It isn't about the fetching, it is =
the entire gap in functionality<br />that we are missing if go starts fetch=
ing dependencies during compile.</blockquote>
A further thought is that if this is for go.mod issues, there is the<br />g=
o-mod.bbclass.<br /><br />Perhaps enabling it in that class and doing a bbw=
arn about go fetching<br />dependencies would be appropriate ?<br /><br />O=
therwise, someone may not know that this is happening and that a no<br />ne=
twork configuration has no chance of working.</blockquote>
I reckon that is reasonable. I'll personally go down the recipe level to wo=
rkaround this change but understanding and agreeing with the reasoning behi=
nd this change, I want to invest a bit into trying to find a proper solutio=
n in the core. Bruce, I know you invested a fair amount of time into this a=
lready. Would you be willing to sync up and see how we can work together in=
 tackling this?</blockquote>
Definitely, more ideas are good. In fact, I think there are probably<br />s=
everal approaches that can co-exist, depending on what a<br />recipe/develo=
per needs.<br /><br />I'm in the Eastern time zone here, and will try and g=
rab folks on IRC<br />to have a level set<br /><br />Bruce<br /><br />
<blockquote>Added Zyga to CC as he is also interested in this as part of hi=
s go development activities.<br /><br />Thanks,<br />Andrei</blockquote>
<br /><br />-- <br />- Thou shalt not follow the NULL pointer, for chaos an=
d madness await<br />thee at its end<br />- "Use the force Harry" - Gandalf=
, Star Trek II</blockquote>
<div>The problem in allowing downloads during compile (e.g. by go) is, that=
 it leads to non-reproducable builds. I'm currently facing the same issue a=
nd would like to have a reproducable go *offline* build.</div>
<div>I would like to propose two ideas to workaround the go-compile fetchin=
g issue:</div>
<div>&nbsp;</div>
<div>First:</div>
<div>- Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by writing a seperate go fetcher or a wget-fetcher) and unpack the depend=
encies into go projects 'vendor' folder. This forces go to compile offline.=
 However, one have to generate the 'modules.txt' file in the vendor folder =
'manually' during unpack. This is error prone, as there is no official docu=
mentation how this format should look like. Anyway, I've tried this approac=
h and it works for me.</div>
<div>&nbsp;</div>
<div>Second:</div>
<div>- Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by writing a seperate go fetcher) and unpack the dependencies into a loca=
l (workdir) go-path. This seemed a good solution for me as the go-path is w=
ell defined. But for some reason 'go'&nbsp; fetches the zip-files during co=
mpile into it's download-cache AGAIN, even if the source is already unpacke=
d in the go-path. I'll assume this is required to verify the source files i=
ntegrity?! With this approach one have to adapt 'go' to suppress this downl=
oad behaviour.</div>
<div>&nbsp;</div>
<div>Please let me know your opinion on these two approaches.</div>

--RTcujccYRzaKRXvpPgD5--

