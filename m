Received: from mail-la0-f52.google.com ([209.85.215.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1U0elt-0000iL-BT
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 22:00:44 +0100
Received: by mail-la0-f52.google.com with SMTP id fs12so1421840lab.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 12:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=9vuo+YsGO5LTPtCfIyhBaqPLR37KMINNyJC8HZHmH5w=;
	b=oT+LU/Dw4ZMaDx6M2ztcjyzXmP1OYpJp+vQylj/KuRcH1wrVjH7hmJz389Pvms199C
	HllwK3Kur9jfyo7dhGP0jbZZM7HNusesPfbtPX0mQR7t40AZyGTfITDJRMwod7O/YNDe
	AR6OoW290hWTBHxB+40of6z8XlZ7wk5CqzMBufGgxeVu8MhnRtsTjbHsVYYiczQKrK4V
	DD+7w249oOWu+kOrTya67Ek33WyY1Fp9dbPcXLaHPDvGUfkEogjD1qQObTM+04Iz6tps
	QBSdqJd9djNjz9zTt84fqxwBq76G5um1JCHiJfvc9TTuSIHn+2+MNurzxYHAz33xy52X
	AzOA==
X-Received: by 10.112.99.2 with SMTP id em2mr2475084lbb.11.1359578699322; Wed,
	30 Jan 2013 12:44:59 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.34.10 with HTTP; Wed, 30 Jan 2013 12:44:39 -0800 (PST)
In-Reply-To: <alpine.DEB.2.02.1301301535390.3782@oneiric>
References: <alpine.DEB.2.02.1301290359260.12134@oneiric>
	<20130129094422.GJ16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301290453220.12871@oneiric>
	<20130129112406.GK16904@jama.palm1.palmone.com>
	<alpine.DEB.2.02.1301301520430.3650@oneiric>
	<CABcZANmn_EP_qGszxtsEymkMFe4iHDsWvXGc2wtc0pSieMTjSQ@mail.gmail.com>
	<alpine.DEB.2.02.1301301535390.3782@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 30 Jan 2013 13:44:39 -0700
X-Google-Sender-Auth: Dg7yYwRAbEY9MPZT4sRXaMg0M08
Message-ID: <CABcZAN=Bd3uFUCd6LVBOOVegNCTXs_ZdBgAGfTQoMtBhJ3-kKQ@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: BB_NO_NETWORK = "1" causes fetch to fail for unnecessary u-boot parsing
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
X-List-Received-Date: Wed, 30 Jan 2013 21:00:52 -0000
Content-Type: multipart/alternative; boundary=f46d0401f9716ad4d604d48795f6

--f46d0401f9716ad4d604d48795f6
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 30, 2013 at 1:37 PM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

> On Wed, 30 Jan 2013, Chris Larson wrote:
>
> > It's worth bringing up the SRCREV_POLICY variable, which lets you
> > control how bitbake handles caching of srcrevs. By default, it
> > figures it needs to get the mapping every time (value == clear, or
> > unset), which can make sense in certain cases. But you can tell it
> > to go ahead and use the values it has cached from a previous run, as
> > well (value == cache). This can be useful if you know you're moving
> > into an offline state and want to prepare for it above and beyond
> > the -c fetchall.
>
>   i'm not in the least embarrassed to admit i didn't even know that
> variable existed.  and, yes, that pretty much solves the problem.
>

Keep in mind, though, it stores it in the persist_data cache, which by
default lives inside of TMPDIR. So if you're going to set it to cache, best
move the persist dir outside of tmpdir, or just make sure you keep the
TMPDIR around.

The only reason I know the variable exists is I had to deal with this for
the Mentor Embedded Linux product releases. We wanted our engineers to be
able to point at branches, but we also wanted our customers to be able to
build without network (we ship the DL_DIR).

What we ended up doing was having our release archival process capture the
srcrev map from the persist data cache into a standalone db, ship that, and
added a class which restored that into the persist data db at the start of
a build in a new TMPDIR.  Not ideal, but got the job done for that
particular use case. For reference,
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/classes/restore-dumped-headrevs.bbclass
does
the save/restore of the headrev map, and then we adjust our local.conf
sample we ship to set BB_SRCREV_POLICY to cache. Probably more detail than
anyone cares to know, but I'm sure we aren't the only ones that ran into
this sort of a problem, so perhaps it may be of interest.

  i'm still creeped out by that comment of using the tag name to deal
> with rebasing a public commit, though.  :-P


It depends.  There are cases where it makes sense, such as in sharing of
work which is pending upstream merge, where you might rebase each time you
submit, as long as the people cloning it are aware of the behavior of the
branch.
-- 
Christopher Larson

--f46d0401f9716ad4d604d48795f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Jan 30, 2013 at 1:37 PM, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On Wed, 30 Jan 2013, Chris Larson wrote:=
<br>


<br>
&gt; It&#39;s worth bringing up the SRCREV_POLICY variable, which lets you<=
br>
&gt; control how bitbake handles caching of srcrevs. By default, it<br>
&gt; figures it needs to get the mapping every time (value =3D=3D clear, or=
<br>
&gt; unset), which can make sense in certain cases. But you can tell it<br>
&gt; to go ahead and use the values it has cached from a previous run, as<b=
r>
&gt; well (value =3D=3D cache). This can be useful if you know you&#39;re m=
oving<br>
&gt; into an offline state and want to prepare for it above and beyond<br>
&gt; the -c fetchall.<br>
<br>
</div>=C2=A0 i&#39;m not in the least embarrassed to admit i didn&#39;t eve=
n know that<br>
variable existed. =C2=A0and, yes, that pretty much solves the problem.<br><=
/blockquote><div><br></div><div style>Keep in mind, though, it stores it in=
 the persist_data cache, which by default lives inside of TMPDIR. So if you=
&#39;re going to set it to cache, best move the persist dir outside of tmpd=
ir, or just make sure you keep the TMPDIR around.</div>

<div style><br></div><div style>The only reason I know the variable exists =
is I had to deal with this for the Mentor Embedded Linux product releases. =
We wanted our engineers to be able to point at branches, but we also wanted=
 our customers to be able to build without network (we ship the DL_DIR).</d=
iv>

<div style><br></div><div style>What we ended up doing was having our relea=
se archival process capture the srcrev map from the persist data cache into=
 a standalone db, ship that, and added a class which restored that into the=
 persist data db at the start of a build in a new TMPDIR. =C2=A0Not ideal, =
but got the job done for that particular use case. For reference,=C2=A0<a h=
ref=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/classes/r=
estore-dumped-headrevs.bbclass">http://git.yoctoproject.org/cgit/cgit.cgi/m=
eta-mentor/tree/classes/restore-dumped-headrevs.bbclass</a>=C2=A0does the s=
ave/restore of the headrev map, and then we adjust our local.conf sample we=
 ship to set BB_SRCREV_POLICY to cache. Probably more detail than anyone ca=
res to know, but I&#39;m sure we aren&#39;t the only ones that ran into thi=
s sort of a problem, so perhaps it may be of interest.</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">
=C2=A0 i&#39;m still creeped out by that comment of using the tag name to d=
eal<br>
with rebasing a public commit, though. =C2=A0:-P</blockquote></div><br>It d=
epends. =C2=A0There are cases where it makes sense, such as in sharing of w=
ork which is pending upstream merge, where you might rebase each time you s=
ubmit, as long as the people cloning it are aware of the behavior of the br=
anch.<br>

-- <br>Christopher Larson</div></div>

--f46d0401f9716ad4d604d48795f6--
