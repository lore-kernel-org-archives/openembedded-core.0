Return-Path: <lukas.funke@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88340C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 08:10:53 +0000 (UTC)
Subject: Re: [PATCH 1/1] go.bbclass: Allow network in do_compile
To: openembedded-core@lists.openembedded.org
From: lukas.funke@weidmueller.com
X-Originating-Location: Sonneberg, Thuringia, DE (87.129.248.106)
X-Originating-Platform: Windows Chrome 98
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 09 Mar 2022 00:10:53 -0800
References: 
 <CADkTA4MVEuGLjzk0vgbeMm+DgWCLk+RA9RTfEkn=YG+-kAwh1g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MVEuGLjzk0vgbeMm+DgWCLk+RA9RTfEkn=YG+-kAwh1g@mail.gmail.com>
Message-ID: <22943.1646813453152097150@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pc1kYPrWUC4Hpo7FnFDV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 08:10:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162951

--pc1kYPrWUC4Hpo7FnFDV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2022 at 05:46 PM, Bruce Ashfield wrote:

>=20
> On Thu, Mar 3, 2022 at 10:13 AM <lukas.funke@weidmueller.com> wrote:
>=20
>> On Thu, Mar 3, 2022 at 04:34 AM, Bruce Ashfield wrote:
>>=20
>> On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan <andrei@gherzan.com> wrote=
:
>>=20
>>=20
>> Mar 1, 2022 20:15:52 Bruce Ashfield <bruce.ashfield@gmail.com>:
>>=20
>> On Tue, Mar 1, 2022 at 10:54 AM <lukas.funke@weidmueller.com> wrote:
>>=20
>> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
>>=20
>> On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com> wrote=
:
>>=20
>>=20
>> On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
>>=20
>> On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>> lists.openembedded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>=20
>>=20
>> On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan <andrei@gherzan.com> wrot=
e:
>>=20
>>=20
>>=20
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>=20
>> Compile pulls in the go.mod list requiring network. Without this, do
>> compile would fail with a similar error to the following:
>>=20
>> dial tcp: lookup proxy.golang.org: Temporary failure in name resolution
>>=20
>> This is something that needs to be carried in your own layers, IMHO it
>> isn't appropriate for core.
>>=20
>> It isn't about the fetching, it is the entire gap in functionality
>> that we are missing if go starts fetching dependencies during compile.
>>=20
>> A further thought is that if this is for go.mod issues, there is the
>> go-mod.bbclass.
>>=20
>> Perhaps enabling it in that class and doing a bbwarn about go fetching
>> dependencies would be appropriate ?
>>=20
>> Otherwise, someone may not know that this is happening and that a no
>> network configuration has no chance of working.
>>=20
>> I reckon that is reasonable. I'll personally go down the recipe level to
>> workaround this change but understanding and agreeing with the reasoning
>> behind this change, I want to invest a bit into trying to find a proper
>> solution in the core. Bruce, I know you invested a fair amount of time
>> into this already. Would you be willing to sync up and see how we can wo=
rk
>> together in tackling this?
>>=20
>> Definitely, more ideas are good. In fact, I think there are probably
>> several approaches that can co-exist, depending on what a
>> recipe/developer needs.
>>=20
>> I'm in the Eastern time zone here, and will try and grab folks on IRC
>> to have a level set
>>=20
>> Bruce
>>=20
>> Added Zyga to CC as he is also interested in this as part of his go
>> development activities.
>>=20
>> Thanks,
>> Andrei
>>=20
>>=20
>>=20
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>=20
>> The problem in allowing downloads during compile (e.g. by go) is, that i=
t
>> leads to non-reproducable builds. I'm currently facing the same issue an=
d
>> would like to have a reproducable go *offline* build.
>> I would like to propose two ideas to workaround the go-compile fetching
>> issue:
>>=20
>> First:
>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. =
by
>> writing a seperate go fetcher or a wget-fetcher) and unpack the
>> dependencies into go projects 'vendor' folder. This forces go to compile
>> offline. However, one have to generate the 'modules.txt' file in the
>> vendor folder 'manually' during unpack. This is error prone, as there is
>> no official documentation how this format should look like. Anyway, I've
>> tried this approach and it works for me.
>>=20
>> Second:
>> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. =
by
>> writing a seperate go fetcher) and unpack the dependencies into a local
>> (workdir) go-path. This seemed a good solution for me as the go-path is
>> well defined. But for some reason 'go' fetches the zip-files during
>> compile into it's download-cache AGAIN, even if the source is already
>> unpacked in the go-path. I'll assume this is required to verify the sour=
ce
>> files integrity?! With this approach one have to adapt 'go' to suppress
>> this download behaviour.
>>=20
>> I've been doing offline builds using a constructed vendor/ directory
>> and generated modules.txt.
>>=20
>> The only difference between what I have working and what you are
>> suggesting (type 1), is that I've gone directly to the sources and
>> constructed the vendor directory using the OE git fetcher. That allows
>> all functionality to continue to work that is part of OEcore, and the
>> build to continue. Switching out the git fetches for tarballs would
>> be possible, I just wasn't sure how to use the proxied modules (and I
>> wanted the history for debug).
>>=20
>> I've never had any issues with the modules.txt, as I generate it at
>> the same time as the git fetch lines for the SRC_URI. I've also not
>> been using information from the go.mod directly from go.proxy.org, it
>> is information I've generated from a clone of the project and dumped
>> via go mod. There's likely improvements I can do there, but with what
>> I'm doing, I'm going directly to the source of the projects and doing
>> clones, which keeps everything clear of the go infrastructure.
>>=20
>> I have a utility that I'm still cleaning up that generates the SRC_URI
>> lines, as well as the modules.txt, when I resolve a few nagging
>> issues, I'll make the WIP scripts available.
>>=20
>> Other projects (BSD, etc), have been doing different sorts of
>> constructed vendor directories, but they are similar in approach.
>>=20
>> For the short term (i.e. the upcoming release), that is pretty much
>> all we can do. There isn't enough time to implement a new go fetcher
>> backend for bitbake.
>>=20
>> In the end, how we fetch and place the dependencies is a transport, so
>> whether or not we fetch them ourselves, or let go do it, that part is
>> largely the same.
>>=20
>> For now (short term), I favour vendor/, as it is workable, but not
>> perfect. It isn't exactly efficient or pretty, but at least it seems
>> to produce correct output, and allows all of the project capabilities
>> to work. And of course, the approach will continue to work regardless
>> of development on other go.mod elements.
>>=20
>> After reflecting on this for a while I reckon this is the fastest way
>> forward while addressing the reproducibility issue. I'm wondering what w=
e
>> can do in terms of compliance? Maybe we can turn the script you were
>> talking about into a recipe generator that also deals with this by
>> querying the licenses of all the dependencies (direct and indirect).
>>=20
>> That was my rough plan, generate a recipe or have it generate an
>> include that recipes pull in, there are some repeating patterns go
>> modules, so there is some re-use to be found.
>>=20
>> I roughed out a process for it to work with k3s, and have a working
>> updated recipe that creates a vendor/ directory and doesn't touch the
>> network during the actual build.
>>=20
>> There's definitely efficiencies to be found, as the first fetch is
>> quite long, and there's some i/o required as the fetches secondarily
>> shuffled into place that go expects in a vendor directory.
>>=20
>> I'm trying to complete a second recipe with the generated SRC_URI
>> entries now (nerdctl) and I ran into an issue with the script where
>> some repeated fetches were breaking the vendor directory creation. I
>> need to spend time with that on Thursday, but after I sort that out,
>> I can remove the curse words from the script and do a bit of cleanup.
>> There's plenty of bugs, and alternate ways things can operate (maybe
>> some of the packaged go modules versus git, etc, etc), but since those
>> choices don't required bitbake/fetcher or other core changes, we have
>> a bit of time to iterate on a workable approach.
>>=20
>> Bruce
>>=20
>> Bruce, I'm looking forward to review your approach. My biggest concern i=
n
>> fetching the imports from source via git is, that an 'import' my not
>> necessarily relate to a git repository. 'go' supports multiple backends
>> (e.g. hg, svn, etc.). That said, an import-path cannot be transformed to=
 a
>> git SRC_URI in a 1:1 manner. That's why I ended up downloading the modul=
es
>> from golang-proxy.
>=20
> I just used git as an example. Any supported OE fetcher can be used. I
> haven't run into any source bases that can't be resolved to git so
> far, but the generation of other SRC_URI entries is relatively
> trivial. Since this is static information and part of the recipe, it
> can all be sorted out ahead after the original generation of the
> source locations.
>=20
> Experience with supporting some of the larger go applications has
> shown me that the source has made it easier for hot fixes to address
> CVE issues. We can easily bump an individual SRCREV or bring in a
> patch. It's solvable no matter what the approach, that's just how
> we've solved it with the source repos.
>=20
> I was browsing around the proxy docs, and the API to get modules was
> clear to me, do you have a link to an example or a document that
> describes it ?

Bruce, sorry for the late reply. The only documentation I found regarding t=
he mapping 'import-path' <> 'src-uri' is this one: Go Modules Reference - T=
he Go Programming Language ( https://go.dev/ref/mod#vcs-find )
The mapping seems to be clear. That said, I would agree that it is possible=
 to download the sources directly from git (or any other vcs) and unpack it=
 to the vendor folder.

Lukas

>=20
>=20
> Bruce
>=20
>=20
>> Lukas
>>=20
>>=20
>> That being said, how can I help? It seems that there is an existing WIP
>> state on this. Can I take something from it? Maybe help with cleaning up
>> the script?
>> --
>> Andrei Gherzan
>> gpg: rsa4096/D4D94F67AD0E9640
>>=20
>>=20
>>=20
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>=20
>>=20
>>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--pc1kYPrWUC4Hpo7FnFDV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 3, 2022 at 05:46 PM, Bruce Ashfield wrote:<br />
<blockquote>On Thu, Mar 3, 2022 at 10:13 AM &lt;lukas.funke@weidmueller.com=
&gt; wrote:<br />
<blockquote>On Thu, Mar 3, 2022 at 04:34 AM, Bruce Ashfield wrote:<br /><br=
 />On Wed, Mar 2, 2022 at 4:57 PM Andrei Gherzan &lt;andrei@gherzan.com&gt;=
 wrote:<br /><br /><br />Mar 1, 2022 20:15:52 Bruce Ashfield &lt;bruce.ashf=
ield@gmail.com&gt;:<br /><br />On Tue, Mar 1, 2022 at 10:54 AM &lt;lukas.fu=
nke@weidmueller.com&gt; wrote:<br /><br />On Tue, Mar 1, 2022 at 02:14 PM, =
Bruce Ashfield wrote:<br /><br />On Tue, Mar 1, 2022 at 6:42 AM Andrei Gher=
zan &lt;andrei@gherzan.com&gt; wrote:<br /><br /><br />On Tue, 1 Mar 2022, =
at 01:55, Bruce Ashfield wrote:<br /><br />On Mon, Feb 28, 2022 at 8:17 PM =
Bruce Ashfield via<br />lists.openembedded.org<br />&lt;bruce.ashfield=3Dgm=
ail.com@lists.openembedded.org&gt; wrote:<br /><br /><br />On Mon, Feb 28, =
2022 at 6:54 PM Andrei Gherzan &lt;andrei@gherzan.com&gt; wrote:<br /><br /=
><br />From: Andrei Gherzan &lt;andrei.gherzan@huawei.com&gt;<br /><br />Co=
mpile pulls in the go.mod list requiring network. Without this, do<br />com=
pile would fail with a similar error to the following:<br /><br />dial tcp:=
 lookup proxy.golang.org: Temporary failure in name resolution<br /><br />T=
his is something that needs to be carried in your own layers, IMHO it<br />=
isn't appropriate for core.<br /><br />It isn't about the fetching, it is t=
he entire gap in functionality<br />that we are missing if go starts fetchi=
ng dependencies during compile.<br /><br />A further thought is that if thi=
s is for go.mod issues, there is the<br />go-mod.bbclass.<br /><br />Perhap=
s enabling it in that class and doing a bbwarn about go fetching<br />depen=
dencies would be appropriate ?<br /><br />Otherwise, someone may not know t=
hat this is happening and that a no<br />network configuration has no chanc=
e of working.<br /><br />I reckon that is reasonable. I'll personally go do=
wn the recipe level to workaround this change but understanding and agreein=
g with the reasoning behind this change, I want to invest a bit into trying=
 to find a proper solution in the core. Bruce, I know you invested a fair a=
mount of time into this already. Would you be willing to sync up and see ho=
w we can work together in tackling this?<br /><br />Definitely, more ideas =
are good. In fact, I think there are probably<br />several approaches that =
can co-exist, depending on what a<br />recipe/developer needs.<br /><br />I=
'm in the Eastern time zone here, and will try and grab folks on IRC<br />t=
o have a level set<br /><br />Bruce<br /><br />Added Zyga to CC as he is al=
so interested in this as part of his go development activities.<br /><br />=
Thanks,<br />Andrei<br /><br /><br /><br />--<br />- Thou shalt not follow =
the NULL pointer, for chaos and madness await<br />thee at its end<br />- "=
Use the force Harry" - Gandalf, Star Trek II<br /><br />The problem in allo=
wing downloads during compile (e.g. by go) is, that it leads to non-reprodu=
cable builds. I'm currently facing the same issue and would like to have a =
reproducable go *offline* build.<br />I would like to propose two ideas to =
workaround the go-compile fetching issue:<br /><br />First:<br />- Fetch go=
-dependencies using go.mod file from 'proxy.golang.org' (e.g. by writing a =
seperate go fetcher or a wget-fetcher) and unpack the dependencies into go =
projects 'vendor' folder. This forces go to compile offline. However, one h=
ave to generate the 'modules.txt' file in the vendor folder 'manually' duri=
ng unpack. This is error prone, as there is no official documentation how t=
his format should look like. Anyway, I've tried this approach and it works =
for me.<br /><br />Second:<br />- Fetch go-dependencies using go.mod file f=
rom 'proxy.golang.org' (e.g. by writing a seperate go fetcher) and unpack t=
he dependencies into a local (workdir) go-path. This seemed a good solution=
 for me as the go-path is well defined. But for some reason 'go' fetches th=
e zip-files during compile into it's download-cache AGAIN, even if the sour=
ce is already unpacked in the go-path. I'll assume this is required to veri=
fy the source files integrity?! With this approach one have to adapt 'go' t=
o suppress this download behaviour.<br /><br />I've been doing offline buil=
ds using a constructed vendor/ directory<br />and generated modules.txt.<br=
 /><br />The only difference between what I have working and what you are<b=
r />suggesting (type 1), is that I've gone directly to the sources and<br /=
>constructed the vendor directory using the OE git fetcher. That allows<br =
/>all functionality to continue to work that is part of OEcore, and the<br =
/>build to continue. Switching out the git fetches for tarballs would<br />=
be possible, I just wasn't sure how to use the proxied modules (and I<br />=
wanted the history for debug).<br /><br />I've never had any issues with th=
e modules.txt, as I generate it at<br />the same time as the git fetch line=
s for the SRC_URI. I've also not<br />been using information from the go.mo=
d directly from go.proxy.org, it<br />is information I've generated from a =
clone of the project and dumped<br />via go mod. There's likely improvement=
s I can do there, but with what<br />I'm doing, I'm going directly to the s=
ource of the projects and doing<br />clones, which keeps everything clear o=
f the go infrastructure.<br /><br />I have a utility that I'm still cleanin=
g up that generates the SRC_URI<br />lines, as well as the modules.txt, whe=
n I resolve a few nagging<br />issues, I'll make the WIP scripts available.=
<br /><br />Other projects (BSD, etc), have been doing different sorts of<b=
r />constructed vendor directories, but they are similar in approach.<br />=
<br />For the short term (i.e. the upcoming release), that is pretty much<b=
r />all we can do. There isn't enough time to implement a new go fetcher<br=
 />backend for bitbake.<br /><br />In the end, how we fetch and place the d=
ependencies is a transport, so<br />whether or not we fetch them ourselves,=
 or let go do it, that part is<br />largely the same.<br /><br />For now (s=
hort term), I favour vendor/, as it is workable, but not<br />perfect. It i=
sn't exactly efficient or pretty, but at least it seems<br />to produce cor=
rect output, and allows all of the project capabilities<br />to work. And o=
f course, the approach will continue to work regardless<br />of development=
 on other go.mod elements.<br /><br />After reflecting on this for a while =
I reckon this is the fastest way forward while addressing the reproducibili=
ty issue. I'm wondering what we can do in terms of compliance? Maybe we can=
 turn the script you were talking about into a recipe generator that also d=
eals with this by querying the licenses of all the dependencies (direct and=
 indirect).<br /><br />That was my rough plan, generate a recipe or have it=
 generate an<br />include that recipes pull in, there are some repeating pa=
tterns go<br />modules, so there is some re-use to be found.<br /><br />I r=
oughed out a process for it to work with k3s, and have a working<br />updat=
ed recipe that creates a vendor/ directory and doesn't touch the<br />netwo=
rk during the actual build.<br /><br />There's definitely efficiencies to b=
e found, as the first fetch is<br />quite long, and there's some i/o requir=
ed as the fetches secondarily<br />shuffled into place that go expects in a=
 vendor directory.<br /><br />I'm trying to complete a second recipe with t=
he generated SRC_URI<br />entries now (nerdctl) and I ran into an issue wit=
h the script where<br />some repeated fetches were breaking the vendor dire=
ctory creation. I<br />need to spend time with that on Thursday, but after =
I sort that out,<br />I can remove the curse words from the script and do a=
 bit of cleanup.<br />There's plenty of bugs, and alternate ways things can=
 operate (maybe<br />some of the packaged go modules versus git, etc, etc),=
 but since those<br />choices don't required bitbake/fetcher or other core =
changes, we have<br />a bit of time to iterate on a workable approach.<br /=
><br />Bruce<br /><br />Bruce, I'm looking forward to review your approach.=
 My biggest concern in fetching the imports from source via git is, that an=
 'import' my not necessarily relate to a git repository. 'go' supports mult=
iple backends (e.g. hg, svn, etc.). That said, an import-path cannot be tra=
nsformed to a git SRC_URI in a 1:1 manner. That's why I ended up downloadin=
g the modules from golang-proxy.</blockquote>
I just used git as an example. Any supported OE fetcher can be used. I<br /=
>haven't run into any source bases that can't be resolved to git so<br />fa=
r, but the generation of other SRC_URI entries is relatively<br />trivial. =
Since this is static information and part of the recipe, it<br />can all be=
 sorted out ahead after the original generation of the<br />source location=
s.<br /><br />Experience with supporting some of the larger go applications=
 has<br />shown me that the source has made it easier for hot fixes to addr=
ess<br />CVE issues. We can easily bump an individual SRCREV or bring in a<=
br />patch. It's solvable no matter what the approach, that's just how<br /=
>we've solved it with the source repos.<br /><br />I was browsing around th=
e proxy docs, and the API to get modules was<br />clear to me, do you have =
a link to an example or a document that<br />describes it ?</blockquote>
Bruce, sorry for the late reply. The only documentation I found regarding t=
he mapping 'import-path' &lt;&gt; 'src-uri' is this one:&nbsp;<a href=3D"ht=
tps://go.dev/ref/mod#vcs-find">Go Modules Reference - The Go Programming La=
nguage&nbsp;</a><br />The mapping seems to be clear. That said, I would agr=
ee that it is possible to download the sources directly from git (or any ot=
her vcs) and unpack it to the vendor folder.<br /><br />Lukas<br /><br />
<blockquote><br />Bruce<br /><br />
<blockquote>Lukas<br /><br /><br />That being said, how can I help? It seem=
s that there is an existing WIP state on this. Can I take something from it=
? Maybe help with cleaning up the script?<br />--<br />Andrei Gherzan<br />=
gpg: rsa4096/D4D94F67AD0E9640<br /><br /><br /><br />--<br />- Thou shalt n=
ot follow the NULL pointer, for chaos and madness await<br />thee at its en=
d<br />- "Use the force Harry" - Gandalf, Star Trek II<br /><br /><br /></b=
lockquote>
<br />-- <br />- Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br />thee at its end<br />- "Use the force Harry" - Gandalf, Star=
 Trek II</blockquote>

--pc1kYPrWUC4Hpo7FnFDV--

