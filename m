Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57B67C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 21:55:04 +0000 (UTC)
Subject: Re: [PATCH 2/2] classes: Add new packagefeed class.
To: openembedded-core@lists.openembedded.org
From: "Charlie Johnston" <charlie.johnston@ni.com>
X-Originating-Location: Austin, Texas, US (162.237.205.80)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 May 2023 14:54:56 -0700
References: <CANNYZj_zqGXU_v8SFzNK7uDrUXn-979-GiYcPsS6Sd2EWEWytA@mail.gmail.com>
In-Reply-To: <CANNYZj_zqGXU_v8SFzNK7uDrUXn-979-GiYcPsS6Sd2EWEWytA@mail.gmail.com>
Message-ID: <6010.1685051696220462053@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5ItBwV8YcFIEbRkoZd5H"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 21:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181724

--5ItBwV8YcFIEbRkoZd5H
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I see your point. Please drop this patch set from consideration.

Taking a step back, my intention was to make it so that a "packagefeed" was=
 a simple buildable target the way an image or packagegroup is. That is, I'=
d like it to be possible to just "bitbake packagefeed" and get all the pack=
ages and indexes.
I think the non-deterministic problem exists today too since someone could =
run "bitbake packagegroup package-index" and nothing is stopping them from =
doing that other than noticing it doesn't work.

I can see a couple of potential options:

1. Come up with a way to ensure that the do_package_index task is only run =
once per bitbake invocation after all other packaging tasks. As far as I ca=
n tell, there's not a way to enforce this with my current design. It also d=
oesn't address the problem of packages already in the deploy directories.
2. Add more scaffolding to create a packagefeed class with potentially its =
own deploy directory and which only includes index files for its dependenci=
es. That seems like a lot more effort than my change but might address the =
concerns more completely.
Any feedback or thoughts on those ideas?

Thanks,

Charlie

On Thu, May 25, 2023 at 11:11 AM, Alexander Kanavin wrote:

>=20
> It would not be the same thing done twice. It is not clear how the
> rpm/dep/opkg-specific tooling would behave if there's two or more
> instances of it indexing the files at the same time, or one starts
> earlier than the other, and the later ones see incomplete index files
> or half-deployed packages etc. It's well possible such situations are
> not handled well, and you still need to somehow ensure the indexing
> indeed runs once, and only after everything else. How would you ensure
> that? I worry this change opens the door to misuse, and cryptic, hard
> to reproduce or diagnose errors.
>=20
> The output would also be non-deterministic: it would contain
> everything from the packagegroup and an unknown amount of additional
> packages, depending on what else happened to be in deploy directory at
> the time.
>=20
> Alex
>=20
> On Thu, 25 May 2023 at 17:55, Charlie Johnston <charlie.johnston@ni.com>
> wrote:
>=20
>>=20
>> Yes, having two recipes that inherit this running at the same time would
>> potentially write the same index files. I'm not sure that's actually a
>> problem other than the same thing being done twice.
>> As long as at least one of the package index steps runs after all packag=
es
>> have been written, the index files will be up-to-date. Since I've made t=
he
>> task recursively depend on the tasks that create packages, I think it's
>> fine.
>>=20
>> That being said, if there's a way to both add it to recipes and ensure
>> that the task only runs once per bitbake command I would be open to movi=
ng
>> towards that. Is there anything like that?
>>=20
>> Thanks,
>> Charlie
>>=20
>> On Thu, May 25, 2023 at 03:47 AM, Alexander Kanavin wrote:
>>=20
>> What happens if several recipes inherit this class, and are processed
>> at the same time? Won't they step on each other, writing the same
>> index files into the deploy directory? I think package-index recipe is
>> deliberately standalone for that reason: you have to build it in a
>> separate step.
>>=20
>> Alex
>>=20
>> On Wed, 24 May 2023 at 23:55, Charlie Johnston <charlie.johnston@ni.com>
>> wrote:
>>=20
>>=20
>> Added a new packagefeed class that contains both a
>> packagegroup and the package index builds. This allows a
>> one-line bitbake for a packagegroup that defines a feed
>> without explicitly needing to run the package-index recipe.
>>=20
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>> meta/classes/packagefeed.bbclass | 5 +++++
>> 1 file changed, 5 insertions(+)
>> create mode 100644 meta/classes/packagefeed.bbclass
>>=20
>> diff --git a/meta/classes/packagefeed.bbclass
>> b/meta/classes/packagefeed.bbclass
>> new file mode 100644
>> index 0000000000..b83ac54f21
>> --- /dev/null
>> +++ b/meta/classes/packagefeed.bbclass
>> @@ -0,0 +1,5 @@
>> +#
>> +# Special case of packagegroup that includes package index builds.
>> +#
>> +
>> +inherit packagegroup package_index
>> --
>> 2.30.2
>>=20
>>=20
>>=20
>>=20
>>=20
>>=20
>=20
>

--5ItBwV8YcFIEbRkoZd5H
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>I see your point. Please drop this patch set from consideration.<br /><b=
r />Taking a step back, my intention was to make it so that a "packagefeed"=
 was a simple buildable target the way an image or packagegroup is. That is=
, I'd like it to be possible to just "bitbake packagefeed" and get all the =
packages and indexes.&nbsp;<br />I think the non-deterministic problem exis=
ts today too since someone could run "bitbake packagegroup package-index" a=
nd nothing is stopping them from doing that other than noticing it doesn't =
work.<br /><br />I can see a couple of potential options:</p>
<p>1. Come up with a way to ensure that the do_package_index task is only r=
un once per bitbake invocation after all other packaging tasks. As far as I=
 can tell, there's not a way to enforce this with my current design. It als=
o doesn't address the problem of packages already in the deploy directories=
.<br />2. Add more scaffolding to create a packagefeed class with potential=
ly its own deploy directory and which only includes index files for its dep=
endencies. That seems like a lot more effort than my change but might addre=
ss the concerns more completely.<br />Any feedback or thoughts on those ide=
as?<br /><br />Thanks,</p>
<p>Charlie<br /><br />On Thu, May 25, 2023 at 11:11 AM, Alexander Kanavin w=
rote:</p>
<blockquote>It would not be the same thing done twice. It is not clear how =
the<br />rpm/dep/opkg-specific tooling would behave if there's two or more<=
br />instances of it indexing the files at the same time, or one starts<br =
/>earlier than the other, and the later ones see incomplete index files<br =
/>or half-deployed packages etc. It's well possible such situations are<br =
/>not handled well, and you still need to somehow ensure the indexing<br />=
indeed runs once, and only after everything else. How would you ensure<br /=
>that? I worry this change opens the door to misuse, and cryptic, hard<br /=
>to reproduce or diagnose errors.<br /><br />The output would also be non-d=
eterministic: it would contain<br />everything from the packagegroup and an=
 unknown amount of additional<br />packages, depending on what else happene=
d to be in deploy directory at<br />the time.<br /><br />Alex<br /><br />On=
 Thu, 25 May 2023 at 17:55, Charlie Johnston &lt;charlie.johnston@ni.com&gt=
; wrote:<br />
<blockquote><br />Yes, having two recipes that inherit this running at the =
same time would potentially write the same index files. I'm not sure that's=
 actually a problem other than the same thing being done twice.<br />As lon=
g as at least one of the package index steps runs after all packages have b=
een written, the index files will be up-to-date. Since I've made the task r=
ecursively depend on the tasks that create packages, I think it's fine.<br =
/><br />That being said, if there's a way to both add it to recipes and ens=
ure that the task only runs once per bitbake command I would be open to mov=
ing towards that. Is there anything like that?<br /><br />Thanks,<br />Char=
lie<br /><br />On Thu, May 25, 2023 at 03:47 AM, Alexander Kanavin wrote:<b=
r /><br />What happens if several recipes inherit this class, and are proce=
ssed<br />at the same time? Won't they step on each other, writing the same=
<br />index files into the deploy directory? I think package-index recipe i=
s<br />deliberately standalone for that reason: you have to build it in a<b=
r />separate step.<br /><br />Alex<br /><br />On Wed, 24 May 2023 at 23:55,=
 Charlie Johnston &lt;charlie.johnston@ni.com&gt; wrote:<br /><br /><br />A=
dded a new packagefeed class that contains both a<br />packagegroup and the=
 package index builds. This allows a<br />one-line bitbake for a packagegro=
up that defines a feed<br />without explicitly needing to run the package-i=
ndex recipe.<br /><br />Signed-off-by: Charlie Johnston &lt;charlie.johnsto=
n@ni.com&gt;<br />---<br />meta/classes/packagefeed.bbclass | 5 +++++<br />=
1 file changed, 5 insertions(+)<br />create mode 100644 meta/classes/packag=
efeed.bbclass<br /><br />diff --git a/meta/classes/packagefeed.bbclass b/me=
ta/classes/packagefeed.bbclass<br />new file mode 100644<br />index 0000000=
000..b83ac54f21<br />--- /dev/null<br />+++ b/meta/classes/packagefeed.bbcl=
ass<br />@@ -0,0 +1,5 @@<br />+#<br />+# Special case of packagegroup that =
includes package index builds.<br />+#<br />+<br />+inherit packagegroup pa=
ckage_index<br />--<br />2.30.2<br /><br /><br /><br /><br /><br /></blockq=
uote>
</blockquote>

--5ItBwV8YcFIEbRkoZd5H--

