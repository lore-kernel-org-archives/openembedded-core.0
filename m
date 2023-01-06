Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A2F4C54EBD
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 18:52:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.1595.1673031166139444996
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 10:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?iso-8859-2?Q?Petr_Kubiz=F2=E1k_-_2N?= <Kubiznak@2n.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Topic: [OE-core][PATCH 1/2] gobject-introspection: check for
 GI_DATA_ENABLED
Thread-Index: AQHZIDIvVR7HPOD4Nkm3C4IeSj1LKa6OJ86sgAACnh////a/gIABuyOa///zXQCAAcyOyA==
Date: Fri, 6 Jan 2023 18:52:43 +0000
Message-ID: <e46977d84bbc4fd6ba7966b02937e8e9@2n.com>
References: <20230104114555.575278-1-kubiznak@2n.com>
 <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com>
 <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com>,<CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
In-Reply-To: <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/alternative;
	boundary="_000_e46977d84bbc4fd6ba7966b02937e8e92ncom_"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 18:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175611

--_000_e46977d84bbc4fd6ba7966b02937e8e92ncom_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

rust_1.66.0 and webkitgtk_2.38.2 keep failing to build in any setup (includ=
ing g-i enabled and no patch applied) on my side.


What's more interesting, with no patch applied and g-i disabled, graphene_1=
.10.8 fails to build ("Failed to parse included gir GObject-2.0").


When the patch is _applied_ and g-i is _disabled_, graphene does build, but=
 some other packages don't:


gconf_3.2.6.bb:do_configure:
/home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky-linux/gc=
onf/3.2.6-r0/temp/run.do_configure.2180034: 225: glib-gettextize: not found


python3-pygobject_3.42.2.bb:do_configure:

Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig an=
d cmake)

Looking for a fallback subproject for the dependency gobject-introspection-=
1.0
../pygobject-3.42.2/meson.build:29:0: ERROR: Automatic wrap-based subprojec=
t downloading is disabled

avahi_0.8.bb:do_compile:
/bin/bash: line 2: glib-mkenums: command not found

gtk4_4.8.2.bb:do_configure:
Run-time dependency graphene-gobject-1.0 found: NO (tried pkgconfig and cma=
ke)
Looking for a fallback subproject for the dependency graphene-gobject-1.0
../gtk-4.8.2/meson.build:440:0: ERROR: Automatic wrap-based subproject down=
loading is disabled


This shows that these packages depend on gobject-introspection and/or its d=
ependencies no matter whether introspection is enabled or disabled. I don't=
 know these packages so I don't think I'm able to patch them properly. On t=
he other hand, I still believe it is incorrect to pull in the unnecessary d=
ependencies when g-i is disabled. What do you think?


Petr


________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, January 5, 2023 3:17:16 PM
To: Petr Kubiz=F2=E1k - 2N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_=
ENABLED

We do run world on every master tip, so yes it should succeed. It
doesn't seem to be related to disabling introspection, but you might
want to retry with it enabled to be sure.

If target rust continues to fail no matter what you try, then 'bitbake
-k world' will continue building what it can when fails occur.

Alex

On Thu, 5 Jan 2023 at 15:13, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
>
> Is the `bitbake world` command guaranteed to succeed for every commit in =
the repository? In my case, I end up with failures even with _default_ setu=
p. My point is whether this has to be an issue on my machine (e.g. native t=
ools?), or I should just try a different commit.
>
>
> Build Configuration:
> BB_VERSION           =3D "2.2.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "universal"
> TARGET_SYS           =3D "x86_64-poky-linux"
> MACHINE              =3D "qemux86-64"
> DISTRO               =3D "poky"
> DISTRO_VERSION       =3D "4.1"
> TUNE_FEATURES        =3D "m64 core2"
> TARGET_FPU           =3D ""
> meta
> meta-poky
> meta-yocto-bsp       =3D "HEAD:2c6f0b9228b47459dd1b67d578792cd017006128"
> ...
> ERROR: rust-1.66.0-r0 do_compile: ExecutionError('/home/kubiznak/projects=
/poky/builds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/run.d=
o_compile.1080378', 1, None, None)
> ERROR: Logfile of failure stored in: /home/kubiznak/projects/poky/builds/=
test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/log.do_compile.108=
0378
> NOTE: recipe rust-1.66.0-r0: task do_compile: Failed
> ERROR: Task (/home/kubiznak/projects/poky/meta/recipes-devtools/rust/rust=
_1.66.0.bb:do_compile) failed with exit code '1'
>
> The first error in rust log:
>
> error: /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky=
-linux/rust/1.66.0-r0/rustc-1.66.0-src/build/x86_64-unknown-linux-gnu/stage=
1-rustc/release/deps/libunic_langid_macros_impl-09018f99e8b09dcb.so: undefi=
ned symbol: _Ungind_Resume
>  --> /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-poky-l=
inux/rust/1.66.0-r0/rustc-1.66.0-src/vendor/unic-langid-macros/src/lib.rs:5=
:9
>   |
> 5 | pub use unic_langid_macros_impl::langid;
>   |         ^^^^^^^^^^^^^^^^^^^^^^^
>
> Full logs attached.
>
>
> Petr
>
> ________________________________
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Wednesday, January 4, 2023 1:36:27 PM
> To: Petr Kubiz=F2=E1k - 2N
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DAT=
A_ENABLED
>
> On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=F2=E1k <kubiznak@2n.com> wrote:
> > Yes, that's exactly the reason. I'm particularly concerned about depend=
ency on glib, but other dependencies are unnecessary, too.
> >
> >
> > This change was sufficient to remove the dependency from the target. I =
am not aware of potential consequences of removing the -native dependencies=
, but if you think it should also be done, I'm happy to update the patch. P=
lease let me know.
>
> I'd suggest that you remove all three, then set up a plain poky master
> build with gobject-introspection-data disabled, and issue bitbake
> world.
>
> Component upstreams generally only test the gi-enabled configuration,
> so this may reveal incorrect upstream logic when g-i is disabled.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175529): https://lists.openembedded.org/g/openembedde=
d-core/message/175529
> Mute This Topic: https://lists.openembedded.org/mt/96048399/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--_000_e46977d84bbc4fd6ba7966b02937e8e92ncom_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;Apple=
 Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe UI=
 Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p><span style=3D"font-size:12pt">rust_1.66.0 and webkitgtk_2.38.2 keep fai=
ling to build in any setup (including g-i enabled and no patch applied) on =
my side.</span><br>
</p>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:rgb(0,0,0); font-family:Calibri,Helvetica,sans-serif,EmojiFont,&quot;App=
le Color Emoji&quot;,&quot;Segoe UI Emoji&quot;,NotoColorEmoji,&quot;Segoe =
UI Symbol&quot;,&quot;Android Emoji&quot;,EmojiSymbols">
<p><br>
</p>
<p>What's more interesting, with no patch applied and g-i disabled, graphen=
e_1.10.8 fails to build (&quot;Failed to parse included gir GObject-2.0&quo=
t;).</p>
<p><br>
</p>
<p>When the patch is _applied_ and g-i is _disabled_, graphene does build, =
but some&nbsp;other packages don't:</p>
<p><br>
</p>
<p><span>gconf_3.2.6.bb:do_configure:<br>
</span><span style=3D"font-size:12pt">/home/kubiznak/projects/poky/builds/t=
est-gi/tmp/work/core2-64-poky-linux/gconf/3.2.6-r0/temp/run.do_configure.21=
80034: 225: glib-gettextize: not found</span></p>
<p><span style=3D"font-size:12pt"><br>
</span></p>
<p><span style=3D"font-size:12pt"></span><span style=3D"font-size:12pt">pyt=
hon3-pygobject_3.42.2.bb:do_configure:</span></p>
<p><span style=3D"font-size:12pt">Run-time dependency gobject-introspection=
-1.0 found: NO (tried pkgconfig and cmake)</span></p>
<div>Looking for a fallback subproject for the dependency gobject-introspec=
tion-1.0</div>
<div><span style=3D"font-size:12pt">../pygobject-3.42.2/meson.build:29:0: E=
RROR: Automatic wrap-based subproject downloading is disabled</span><br>
</div>
<div><br>
</div>
<span>avahi_0.8.bb:do_compile:<br>
</span><span style=3D"font-size:12pt">/bin/bash: line 2: glib-mkenums: comm=
and not found</span>
<div><br>
</div>
<span>gtk4_4.8.2.bb:do_configure:<br>
</span><span style=3D"font-size:12pt">Run-time dependency graphene-gobject-=
1.0 found: NO (tried pkgconfig and cmake)</span>
<div>Looking for a fallback subproject for the dependency graphene-gobject-=
1.0</div>
<div><span style=3D"font-size:12pt">../gtk-4.8.2/meson.build:440:0: ERROR: =
Automatic wrap-based subproject downloading is disabled</span><br>
</div>
<div><br>
</div>
<p></p>
<p><span>This shows that these packages depend on gobject-introspection and=
/or its dependencies no matter whether introspection is enabled or disabled=
. I don't know these packages so I don't think I'm able to patch them prope=
rly. On the other hand, I still
 believe it is incorrect to pull in the unnecessary dependencies when g-i i=
s&nbsp;disabled. What do you think?</span></p>
<p><span><br>
</span></p>
<p><span>Petr</span></p>
<p><span><br>
</span></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alexander Kanavin &=
lt;alex.kanavin@gmail.com&gt;<br>
<b>Sent:</b> Thursday, January 5, 2023 3:17:16 PM<br>
<b>To:</b> Petr Kubiz=F2=E1k - 2N<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core][PATCH 1/2] gobject-introspection: check for G=
I_DATA_ENABLED</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div class=3D"PlainText">We do run world on every master tip, so yes it sho=
uld succeed. It<br>
doesn't seem to be related to disabling introspection, but you might<br>
want to retry with it enabled to be sure.<br>
<br>
If target rust continues to fail no matter what you try, then 'bitbake<br>
-k world' will continue building what it can when fails occur.<br>
<br>
Alex<br>
<br>
On Thu, 5 Jan 2023 at 15:13, Petr Kubiz=F2=E1k &lt;kubiznak@2n.com&gt; wrot=
e:<br>
&gt;<br>
&gt; Is the `bitbake world` command guaranteed to succeed for every commit =
in the repository? In my case, I end up with failures even with _default_ s=
etup. My point is whether this has to be an issue on my machine (e.g. nativ=
e tools?), or I should just try a different
 commit.<br>
&gt;<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;2.2.0&quot;<br>
&gt; BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;universal&quot=
;<br>
&gt; TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;x86_64-poky-linux&quot;<br>
&gt; MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; =3D &quot;qemux86-64&quot;<br>
&gt; DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D &quot;poky&quot;<br>
&gt; DISTRO_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;4.1&quot;=
<br>
&gt; TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;m64 =
core2&quot;<br>
&gt; TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 =3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;HEAD:2c6f=
0b9228b47459dd1b67d578792cd017006128&quot;<br>
&gt; ...<br>
&gt; ERROR: rust-1.66.0-r0 do_compile: ExecutionError('/home/kubiznak/proje=
cts/poky/builds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/ru=
n.do_compile.1080378', 1, None, None)<br>
&gt; ERROR: Logfile of failure stored in: /home/kubiznak/projects/poky/buil=
ds/test-gi/tmp/work/core2-64-poky-linux/rust/1.66.0-r0/temp/log.do_compile.=
1080378<br>
&gt; NOTE: recipe rust-1.66.0-r0: task do_compile: Failed<br>
&gt; ERROR: Task (/home/kubiznak/projects/poky/meta/recipes-devtools/rust/r=
ust_1.66.0.bb:do_compile) failed with exit code '1'<br>
&gt;<br>
&gt; The first error in rust log:<br>
&gt;<br>
&gt; error: /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core2-64-p=
oky-linux/rust/1.66.0-r0/rustc-1.66.0-src/build/x86_64-unknown-linux-gnu/st=
age1-rustc/release/deps/libunic_langid_macros_impl-09018f99e8b09dcb.so: und=
efined symbol: _Ungind_Resume<br>
&gt;&nbsp; --&gt; /home/kubiznak/projects/poky/builds/test-gi/tmp/work/core=
2-64-poky-linux/rust/1.66.0-r0/rustc-1.66.0-src/vendor/unic-langid-macros/s=
rc/lib.rs:5:9<br>
&gt;&nbsp;&nbsp; |<br>
&gt; 5 | pub use unic_langid_macros_impl::langid;<br>
&gt;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^^^^^^^^=
^^^^^^^^^^^^^^^<br>
&gt;<br>
&gt; Full logs attached.<br>
&gt;<br>
&gt;<br>
&gt; Petr<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
&gt; Sent: Wednesday, January 4, 2023 1:36:27 PM<br>
&gt; To: Petr Kubiz=F2=E1k - 2N<br>
&gt; Cc: openembedded-core@lists.openembedded.org<br>
&gt; Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_=
DATA_ENABLED<br>
&gt;<br>
&gt; On Wed, 4 Jan 2023 at 13:24, Petr Kubiz=F2=E1k &lt;kubiznak@2n.com&gt;=
 wrote:<br>
&gt; &gt; Yes, that's exactly the reason. I'm particularly concerned about =
dependency on glib, but other dependencies are unnecessary, too.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This change was sufficient to remove the dependency from the targ=
et. I am not aware of potential consequences of removing the -native depend=
encies, but if you think it should also be done, I'm happy to update the pa=
tch. Please let me know.<br>
&gt;<br>
&gt; I'd suggest that you remove all three, then set up a plain poky master=
<br>
&gt; build with gobject-introspection-data disabled, and issue bitbake<br>
&gt; world.<br>
&gt;<br>
&gt; Component upstreams generally only test the gi-enabled configuration,<=
br>
&gt; so this may reveal incorrect upstream logic when g-i is disabled.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#175529): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/175529" id=3D"LPlnk945513" previewremoved=3D"t=
rue">
https://lists.openembedded.org/g/openembedded-core/message/175529</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96048399=
/1686489" id=3D"LPlnk176257" previewremoved=3D"true">
https://lists.openembedded.org/mt/96048399/1686489</a><br>
&gt; Group Owner: openembedded-core&#43;owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" id=3D"LPlnk918936" previewremoved=3D"true">
https://lists.openembedded.org/g/openembedded-core/unsub</a> [alex.kanavin@=
gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_e46977d84bbc4fd6ba7966b02937e8e92ncom_--

