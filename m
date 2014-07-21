Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id A24BE65DAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 19:52:19 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id e16so5154284lan.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 12:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tGGvpk1swP0Kyuw6qZSGnpDWX+i166pIhFyaLwaXzS8=;
	b=IbWoigS5rivMfohAax7f1pW5X115lBNMCCiT/PSS1dvQYv7eFm+JPJ72I22oEoFpsl
	ckYRc3tgHMn1f17eO0kzgXH/+ge3Qx7j/+Qd11So8bdRAUKhVbtGQgEIKRdswFYTY2UX
	8YYBE5JNyns3HP+ae8EFVB841XgKzIpfg+p3FyZGnc/EjRbcEZW6/Y2b1mSrnt0VRjT9
	k6Wl/ZK5vk9Ak4nTBQYIz7AkovRRyFZ7pg4OXph5jnp5brPOr+WO7ILhP7PKUdRHWqMN
	06EgQ26GRo8eOURCFeB9tSTw1Gk2fuqFMJqeVybAQkpMEU8qtDMc4kYkPRPF3lYyyfDb
	3zyw==
MIME-Version: 1.0
X-Received: by 10.112.30.99 with SMTP id r3mr28221621lbh.14.1405972340759;
	Mon, 21 Jul 2014 12:52:20 -0700 (PDT)
Received: by 10.112.26.210 with HTTP; Mon, 21 Jul 2014 12:52:20 -0700 (PDT)
In-Reply-To: <CAPbeDCkjmKsTHFpKjd4CXBr8LuNP2bKSrQM7zpvCH-GwQzXMaA@mail.gmail.com>
References: <1405946349-16124-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<CAJTo0Lafck2hOcUfpqYTnARMuzLOfNbA-GnnLcHF-oUBnc9zwA@mail.gmail.com>
	<CAPbeDCkjmKsTHFpKjd4CXBr8LuNP2bKSrQM7zpvCH-GwQzXMaA@mail.gmail.com>
Date: Mon, 21 Jul 2014 21:52:20 +0200
Message-ID: <CAPbeDCmXY=hj3Qyxk263utmm+6hW54LFJrNVcaqR5pMwYkDDeg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, clarson@kergoth.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pixbufcache: Add missing dependency on jpeg-native
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
X-List-Received-Date: Mon, 21 Jul 2014 19:52:22 -0000
Content-Type: multipart/alternative; boundary=001a1133a628ef6ba404feb9711a

--001a1133a628ef6ba404feb9711a
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 21, 2014 at 6:00 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Hi Ross,
>
>
> On Mon, Jul 21, 2014 at 2:49 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
>> On 21 July 2014 13:39, Jacob Kroon <jacob.kroon@mikrodidakt.se> wrote:
>> > gdk-pixbuf-native uses png and jpeg loaders. When updating the
>> > loader-cache, these needs to be already populated in the sysroot.
>> >
>> > Although png was present, the jpeg dependency was missing, so add it.
>>
>> But those dependencies are dependent on a PACKAGECONFIG setting, so
>> you'll potentially be forcing a build of libjpeg purely to satisfy a
>> fetch from sstate of a JPEG-disabled gdk-pixbuf.  Also, libtiff and
>> libjasper are missing.
>>
>> If we can't change the sysroot creation order so that the order is
>> zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to
>> be pulled out to a function that can do neater logic, such as iterate
>> through PACKAGECONFIG and add the required dependencies (for each
>> enabled option, turn the build depends into
>> %s-native:do_populate_sysroot_setscene).
>>
>>
> What about something like the patch below. It looks at the package's
> DEPENDS,
> and for native packages just adds them to
>
> do_populate_sysroot[depends]
> do_populate_sysroot_setscene[depends]
>
>
Thinking some more about it I don't see this working either, since it only
guarantees 1-level-of-dependencies to be populated, right ?
Wouldn't the right thing here be to somehow postpone updating the
loader-caches until the entire sysroot is populated ?

--001a1133a628ef6ba404feb9711a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Jul 21, 2014 at 6:00 PM, Jacob Kroon <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"gmail_quote">Hi Ross,<div class=3D""><br><br>On Mon, Jul 21, =
2014 at 2:49 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.=
burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wr=
ote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div>On 21 July 2014 13:3=
9, Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@mikrodidakt.se" target=3D"=
_blank">jacob.kroon@mikrodidakt.se</a>&gt; wrote:<br>


&gt; gdk-pixbuf-native uses png and jpeg loaders. When updating the<br>
&gt; loader-cache, these needs to be already populated in the sysroot.<br>
&gt;<br>
&gt; Although png was present, the jpeg dependency was missing, so add it.<=
br>
<br>
</div>But those dependencies are dependent on a PACKAGECONFIG setting, so<b=
r>
you&#39;ll potentially be forcing a build of libjpeg purely to satisfy a<br=
>
fetch from sstate of a JPEG-disabled gdk-pixbuf. =C2=A0Also, libtiff and<br=
>
libjasper are missing.<br>
<br>
If we can&#39;t change the sysroot creation order so that the order is<br>
zlib, libpng, libjpeg, and then gdk-pixbuf then I think this needs to<br>
be pulled out to a function that can do neater logic, such as iterate<br>
through PACKAGECONFIG and add the required dependencies (for each<br>
enabled option, turn the build depends into<br>
%s-native:do_populate_sysroot_setscene).<br>
<span><font color=3D"#888888"><br></font></span></blockquote><br></div></di=
v><div class=3D"gmail_quote">What about something like the patch below. It =
looks at the package&#39;s DEPENDS,<br>and for native packages just adds th=
em to <br>

<br>do_populate_sysroot[depends]<br>do_populate_sysroot_setscene[depends]<b=
r><br></div></div></div></blockquote><div><br></div><div>Thinking some more=
 about it I don&#39;t see this working either, since it only guarantees 1-l=
evel-of-dependencies to be populated, right ?<br>
</div><div>Wouldn&#39;t the right thing here be to somehow postpone updatin=
g the loader-caches until the entire sysroot is populated ?<br></div></div>=
</div></div>

--001a1133a628ef6ba404feb9711a--
