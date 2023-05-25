Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD19C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 15:55:40 +0000 (UTC)
Subject: Re: [PATCH 2/2] classes: Add new packagefeed class.
To: openembedded-core@lists.openembedded.org
From: "Charlie Johnston" <charlie.johnston@ni.com>
X-Originating-Location: Austin, Texas, US (162.237.205.80)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 25 May 2023 08:55:35 -0700
References: <CANNYZj9qufy5ryo0xT3fV1YKWS+1Ue1+L019kaWHD7t2SB53-g@mail.gmail.com>
In-Reply-To: <CANNYZj9qufy5ryo0xT3fV1YKWS+1Ue1+L019kaWHD7t2SB53-g@mail.gmail.com>
Message-ID: <2625.1685030135012218547@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0W1UhHVSPSTlZVZFMvr8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 15:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181715

--0W1UhHVSPSTlZVZFMvr8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes, having two recipes that inherit this running at the same time would po=
tentially write the same index files. I'm not sure that's actually a proble=
m other than the same thing being done twice.
As long as at least one of the package index steps runs after all packages =
have been written, the index files will be up-to-date. Since I've made the =
task recursively depend on the tasks that create packages, I think it's fin=
e.

That being said, if there's a way to both add it to recipes and ensure that=
 the task only runs once per bitbake command I would be open to moving towa=
rds that. Is there anything like that?

Thanks,
Charlie

On Thu, May 25, 2023 at 03:47 AM, Alexander Kanavin wrote:

>=20
> What happens if several recipes inherit this class, and are processed
> at the same time? Won't they step on each other, writing the same
> index files into the deploy directory? I think package-index recipe is
> deliberately standalone for that reason: you have to build it in a
> separate step.
>=20
> Alex
>=20
> On Wed, 24 May 2023 at 23:55, Charlie Johnston <charlie.johnston@ni.com>
> wrote:
>=20
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
>=20
>

--0W1UhHVSPSTlZVZFMvr8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Yes, having two recipes that inherit this running at the same time would po=
tentially write the same index files. I'm not sure that's actually a proble=
m other than the same thing being done twice.<br />As long as at least one =
of the package index steps runs after all packages have been written, the i=
ndex files will be up-to-date. Since I've made the task recursively depend =
on the tasks that create packages, I think it's fine.<br /><br />That being=
 said, if there's a way to both add it to recipes and ensure that the task =
only runs once per bitbake command I would be open to moving towards that. =
Is there anything like that?<br /><br />Thanks,<br />Charlie<br /><br />On =
Thu, May 25, 2023 at 03:47 AM, Alexander Kanavin wrote:<br />
<blockquote>What happens if several recipes inherit this class, and are pro=
cessed<br />at the same time? Won't they step on each other, writing the sa=
me<br />index files into the deploy directory? I think package-index recipe=
 is<br />deliberately standalone for that reason: you have to build it in a=
<br />separate step.<br /><br />Alex<br /><br />On Wed, 24 May 2023 at 23:5=
5, Charlie Johnston &lt;charlie.johnston@ni.com&gt; wrote:<br />
<blockquote><br />Added a new packagefeed class that contains both a<br />p=
ackagegroup and the package index builds. This allows a<br />one-line bitba=
ke for a packagegroup that defines a feed<br />without explicitly needing t=
o run the package-index recipe.<br /><br />Signed-off-by: Charlie Johnston =
&lt;charlie.johnston@ni.com&gt;<br />---<br />meta/classes/packagefeed.bbcl=
ass | 5 +++++<br />1 file changed, 5 insertions(+)<br />create mode 100644 =
meta/classes/packagefeed.bbclass<br /><br />diff --git a/meta/classes/packa=
gefeed.bbclass b/meta/classes/packagefeed.bbclass<br />new file mode 100644=
<br />index 0000000000..b83ac54f21<br />--- /dev/null<br />+++ b/meta/class=
es/packagefeed.bbclass<br />@@ -0,0 +1,5 @@<br />+#<br />+# Special case of=
 packagegroup that includes package index builds.<br />+#<br />+<br />+inhe=
rit packagegroup package_index<br />--<br />2.30.2<br /><br /><br /><br /><=
/blockquote>
</blockquote>

--0W1UhHVSPSTlZVZFMvr8--

