Received: from kozue.soulik.info (kozue.soulik.info [108.61.200.231])
 by mx.groups.io with SMTP id smtpd.web08.17996.1609395362026586609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 22:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: soulik.info, ip: 108.61.200.231, mailfrom: ayaka@soulik.info)
Received: from [192.168.10.145] (unknown [183.129.223.42])
	by kozue.soulik.info (Postfix) with ESMTPSA id 8B3C2100792;
	Thu, 31 Dec 2020 15:15:41 +0900 (JST)
Mime-Version: 1.0 (1.0)
Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
From: "Randy Li" <ayaka@soulik.info>
X-Mailer: iPad Mail (16D57)
In-Reply-To: <390f5f92da9944a08fea5c65b5e04a10@intel.com>
Date: Thu, 31 Dec 2020 14:15:54 +0800
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Message-Id: <5EC7D728-291A-4A57-B6B7-3989DFAE84E6@soulik.info>
References: <20201229035550.226617-1-ayaka@soulik.info> <0caca27102d49a9897438734f3f0d955ecf17656.camel@linuxfoundation.org> <E4DB717E-1AD6-4B7D-8A6B-91217F3C5769@soulik.info> <390f5f92da9944a08fea5c65b5e04a10@intel.com>
To: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-A559495A-3854-4340-8618-7FE3F364A3E7
Content-Transfer-Encoding: 7bit

--Apple-Mail-A559495A-3854-4340-8618-7FE3F364A3E7
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> On Dec 31, 2020, at 12:43 PM, Saini, Naveen Kumar <naveen.kumar.saini@inte=
l.com> wrote:
>=20
> This failing in case of non-native sdk too, where PKG_CONFIG_SYSROOT_DIR i=
s also exported. It does not prepend PKG_CONFIG_SYSROOT_DIR path.=20
>=20
> I think it should be fixed manually by prepending sysroot path.=20
I was having such plan but Gstreamer people said it should be fixed in OE it=
self
https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/merge_requests/12=
53

>=20
> +  pkgconf_sysroot =3D run_command(python3, '-c', 'import os; print(os.env=
iron.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
>   mfx_incdir =3D mfx_dep.get_pkgconfig_variable('includedir')
> +  mfx_incdir =3D pkgconf_sysroot +  mfx_incdir
>=20
Sorry, I don=E2=80=99t what the non-native sdk means here, since get_pkgconf=
ig_variable('includedir') from meson would apply the pkgconfig sysroot setti=
ng from the meson, it would be fine.
>=20
> Ref: https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-mul=
timedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-openc=
v-data-dir-in-yocto-buil.patch#n26
>=20
>=20
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Randy Li
>> Sent: Thursday, December 31, 2020 9:46 AM
>> To: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nativesdk sysroot
>>=20
>>=20
>>> On Dec 30, 2020, at 10:05 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>>> On Tue, 2020-12-29 at 11:55 +0800, Randy Li wrote:
>>>> I still saw the request for this patch from Gstreamer users
>>>> sometimes. I have verified this version would work fine.
>>>>=20
>>>> Only the exported SDK would need this patch.
>>>=20
>>> Thanks for the patches, is there something we should add to the
>>> automated tests (e.g. in meta/lib/oeqa/sdk/cases) to test this?
>>>=20
>> The original case is that when I was compiling the Gstreamer plugins bad f=
or
>> Intel Media SDK, the include path from the pkg-config would be one withou=
t
>> sysroot. Most of packages won=E2=80=99t meet such problem, they can just o=
rdinary
>> includedir, which is not from meson but compiler I think, then prepend a
>> package name when its code include thems.
>>=20
>> I think this case only fix those package using meson and need to get
>> something likes path information from the pkg-config.
>>=20
>> I have not read the QA part, so I don=E2=80=99t know what is necessary fo=
r such case.
>> Maybe a check for the environment variables from all those auto build too=
ls ?
>> I need to read and make the right comment as well as I welcome the idea
>> from the others.
>>> Cheers,
>>>=20
>>> Richard
>>>=20
>> Sincerely
>> Randy

--Apple-Mail-A559495A-3854-4340-8618-7FE3F364A3E7
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><br><div dir=3D"ltr"><br>On Dec 31, 2020, a=
t 12:43 PM, Saini, Naveen Kumar &lt;<a href=3D"mailto:naveen.kumar.saini@int=
el.com">naveen.kumar.saini@intel.com</a>&gt; wrote:<br><br></div><blockquote=
 type=3D"cite"><div dir=3D"ltr"><span>This failing in case of non-native sdk=
 too, where PKG_CONFIG_SYSROOT_DIR is also exported. It does not prepend PKG=
_CONFIG_SYSROOT_DIR path. </span><br><span></span><br><span>I think it shoul=
d be fixed manually by prepending sysroot path. </span><br></div></blockquot=
e>I was having such plan but Gstreamer people said it should be fixed in OE i=
tself<div><a href=3D"https://gitlab.freedesktop.org/gstreamer/gst-plugins-ba=
d/-/merge_requests/1253">https://gitlab.freedesktop.org/gstreamer/gst-plugin=
s-bad/-/merge_requests/1253</a></div><div><br><blockquote type=3D"cite"><div=
 dir=3D"ltr"><span></span><br><span>+ &nbsp;pkgconf_sysroot =3D run_command(=
python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))')=
.stdout().strip()</span><br><span> &nbsp;&nbsp;mfx_incdir =3D mfx_dep.get_pk=
gconfig_variable('includedir')</span><br><span>+ &nbsp;mfx_incdir =3D pkgcon=
f_sysroot + &nbsp;mfx_incdir</span><br><span></span><br></div></blockquote>S=
orry, I don=E2=80=99t what the non-native sdk means here, since g<span style=
=3D"background-color: rgba(255, 255, 255, 0);">et_pkgconfig_variable('includ=
edir') from meson would apply the pkgconfig sysroot setting from the meson, i=
t would be fine.</span><blockquote type=3D"cite"><div dir=3D"ltr"><span>Ref:=
 <a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipe=
s-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-missing-=
opencv-data-dir-in-yocto-buil.patch#n26">https://git.yoctoproject.org/cgit/c=
git.cgi/poky/tree/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad=
/0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch#n26</a></sp=
an><br><span></span><br><span></span><br><blockquote type=3D"cite"><span>---=
--Original Message-----</span><br></blockquote><blockquote type=3D"cite"><sp=
an>From: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openemb=
edded-core@lists.openembedded.org</a> &lt;openembedded-</span><br></blockquo=
te><blockquote type=3D"cite"><span><a href=3D"mailto:core@lists.openembedded=
.org">core@lists.openembedded.org</a>&gt; On Behalf Of Randy Li</span><br></=
blockquote><blockquote type=3D"cite"><span>Sent: Thursday, December 31, 2020=
 9:46 AM</span><br></blockquote><blockquote type=3D"cite"><span>To: Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purd=
ie@linuxfoundation.org</a>&gt;</span><br></blockquote><blockquote type=3D"ci=
te"><span>Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">op=
enembedded-core@lists.openembedded.org</a></span><br></blockquote><blockquot=
e type=3D"cite"><span>Subject: Re: [OE-core] [PATCH v2 0/2] meson: fixup nat=
ivesdk sysroot</span><br></blockquote><blockquote type=3D"cite"><span></span=
><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><span>On Dec 30, 2020, at 1=
0:05 PM, Richard Purdie</span><br></blockquote></blockquote><blockquote type=
=3D"cite"><span>&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:</span><br></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote=
></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquot=
e type=3D"cite"><span>On Tue, 2020-12-29 at 11:55 +0800, Randy Li wrote:</sp=
an><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><blo=
ckquote type=3D"cite"><blockquote type=3D"cite"><span>I still saw the reques=
t for this patch from Gstreamer users</span><br></blockquote></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>sometimes. I have verified this version would work fine.<=
/span><br></blockquote></blockquote></blockquote><blockquote type=3D"cite"><=
blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockq=
uote></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span>Only the exported SDK would need this=
 patch.</span><br></blockquote></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>Thanks for the pat=
ches, is there something we should add to the</span><br></blockquote></block=
quote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>automated te=
sts (e.g. in meta/lib/oeqa/sdk/cases) to test this?</span><br></blockquote><=
/blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span=
><br></blockquote></blockquote><blockquote type=3D"cite"><span>The original c=
ase is that when I was compiling the Gstreamer plugins bad for</span><br></b=
lockquote><blockquote type=3D"cite"><span>Intel Media SDK, the include path f=
rom the pkg-config would be one without</span><br></blockquote><blockquote t=
ype=3D"cite"><span>sysroot. Most of packages won=E2=80=99t meet such problem=
, they can just ordinary</span><br></blockquote><blockquote type=3D"cite"><s=
pan>includedir, which is not from meson but compiler I think, then prepend a=
</span><br></blockquote><blockquote type=3D"cite"><span>package name when it=
s code include thems.</span><br></blockquote><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>I think this case o=
nly fix those package using meson and need to get</span><br></blockquote><bl=
ockquote type=3D"cite"><span>something likes path information from the pkg-c=
onfig.</span><br></blockquote><blockquote type=3D"cite"><span></span><br></b=
lockquote><blockquote type=3D"cite"><span>I have not read the QA part, so I d=
on=E2=80=99t know what is necessary for such case.</span><br></blockquote><b=
lockquote type=3D"cite"><span>Maybe a check for the environment variables fr=
om all those auto build tools ?</span><br></blockquote><blockquote type=3D"c=
ite"><span>I need to read and make the right comment as well as I welcome th=
e idea</span><br></blockquote><blockquote type=3D"cite"><span>from the other=
s.</span><br></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite=
"><span>Cheers,</span><br></blockquote></blockquote><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote><bloc=
kquote type=3D"cite"><blockquote type=3D"cite"><span>Richard</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an></span><br></blockquote></blockquote><blockquote type=3D"cite"><span>Sinc=
erely</span><br></blockquote><blockquote type=3D"cite"><span>Randy</span><br=
></blockquote></div></blockquote></div></body></html>=

--Apple-Mail-A559495A-3854-4340-8618-7FE3F364A3E7--
