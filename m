Return-Path: <andrea.adami@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1D7765A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:46:01 +0000 (UTC)
Received: by iodt126 with SMTP id t126so187157997iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 06:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pm6aK2STcOc8ti5jNwexdre+kGrgoehYLmMic2aPaW8=;
	b=ClWi1K6LHGhSgkRTKkgl3iY4YC9IcrD6FEgO3SQ263MbtKSB2wwW/n/sMNc5WGypI6
	2Dbp45jJZW7b6qIoO4uZA/4He3Gd/75J2ORRZGk6wq/q9Ukotz06GuTtmE6mqeQrDpLo
	spshz941I4kc4kOdqLCbwJJ+VbKBuO5T67UY5W0I/1VOnvKlCYT6xqaUJywdDnuOzDLv
	waBBJNUEZPRGNIZzfDWgjtXFQHUSCaoQZf7ySrn34UaV1zkUTttYwFLjEsw7WtQ2vif5
	i3Ghktn5xGR4/dseat8SN1Nr+pE9QvLaZC5DFHo8O3Z/683nf1ZpJJ0nRdd+0DeeDgqy
	8eIw==
MIME-Version: 1.0
X-Received: by 10.107.168.40 with SMTP id r40mr22602910ioe.20.1440510362102;
	Tue, 25 Aug 2015 06:46:02 -0700 (PDT)
Received: by 10.36.158.5 with HTTP; Tue, 25 Aug 2015 06:46:02 -0700 (PDT)
In-Reply-To: <55DC6D05.7010107@windriver.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<6af40fe1752b8cf25efca4a906361c4437249841.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LbMmZ9rf-Jq_XoGJzTCj_0E=1qene_ooyf_T_nWsH60Jw@mail.gmail.com>
	<1439372036.28153.29.camel@intel.com>
	<CAJTo0LYZg-gX1_-qeiJ2O1KDDhoYGi0BdJJp3z=hBhYhma9TVA@mail.gmail.com>
	<1440503201.24929.53.camel@intel.com>
	<55DC6D05.7010107@windriver.com>
Date: Tue, 25 Aug 2015 15:46:02 +0200
Message-ID: <CAAQYJAtLfJ-Z57kY=7DfA3_EE6shLdsGX+qBF1RPYDJrY3cxZQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] mtd-utils: keep xattr support enabled
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
X-List-Received-Date: Tue, 25 Aug 2015 13:46:04 -0000
Content-Type: multipart/alternative; boundary=001a11425c526db03c051e22f409

--001a11425c526db03c051e22f409
Content-Type: text/plain; charset=UTF-8

Patrick,

sorry I didn't put you in cc.
My quick&dirty workaround: http://patchwork.openembedded.org/patch/101169/

Cheers

Andrea

On Tue, Aug 25, 2015 at 3:26 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 8/25/15 6:46 AM, Patrick Ohly wrote:
> > On Fri, 2015-08-14 at 11:51 +0100, Burton, Ross wrote:
> >>
> >> On 12 August 2015 at 10:33, Patrick Ohly <patrick.ohly@intel.com>
> >> wrote:
> >>         > There's a "xattr" DISTRO_FEATURE that should be respected
> >>         here for
> >>         > target builds (and explicitly enabled for native I guess).
> >>
> >>         I can add that check, if you want.
> >>
> >>         > Does enabling xattr mean adding build dependencies?
> >>
> >>         No, the conditional code uses lgetxattr and llistxattr, which
> >>         are in
> >>         glibc.
> >>
> >>
> >> From five seconds of google it looks like these are in musl and uclibc
> >> too, so I've merged this  to MUT as-is.
> >
> > However, it turned out that the XATTR code also introduces a dependency
> > on sys/acl.h:
> >
> > mkfs.jffs2.c:
> >
> > #ifndef WITHOUT_XATTR
> > #include <sys/xattr.h>
> > #include <sys/acl.h>
> > #endif
> >
> > sys/acl.h gets provided by acl, so it may or may not work depending on
> > build order and files on the host.
> >
> > I hadn't caught that because I had only looked at library dependencies,
> > sorry for that.
> >
> > What's the right fix? Add the dependency on acl-native in the native
> > case, disable XATTR support for target builds (same state as before) or
> > make it somehow depend on both "xattr" and "acl" distro features?
> >
> > Or only check for "xattr"? I'm uncertain how the two are related.
> >
>
> Use PACKAGECONFIG, add xattr as a configuration that in turn adds the
> 'acl' as a
> dependency.  Then acl-native will automatically be converted from 'acl' if
> the
> '-native' version is built.
>
> This is typically how I've seen it implemented in other places.  (Not
> necessary
> xattr.. but with the push for more Linux Security Models coming from users
> and
> other layers, I think xattr is something we need to make sure really works
> properly.)
>
> --Mark
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11425c526db03c051e22f409
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Patrick,<br><br></div>sorry I didn&#39=
;t put you in cc.<br></div>My quick&amp;dirty workaround: <a href=3D"http:/=
/patchwork.openembedded.org/patch/101169/">http://patchwork.openembedded.or=
g/patch/101169/</a><br><br></div>Cheers<br><br></div>Andrea<br></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 25, 2015 at=
 3:26 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@win=
driver.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"=
>On 8/25/15 6:46 AM, Patrick Ohly wrote:<br>
&gt; On Fri, 2015-08-14 at 11:51 +0100, Burton, Ross wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 12 August 2015 at 10:33, Patrick Ohly &lt;<a href=3D"mailto:pat=
rick.ohly@intel.com">patrick.ohly@intel.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; There&#39;s a &quot;xattr&qu=
ot; DISTRO_FEATURE that should be respected<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0here for<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; target builds (and explicitl=
y enabled for native I guess).<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I can add that check, if you want=
.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Does enabling xattr mean add=
ing build dependencies?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0No, the conditional code uses lge=
txattr and llistxattr, which<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0are in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; From five seconds of google it looks like these are in musl and uc=
libc<br>
&gt;&gt; too, so I&#39;ve merged this=C2=A0 to MUT as-is.<br>
&gt;<br>
&gt; However, it turned out that the XATTR code also introduces a dependenc=
y<br>
&gt; on sys/acl.h:<br>
&gt;<br>
&gt; mkfs.jffs2.c:<br>
&gt;<br>
&gt; #ifndef WITHOUT_XATTR<br>
&gt; #include &lt;sys/xattr.h&gt;<br>
&gt; #include &lt;sys/acl.h&gt;<br>
&gt; #endif<br>
&gt;<br>
&gt; sys/acl.h gets provided by acl, so it may or may not work depending on=
<br>
&gt; build order and files on the host.<br>
&gt;<br>
&gt; I hadn&#39;t caught that because I had only looked at library dependen=
cies,<br>
&gt; sorry for that.<br>
&gt;<br>
&gt; What&#39;s the right fix? Add the dependency on acl-native in the nati=
ve<br>
&gt; case, disable XATTR support for target builds (same state as before) o=
r<br>
&gt; make it somehow depend on both &quot;xattr&quot; and &quot;acl&quot; d=
istro features?<br>
&gt;<br>
&gt; Or only check for &quot;xattr&quot;? I&#39;m uncertain how the two are=
 related.<br>
&gt;<br>
<br>
</div></div>Use PACKAGECONFIG, add xattr as a configuration that in turn ad=
ds the &#39;acl&#39; as a<br>
dependency.=C2=A0 Then acl-native will automatically be converted from &#39=
;acl&#39; if the<br>
&#39;-native&#39; version is built.<br>
<br>
This is typically how I&#39;ve seen it implemented in other places.=C2=A0 (=
Not necessary<br>
xattr.. but with the push for more Linux Security Models coming from users =
and<br>
other layers, I think xattr is something we need to make sure really works<=
br>
properly.)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11425c526db03c051e22f409--
