Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0A3C3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 12:33:58 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.171610.1719318831881830447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 05:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b+GSG1rh;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3541185a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 05:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318831; x=1719923631; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A5zDxIQ7I5U1TucrC2/Ol89w7Gj8XvexmVaafLYbD6A=;
        b=b+GSG1rhch6u2IpBXk9q0s3bsXKsYrvWcIMzPfeI6eQDJfGiOAXE/KFFLM1NHlzQe5
         0GP1QO88XRHTQFTdNXxbwOFuOVRxjpl9pyu1+UcW48uN3zFB/LZFqg3dLTugao1FC9yG
         tAqeLVdH+/FO3X3ky31IS/CyE8nlW5HZiKDmzDH+DPxfowC1GLqPQ+E3jpWMzi7z0Z8H
         HcU+QxU/Fr5ixueJKkgVghICxXjW7VqkN+K3K63dw8AtWmOTfXGTtb4L1wvxEqmTvfvZ
         ZwPhH6Hg22bs8tl1ue225fEJwWgayHyxGAcGUReIgOv30icrPm6BGRmMLDqvzAgho1CO
         UbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318831; x=1719923631;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5zDxIQ7I5U1TucrC2/Ol89w7Gj8XvexmVaafLYbD6A=;
        b=XXo3wWHALE6yNtU2uTHHZZrMjHMemfIreg4j92qy8Xs/Do8zN3nWGRYeqDqX5NWNU5
         AWFBHE1SCMas+X2Co47OwX9nIJ5a8Vx7Uf9NgXirxgi3GaJ2t/lHkt5pAcVMIA/YFIuw
         pARUpDPP1RIB/tQJ3tPpSM0BxnYKZBNP6JwqNGtQQX4klVPMb4kT9jlanfdtZb9PYJQz
         Sv2PiA9NHLe40wgf1akiLpwafLx/KLYBYdhlKmQKsC07zGJ/7l4NfDnPxxx3AmBERgWR
         H5Cwo51K4RN1NfrCdw7Rrjy2xSL+HMDLMBteEHchgBRDFjvj6fHjsd9e3JgplH0T1InD
         4MMg==
X-Gm-Message-State: AOJu0YwN5cZ7s6cOMlmAW6hWstwpAxKiD5emcwBqEyIhaNzpJLW7GamG
	Er4AcrqM/fk2eekF0eLjlLh90GX9pKBzdxcN4ewvtJ2PL1Hvss9SkvAvzSJTEpFaj3imOs/EEVD
	bwdLhX065j6D+E4jzHCFA2wkLe2Q=
X-Google-Smtp-Source: AGHT+IE15lnnzq+BdEOY1Ce3XHypX02w6Eie7oDLloaXgBQ7QmI+YJO4qLYManmLWstoNwRZ0px/3xN7a/yDokfv7Rw=
X-Received: by 2002:a17:90b:1b0a:b0:2c2:d6f3:6353 with SMTP id
 98e67ed59e1d1-2c86124c99cmr5752550a91.14.1719318830888; Tue, 25 Jun 2024
 05:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240531130128.1258909-1-marta.rybczynska@syslinbit.com>
 <20240531130128.1258909-2-marta.rybczynska@syslinbit.com> <181943DB-2E43-4328-B4EC-B90E0A1F9CE8@arm.com>
In-Reply-To: <181943DB-2E43-4328-B4EC-B90E0A1F9CE8@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 25 Jun 2024 14:33:38 +0200
Message-ID: <CAApg2=SuLizUXb2ShWgQhHa2HPx1QhwXy7ZQWXP31D-ZsYytWQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][OE-core 2/3] vex.bbclass: add a new class
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000002bc517061bb61c42"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 12:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201132

--0000000000002bc517061bb61c42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:16=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> Hi Marta,
>
> On 31 May 2024, at 14:01, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > The "vex" class generates the minimum information that is necessary
> > by an external CVE checking tool. It is a drop-in replacement of
> "cve-check".
> > It uses the same variables from recipes.
> >
> > It generates the JSON output format only.
>
> This appears to be a trimmed down version of the cve-check class which
> outputs the same JSON file, so what this is really missing is the greater
> context.  For example, the comments still talk about the cve-check
> behaviour, not this new vex class=E2=80=99s behaviour.  Understanding wha=
t this
> class is doing and how it=E2=80=99s meant to be used isn=E2=80=99t obviou=
s.
>
> Correct me if I'm wrong, but this class writes a JSON file per recipe (in
> the same bespoke JSON format as cve-check) that contains _just_ the
> assertions in the recipe: that is any CVE_STATUS assignments and resolved
> statements from patches.  It does not include all known issues, because
> that changes over time this is the responsibility of external tooling.
> This explanation should be in the comments.
>

Yes, this is true. I'll update the description in the next version.


>
> Is this bespoke JSON format still the best format to use, or should we
> adopt an existing format such as OpenVEX?
>

At this time I was unable to export some information directly in a format
like OpenVEX, especially linked to the priority of analysis (eg. that the
"cpe-incorrect" assessment has a priority over the direct scan result; in
fact "cpe-incorrect" doesn't exist in any VEX format I am aware of). There
is a bit of code on handling that in the standalone tool. What I want to do
so is to assemble the list and go see the OpenVEX people (easier to reach
than CSAF from my experience) to figure out if they have an idea on how to
handle all our cases. The standalone tool has a CVE JSON to OpenVEX
converter. Without extensions, it's a lossy conversion, however.


>
> There=E2=80=99s a chunk of code in cve_write_data_json() to write CVE met=
adata,
> that appears to be dead code that can be deleted.  Also the vex_clean eve=
nt
> is entirely dead code as the variables defining the files to clean are
> never assigned.
>
> Also I=E2=80=99m unconvinced that we need to write so many files.  We end=
 up with
> a file inside WORKDIR, LOG_DIR, and DEPLOY_DIR.  Can we just reduce that
> down to DEPLOY_DIR?
>

We tried to remove all the dead code, but there might be some places left.
Will verify that.

BTW We have solved the issue you have seen with ninja CVEs and I have
builds + scans running. I want to verify results manually to make sure it
is OK. Will be submitting another version after the verification are done.

Kind regards,
Marta

--0000000000002bc517061bb61c42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 21, 2024 at 6:16=E2=80=AF=
PM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Hi Marta,<br>
<br>
On 31 May 2024, at 14:01, Marta Rybczynska via <a href=3D"http://lists.open=
embedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</=
a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; The &quot;vex&quot; class generates the minimum information that is ne=
cessary<br>
&gt; by an external CVE checking tool. It is a drop-in replacement of &quot=
;cve-check&quot;.<br>
&gt; It uses the same variables from recipes.<br>
&gt; <br>
&gt; It generates the JSON output format only.<br>
<br>
This appears to be a trimmed down version of the cve-check class which outp=
uts the same JSON file, so what this is really missing is the greater conte=
xt.=C2=A0 For example, the comments still talk about the cve-check behaviou=
r, not this new vex class=E2=80=99s behaviour.=C2=A0 Understanding what thi=
s class is doing and how it=E2=80=99s meant to be used isn=E2=80=99t obviou=
s.<br>
<br>
Correct me if I&#39;m wrong, but this class writes a JSON file per recipe (=
in the same bespoke JSON format as cve-check) that contains _just_ the asse=
rtions in the recipe: that is any CVE_STATUS assignments and resolved state=
ments from patches.=C2=A0 It does not include all known issues, because tha=
t changes over time this is the responsibility of external tooling.=C2=A0 T=
his explanation should be in the comments.<br></blockquote><div><br></div><=
div>Yes, this is true. I&#39;ll update the description in the next version.=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Is this bespoke JSON format still the best format to use, or should we adop=
t an existing format such as OpenVEX?<br></blockquote><div><br></div><div>A=
t this time I was unable to export some information directly in a format li=
ke OpenVEX, especially linked to the priority of analysis (eg. that the &qu=
ot;cpe-incorrect&quot; assessment has a priority over the direct scan resul=
t; in fact &quot;cpe-incorrect&quot; doesn&#39;t exist in any VEX format I =
am aware of). There is a bit of code on handling that in the standalone too=
l. What I want to do so is to assemble the list and go see the OpenVEX peop=
le (easier to reach than CSAF from my experience) to figure out if they hav=
e an idea on how to handle all our cases. The standalone tool has a CVE JSO=
N to OpenVEX converter. Without extensions, it&#39;s a lossy conversion, ho=
wever.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
There=E2=80=99s a chunk of code in cve_write_data_json() to write CVE metad=
ata, that appears to be dead code that can be deleted.=C2=A0 Also the vex_c=
lean event is entirely dead code as the variables defining the files to cle=
an are never assigned. <br>
<br>
Also I=E2=80=99m unconvinced that we need to write so many files.=C2=A0 We =
end up with a file inside WORKDIR, LOG_DIR, and DEPLOY_DIR.=C2=A0 Can we ju=
st reduce that down to DEPLOY_DIR?<br></blockquote><div><br></div><div>We t=
ried to remove all the dead code, but there might be some places left. Will=
 verify that.</div></div><div class=3D"gmail_quote"><br></div><div class=3D=
"gmail_quote">BTW We have solved the issue you have seen with ninja CVEs an=
d I have builds + scans running. I want to verify results manually to make =
sure it is OK. Will be submitting another version after the verification ar=
e done.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">Kind regards,</div><div class=3D"gmail_quote">Marta<br></div></div>

--0000000000002bc517061bb61c42--

