Return-Path: <andrea.adami@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2E18273E11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 09:50:06 +0000 (UTC)
Received: by igfj19 with SMTP id j19so33272005igf.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 02:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=lfQU3gKHAAT3C/VWtDkVeJLmAsAb+K1aW5RjhAOp9kI=;
	b=sSWMswHzfhk1DTpJYySXX8Y5wZBFiXO8qLSvKPmQ+ezNF5fvpq6FLKCJENkJXNwb5I
	UmBFB3KGqMBxAP3rslKNYv+mKyzcBOTCOihCvoJ/I56czMrY7zGka0ZCXxq9jO5f4TGJ
	pHkhA2kt/r6pxVmbBeZ+IW55FpKBBYsOc0eB11pxTYxhBuEKmP48BFE1OaQB/gBEs2r2
	tziB7I8gFKj0kcdNT7FBZevYKBBVuZl0MEbWUHDGDsxWgAm5SLbxSREoepUl/SEpYM7y
	Jh/a9+mrtf+IEHY1pkAERlfv5sRtMYE3b8ZdvLKWsYblsCvxsQBcz7yN5Kja7UhyNVl3
	aDaQ==
MIME-Version: 1.0
X-Received: by 10.50.117.98 with SMTP id kd2mr7226022igb.78.1440237006847;
	Sat, 22 Aug 2015 02:50:06 -0700 (PDT)
Received: by 10.36.158.5 with HTTP; Sat, 22 Aug 2015 02:50:06 -0700 (PDT)
In-Reply-To: <CAAQYJAugiMk95tg9rKk1PXfWQ4HXZXZnHeyHbjvWSQgfJ9kAOg@mail.gmail.com>
References: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
	<CAJ86T=XmEdEQWhpSR9nZsnqn+pZqBdZmNqtfnKfXDx52CGXaxw@mail.gmail.com>
	<CAAQYJAugiMk95tg9rKk1PXfWQ4HXZXZnHeyHbjvWSQgfJ9kAOg@mail.gmail.com>
Date: Sat, 22 Aug 2015 11:50:06 +0200
Message-ID: <CAAQYJAt1ErcWAXsW4wTdYVOU7GoD3fwwU6HWrypEeJe5rymOnw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: add dependency on acl
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
X-List-Received-Date: Sat, 22 Aug 2015 09:50:09 -0000
Content-Type: multipart/alternative; boundary=089e011608f42fa6a5051de34f38

--089e011608f42fa6a5051de34f38
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 22, 2015 at 11:47 AM, Andrea Adami <andrea.adami@gmail.com>
wrote:

>
>
> On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
>
>> On Fri, Aug 21, 2015 at 4:28 PM, Andrea Adami <andrea.adami@gmail.com>
>> wrote:
>> > After commit 24fde4d do_compile fails:
>> >
>> > | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
>> > |  #include <sys/acl.h>
>> >
>> > Adding acl to the list of dependencies fixes the build.
>>
>> Unconditionally enabling xattr and acl support is OK for the native
>> build, but for the target both should probably be conditional on their
>> respective DISTRO_FEATURES.
>>
>
> I can agree, acl is one distro feature but atm it is not used by nodistro
> and poky.
> So the patch unconditionally  -DWITHOUT_XATTR seems wrong...this should be
> done only if acl is used.
>


ofc I meant unconditionally removing -DWITHOUT_XATTR
( commit24fde4d983cc8f056177de6c1ad308369f6279ad )
<http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/mtd/mtd-utils_git.bb?id=24fde4d983cc8f056177de6c1ad308369f6279ad>


>
> Andrea
>
>
>
>>
>>
>> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>> > ---
>> >  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> > index 8d4892a..72ce9ed 100644
>> > --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> > +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
>> > @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
>> >  LIC_FILES_CHKSUM =
>> "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>> >
>> file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
>> >
>> > -DEPENDS = "zlib lzo e2fsprogs util-linux"
>> > +DEPENDS = "zlib lzo e2fsprogs util-linux acl"
>> >
>> >  PV = "1.5.1+git${SRCPV}"
>> >
>> > --
>> > 1.9.1
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--089e011608f42fa6a5051de34f38
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Aug 22, 2015 at 11:47 AM, Andrea Adami <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:andrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"l=
tr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span cla=
ss=3D"">On Sat, Aug 22, 2015 at 2:44 AM, Andre McCurdy <span dir=3D"ltr">&l=
t;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On Fri, A=
ug 21, 2015 at 4:28 PM, Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gma=
il.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt; wrote:<br>
&gt; After commit 24fde4d do_compile fails:<br>
&gt;<br>
&gt; | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or director=
y<br>
&gt; |=C2=A0 #include &lt;sys/acl.h&gt;<br>
&gt;<br>
&gt; Adding acl to the list of dependencies fixes the build.<br>
<br>
</span>Unconditionally enabling xattr and acl support is OK for the native<=
br>
build, but for the target both should probably be conditional on their<br>
respective DISTRO_FEATURES.<br></blockquote><div><br></div></span><div>I ca=
n agree, acl is one distro feature but atm it is not used by nodistro and p=
oky.<br></div><div>So the patch unconditionally=C2=A0 -DWITHOUT_XATTR seems=
 wrong...this should be done only if acl is used.<span class=3D"HOEnZb"><fo=
nt color=3D"#888888"><br></font></span></div></div></div></div></blockquote=
><div><br><br></div><div>ofc I meant unconditionally removing -DWITHOUT_XAT=
TR<br>( commit<a href=3D"http://cgit.openembedded.org/openembedded-core/com=
mit/meta/recipes-devtools/mtd/mtd-utils_git.bb?id=3D24fde4d983cc8f056177de6=
c1ad308369f6279ad">24fde4d983cc8f056177de6c1ad308369f6279ad )</a></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"=
gmail_extra"><div class=3D"gmail_quote"><div><span class=3D"HOEnZb"><font c=
olor=3D"#888888"></font></span></div><span class=3D"HOEnZb"><font color=3D"=
#888888"><div><br></div><div>Andrea<br></div></font></span><span class=3D""=
><div><br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div><br>
<br>
&gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.c=
om" target=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git=
.bb" rel=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a> b/meta/recip=
es-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mtd-utils_git.bb</a><br>
&gt; index 8d4892a..72ce9ed 100644<br>
&gt; --- a/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; +++ b/meta/recipes-devtools/mtd/<a href=3D"http://mtd-utils_git.bb" re=
l=3D"noreferrer" target=3D"_blank">mtd-utils_git.bb</a><br>
&gt; @@ -5,7 +5,7 @@ LICENSE =3D &quot;GPLv2+&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0215e8d=
672dc4c32c317bb3 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://include/common.h;beginline=3D1;endline=3D17;md5=3Dba05b07912a=
44ea2bf81ce409380049c&quot;<br>
&gt;<br>
&gt; -DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux&quot;<br>
&gt; +DEPENDS =3D &quot;zlib lzo e2fsprogs util-linux acl&quot;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;1.5.1+git${SRCPV}&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 1.9.1<br>
&gt;<br>
</div></div><span><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</font></span></blockquote></span></div><br></div></div>
</blockquote></div><br></div></div>

--089e011608f42fa6a5051de34f38--
