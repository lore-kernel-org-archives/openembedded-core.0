Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBDC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 10:07:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.20009.1677578849232279020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 02:07:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cM+bHyv4;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id bv17so9102287wrb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KZTPCWtfAYwMi4J/9DgCton7zGQSkjCA9XKXRIGw/GA=;
        b=cM+bHyv4cjm4ucP+77O5mIpw8l6cC5AV5v5kZ1svPsQGpr+INhv3lvX3jxsgAH5BZ8
         LWVwTM6Q9Q1yokOA2J2cp6YfvZIY+PH2GLEaDZRqz4gsDsjwlJsAZqBuWjiFcvHXO4/t
         UjXFQDw3xWG5TFSAcRzPKbLvkC0wlxUKYn/PgP/5qhMbnyTAkDloHUi7iI99ovjJc6fh
         UaCqt+PGh0NEFq4v6MFDbD9XxpPQlg3ujsTGhZ9ua3GsDAA+yNt7/Mqy+4o1gRqnuy6I
         SNXMNq0+Sb5HEi1NzHrXue6zeOZDagzN6hpSxNXKn/X/gjSUPP5RQPexrlEe+pymklzV
         AKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZTPCWtfAYwMi4J/9DgCton7zGQSkjCA9XKXRIGw/GA=;
        b=zbABo7N2Mme3CDEqgkbKOwp+9p9QFDosWWjQfSQv95sQudVKCrz9BPYMzeajaGfzMh
         TsQ0m37pC+TGMOp03jx5kyn7VmHKnC2smgsJL2uywS4eBViLChuj88N1Ih8f3eiVXGVj
         nPXya/prZ9oKybUeTxEMohlVlkIvNoOGWQvxVuv7rhQ8nkmm51Kzq5sSf3oj+XcIiylJ
         rmztCBHOiO94fx7f42EfA4k5RiEmzppuOd5G6Sxs+8lXbdf/gv3SzABSAUm7dhtFkjTV
         vGnYCMmAQnvtVTosbAZCKYw8WIYYtJuz7BEZHn1Nmg5Q8L5Zn4D0l1KK729EDiSYnRqe
         ZbMg==
X-Gm-Message-State: AO0yUKVZqLC85+njlhN3ir3dojcJEx/403X4MITl5WNeI27zbJklFpSE
	LutKGD8LbvUIT7EfkxjOXwXZ97Ui4yN9VPEfvF0=
X-Google-Smtp-Source: AK7set/EpZpmf3B+3KH0p19rD5H9q7OycLriS6R3bfprGuzQkzR4tYaB7ese4fJycRCGtOrugi3f6bG1mXWzjn0rBeE=
X-Received: by 2002:adf:f7ca:0:b0:2c8:f4a:59f8 with SMTP id
 a10-20020adff7ca000000b002c80f4a59f8mr458916wrq.3.1677578847426; Tue, 28 Feb
 2023 02:07:27 -0800 (PST)
MIME-Version: 1.0
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
 <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
 <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
In-Reply-To: <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Feb 2023 11:07:14 +0100
Message-ID: <CA+chaQd4+b0WsZC9SCZBU0RVy1ezXfGO496KVMGe2vhvUTzFPg@mail.gmail.com>
Subject: Re: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
To: michael.opdenacker@bootlin.com
Cc: Tom Hochstein <tom.hochstein@nxp.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000489c5605f5bfc3b4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 10:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177833

--000000000000489c5605f5bfc3b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 10:52=E2=80=AFAM Michael Opdenacker via
lists.openembedded.org <michael.opdenacker=3D
bootlin.com@lists.openembedded.org> wrote:

> Greetings,
>
> Thank you all for your replies and comments!
>
> On 24.02.23 at 00:24, Tom Hochstein wrote:
> > I agree. The problem I have with these variable names is that it's
> ambiguous whether the features will be included or excluded from the
> backfill. All you can tell from the names is that the values were
> 'considered'. What does that mean? You have to go to the manual to find t=
he
> full meaning.
> >
> > What's important about the variables is that they will be 'excluded'
> from the backfill, so this does look much clearer to me:
> >
> >       DISTRO_FEATURES_BACKFILL_EXCLUDED +=3D "some-feature"
>
>
> Richard, would you accept it if I sent a patch replacing
> "BACKFILL_CONSIDERED" by "BACKFILL_EXCLUDED" in the two variables?
>
> Of course, I can understand if that's too late for the next release, and
> instead document this oddity, at least before we can make a change again.
>

Whole BACKFILL mechanism was added for easier backwards compatibility with
existing DISTROs.

Renaming the variable breaks those DISTROs and personally I don't find the
new variables less confusing than the old ones.

I've always read it as: These are the DISTRO_FEATURES which will be
automatically BACKFILLED if you don't do anything and if you notice the
change and CONSIDER them as not wanted, you opt-out by adding them to
BACKFILL_CONSIDERED.

Yes it's confusing, but this whole mechanism wasn't used much, so I'm
surprised a bit that people still have to deal with it.


> >
> > Is there a good reason why we have this separate variable and can't jus=
t
> do this?
> >
> >       DISTRO_FEATURES_BACKFILL:remove =3D "some-feature"
>
>
> Good question. Maybe because ":remove" is final, and cannot be
> overridden, if I understood correctly?
>

IIRC BACKFILL mechanism predates :remove operator by quite a bit.

So BACKFILL wa added as very weak sort-of-append to DISTRO_FEATURES and
BACKFILL_CONSIDERED was to opt-out from it.

Regards,

--000000000000489c5605f5bfc3b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 28, 2023 at 10:52=E2=80=AFAM =
Michael Opdenacker via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lis=
ts.openembedded.org">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Greetings,<br>
<br>
Thank you all for your replies and comments!<br>
<br>
On 24.02.23 at 00:24, Tom Hochstein wrote:<br>
&gt; I agree. The problem I have with these variable names is that it&#39;s=
 ambiguous whether the features will be included or excluded from the backf=
ill. All you can tell from the names is that the values were &#39;considere=
d&#39;. What does that mean? You have to go to the manual to find the full =
meaning.<br>
&gt;<br>
&gt; What&#39;s important about the variables is that they will be &#39;exc=
luded&#39; from the backfill, so this does look much clearer to me:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_BACKFILL_EXCLUDED +=3D &quot=
;some-feature&quot;<br>
<br>
<br>
Richard, would you accept it if I sent a patch replacing <br>
&quot;BACKFILL_CONSIDERED&quot; by &quot;BACKFILL_EXCLUDED&quot; in the two=
 variables?<br>
<br>
Of course, I can understand if that&#39;s too late for the next release, an=
d <br>
instead document this oddity, at least before we can make a change again.<b=
r></blockquote><div><br></div><div>Whole BACKFILL mechanism was added for e=
asier backwards compatibility with existing DISTROs.</div><div><br></div><d=
iv>Renaming the variable breaks those DISTROs and personally I don&#39;t fi=
nd the new variables less confusing than the old ones.</div><div><br></div>=
<div>I&#39;ve always read it as: These are the DISTRO_FEATURES which will b=
e automatically BACKFILLED if you don&#39;t do anything and if you notice t=
he change and CONSIDER them as not wanted, you opt-out by adding them to BA=
CKFILL_CONSIDERED.</div><div><br></div><div>Yes it&#39;s confusing, but thi=
s whole mechanism wasn&#39;t used much, so I&#39;m surprised a bit that peo=
ple still have to deal with it.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
&gt;<br>
&gt; Is there a good reason why we have this separate variable and can&#39;=
t just do this?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_BACKFILL:remove =3D &quot;so=
me-feature&quot;<br>
<br>
<br>
Good question. Maybe because &quot;:remove&quot; is final, and cannot be <b=
r>
overridden, if I understood correctly?<br></blockquote><div><br></div><div>=
IIRC BACKFILL mechanism predates :remove operator by quite a bit.</div><div=
><br></div><div>So BACKFILL wa added as very weak sort-of-append to DISTRO_=
FEATURES and BACKFILL_CONSIDERED was to opt-out from it.</div><div><br></di=
v><div>Regards,</div></div></div>

--000000000000489c5605f5bfc3b4--

