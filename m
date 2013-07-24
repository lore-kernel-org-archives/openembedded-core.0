Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 361C86A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:55:33 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 13so987274lba.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Guo2dDpejPXAbIDXJzTu37j7TkAlwEl684sMUM5gHXk=;
	b=diEHAeXr7zGQNBuaQ3V6Htu69XZaWETBob24UmOxUxCD5Pv3e6jLpoiVoWcs1+NUQ9
	H2xp50ZUB1Nilk9Ss/bWp1itQit7jYFzN9IMuxnXXNXqjpDA73VPBjW+G1DBLuQGkVk6
	a2VNgSQafnOoKtJsd3q3JI1uIWXErl4Cpvawa2OxxX2fgs0l4heakaOElYNC0LGUrUIO
	AjlSQsKSWwC7gqBAlAdGJGXHQ9gtWnAXhfNqqIDkZJ45Ba1hCtqBC5LYH05r7Y5ZZsLG
	7aYk2lvfynpIo9BR9LRPihB3drQ3AbDqhDe/9saMN/NeNrtEmJT7NfIQMwR6eIP+gQg7
	S4CQ==
X-Received: by 10.152.18.129 with SMTP id w1mr17876996lad.10.1374706532233;
	Wed, 24 Jul 2013 15:55:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 15:55:12 -0700 (PDT)
In-Reply-To: <CAP9ODKrwQfK9=mArwGbJk1E2-8G+_QvFZ3ehU+fKqYvPY5xLjg@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
	<CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
	<CAP9ODKrwQfK9=mArwGbJk1E2-8G+_QvFZ3ehU+fKqYvPY5xLjg@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 15:55:12 -0700
X-Google-Sender-Auth: AvAf2e_nEtqtTUx70X5FyDDHw4s
Message-ID: <CABcZANnTy3Mg91oeu0U57Y1YADM+Jr-gK8phf9P0SuQcLy5YNw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 22:55:33 -0000
Content-Type: multipart/alternative; boundary=089e014939688638e404e249cebc

--089e014939688638e404e249cebc
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 3:40 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Wed, Jul 24, 2013 at 7:34 PM, Chris Larson <clarson@kergoth.com> wrote:
> >
> > On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador <
> otavio@ossystems.com.br>
> > wrote:
> >>
> >> On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson <clarson@kergoth.com>
> wrote:
> >> ...
> >> > The standalone systemd-tmpfiles recipe I've created has a fairly small
> >> > set
> >> > of dependencies: intltool-native, dbus, libcap. Given this, I'd like
> to
> >> > propose transitioning away from populate-volatiles to
> systemd-tmpfiles,
> >> > even
> >> > for non-systemd images. I think that the update-tmpfiles shell script
> >> > may be
> >> > of use in a transition, but before we even begin discussing a
> transition
> >> > path, I'd like to request comments on the notion of moving to it at
> all.
> >>
> >> I think it shouldn't be hard to make an C app or script which could
> >> parse systemd-tmpfiles and use this for non-systemd systems. What do
> >> you think?
> >
> >
> > I considered this too, but systemd-tmpfiles supports quite a lot more
> than
> > volatiles, for example restoring selinux labels. Maybe that sounds fun to
> > you, but it sounded like more trouble than it was worth to me, given
> > systemd-tmpfiles can be used without systemd :) But yes, it's definitely
> > another option to consider.
>
> Sorry, pressed the send button too fast ...
>
> I understand but I think we could solve the tmp files issue only;
> people using sysv are expected to solve all those other issues in
> another way so it is not a regression for them.


I think those other issues still apply to tmpfiles, just not about their
creation alone :)

Assuming others have other ways of handling that, it does bother me a
little still duplicating that information between tmpfiles config and
whatever that 'another way' was, but it would definitely be a step in the
right direction.

Using a single config file but different implementations would absolutely
be an improvement over the current handling, and would be less invasive,
and wouldn't add the potential additional deps brought in by
systemd-tmpfiles. It's a good idea, and I'd be curious to hear what others
think about this option vs using systemd-tmpfiles itself.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e014939688638e404e249cebc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 24, 2013 at 3:40 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wed, Jul 24, 2013 at 7:=
34 PM, Chris Larson &lt;<a href=3D"mailto:clarson@kergoth.com">clarson@kerg=
oth.com</a>&gt; wrote:<br>


&gt;<br>
&gt; On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador &lt;<a href=3D"mailto=
:otavio@ossystems.com.br">otavio@ossystems.com.br</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson &lt;<a href=3D"mailt=
o:clarson@kergoth.com">clarson@kergoth.com</a>&gt; wrote:<br>
&gt;&gt; ...<br>
&gt;&gt; &gt; The standalone systemd-tmpfiles recipe I&#39;ve created has a=
 fairly small<br>
&gt;&gt; &gt; set<br>
&gt;&gt; &gt; of dependencies: intltool-native, dbus, libcap. Given this, I=
&#39;d like to<br>
&gt;&gt; &gt; propose transitioning away from populate-volatiles to systemd=
-tmpfiles,<br>
&gt;&gt; &gt; even<br>
&gt;&gt; &gt; for non-systemd images. I think that the update-tmpfiles shel=
l script<br>
&gt;&gt; &gt; may be<br>
&gt;&gt; &gt; of use in a transition, but before we even begin discussing a=
 transition<br>
&gt;&gt; &gt; path, I&#39;d like to request comments on the notion of movin=
g to it at all.<br>
&gt;&gt;<br>
&gt;&gt; I think it shouldn&#39;t be hard to make an C app or script which =
could<br>
&gt;&gt; parse systemd-tmpfiles and use this for non-systemd systems. What =
do<br>
&gt;&gt; you think?<br>
&gt;<br>
&gt;<br>
&gt; I considered this too, but systemd-tmpfiles supports quite a lot more =
than<br>
&gt; volatiles, for example restoring selinux labels. Maybe that sounds fun=
 to<br>
&gt; you, but it sounded like more trouble than it was worth to me, given<b=
r>
&gt; systemd-tmpfiles can be used without systemd :) But yes, it&#39;s defi=
nitely<br>
&gt; another option to consider.<br>
<br>
</div>Sorry, pressed the send button too fast ...<br>
<br>
I understand but I think we could solve the tmp files issue only;<br>
people using sysv are expected to solve all those other issues in<br>
another way so it is not a regression for them.</blockquote><div><br></div>=
<div style>I think those other issues still apply to tmpfiles, just not abo=
ut their creation alone :)=C2=A0</div></div><br>Assuming others have other =
ways of handling that, it does bother me a little still duplicating that in=
formation between tmpfiles config and whatever that &#39;another way&#39; w=
as, but it would definitely be a step in the right direction.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Using a sin=
gle config file but different implementations would absolutely be an improv=
ement over the current handling, and would be less invasive, and wouldn&#39=
;t add the potential additional deps brought in by systemd-tmpfiles. It&#39=
;s a good idea, and I&#39;d be curious to hear what others think about this=
 option vs using systemd-tmpfiles itself.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--089e014939688638e404e249cebc--
