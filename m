Received: from mail-oa0-f41.google.com ([209.85.219.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1Tr2w7-0000f9-46
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Jan 2013 09:47:37 +0100
Received: by mail-oa0-f41.google.com with SMTP id k14so14999583oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 00:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=bGmNMK8hPiiCRB2UumoY8YyMMGC0xylHDx95A60WPWA=;
	b=xhENUxyhEGJ1s/wK+0/VofobiWTrqIRu5Hx1RN6mosQW9A3w8ze7OKWUUSw496uKdi
	9XB+5bqYGYnZ6+/tKon59IbN4SXpnnbcVOhGCziFyf9A9XTnTsgjgfIdSk6Hem5fgqqp
	FI81BjF0ndNy+xraSYxRi4GkLK0WPeafG7y3mgAYmDYvExqtsw8mkm1C3hJASpTkMMX/
	wcYlopU7md6jq9hMWWxYU7lQR0m5pzyJIOibTXVUUva2Fq1mx/i0TtsUuj4uhbERjLNh
	FbepDKMg15P/OL5SazCfysVX+vbUsRX5kN1SPAFon3WOvBle1GULQA+Sj0WFQnco2Iiy
	bRFg==
MIME-Version: 1.0
Received: by 10.60.31.206 with SMTP id c14mr28748395oei.88.1357288345747; Fri,
	04 Jan 2013 00:32:25 -0800 (PST)
Received: by 10.60.8.39 with HTTP; Fri, 4 Jan 2013 00:32:25 -0800 (PST)
In-Reply-To: <2128976.L3Pq5tyagE@helios>
References: <CAOHjBZvW_wovoRDXuk=sbc-sgf64zLjsZYwDv+1UnXgkrLE_Nw@mail.gmail.com>
	<alpine.DEB.2.02.1212141209200.9553@oneiric>
	<CAOHjBZsawyuAo4zrzoSd3R5GypV=BiNEHc-JD5STmz1mR80G3Q@mail.gmail.com>
	<2128976.L3Pq5tyagE@helios>
Date: Fri, 4 Jan 2013 09:32:25 +0100
Message-ID: <CAOHjBZunBu-nLUcJzVJMBj6VDHFnRKGVWHtZ5n0PEXa4mBbHaQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: gcc-4.7.inc wrong FILESPATH setting?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Jan 2013 08:48:01 -0000
Content-Type: multipart/alternative; boundary=e89a8ff252e0b4c26f04d27251b9

--e89a8ff252e0b4c26f04d27251b9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Paul and all,

coming back to this discussion....
It seems that setting FILESPATH in the gcc .inc file doesn't allow system
to recognize the FILESEXTRAPATHS_prepend setting in the append file.
I'm wondering if you can test this scenario, maybe creating a gcc append
recipe to add a dummy file in the SRC_URI list.

Cheers,
Giuseppe
2012/12/19 Paul Eggleton <paul.eggleton@linux.intel.com>

> On Monday 17 December 2012 14:51:59 Giuseppe Condorelli wrote:
> > 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > > On Fri, 14 Dec 2012, Giuseppe Condorelli wrote:
> > > > 2012/12/14 Robert P. J. Day <rpjday@crashcourse.ca>
> > > >
> > > >       On Fri, 14 Dec 2012, Marko Kati=C4=87 wrote:
> > > >       > On Fri, 2012-12-14 at 17:41 +0100, Giuseppe Condorelli wrot=
e:
> > > >       > > Hi All,
> > > >       > >
> > > >       > > I've seen that, in the given .inc file, the FILESPATH is
> > >
> > > statically
> > >
> > > >       > > set to
> > > >       > >
> > > >       > > FILESPATH =3D "${FILE_DIRNAME}/gcc-4.7"
> > > >       > >
> > > >       > > This seems to avoid any FILESEXTRAPATHS_prepend usage on
> > >
> > > append file.
> > >
> > > >       > > I need to add further patches for gcc-4.7.2 in my own met=
a
> > >
> > > layer but
> > >
> > > >       > > if I set the FILESEXTRAPATHS_prepend as usual
> > > >       > > nothing happens, sources are taken only from the director=
y
> set
> > >
> > > by
> > >
> > > >       > > FILESPATH.
> > > >       > > Also I saw this setting was different in the past
> > > >       > >
> > > >       > > FILESPATH =3D "${@base_set_filespath([
> '${FILE_DIRNAME}/gcc-4.7'
> > >
> > > ], d)}"
> > >
> > > >   i'm fairly sure i posted on this recently.  base.bbclass
> > > >
> > > > *explicitly* sets FILESPATH to a set of variations thusly:
> > > >
> > > > FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
> > >
> > > "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> > >
> > > > which works fine with the recipes in the underlying oe-core layer.
> > > >
> > > >   however, when you use FILESEXTRAPATHS_prepend, you get additional
> > > >
> > > > directories based on *only* the name you specify.  so if you do:
> > > >
> > > > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> > > >
> > > > are you thinking you should also get all variations of "gcc-4.7"?
> > > > because that's not what's going to happen.
> > > >
> > > > I'm sorry, I've not catched your last sentence. I set (as in the
> > > > past) the FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> > > > also updating the SRC_URI inside the .bbappend file to use the
> > > > sources available in the gcc directory available in my own layer.
> > > >
> > >   did you also set THISDIR just above that?
> >
> > No, I don't set it. Is it necessary now?
>
> No, THISDIR is set automatically, you should not set it yourself.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--e89a8ff252e0b4c26f04d27251b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul and all,</div><div>=C2=A0</div><div>coming back to this discus=
sion....</div><div>It seems that setting FILESPATH in the gcc .inc file doe=
sn&#39;t allow system to recognize the FILESEXTRAPATHS_prepend setting in t=
he append file.</div>
<div>I&#39;m wondering if you can test this scenario, maybe creating a gcc =
append recipe to add a dummy file in the SRC_URI list.</div><div>=C2=A0</di=
v><div>Cheers,</div><div>Giuseppe<br></div><div class=3D"gmail_quote">2012/=
12/19 Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@l=
inux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</sp=
an><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"HOEnZb"><div class=3D"h5">On Monday 17 Decem=
ber 2012 14:51:59 Giuseppe Condorelli wrote:<br>

&gt; 2012/12/14 Robert P. J. Day &lt;<a href=3D"mailto:rpjday@crashcourse.c=
a">rpjday@crashcourse.ca</a>&gt;<br>
&gt;<br>
&gt; &gt; On Fri, 14 Dec 2012, Giuseppe Condorelli wrote:<br>
&gt; &gt; &gt; 2012/12/14 Robert P. J. Day &lt;<a href=3D"mailto:rpjday@cra=
shcourse.ca">rpjday@crashcourse.ca</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 On Fri, 14 Dec 2012, Marko Kati=C4=87 w=
rote:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; On Fri, 2012-12-14 at 17:41 +0100,=
 Giuseppe Condorelli wrote:<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; Hi All,<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; I&#39;ve seen that, in the gi=
ven .inc file, the FILESPATH is<br>
&gt; &gt;<br>
&gt; &gt; statically<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; set to<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH =3D &quot;${FILE_DI=
RNAME}/gcc-4.7&quot;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; This seems to avoid any FILES=
EXTRAPATHS_prepend usage on<br>
&gt; &gt;<br>
&gt; &gt; append file.<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; I need to add further patches=
 for gcc-4.7.2 in my own meta<br>
&gt; &gt;<br>
&gt; &gt; layer but<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; if I set the FILESEXTRAPATHS_=
prepend as usual<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; nothing happens, sources are =
taken only from the directory set<br>
&gt; &gt;<br>
&gt; &gt; by<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH.<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; Also I saw this setting was d=
ifferent in the past<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 &gt; &gt; FILESPATH =3D &quot;${@base_s=
et_filespath([ &#39;${FILE_DIRNAME}/gcc-4.7&#39;<br>
&gt; &gt;<br>
&gt; &gt; ], d)}&quot;<br>
&gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 i&#39;m fairly sure i posted on this recently. =C2=A0=
base.bbclass<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; *explicitly* sets FILESPATH to a set of variations thusly:<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FILESPATH =3D &quot;${@base_set_filespath([&quot;${FILE_DIRN=
AME}/${BP}&quot;,<br>
&gt; &gt;<br>
&gt; &gt; &quot;${FILE_DIRNAME}/${BPN}&quot;, &quot;${FILE_DIRNAME}/files&q=
uot;], d)}&quot;<br>
&gt; &gt;<br>
&gt; &gt; &gt; which works fine with the recipes in the underlying oe-core =
layer.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0 however, when you use FILESEXTRAPATHS_prepend, you ge=
t additional<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; directories based on *only* the name you specify. =C2=A0so i=
f you do:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/${PN}:&quot;<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; are you thinking you should also get all variations of &quot=
;gcc-4.7&quot;?<br>
&gt; &gt; &gt; because that&#39;s not what&#39;s going to happen.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m sorry, I&#39;ve not catched your last sentence. I se=
t (as in the<br>
&gt; &gt; &gt; past) the FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/file=
s:&quot;<br>
&gt; &gt; &gt; also updating the SRC_URI inside the .bbappend file to use t=
he<br>
&gt; &gt; &gt; sources available in the gcc directory available in my own l=
ayer.<br>
&gt; &gt; &gt;<br>
&gt; &gt; =C2=A0 did you also set THISDIR just above that?<br>
&gt;<br>
&gt; No, I don&#39;t set it. Is it necessary now?<br>
<br>
</div></div>No, THISDIR is set automatically, you should not set it yoursel=
f.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br>

--e89a8ff252e0b4c26f04d27251b9--
