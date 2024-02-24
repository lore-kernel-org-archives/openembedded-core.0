Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE62C54798
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 00:01:49 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.9881.1708732903754840840
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 16:01:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=PnDNXn1M;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3F182240027
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 01:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708732901; bh=yF9EbWOCCb25+jLA3EEkVtEIB4r71qKoz6W+WApeUNE=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version:
	 From;
	b=PnDNXn1MTPQOakNxM1v4p9K+7LrS92tlx29RaGx3MfciYqlBgo8KasrjnTOqzfwnB
	 bhhOkjGu9Yz8YNm4uyTkSi+I/itYruxdW8n1hLf7Hg3afdRmyr+9jrp4YML1EeUeD6
	 zTrGLmaKfGVARE2T97v6aJmA+CIvy4Ibqr/kIhykjcyvlqb3ak+gcF/Pgp4ivN3EJy
	 oB22CeZ9MhG2pbqeyyWWjwccKRCZTZJHihit5YYSKsgJ0ydLTLmyWN4BbMkrXEjjxg
	 A8IeToWMFR2ZKcNf3ln5hrzba9w3DP9SljFE5cJO/FSNHlMMUWvIGVjGiLhKF/LInQ
	 6pA8wRtON4laA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThRr40420z9rxM;
	Sat, 24 Feb 2024 01:01:39 +0100 (CET)
Message-ID: <404a832329edbb499202500f2782bd115391a575.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] cve-check: Log if CVE_STATUS set but not
 reported for component
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Yoann CONGAL <yoann.congal@smile.fr>, Simone =?ISO-8859-1?Q?Wei=DF?=
	 <simone.p.weiss@posteo.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 24 Feb 2024 00:01:39 +0000
In-Reply-To: <CAMSfU+4zeAm-BKwqw_vE2RTTmCBoCEAuYyoxm4_KXH7j_mDQqg@mail.gmail.com>
References: <20240223210848.21731-1-simone.p.weiss@posteo.com>
	 <CAMSfU+4zeAm-BKwqw_vE2RTTmCBoCEAuYyoxm4_KXH7j_mDQqg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-iYRrVHTRuVlGnCwC1lzG"
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 00:01:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196118

--=-iYRrVHTRuVlGnCwC1lzG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2024-02-23 at 22:52 +0100, Yoann CONGAL wrote:
> Le=C2=A0ven. 23 f=C3=A9vr. 2024 =C3=A0=C2=A022:09, Simone Wei=C3=9F <simo=
ne.p.weiss@posteo.com> a
> =C3=A9crit=C2=A0:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Log if the CVE_STATUS is set for a CVE, but the cve is not reported
> > for a
> > component. This should hopefully help to clean up not needed
> > CVE_STATUS
> > settings.=20
> >=20
>=20
>=20
> Thank you for taking the time to do this :-)
> =C2=A0
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/classes/cve-check.bbclass | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-
> > check.bbclass
> > index 5191d04303..b82a9e89ec 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -418,6 +418,9 @@ def check_cves(d, patched_cves):
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cves_status.append([pro=
duct, False])
> >=20
> > =C2=A0 =C2=A0 =C2=A0conn.close()
> > +=C2=A0 =C2=A0 diff_ignore =3D list(set(cve_ignore) - set(cves_ignored)=
)
> > +=C2=A0 =C2=A0 if diff_ignore:
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn("Found CVE (%s) with CVE_STATUS se=
t that is not found
> > in database for this component" % " ".join(diff_ignore))
> >=20
>=20
>=20
> A non-optional warning might be a bit harsh (Especially one that can
> come up after an independent NVD database update).
>=20
I first had the same doubt, but then thought: hey it will only appear if
cve checks are actually performed, which is not the default.
And when you do that you get warnings anyway. You are right though.
> How about a new element in the output of cve_check (the
> build/tmp/log/cve/*.{txt,json} files)?
> That way, someone looking for this info may find it, everyone else can
> (safely) ignore this.
>=20
> Another way I see would be to make the warning optional by using
> QA_WARN&co but I'm not 100% sure it can be done...
>=20
Good point. Sth like:

oe.qa.handle_error("cve_status_not_in_db", "%s Found CVE (%s) with
CVE_STATUS set that are not found in database for this component" % (pn, "
".join(diff_ignore)), d)

should work.
Then the warning is only given if=C2=A0cve_status_not_in_db is appended to
WARN_QA. I think this would be fine, also other classes besides
insane.bbclass add to WARN_QA/ERROR_QA. I will check the docs and then
most likely send v2.

Cheers
Simone
> Regards,
>=20
> > =C2=A0 =C2=A0 =C2=A0if not cves_in_recipe:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("No CVE records for products =
in recipe %s" % (pn))


--=-iYRrVHTRuVlGnCwC1lzG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2024-02-23 at 22:52 +0100, Yoann CONG=
AL wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
>Le&nbsp;ven. 23 f=C3=A9vr. 2024 =C3=A0&nbsp;22:09, Simone Wei=C3=9F &lt;<a=
 href=3D"mailto:simone.p.weiss@posteo.com">simone.p.weiss@posteo.com</a>&gt=
; a =C3=A9crit&nbsp;:</div><div class=3D"gmail_quote"><blockquote type=3D"c=
ite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left=
:1ex"><div>From: Simone Wei=C3=9F &lt;<a href=3D"mailto:simone.p.weiss@post=
eo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<br></div><div><=
br>Log if the CVE_STATUS is set for a CVE, but the cve is not reported for =
a<br>component. This should hopefully help to clean up not needed CVE_STATU=
S<br>settings. <br></div><br></blockquote><div><br></div><div>Thank you for=
 taking the time to do this :-)<br></div><div>&nbsp;</div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div>Signed-off-by: Simone Wei=C3=9F &lt;<a href=3D"mailto:simon=
e.p.weiss@posteo.com" target=3D"_blank">simone.p.weiss@posteo.com</a>&gt;<b=
r>---<br>&nbsp;meta/classes/cve-check.bbclass | 3 +++<br>&nbsp;1 file chang=
ed, 3 insertions(+)<br></div><div><br>diff --git a/meta/classes/cve-check.b=
bclass b/meta/classes/cve-check.bbclass<br>index 5191d04303..b82a9e89ec 100=
644<br>--- a/meta/classes/cve-check.bbclass<br>+++ b/meta/classes/cve-check=
.bbclass<br>@@ -418,6 +418,9 @@ def check_cves(d, patched_cves):<br>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;cves_status.append([product, False=
])<br></div><div><br>&nbsp; &nbsp; &nbsp;conn.close()<br>+&nbsp; &nbsp; dif=
f_ignore =3D list(set(cve_ignore) - set(cves_ignored))<br>+&nbsp; &nbsp; if=
 diff_ignore:<br>+&nbsp; &nbsp; &nbsp; &nbsp; bb.warn("Found CVE (%s) with =
CVE_STATUS set that is not found in database for this component" % " ".join=
(diff_ignore))<br></div><br></blockquote><div><br></div><div>A non-optional=
 warning might be a bit harsh (Especially one that can come up after an ind=
ependent NVD database update).</div><div><br></div></div></div></blockquote=
><div>I first had the same doubt, but then thought: hey it will only appear=
 if cve checks are actually performed, which is not the default.</div><div>=
And when you do that you get warnings anyway. You are right though.</div><b=
lockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf=
 solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>H=
ow about a new element in the output of cve_check (the build/tmp/log/cve/*.=
{txt,json} files)?</div><div>That way, someone looking for this info may fi=
nd it, everyone else can (safely) ignore this.<br></div><div><br></div><div=
>Another way I see would be to make the warning optional by using QA_WARN&a=
mp;co but I'm not 100% sure it can be done...</div><div><br></div></div></d=
iv></blockquote><div>Good point. Sth like:</div><div><br></div><div>oe.qa.h=
andle_error("cve_status_not_in_db", "%s Found CVE (%s) with CVE_STATUS set =
that are not found in database for this component" % (pn, " ".join(diff_ign=
ore)), d)</div><div><br></div><div>should work.</div><div>Then the warning =
is only given if&nbsp;<span style=3D"font-size: 14.666667px;">cve_status_no=
t_in_db is appended to WARN_QA. I think this would be fine, also other clas=
ses besides</span></div><div>insane.bbclass add to WARN_QA/ERROR_QA. I will=
 check the docs and then most likely send v2.</div><div><br></div><div>Chee=
rs</div><div>Simone</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><div>Regards,</div><div><br></div><blockquote type=3D"=
cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-lef=
t:1ex"><div>&nbsp; &nbsp; &nbsp;if not cves_in_recipe:<br>&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;bb.note("No CVE records for products in recipe %s" % (pn))=
<br></div></blockquote></div></div></blockquote><div><br></div><div><span><=
/span></div></body></html>

--=-iYRrVHTRuVlGnCwC1lzG--

