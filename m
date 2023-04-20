Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15088C77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 15:27:19 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.11250.1682004433962592449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 08:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IsO2C6E4;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2a8bae45579so5755071fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682004432; x=1684596432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0pyFzhC8yLdBxI0diCyNbKxKK6csciCV0TQNjBHA5RY=;
        b=IsO2C6E4+zmlB7F5bPr4jyjMc7VOHPIBNIPDYhrqC8FvnPpJhEB1TB6SNz5eK9Txde
         kFvxTBaSjn7rsIhebuffE+lFmY3IxT/JKotP6cr82gO9I4lexCqOWuTN0nhVke9Ogptg
         IMekWc8ydcc/Z9LmklmlzA077IbuHXrdQc02eu4KcnmzOPEFZDkAs+K9qHY6hlY+FIir
         QruW7x4HIDyqhbti3OTRIYm9OJeOIKheq0+uSKhV2zg8io/P0aEbcpKOBk6VPfty6PMp
         dBqH2ptqO2J2dPA2BGcmSIkSsaveFvw85dOoYlSN71xFYXHAT37AIwxuDXVEYKjrhXKB
         ZgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682004432; x=1684596432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pyFzhC8yLdBxI0diCyNbKxKK6csciCV0TQNjBHA5RY=;
        b=ZCrvznqfCMak7a93dOftSuu5EU/2DJ0OyUAKpC5zZtrzsufnD4BXL0UQwOO8Fvcvw+
         FA/zbQANQBzhEEV69Nw+FBpZ7fhHFUKFVuj3ZlrHNdMLi+4yi28b1kx06ugCmphbS/Tq
         6aOf8axhQgXN3mpHdy/pVfXv+Z+r0k5Hq2xFiiWQmCmPglOprBKXzMfKaiDHQw98gWKo
         mWzCaCJy1qJScYxadLr2zeXGxP2UeICreTG62Qr1HMRmhqC2rIzvC6m5/buAiJzvrwld
         t3BryQ8B66NVrH6cwAWyA6QGmh/HSNqWrZjFMKZBIFAoWkMCdQCu2nkafvkIz32fYUJD
         41hQ==
X-Gm-Message-State: AAQBX9eVD5iD1LfT/1BuoPoTDRFuORVWV0swMLiRU2nziyAAztPyjmVw
	zRigkiqiYXCMR2e1rmBsMT4qoQf4vDEsPrx+Sos=
X-Google-Smtp-Source: AKy350aRAVdlKxuPzJWL5Id9bHGOEkPoIUsRxP+AkagTneIYysDGBHsUijkNFJYIJGg+jRaeL3jdlUUNbmQOkUa7p8U=
X-Received: by 2002:a19:7403:0:b0:4ee:db34:6f6e with SMTP id
 v3-20020a197403000000b004eedb346f6emr503415lfe.12.1682004431863; Thu, 20 Apr
 2023 08:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <CA+cAkepE6FLo7L8N0FG-39CfFfLgK9RPFH0qvi+dRNOY5gpXRw@mail.gmail.com>
 <b8187209629974cf50110a5690a14360e7c02026.camel@linuxfoundation.org>
 <CA+cAkeqwkQRFzEYVC0jm0xdby9RrGqYtVOenc85+J-nMiGwtoA@mail.gmail.com> <f0057a72-aebd-230e-f247-ca47f3ac025a@gmail.com>
In-Reply-To: <f0057a72-aebd-230e-f247-ca47f3ac025a@gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 20 Apr 2023 17:27:00 +0200
Message-ID: <CA+cAkeo+W46HDaLD8aUM3ewn=_M8XepKaP_v+vOmfR0rP9Qt6A@mail.gmail.com>
Subject: Re: [OE-core] Cargo and ptest
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ac043505f9c62c68"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 15:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180255

--000000000000ac043505f9c62c68
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 20 avr. 2023, 17:00, Khem Raj <raj.khem@gmail.com> a =C3=A9crit :

> On 4/20/23 2:57 AM, Frederic Martinsons wrote:
> >
> >
> > Le jeu. 20 avr. 2023, 11:41, Richard Purdie
> > <richard.purdie@linuxfoundation.org
> > <mailto:richard.purdie@linuxfoundation.org>> a =C3=A9crit :
> >
> >     On Thu, 2023-04-20 at 09:27 +0200, Frederic Martinsons wrote:
> >      > Hello,
> >      >
> >      > I would like to build and ship tests for recipes which uses carg=
o
> and
> >      > in the process, three questions arose (maybe more when I will
> >      > progress).
> >      > I would like to have your opinions on them.
> >      >
> >      > 1) should we ship cargo-native in ptest images or should we just
> >      > build and ship test binaries alone ?
> >
> >     ptests run in target images so they'd depend on "cargo" and cargo-
> >     native wouldn't be appropriate.
> >
> >
> > Of course, I meant cargo, not cargo-native.
> > I'm asking for that because running "cargo test" to execute the whole
> > test suite is the standard for rust project but it will force us to
> > embed cargo (plus all it's deps) and source code for doing that. I thin=
k
> > I will go for the test binaries only for the moment. Note that I will
> > need to do some "clever" search of them because they do not have a
> > deterministic name (https://github.com/rust-lang/cargo/issues/1924
> > <https://github.com/rust-lang/cargo/issues/1924>)
>
> Usually ptests are cross compiled during build and results are packaged
> into PN-ptest package. A run-ptest script is added to this package which
> is used to execute the tests on device. This also integrates with
> ptest-runner and larger system testing if you wish to do so. in some
> cases we
> might package tools needed to run the tests on target but seldom do we
> compile the tests on target and then run them because embedded targets
> may not have enough musle to do that. So if cargo binary is needed to
> run the pre-compiled tests then I think adding that to rdeps of PN-ptest
> might be fine.
>

Yes, thanks, I'm aware of PN-test package and run-ptest script, this is
what I plan to do.

But I don't think embedding cargo is desirable, since issuing "cargo test"
command doesn't imply to run pre compiled binary, this will compile the
project and run tests onto (pretty like what a Makefile project would do
with "make check"), so this would imply to pull a lot of dependencies for
that (though I don't how many exactly)

>
> >
> >      > 2) should we place the cargo ptest specifics in a dedicated clas=
s
> >      > (e.g ptest-cargo.bbclass, like already existing ptest-gnome or
> ptest-
> >      > perl) or put this in cargo.bbclass itself ?
> >
> >     If ptests for cargo all follow a common format and a class can enab=
le
> >     them for a large set of recipes, a class is appropriate.
> >
> >     If would only be in cargo.bbclass itself if all cargo recipes had
> >     standard ptests.
> >
> >
> > Yes they do follow a common format for all rust projects (except for th=
e
> > generated binary name, see above). But a recipe can perfectly choose to
> > not implementing any tests if they want to.
> > I'll go for a separate class to clearly distinguish test things in a
> > first time.
> >
> >
> >      > 3) should we embed all kind of tests (unit, integration and doc
> >      > tests, see
> >      > https://doc.rust-lang.org/book/ch11-03-test-organization.html
> >     <https://doc.rust-lang.org/book/ch11-03-test-organization.html>) or
> >      > just the unit tests ?
> >
> >     I don't know about the rust specific details but unit and integrati=
on
> >     tests are both appropriate. I've no strong opinion on doc tests.
> >     They're probably fine if they don't add large dependency chains and
> run
> >     quickly.
> >
> >     Cheers,
> >
> >     Richard
> >
> >
> > OK I'll see how doc tests behave for already existing recipes (if they
> > have some).
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#180246):
> https://lists.openembedded.org/g/openembedded-core/message/180246
> > Mute This Topic: https://lists.openembedded.org/mt/98384286/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000ac043505f9c62c68
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 20 avr. 2023, 17:00, Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On 4/20/23 2:57 AM, Frederic Martinso=
ns wrote:<br>
&gt; <br>
&gt; <br>
&gt; Le jeu. 20 avr. 2023, 11:41, Richard Purdie <br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt;&=
gt; a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, 2023-04-20 at 09:27 +0200, Frederic Martins=
ons wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hello,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I would like to build and ship tests for reci=
pes which uses cargo and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; in the process, three questions arose (maybe =
more when I will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; progress).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I would like to have your opinions on them.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1) should we ship cargo-native in ptest image=
s or should we just<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; build and ship test binaries alone ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0ptests run in target images so they&#39;d depend on=
 &quot;cargo&quot; and cargo-<br>
&gt;=C2=A0 =C2=A0 =C2=A0native wouldn&#39;t be appropriate.<br>
&gt; <br>
&gt; <br>
&gt; Of course, I meant cargo, not cargo-native.<br>
&gt; I&#39;m asking for that because running &quot;cargo test&quot; to exec=
ute the whole <br>
&gt; test suite is the standard for rust project but it will force us to <b=
r>
&gt; embed cargo (plus all it&#39;s deps) and source code for doing that. I=
 think <br>
&gt; I will go for the test binaries only for the moment. Note that I will =
<br>
&gt; need to do some &quot;clever&quot; search of them because they do not =
have a <br>
&gt; deterministic name (<a href=3D"https://github.com/rust-lang/cargo/issu=
es/1924" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com=
/rust-lang/cargo/issues/1924</a> <br>
&gt; &lt;<a href=3D"https://github.com/rust-lang/cargo/issues/1924" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://github.com/rust-lang/cargo=
/issues/1924</a>&gt;)<br>
<br>
Usually ptests are cross compiled during build and results are packaged<br>
into PN-ptest package. A run-ptest script is added to this package which<br=
>
is used to execute the tests on device. This also integrates with <br>
ptest-runner and larger system testing if you wish to do so. in some <br>
cases we<br>
might package tools needed to run the tests on target but seldom do we<br>
compile the tests on target and then run them because embedded targets <br>
may not have enough musle to do that. So if cargo binary is needed to <br>
run the pre-compiled tests then I think adding that to rdeps of PN-ptest <b=
r>
might be fine.<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">Yes, thanks, I&#39;m aware of PN-test package and run-ptest s=
cript, this is what I plan to do.=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">But I don&#39;t think embedding cargo is desirable, since i=
ssuing &quot;cargo test&quot; command doesn&#39;t imply to run pre compiled=
 binary, this will compile the project and run tests onto (pretty like what=
 a Makefile project would do with &quot;make check&quot;), so this would im=
ply to pull a lot of dependencies for that (though I don&#39;t how many exa=
ctly)=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2) should we place the cargo ptest specifics =
in a dedicated class<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (e.g ptest-cargo.bbclass, like already existi=
ng ptest-gnome or ptest-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; perl) or put this in cargo.bbclass itself ?<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If ptests for cargo all follow a common format and =
a class can enable<br>
&gt;=C2=A0 =C2=A0 =C2=A0them for a large set of recipes, a class is appropr=
iate.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If would only be in cargo.bbclass itself if all car=
go recipes had<br>
&gt;=C2=A0 =C2=A0 =C2=A0standard ptests.<br>
&gt; <br>
&gt; <br>
&gt; Yes they do follow a common format for all rust projects (except for t=
he <br>
&gt; generated binary name, see above). But a recipe can perfectly choose t=
o <br>
&gt; not implementing any tests if they want to.<br>
&gt; I&#39;ll go for a separate class to clearly distinguish test things in=
 a <br>
&gt; first time.<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 3) should we embed all kind of tests (unit, i=
ntegration and doc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; tests, see<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://doc.rust-lang.org/book/ch1=
1-03-test-organization.html" rel=3D"noreferrer noreferrer" target=3D"_blank=
">https://doc.rust-lang.org/book/ch11-03-test-organization.html</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://doc.rust-lang.org/book/ch11-=
03-test-organization.html" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://doc.rust-lang.org/book/ch11-03-test-organization.html</a>&gt;) or<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; just the unit tests ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I don&#39;t know about the rust specific details bu=
t unit and integration<br>
&gt;=C2=A0 =C2=A0 =C2=A0tests are both appropriate. I&#39;ve no strong opin=
ion on doc tests.<br>
&gt;=C2=A0 =C2=A0 =C2=A0They&#39;re probably fine if they don&#39;t add lar=
ge dependency chains and run<br>
&gt;=C2=A0 =C2=A0 =C2=A0quickly.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Richard<br>
&gt; <br>
&gt; <br>
&gt; OK I&#39;ll see how doc tests behave for already existing recipes (if =
they <br>
&gt; have some).<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#180246): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/180246" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1802=
46</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98384286=
/1997914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/98384286/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div></div>

--000000000000ac043505f9c62c68--

