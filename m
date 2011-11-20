Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RS7Hl-0004eF-KN
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 14:18:17 +0100
Received: by vbbey12 with SMTP id ey12so1639669vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 05:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=RNNWV+0gvGXFkIshkvRyrbDNFdRm9lrhM3VnVX9nXZI=;
	b=vQtcvNT3+9MALduc+h4VDJROZnRfhUE/T8KM1MpHF43ZvUUjVQgqiTSDP4GurHJZUJ
	/QkGi05j1v9GjMPSKRRvZK9HgR+Gmk4QDztasJj8VtXYLyxGo7bvVibYXLYgYpXyhiqA
	RkpV5gIShQOGc1zqw6kAyjF2y+FJQejYvns1I=
MIME-Version: 1.0
Received: by 10.52.33.140 with SMTP id r12mr11504373vdi.36.1321794708316; Sun,
	20 Nov 2011 05:11:48 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Sun, 20 Nov 2011 05:11:48 -0800 (PST)
In-Reply-To: <20111119151337.GA3384@jama.jama.net>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
	<CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
	<1423361.Uzi15gmuni@helios>
	<CACW_hTbp2zMZZQw17_-Pd-wSt3qfs1rs-CF8fLTyGssePwLk=A@mail.gmail.com>
	<20111119151337.GA3384@jama.jama.net>
Date: Sun, 20 Nov 2011 14:11:48 +0100
Message-ID: <CACW_hTYV14qVj1gCR1+r5hSV9kbbWhzj80HQ5aeM5O0JB5Jgkw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Nov 2011 13:18:17 -0000
Content-Type: multipart/alternative; boundary=20cf3079beb60e227904b22a5094

--20cf3079beb60e227904b22a5094
Content-Type: text/plain; charset=ISO-8859-1

2011/11/19 Martin Jansa <martin.jansa@gmail.com>

> On Sat, Nov 19, 2011 at 04:02:49PM +0100, Frans Meulenbroeks wrote:
> > 2011/11/18 Paul Eggleton <paul.eggleton@linux.intel.com>
> >
> > > On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wrote:
> > > > Is ordering of PACKAGES relevant? If so, please enlighten me why.
> > >
> > > It is. The packaging code reads this in order and the first package to
> > > match a
> > > file is the package that the file will go into; thus if you want to
> add a
> > > package that will include files that would normally be in one of the
> > > default
> > > packages you need to prepend to PACKAGES so that your new package gets
> the
> > > files first.
> > >
> > > Ah, ok. understood.
> > Not fully sure if the current behaviour is the most desirable one.
> > Is it still possible to put a file into two packages by explicitly adding
> > it to both?
>
> And then make resulting packages RCONFLICTing each other? Imho this is
> bad idea and it's good that this wasn't ever possible afaik.
>
I was thinking of the situation where a recipe could generate two (indeed
conflicting) packages. E.g. a minimal version and a more expanded version.
Or versions with different options enabled. Or a static and a
dynamic linked version (which still could share e.g. a common config file).
I can also imagine one wants (or must) add a file to all packages. This
could perhaps apply to some license files.

> Also it might be somewhat confusing that a line that adds say a dir to a
> package does not necessarily get all fies in that dir in the package
> Personally I think I prefer to have all added in that case, irrespective
if
> a previous package already took a file from it.

Why confusing?
> should only one package include all /usr/lib/foo and then separte
> subpackages package only some parts of it so we won't pull whole big
> /usr/lib/foo when we need in some image only
> /usr/lib/foo/feature1 and /usr/lib/foo/feature2 in other package? And
> what should shlibs report as feature1 provider? PN_feature1 or PN (which
> also includes all /usr/lib/foo/feature1 files)?
>
> Sorry but this idea seems wrong to me..
>
I'm not saying we should move into that direction, I'm more exporing
whether there is a use case for this and whether it is desired or not.

If it is felt that allowing adding a file to two packages is not good, then
I feel that if a file could be candidate for insertion of two packages,
this could be flagged as an error to be resolved in the recipe (by more
precisely specifying the package contents). That way ordering within
PACKAGES becomes irrelevant (and as such it removes a source of silent
errors, like the one that started this thread).

Frans.


> > Alternately it could be seen as a QA issue if a file could have been
> added
> > to two packages (in which case a more strict pattern should have been
> used
> > somewhere)
> >
> > Frans
>
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

--20cf3079beb60e227904b22a5094
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/11/19 Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&=
gt;</span><br><blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left:=
 1ex; border-left-color: rgb(204, 204, 204); border-left-width: 1px; border=
-left-style: solid;" class=3D"gmail_quote">
<div class=3D"im">On Sat, Nov 19, 2011 at 04:02:49PM +0100, Frans Meulenbro=
eks wrote:<br>
&gt; 2011/11/18 Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.int=
el.com">paul.eggleton@linux.intel.com</a>&gt;<br>
&gt;<br>
&gt; &gt; On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wrote:<br>
&gt; &gt; &gt; Is ordering of PACKAGES relevant? If so, please enlighten me=
 why.<br>
&gt; &gt;<br>
&gt; &gt; It is. The packaging code reads this in order and the first packa=
ge to<br>
&gt; &gt; match a<br>
&gt; &gt; file is the package that the file will go into; thus if you want =
to add a<br>
&gt; &gt; package that will include files that would normally be in one of =
the<br>
&gt; &gt; default<br>
&gt; &gt; packages you need to prepend to PACKAGES so that your new package=
 gets the<br>
&gt; &gt; files first.<br>
&gt; &gt;<br>
&gt; &gt; Ah, ok. understood.<br>
&gt; Not fully sure if the current behaviour is the most desirable one.<br>
&gt; Is it still possible to put a file into two packages by explicitly add=
ing<br>
&gt; it to both?<br>
<br>
</div>And then make resulting packages RCONFLICTing each other? Imho this i=
s<br>
bad idea and it&#39;s good that this wasn&#39;t ever possible afaik.<br></b=
lockquote><div>I was thinking of the situation where=A0a recipe could gener=
ate two (indeed conflicting) packages. E.g. a=A0minimal version and a more =
expanded version. Or versions with different options enabled. Or a static a=
nd a dynamic=A0linked version (which still could share e.g. a common config=
 file).=A0</div>
<div>I can also imagine one wants (or must) add a file to all packages. Thi=
s could perhaps=A0apply to some license files.</div><div>=A0</div><div>&gt;=
 Also it might be somewhat confusing that a line that adds say a dir to a<b=
r>

&gt; package does not necessarily get all fies in that dir in the package<b=
r>
&gt; Personally I think I prefer to have all added in that case, irrespecti=
ve if<br>
&gt; a previous package already took a file from it.<br>
<br>
</div><blockquote style=3D"margin: 0px 0px 0px 0.8ex; padding-left: 1ex; bo=
rder-left-color: rgb(204, 204, 204); border-left-width: 1px; border-left-st=
yle: solid;" class=3D"gmail_quote">Why confusing?<br>
should only one package include all /usr/lib/foo and then separte<br>
subpackages package only some parts of it so we won&#39;t pull whole big<br=
>
/usr/lib/foo when we need in some image only<br>
/usr/lib/foo/feature1 and /usr/lib/foo/feature2 in other package? And<br>
what should shlibs report as feature1 provider? PN_feature1 or PN (which<br=
>
also includes all /usr/lib/foo/feature1 files)?<br>
<br>
Sorry but this idea seems wrong to me..<br></blockquote><div>I&#39;m not sa=
ying we=A0should move into that direction, I&#39;m more exporing whether th=
ere is a use case for this and whether it is desired or not.</div><div>=A0<=
/div>
<div>If it is felt that allowing adding a file to two packages is not good,=
 then I feel that if a file could be candidate for insertion of two package=
s, this could be flagged as an error to be resolved in the recipe (by more =
precisely specifying the package contents). That way ordering within PACKAG=
ES becomes irrelevant (and as such it removes a source of silent errors, li=
ke the one that started this thread).</div>
<div>=A0</div><div>Frans.</div><div>=A0</div><blockquote style=3D"margin: 0=
px 0px 0px 0.8ex; padding-left: 1ex; border-left-color: rgb(204, 204, 204);=
 border-left-width: 1px; border-left-style: solid;" class=3D"gmail_quote">
&gt; Alternately it could be seen as a QA issue if a file could have been a=
dded <br>
&gt; to two packages (in which case a more strict pattern should have been =
used<br>
&gt; somewhere)<br>
&gt;<br>
&gt; Frans<br>
<br>
<div><div></div><div class=3D"h5">&gt; ____________________________________=
___________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
<br>
</div></div><font color=3D"#888888">--<br>
Martin &#39;JaMa&#39; Jansa =A0 =A0 jabber: <a href=3D"mailto:Martin.Jansa@=
gmail.com">Martin.Jansa@gmail.com</a><br>
</font><br>_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
<br></blockquote></div><br>

--20cf3079beb60e227904b22a5094--
