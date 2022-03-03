Return-Path: <lukas.funke@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E18C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 15:13:18 +0000 (UTC)
Subject: Re: [PATCH 1/1] go.bbclass: Allow network in do_compile
To: openembedded-core@lists.openembedded.org
From: lukas.funke@weidmueller.com
X-Originating-Location: Sonneberg, Thuringia, DE (87.129.248.106)
X-Originating-Platform: Windows Chrome 98
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 07:13:17 -0800
References: 
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4Ph0hfZTGBj0cTPLCSUUYZLX-RO1dcvjpJi1uuzGDpkGA@mail.gmail.com>
Message-ID: <24532.1646320397183558195@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oQnfHKNt6y7shanEUR5a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 15:13:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162658

--oQnfHKNt6y7shanEUR5a
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2022 at 04:34 AM, Bruce Ashfield wrote:

>=20
> On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan <andrei@gherzan.com> wrote:
>=20
>>=20
>> Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>=20
>>=20
>>> On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
>>>=20
>>>> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
>>>>=20
>>>> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wro=
te:
>>>>=20
>>>>=20
>>>> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>>>>=20
>>>> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>>>> lists.openembedded.org
>>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>>>=20
>>>>=20
>>>> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wr=
ote:
>>>>=20
>>>>=20
>>>>=20
>>>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>>>=20
>>>> Compile pulls in the go.mod list requiring network. Without this, do
>>>> compile would fail with a similar error to the following:
>>>>=20
>>>> dial tcp: lookup proxy.golang.org: Temporary failure in name resolutio=
n
>>>>=20
>>>> This is something that needs to be carried in your own layers, IMHO it
>>>> isn't appropriate for core.
>>>>=20
>>>> It isn't about the fetching, it is the entire gap in functionality
>>>> that we are missing if go starts fetching dependencies during compile.
>>>>=20
>>>> A further thought is that if this is for go.mod issues, there is the
>>>> go-mod.bbclass.
>>>>=20
>>>> Perhaps enabling it in that class and doing a bbwarn about go fetching
>>>> dependencies would be appropriate ?
>>>>=20
>>>> Otherwise, someone may not know that this is happening and that a no
>>>> network configuration has no chance of working.
>>>>=20
>>>> I reckon that is reasonable. I'll personally go down the recipe level =
to
>>>> workaround this change but understanding and agreeing with the reasoni=
ng
>>>> behind this change, I want to invest a bit into trying to find a prope=
r
>>>> solution in the core. Bruce, I know you invested a fair amount of time
>>>> into this already. Would you be willing to sync up and see how we can =
work
>>>> together in tackling this?
>>>>=20
>>>> Definitely, more ideas are good. In fact, I think there are probably
>>>> several approaches that can co-exist, depending on what a
>>>> recipe/developer needs.
>>>>=20
>>>> I'm in the Eastern time zone here, and will try and grab folks on IRC
>>>> to have a level set
>>>>=20
>>>> Bruce
>>>>=20
>>>> Added Zyga to CC as he is also interested in this as part of his go
>>>> development activities.
>>>>=20
>>>> Thanks,
>>>> Andrei
>>>>=20
>>>>=20
>>>>=20
>>>> --
>>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>>> thee at its end
>>>> - "Use the force Harry" - Gandalf, Star Trek II
>>>>=20
>>>> The problem in allowing downloads during compile (e.g. by go) is, that=
 it
>>>> leads to non-reproducable builds. I'm currently facing the same issue =
and
>>>> would like to have a reproducable go *offline* build.
>>>> I would like to propose two ideas to workaround the go-compile fetchin=
g
>>>> issue:
>>>>=20
>>>> First:
>>>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by
>>>> writing a seperate go fetcher or a wget-fetcher) and unpack the
>>>> dependencies into go projects 'vendor' folder. This forces go to compi=
le
>>>> offline. However, one have to generate the 'modules.txt' file in the
>>>> vendor folder 'manually' during unpack. This is error prone, as there =
is
>>>> no official documentation how this format should look like. Anyway, I'=
ve
>>>> tried this approach and it works for me.
>>>>=20
>>>> Second:
>>>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g=
. by
>>>> writing a seperate go fetcher) and unpack the dependencies into a loca=
l
>>>> (workdir) go-path. This seemed a good solution for me as the go-path i=
s
>>>> well defined. But for some reason 'go' fetches the zip-files during
>>>> compile into it's download-cache AGAIN, even if the source is already
>>>> unpacked in the go-path. I'll assume this is required to verify the so=
urce
>>>> files integrity?! With this approach one have to adapt 'go' to suppres=
s
>>>> this download behaviour.
>>>=20
>>> I've been doing offline builds using a constructed vendor/ directory
>>> and generated modules.txt.
>>>=20
>>> The only difference between what I have working and what you are
>>> suggesting (type 1), is that I've gone directly to the sources and
>>> constructed the vendor directory using the OE git fetcher. That allows
>>> all functionality to continue to work that is part of OEcore, and the
>>> build to continue. Switching out the git fetches for tarballs would
>>> be possible, I just wasn't sure how to use the proxied modules (and I
>>> wanted the history for debug).
>>>=20
>>> I've never had any issues with the modules.txt, as I generate it at
>>> the same time as the git fetch lines for the SRC_URI. I've also not
>>> been using information from the go.mod directly from go.proxy.org, it
>>> is information I've generated from a clone of the project and dumped
>>> via go mod. There's likely improvements I can do there, but with what
>>> I'm doing, I'm going directly to the source of the projects and doing
>>> clones, which keeps everything clear of the go infrastructure.
>>>=20
>>> I have a utility that I'm still cleaning up that generates the SRC_URI
>>> lines, as well as the modules.txt, when I resolve a few nagging
>>> issues, I'll make the WIP scripts available.
>>>=20
>>> Other projects (BSD, etc), have been doing different sorts of
>>> constructed vendor directories, but they are similar in approach.
>>>=20
>>> For the short term (i.e. the upcoming release), that is pretty much
>>> all we can do. There isn't enough time to implement a new go fetcher
>>> backend for bitbake.
>>>=20
>>> In the end, how we fetch and place the dependencies is a transport, so
>>> whether or not we fetch them ourselves, or let go do it, that part is
>>> largely the same.
>>>=20
>>> For now (short term), I favour vendor/, as it is workable, but not
>>> perfect. It isn't exactly efficient or pretty, but at least it seems
>>> to produce correct output, and allows all of the project capabilities
>>> to work. And of course, the approach will continue to work regardless
>>> of development on other go.mod elements.
>>=20
>> After reflecting on this for a while I reckon this is the fastest way
>> forward while addressing the reproducibility issue. I'm wondering what w=
e
>> can do in terms of compliance? Maybe we can turn the script you were
>> talking about into a recipe generator that also deals with this by
>> querying the licenses of all the dependencies (direct and indirect).
>=20
> That was my rough plan, generate a recipe or have it generate an
> include that recipes pull in, there are some repeating patterns go
> modules, so there is some re-use to be found.
>=20
> I roughed out a process for it to work with k3s, and have a working
> updated recipe that creates a vendor/ directory and doesn't touch the
> network during the actual build.
>=20
> There's definitely efficiencies to be found, as the first fetch is
> quite long, and there's some i/o required as the fetches secondarily
> shuffled into place that go expects in a vendor directory.
>=20
> I'm trying to complete a second recipe with the generated SRC_URI
> entries now (nerdctl) and I ran into an issue with the script where
> some repeated fetches were breaking the vendor directory creation. I
> need to spend time with that on Thursday, but after I sort that out,
> I can remove the curse words from the script and do a bit of cleanup.
> There's plenty of bugs, and alternate ways things can operate (maybe
> some of the packaged go modules versus git, etc, etc), but since those
> choices don't required bitbake/fetcher or other core changes, we have
> a bit of time to iterate on a workable approach.
>=20
> Bruce

Bruce, I'm looking forward to review your approach. My biggest concern in f=
etching the imports from source via git is, that an 'import' my not necessa=
rily relate to a git repository. 'go' supports multiple backends (e.g. hg, =
svn, etc.). That said, an import-path cannot be transformed to a git SRC_UR=
I in a 1:1 manner. That's why I ended up downloading the modules from golan=
g-proxy.

Lukas

>=20
>=20
>=20
>> That being said, how can I help? It seems that there is an existing WIP
>> state on this. Can I take something from it? Maybe help with cleaning up
>> the script?
>> --
>> Andrei Gherzan
>> gpg: rsa4096/D4D94F67AD0E9640
>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--oQnfHKNt6y7shanEUR5a
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2022 at 04:34 AM, Bruce Ashfield wrote:<br />
<blockquote>On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan &lt;andrei@gherza=
n.com&gt; wrote:<br />
<blockquote><br />Mar 1, 2022 20:15:52 Bruce Ashfield &lt;bruce.ashfield@gm=
ail.com&gt;:<br /><br />
<blockquote>On Tue, Mar 1, 2022 at 10:54 AM &lt;lukas.funke@weidmueller.com=
&gt; wrote:<br />
<blockquote>On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:<br /><br=
 />On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan &lt;andrei@gherzan.com&gt;=
 wrote:<br /><br /><br />On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote=
:<br /><br />On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via<br />lists.=
openembedded.org<br />&lt;bruce.ashfield=3Dgmail.com@lists.openembedded.org=
&gt; wrote:<br /><br /><br />On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan=
 &lt;andrei@gherzan.com&gt; wrote:<br /><br /><br />From: Andrei Gherzan &l=
t;andrei.gherzan@huawei.com&gt;<br /><br />Compile pulls in the go.mod list=
 requiring network. Without this, do<br />compile would fail with a similar=
 error to the following:<br /><br />dial tcp: lookup proxy.golang.org: Temp=
orary failure in name resolution<br /><br />This is something that needs to=
 be carried in your own layers, IMHO it<br />isn't appropriate for core.<br=
 /><br />It isn't about the fetching, it is the entire gap in functionality=
<br />that we are missing if go starts fetching dependencies during compile=
.<br /><br />A further thought is that if this is for go.mod issues, there =
is the<br />go-mod.bbclass.<br /><br />Perhaps enabling it in that class an=
d doing a bbwarn about go fetching<br />dependencies would be appropriate ?=
<br /><br />Otherwise, someone may not know that this is happening and that=
 a no<br />network configuration has no chance of working.<br /><br />I rec=
kon that is reasonable. I'll personally go down the recipe level to workaro=
und this change but understanding and agreeing with the reasoning behind th=
is change, I want to invest a bit into trying to find a proper solution in =
the core. Bruce, I know you invested a fair amount of time into this alread=
y. Would you be willing to sync up and see how we can work together in tack=
ling this?<br /><br />Definitely, more ideas are good. In fact, I think the=
re are probably<br />several approaches that can co-exist, depending on wha=
t a<br />recipe/developer needs.<br /><br />I'm in the Eastern time zone he=
re, and will try and grab folks on IRC<br />to have a level set<br /><br />=
Bruce<br /><br />Added Zyga to CC as he is also interested in this as part =
of his go development activities.<br /><br />Thanks,<br />Andrei<br /><br /=
><br /><br />--<br />- Thou shalt not follow the NULL pointer, for chaos an=
d madness await<br />thee at its end<br />- "Use the force Harry" - Gandalf=
, Star Trek II<br /><br />The problem in allowing downloads during compile =
(e.g. by go) is, that it leads to non-reproducable builds. I'm currently fa=
cing the same issue and would like to have a reproducable go *offline* buil=
d.<br />I would like to propose two ideas to workaround the go-compile fetc=
hing issue:<br /><br />First:<br />- Fetch go-dependencies using go.mod fil=
e from 'proxy.golang.org' (e.g. by writing a seperate go fetcher or a wget-=
fetcher) and unpack the dependencies into go projects 'vendor' folder. This=
 forces go to compile offline. However, one have to generate the 'modules.t=
xt' file in the vendor folder 'manually' during unpack. This is error prone=
, as there is no official documentation how this format should look like. A=
nyway, I've tried this approach and it works for me.<br /><br />Second:<br =
/>- Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. b=
y writing a seperate go fetcher) and unpack the dependencies into a local (=
workdir) go-path. This seemed a good solution for me as the go-path is well=
 defined. But for some reason 'go' fetches the zip-files during compile int=
o it's download-cache AGAIN, even if the source is already unpacked in the =
go-path. I'll assume this is required to verify the source files integrity?=
! With this approach one have to adapt 'go' to suppress this download behav=
iour.</blockquote>
I've been doing offline builds using a constructed vendor/ directory<br />a=
nd generated modules.txt.<br /><br />The only difference between what I hav=
e working and what you are<br />suggesting (type 1), is that I've gone dire=
ctly to the sources and<br />constructed the vendor directory using the OE =
git fetcher. That allows<br />all functionality to continue to work that is=
 part of OEcore, and the<br />build to continue. Switching out the git fetc=
hes for tarballs would<br />be possible, I just wasn't sure how to use the =
proxied modules (and I<br />wanted the history for debug).<br /><br />I've =
never had any issues with the modules.txt, as I generate it at<br />the sam=
e time as the git fetch lines for the SRC_URI. I've also not<br />been usin=
g information from the go.mod directly from go.proxy.org, it<br />is inform=
ation I've generated from a clone of the project and dumped<br />via go mod=
. There's likely improvements I can do there, but with what<br />I'm doing,=
 I'm going directly to the source of the projects and doing<br />clones, wh=
ich keeps everything clear of the go infrastructure.<br /><br />I have a ut=
ility that I'm still cleaning up that generates the SRC_URI<br />lines, as =
well as the modules.txt, when I resolve a few nagging<br />issues, I'll mak=
e the WIP scripts available.<br /><br />Other projects (BSD, etc), have bee=
n doing different sorts of<br />constructed vendor directories, but they ar=
e similar in approach.<br /><br />For the short term (i.e. the upcoming rel=
ease), that is pretty much<br />all we can do. There isn't enough time to i=
mplement a new go fetcher<br />backend for bitbake.<br /><br />In the end, =
how we fetch and place the dependencies is a transport, so<br />whether or =
not we fetch them ourselves, or let go do it, that part is<br />largely the=
 same.<br /><br />For now (short term), I favour vendor/, as it is workable=
, but not<br />perfect. It isn't exactly efficient or pretty, but at least =
it seems<br />to produce correct output, and allows all of the project capa=
bilities<br />to work. And of course, the approach will continue to work re=
gardless<br />of development on other go.mod elements.</blockquote>
After reflecting on this for a while I reckon this is the fastest way forwa=
rd while addressing the reproducibility issue. I'm wondering what we can do=
 in terms of compliance? Maybe we can turn the script you were talking abou=
t into a recipe generator that also deals with this by querying the license=
s of all the dependencies (direct and indirect).</blockquote>
That was my rough plan, generate a recipe or have it generate an<br />inclu=
de that recipes pull in, there are some repeating patterns go<br />modules,=
 so there is some re-use to be found.<br /><br />I roughed out a process fo=
r it to work with k3s, and have a working<br />updated recipe that creates =
a vendor/ directory and doesn't touch the<br />network during the actual bu=
ild.<br /><br />There's definitely efficiencies to be found, as the first f=
etch is<br />quite long, and there's some i/o required as the fetches secon=
darily<br />shuffled into place that go expects in a vendor directory.<br /=
><br />I'm trying to complete a second recipe with the generated SRC_URI<br=
 />entries now (nerdctl) and I ran into an issue with the script where<br /=
>some repeated fetches were breaking the vendor directory creation. I<br />=
need to spend time with that on Thursday, but after I sort that out,<br />I=
 can remove the curse words from the script and do a bit of cleanup.<br />T=
here's plenty of bugs, and alternate ways things can operate (maybe<br />so=
me of the packaged go modules versus git, etc, etc), but since those<br />c=
hoices don't required bitbake/fetcher or other core changes, we have<br />a=
 bit of time to iterate on a workable approach.<br /><br />Bruce</blockquot=
e>
Bruce, I'm looking forward to review your approach. My biggest concern in f=
etching the imports from source via git is, that an 'import' my not necessa=
rily relate to a git repository. 'go' supports multiple backends (e.g. hg, =
svn, etc.). That said, an import-path cannot be transformed to a git SRC_UR=
I in a 1:1 manner. That's why I ended up downloading the modules from golan=
g-proxy.<br /><br />Lukas<br /><br />
<blockquote><br />
<blockquote>That being said, how can I help? It seems that there is an exis=
ting WIP state on this. Can I take something from it? Maybe help with clean=
ing up the script?<br />--<br />Andrei Gherzan<br />gpg: rsa4096/D4D94F67AD=
0E9640</blockquote>
<br /><br />-- <br />- Thou shalt not follow the NULL pointer, for chaos an=
d madness await<br />thee at its end<br />- "Use the force Harry" - Gandalf=
, Star Trek II</blockquote>

--oQnfHKNt6y7shanEUR5a--

