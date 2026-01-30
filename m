Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AADD49C9D
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 10:34:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7596.1769769268368855589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 02:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R4yrHWug;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435a517be33so1264466f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 02:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769769267; cv=none;
        d=google.com; s=arc-20240605;
        b=GKckyskH5uK1PGVx+5TGFjVPmSSSWagHwAT3u0GdR/nY1ikAYPtWVX6+puf/LNiKOE
         d/sWsDDuNjOOXDwY54Jc0e96XXKdbNnEu3bpcG988lTpw5JtUrCMiDLcUPSP3+f9fYRS
         mQmuNqXaL0vvXpvhqV5XYvBYQDhyAchess37pEXpmVWj5+ivJTCxWPHcf7QWg14ohQYV
         L8lqtkBF7W5e9t8BbVTGRxqBXTMtkhP/FXYnzKbrDub7szB3Gi+XP+DIhdNcJ8AT1Gwo
         PrpiatyRqkXiKlxkFOkbRcnnv1R7t/LHFAtxFzMOHV+0wt3dqbcjvE5H6Yzk3hjxHzkB
         J59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S+zhzXSswckOlw3FDnOxbFzjoDzNZ0VwW3lKIzn7hGg=;
        fh=TFXMLSdPN1LRXPLhm/ovV401g+euqThi6T/uxE7P8zk=;
        b=F9R1S5T5c1PtI+ziRcx2+0ZqNN991fFewN2NoD5HG8YARp59Np20Nmo0yPIkc2z+Bd
         lO1O13hNKVKcOGPZLlwa5mE2iWyto/fWQrDafBmY/FWpAD3JzQDz/DobKwhOWf9B4E6B
         NuJsqaT/vI3E46WwN02TPFTdP/YEhOqm6dmmfHV/SjB4CwLQKyIPLheIU+dJF3lvlmPr
         Qubvt+DYGaSaIr8VMsd2uH4Io+hPTc+s7Jy2NoYT4UKFWULSOWWlO+nqVD1s/+rJx5UG
         KXlTHaFK9NqAW6oY+AZExSTFVSFichI1cnvKKHMs954tGE615EgzYtk7eQgmFHGn+jGX
         8BuA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769769267; x=1770374067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S+zhzXSswckOlw3FDnOxbFzjoDzNZ0VwW3lKIzn7hGg=;
        b=R4yrHWugiV7gU2FUGMPpfx+U4IUcPBlI9z16xROiOUmkZmd1GsRKAk9d9BB4W8jhLJ
         /4zgLsswFUsA0AuXADUDXVtt+DW4zqlHrmTZzXWCPIeGSoejZ6l1c9fJsLZgy4engzlp
         /jB06vh2KrTsu0aCHSk4paasp+32Swv+IU1Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769769267; x=1770374067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+zhzXSswckOlw3FDnOxbFzjoDzNZ0VwW3lKIzn7hGg=;
        b=LzVyyVfIH33cTKAfs2yKvz4O3A83WL9ihn4WGwp9doqVDuDrzeRvzp9WhXKLt6FEBa
         V51NGVwqySK7GTL7weR/K5G04jsNb6gWjS/Dxm4niNZOyn8cflUgbYktQcm/z5EciZYH
         GoiR6b43T+/G5HtDkuVi8exQVBY4pjszn+HxMDgJx7Kgsk4p9g9zC/uhPE+4Z0XEolzo
         1c7X8SspSXAMbckT1fbQnNQYOIKOqDK1/c9GQX+xpQSo9Ngu4ojpchIStFeKBi46cPhJ
         dchQXvy/vY0wH7AAgkouFPSJ2oCE40H0rIK55EQUBdxQJSGh5VZsm1af+qO4GLhOCLPA
         eNCw==
X-Forwarded-Encrypted: i=1; AJvYcCW1m40j9T8v+XwCO+P4+ILb5Nx99vL5vxzeUAGPu6IKZARJSVWe9bjoFm37H5oW28QQoAS/FVh/8Mo6M+M9VY0Kzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkxW/OCkq5FgFEV+zZvZSw+R84LTcQf4lbmtImcB7B/vR6A4vD
	7+6bBfiTbjrAuKBkBb3F6KJf066L2WlVLKMRWZYX6FiEi4bhWDelcocaJK6lucJZt6iuXd+7uzG
	aWDFGNCI3HcD3twuveSujzHUgX/yIQ4obbdccpP7Pcw==
X-Gm-Gg: AZuq6aJTr76DOTYBdF6wSJzH62ZodnqiBwphaptKQOCF6UePYhWiaKhszcsuFRR6ZTK
	iTXWl5IF7UcXhwVJlZ7hu5vz3konhB92fIybx5vyEm4d8DiCp0ot5UMZAiX3mhtlW2jV7V32LcT
	B0b6soVcPGZ+HPEiPIWlsQrawlyQnT4BpbrHm0ixkUGFdUBkfUei175RaZ9i7oU6/wqwBezVQ7C
	cXgdcdE5UV18nkNQOZjDzJMehiyT9IihlbytcUcaG0rSIEcm3qAGpcQWH/lo2LNFkbpLkL4chHw
	NugRXuZTYMwcrbQYQT2EZQg/6Ufv
X-Received: by 2002:a05:6000:26c3:b0:435:b7b9:afe5 with SMTP id
 ffacd0b85a97d-435f3a66f53mr3318124f8f.1.1769769266506; Fri, 30 Jan 2026
 02:34:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1767772757.git.yoann.congal@smile.fr> <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
 <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr> <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev>
In-Reply-To: <6164cc2da28a6a9e637b47bde280254af4ed6384.camel@pbarker.dev>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 30 Jan 2026 11:33:58 +0100
X-Gm-Features: AZwV_QjUJDGxAoqljuyTN4xNGjzy-ghQNVwI8883qa5khgzvAoyW-DZJi2qATiU
Message-ID: <CAMSfU+4xvshEKX3ze=w10+iwFsNm7sr8Mz5svaRQ_tuZ2Z-1xA@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
To: Paul Barker <paul@pbarker.dev>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Jiaying Song <jiaying.song.cn@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000076fda10649988426"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:34:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230192

--00000000000076fda10649988426
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 7 janv. 2026 =C3=A0 15:05, Paul Barker <paul@pbarker.dev> a =C3=A9c=
rit :

> On Wed, 2026-01-07 at 13:47 +0100, Yoann Congal wrote:
> >
> > Le 07/01/2026 =C3=A0 13:32, Paul Barker a =C3=A9crit :
> > > On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:
> > > >
> > > > > -----Original Message-----
> > > > > From: Paul Barker <paul@pbarker.dev>
> > > > > Sent: Wednesday, January 7, 2026 12:49
> > > > > To: yoann.congal@smile.fr;
> openembedded-core@lists.openembedded.org;
> > > > > Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > > > > Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
> > > > >
> > > > > On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
> > > > > lists.openembedded.org wrote:
> > > > > > From: Peter Marko <peter.marko@siemens.com>
> > > > > >
> > > > > > Pick patch per [1].
> > > > > >
> > > > > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
> > > > > >
> > > > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > > > ---
> > > > > >  .../python3-urllib3/CVE-2025-66471.patch      | 930
> ++++++++++++++++++
> > > > > >  .../python/python3-urllib3_2.5.0.bb           |   1 +
> > > > > >  2 files changed, 931 insertions(+)
> > > > > >  create mode 100644
> meta/recipes-devtools/python/python3-urllib3/CVE-2025-
> > > > > 66471.patch
> > > > >
> > > > > This seems like a very large patch for a CVE issue. The changelog
> entry
> > > > > in the patch also says that the API of
> urllib3.response.ContentDecoder
> > > > > is changed.
> > > > >
> > > > > We should look for a narrower fix, and only take this if there is
> no
> > > > > other option.
> > > >
> > > > I originally didn't want to patch this CVE due to this reason (and
> didn't patch it in kirkstone).
> > > > But since this has landed in scarthgap, I decided for the same in
> whinlatter for consistency.
> > > > Should we revert it from scartghap?
> > >
> > > I don't think we need to rush to a decision.
> >
> > On my side, I need to do the whinlatter 5.3.1 release build on Monday.
> > I propose to set this patch aside to not block the release and the othe=
r
> > patches.
>
> Agreed.
>
> > For scarthgap, we can revert the current fix and add the "proper" fix
> > when we have it. I'd rather avoid a patched->applicable transition on a
> CVE.
>
> We don't need to do this immediately, let's take a little time to think
> and see if others have any thoughts.
>

Ubuntu seem to have applied the patch with post-fixes :
https://git.launchpad.net/ubuntu/+source/python-urllib3/tree/debian/patches=
?h=3Dubuntu%2Fnoble-security
CVE-2025-66471.patch # the upstream patch
CVE-2025-66471-post1.patch  # Remove brotli version warning
CVE-2025-66471-fix1.patch # Revert fix for zstd
CVE-2025-66471-fix2.patch # Fix zstandard using unknown attribute

but also, has deem the fix too intrusive for most maintained releases:
https://ubuntu.com/security/CVE-2025-66471#status

Debian has not patched:
https://security-tracker.debian.org/tracker/CVE-2025-66471

> Intrusive to backport; requires update for src:brotli for effective fix
> The fix requires an updated src:brotli >=3D 1.2.0 for the fix to be
> effective,
> which adds the optional output_buffer_limit option to avoid these attacks=
.


--=20
Yoann Congal
Smile ECS

--00000000000076fda10649988426
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 7 =
janv. 2026 =C3=A0=C2=A015:05, Paul Barker &lt;<a href=3D"mailto:paul@pbarke=
r.dev">paul@pbarker.dev</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Wed, 2026-01-07 at 13:47 +0100, Yoan=
n Congal wrote:<br>
&gt; <br>
&gt; Le 07/01/2026 =C3=A0 13:32, Paul Barker a =C3=A9crit=C2=A0:<br>
&gt; &gt; On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Paul Barker &lt;<a href=3D"mailto:paul@pbarker.de=
v" target=3D"_blank">paul@pbarker.dev</a>&gt;<br>
&gt; &gt; &gt; &gt; Sent: Wednesday, January 7, 2026 12:49<br>
&gt; &gt; &gt; &gt; To: <a href=3D"mailto:yoann.congal@smile.fr" target=3D"=
_blank">yoann.congal@smile.fr</a>; <a href=3D"mailto:openembedded-core@list=
s.openembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.=
org</a>;<br>
&gt; &gt; &gt; &gt; Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Pe=
ter.Marko@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br=
>
&gt; &gt; &gt; &gt; Subject: Re: [OE-core][whinlatter 04/11] python3-urllib=
3: patch<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via<br>
&gt; &gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefe=
rrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; &gt; &gt; From: Peter Marko &lt;<a href=3D"mailto:peter.mark=
o@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Pick patch per [1].<br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; [1] <a href=3D"https://nvd.nist.gov/vuln/detail/CV=
E-2025-66471" rel=3D"noreferrer" target=3D"_blank">https://nvd.nist.gov/vul=
n/detail/CVE-2025-66471</a><br>
&gt; &gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Peter Marko &lt;<a href=3D"mailto:p=
eter.marko@siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<b=
r>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 .../python3-urllib3/CVE-2025-66471.patch=C2=
=A0 =C2=A0 =C2=A0 | 930 ++++++++++++++++++<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 .../python/<a href=3D"http://python3-urllib3=
_2.5.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-urllib3_2.5.0.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 2 files changed, 931 insertions(+)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/pyt=
hon/python3-urllib3/CVE-2025-<br>
&gt; &gt; &gt; &gt; 66471.patch<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; This seems like a very large patch for a CVE issue. The=
 changelog entry<br>
&gt; &gt; &gt; &gt; in the patch also says that the API of urllib3.response=
.ContentDecoder<br>
&gt; &gt; &gt; &gt; is changed.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; We should look for a narrower fix, and only take this i=
f there is no<br>
&gt; &gt; &gt; &gt; other option.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I originally didn&#39;t want to patch this CVE due to this r=
eason (and didn&#39;t patch it in kirkstone).<br>
&gt; &gt; &gt; But since this has landed in scarthgap, I decided for the sa=
me in whinlatter for consistency.<br>
&gt; &gt; &gt; Should we revert it from scartghap?<br>
&gt; &gt; <br>
&gt; &gt; I don&#39;t think we need to rush to a decision.<br>
&gt; <br>
&gt; On my side, I need to do the whinlatter 5.3.1 release build on Monday.=
<br>
&gt; I propose to set this patch aside to not block the release and the oth=
er<br>
&gt; patches.<br>
<br>
Agreed.<br>
<br>
&gt; For scarthgap, we can revert the current fix and add the &quot;proper&=
quot; fix<br>
&gt; when we have it. I&#39;d rather avoid a patched-&gt;applicable transit=
ion on a CVE.<br>
<br>
We don&#39;t need to do this immediately, let&#39;s take a little time to t=
hink<br>
and see if others have any thoughts.<br></blockquote><div><br></div><div>Ub=
untu seem to have applied the patch with post-fixes :</div><div><a href=3D"=
https://git.launchpad.net/ubuntu/+source/python-urllib3/tree/debian/patches=
?h=3Dubuntu%2Fnoble-security">https://git.launchpad.net/ubuntu/+source/pyth=
on-urllib3/tree/debian/patches?h=3Dubuntu%2Fnoble-security</a><br><div>CVE-=
2025-66471.patch # the upstream patch</div>CVE-2025-66471-post1.patch=C2=A0=
 # Remove brotli version warning<br>CVE-2025-66471-fix1.patch # Revert fix =
for zstd<br>CVE-2025-66471-fix2.patch # Fix zstandard using unknown attribu=
te</div><div><br></div><div>but also, has deem the fix too intrusive for mo=
st maintained releases: <a href=3D"https://ubuntu.com/security/CVE-2025-664=
71#status">https://ubuntu.com/security/CVE-2025-66471#status</a></div><div>=
<br></div><div>Debian has not patched:=C2=A0<a href=3D"https://security-tra=
cker.debian.org/tracker/CVE-2025-66471">https://security-tracker.debian.org=
/tracker/CVE-2025-66471</a></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Intrusive to backport; requires update for src:brotli for effective=
 fix<br>The fix requires an updated src:brotli &gt;=3D 1.2.0 for the fix to=
 be effective,<br>which adds the optional output_buffer_limit option to avo=
id these attacks.</blockquote><div><br></div></div><span class=3D"gmail_sig=
nature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><di=
v dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font=
 face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000076fda10649988426--

