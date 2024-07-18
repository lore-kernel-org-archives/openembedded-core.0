Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB0FC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 05:06:48 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.8615.1721279201904311035
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 22:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gfXpaRfp;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2cb5789297eso277053a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721279201; x=1721884001; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r7XAIZg4shrfAn+P2TstDJSwU8sYnuLG1lDPR+YZHWM=;
        b=gfXpaRfpAsTVwlX67JaOPWI1PObfHcWREiTCePMwaNuOAtEmaZj3/1zJlrM7gAGVBD
         sMyGkfbDy3550Oxsg47LXrAsKmSfQaUr2CljwqBdYyixVbSs6ZiB0mCJiI5E52PuQQgb
         MoUBWxroeCs5BvC6cwu+0tpWIylBqllHFpsHA4Fc/km4/IiYqQ8BcojgM78y/sp4ZQ73
         OKMs6IbV2UxlnZ/lx2F42qjFcQ8FlM4B30rxX9vfACJVz4V/6M6QQA2dKKFvzLZccCIQ
         SQLDKR5i/CSbHm5PuR86BHnNRHOWy/I8zw6H42fodZyNFBBKJd3pJ+5mEMFt2qQrwYQa
         Sz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721279201; x=1721884001;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r7XAIZg4shrfAn+P2TstDJSwU8sYnuLG1lDPR+YZHWM=;
        b=MrGTrKilPJ18VpUZ27SaZhfXJLxfcYsF2jLaLekDywPi5n1YxjfkaCDw0u6JenhCag
         2D4ukhebPBw62+IOFoHeExOyExsZ+EfQkd90HRbxISQ4zhvi6EVdQN0XHlIE7C/7Pe1r
         51CH6OcP1gXyfN9KemigQ9iCQ0Kw9MY5jEfCXGT7qZQVu5oTXcQ83JGc1gGAR0kBXOJn
         P6MfiHSQVjWgtwEcwSDyVK/Xjwumuy+/2iC1Q9Bco2oaXM7UmeTT79qfAtvjI5G5L7Oe
         WWMNV8KWLuZwz5YXInQ5PXwhmlyiIXnifTgQKjhrg/AVNCStJJjoOCfv842nOeLpttdN
         kN3Q==
X-Gm-Message-State: AOJu0YzfmO/Jld91415QkqUCJIcilAHyEgzXPt+N55mld/IWgntN8Ek6
	9+ibn96uG8OG40i5TuG9gJj2PLy0XAvO5TG1jP3FOx5QRx9n2F2hKmTr0x8BnXj1wVFT3ufXG9K
	komVocGepqibx4lWawCscA3LbvO2bjg==
X-Google-Smtp-Source: AGHT+IEDKTER/eaJYJWFowumnmyO3dgHqvMM+G8D9C6cpKPdbWrVaXApInyGNsWFuAqg8rKyz/gC6Dk9hA9FdlIXVJ4=
X-Received: by 2002:a17:90b:4389:b0:2cb:1563:ccd1 with SMTP id
 98e67ed59e1d1-2cb5294f0bbmr2925076a91.38.1721279200967; Wed, 17 Jul 2024
 22:06:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240715102003.10122-1-marta.rybczynska@syslinbit.com> <AS1PR10MB56970CABA311ECF1A76C7566FDA32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56970CABA311ECF1A76C7566FDA32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 18 Jul 2024 07:06:29 +0200
Message-ID: <CAApg2=TFYV3aVGNeK=PiWVPRTw86RA3NxNLOaB_z5LTU9-4G3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000005544b1061d7e8b9c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 05:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202185

--0000000000005544b1061d7e8b9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 9:11=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hi Marta,
>
> Thanks for the great work on this topic.
> I have left 3 comments below.
>
> Thanks for considering them.
>   Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Marta Rybczynska via
> > lists.openembedded.org
> > Sent: Monday, July 15, 2024 12:20
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>; Samantha Jalaber=
t
> > <samantha.jalabert@syslinbit.com>
> > Subject: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs
> >
> > Previously the information passed between different function of the
> > cve-check class included only tables of patched, unpatched, ignored
> > vulnerabilities and the general status of the recipe.
> >
> > The VEX work requires more information, and we need to pass them
> > between different functions, so that it can be enriched as the
> > analysis progresses. Instead of multiple tables, use a single one
> > with annotations for each CVE encountered. For example, a patched
> > CVE will have:
> >
> > {"abbrev-status": "Patched", "status": "version-not-in-range"}
> >
> > abbrev-status contains the general status (Patched, Unpatched,
> > Ignored and Unknown that will be added in the VEX code)
> > status contains more detailed information that can come from
> > CVE_STATUS and the analysis.
> >
> > Additional fields of the annotation include for example the name
> > of the patch file fixing a given CVE.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
> > Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
> > ---
> >  meta/classes/cve-check.bbclass | 208 +++++++++++++++++----------------
> >  meta/lib/oe/cve_check.py       |  12 +-
> >  2 files changed, 113 insertions(+), 107 deletions(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> > index 93a2a1413d..f177223568 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -188,10 +188,10 @@ python do_cve_check () {
> >                  patched_cves =3D get_patched_cves(d)
> >              except FileNotFoundError:
> >                  bb.fatal("Failure in searching patches")
> > -            ignored, patched, unpatched, status =3D check_cves(d,
> patched_cves)
> > -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE")
> =3D=3D "1"
> > and status):
> > -                cve_data =3D get_cve_info(d, patched + unpatched +
> ignored)
> > -                cve_write_data(d, patched, unpatched, ignored,
> cve_data, status)
> > +            cve_data, status =3D check_cves(d, patched_cves)
> > +            if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D=
 "1"
> and
> > status):
> > +                get_cve_info(d, cve_data)
> > +                cve_write_data(d, cve_data, status)
> >          else:
> >              bb.note("No CVE database found, skipping CVE check")
> >
> > @@ -294,7 +294,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend =3D
> > "${@'cve_check_write_rootfs_manifest ' if d
> >  do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if
> > d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
> >  do_populate_sdk[recrdeptask] +=3D "${@'do_cve_check' if
> > d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
> >
> > -def check_cves(d, patched_cves):
> > +def cve_is_ignored(d, cve_data, cve):
> > +    if cve not in cve_data:
> > +        return False
> > +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> > +        return True
> > +    return False
> > +
> > +def cve_is_patched(d, cve_data, cve):
> > +    if cve not in cve_data:
> > +        return False
> > +    if cve_data[cve]['abbrev-status'] =3D=3D "Patched":
> > +        return True
> > +    return False
> > +
> > +def cve_update(d, cve_data, cve, entry):
>
> I think that there is a fundamental change in behavior here.
> Previously we were taking (NVD) DB as base and only vulnerable CVEs were
> compared annotated with CVE_STATUS or our presence of CVE patches.
> Now we take the CVE_STATUS and CVE patches as base and add entries from D=
B
> only if they were not annotated yet.
>

This was a little more complicated than that. get_patched_cves() was taking
a part of CVE_STATUS at the beginning of the process, then applying the NVD
database.
The change is to import the totality and then update the status in the
process. Now, the entries in CVE_STATUS had priority before, and they still
have.
Now it is explicit, before it was hidden in the code. I do not see changes
in the end result, do you have a case in mind?


> I am not arguing against it, I actually like it much more as we will be
> able to insert also CVEs not in DB into our reports.
> But I have two comments on this:
> * this should be explicitly described in commit message
>

Yes, we can add it here. The logic will be documented more in the
standalone tool, because with the CVE database, the update rule is even
more complex.
(this is also good, it forces to write the list of priorities)


> * this makes global cve includes spill into all recipe reports, so this
> commit series should also get rid of cve-extra-exclusions.inc file finall=
y
> (or at least add a comment into it with this sideeffect)
>
This is the plan. I do not want to push a series removing
cve-extra-inclusions.inc with this one, but maybe, as you suggest, we add a
warning to this file and then remove with a separate series?


>
> > +    # If no entry, just add it
> > +    if cve not in cve_data:
> > +        cve_data[cve] =3D entry
> > +        return
> > +    # If we are updating, there might be change in the status
> > +    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve,
> > cve_data[cve]['abbrev-status'], entry['abbrev-status']))
> > +    if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
> > +        cve_data[cve] =3D entry
> > +        return
> > +    if cve_data[cve]['abbrev-status'] =3D=3D entry['abbrev-status']:
> > +        return
> > +    # Update like in {'abbrev-status': 'Patched', 'status':
> 'version-not-in-range'}
> > to {'abbrev-status': 'Unpatched', 'status': 'version-in-range'}
> > +    if entry['abbrev-status'] =3D=3D "Unpatched" and cve_data[cve]['ab=
brev-
> > status'] =3D=3D "Patched":
> > +        if entry['status'] =3D=3D "version-in-range" and
> cve_data[cve]['status'] =3D=3D
> > "version-not-in-range":
> > +            # New result from the scan, vulnerable
> > +            cve_data[cve] =3D entry
> > +            bb.debug("CVE entry %s update from Patched to Unpatched
> from the
> > scan result" % cve)
> > +            return
> > +    if entry['abbrev-status'] =3D=3D "Patched" and
> cve_data[cve]['abbrev-status']
> > =3D=3D "Unpatched":
> > +        if entry['status'] =3D=3D "version-not-in-range" and
> cve_data[cve]['status'] =3D=3D
> > "version-in-range":
> > +            # Range does not match the scan, but we already have a
> vulnerable
> > match, ignore
> > +            bb.debug("CVE entry %s update from Patched to Unpatched
> from the
> > scan result - not applying" % cve)
> > +            return
> > +    # If we have an "Ignored", it has a priority
> > +    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
> > +        bb.debug("CVE %s not updating because Ignored" % cve)
> > +        return
> > +    bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve,
> > cve_data[cve], entry))
> > +
> > +def check_cves(d, cve_data):
> >      """
> >      Connect to the NVD database and find unpatched cves.
> >      """
> > @@ -304,28 +348,19 @@ def check_cves(d, patched_cves):
> >      real_pv =3D d.getVar("PV")
> >      suffix =3D d.getVar("CVE_VERSION_SUFFIX")
> >
> > -    cves_unpatched =3D []
> > -    cves_ignored =3D []
> >      cves_status =3D []
> >      cves_in_recipe =3D False
> >      # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
> >      products =3D d.getVar("CVE_PRODUCT").split()
> >      # If this has been unset then we're not scanning for CVEs here (fo=
r
> example,
> > image recipes)
> >      if not products:
> > -        return ([], [], [], [])
> > +        return ([], [])
> >      pv =3D d.getVar("CVE_VERSION").split("+git")[0]
> >
> >      # If the recipe has been skipped/ignored we return empty lists
> >      if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
> >          bb.note("Recipe has been skipped by cve-check")
> > -        return ([], [], [], [])
> > -
> > -    # Convert CVE_STATUS into ignored CVEs and check validity
> > -    cve_ignore =3D []
> > -    for cve in (d.getVarFlags("CVE_STATUS") or {}):
> > -        decoded_status, _, _ =3D decode_cve_status(d, cve)
> > -        if decoded_status =3D=3D "Ignored":
> > -            cve_ignore.append(cve)
> > +        return ([], [])
> >
> >      import sqlite3
> >      db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
> > @@ -344,11 +379,10 @@ def check_cves(d, patched_cves):
> >          for cverow in cve_cursor:
> >              cve =3D cverow[0]
> >
> > -            if cve in cve_ignore:
> > +            if cve_is_ignored(d, cve_data, cve):
> >                  bb.note("%s-%s ignores %s" % (product, pv, cve))
> > -                cves_ignored.append(cve)
> >                  continue
> > -            elif cve in patched_cves:
> > +            elif cve_is_patched(d, cve_data, cve):
> >                  bb.note("%s has been patched" % (cve))
> >                  continue
> >              # Write status once only for each product
> > @@ -364,7 +398,7 @@ def check_cves(d, patched_cves):
> >              for row in product_cursor:
> >                  (_, _, _, version_start, operator_start, version_end,
> operator_end) =3D
> > row
> >                  #bb.debug(2, "Evaluating row " + str(row))
> > -                if cve in cve_ignore:
> > +                if cve_is_ignored(d, cve_data, cve):
> >                      ignored =3D True
> >
> >                  version_start =3D convert_cve_version(version_start)
> > @@ -403,16 +437,16 @@ def check_cves(d, patched_cves):
> >                  if vulnerable:
> >                      if ignored:
> >                          bb.note("%s is ignored in %s-%s" % (cve, pn,
> real_pv))
> > -                        cves_ignored.append(cve)
> > +                        cve_update(d, cve_data, cve, {"abbrev-status":
> "Ignored"})
>
> I think that this case happens only when we ignore the CVE via CVE_STATUS=
.
> So calling this is not necessary as it is already prefilled from for it,
> correct?
> In case it would not be prefilled, then it would drop our enrichment...
>
> >                      else:
> >                          bb.note("%s-%s is vulnerable to %s" % (pn,
> real_pv, cve))
> > -                        cves_unpatched.append(cve)
> > +                        cve_update(d, cve_data, cve, {"abbrev-status":
> "Unpatched",
> > "status": "version-in-range"})
>
> Could you please include the new statuses in cve-check-map.conf
> (e.g. version-in-range, version-not-in-range, fix-file-included)
> I think it's important to have all possible statuses there to be able to
> correct the DB manually.
>

Will add. There will be a bigger pass on the doc after it is all merged,
because there's one additional state "Unknown".

Kind regards,
Marta

--0000000000005544b1061d7e8b9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 17, 2024 at 9:11=E2=80=AF=
AM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Peter.Marko@=
siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Marta,<br>
<br>
Thanks for the great work on this topic.<br>
I have left 3 comments below.<br>
<br>
Thanks for considering them.<br>
=C2=A0 Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Marta Rybczynska via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Monday, July 15, 2024 12:20<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska@syslinbit.=
com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;; Samantha Jal=
abert<br>
&gt; &lt;<a href=3D"mailto:samantha.jalabert@syslinbit.com" target=3D"_blan=
k">samantha.jalabert@syslinbit.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH 1/3] cve-check: enrich annotation of CVEs<br=
>
&gt; <br>
&gt; Previously the information passed between different function of the<br=
>
&gt; cve-check class included only tables of patched, unpatched, ignored<br=
>
&gt; vulnerabilities and the general status of the recipe.<br>
&gt; <br>
&gt; The VEX work requires more information, and we need to pass them<br>
&gt; between different functions, so that it can be enriched as the<br>
&gt; analysis progresses. Instead of multiple tables, use a single one<br>
&gt; with annotations for each CVE encountered. For example, a patched<br>
&gt; CVE will have:<br>
&gt; <br>
&gt; {&quot;abbrev-status&quot;: &quot;Patched&quot;, &quot;status&quot;: &=
quot;version-not-in-range&quot;}<br>
&gt; <br>
&gt; abbrev-status contains the general status (Patched, Unpatched,<br>
&gt; Ignored and Unknown that will be added in the VEX code)<br>
&gt; status contains more detailed information that can come from<br>
&gt; CVE_STATUS and the analysis.<br>
&gt; <br>
&gt; Additional fields of the annotation include for example the name<br>
&gt; of the patch file fixing a given CVE.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@syslinbit.com" target=3D"_blank">marta.rybczynska@syslinbit.com</a>&gt;<br=
>
&gt; Signed-off-by: Samantha Jalabert &lt;<a href=3D"mailto:samantha.jalabe=
rt@syslinbit.com" target=3D"_blank">samantha.jalabert@syslinbit.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cve-check.bbclass | 208 +++++++++++++++++----------=
------<br>
&gt;=C2=A0 meta/lib/oe/cve_check.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +-=
<br>
&gt;=C2=A0 2 files changed, 113 insertions(+), 107 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index 93a2a1413d..f177223568 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -188,10 +188,10 @@ python do_cve_check () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patched_=
cves =3D get_patched_cves(d)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except FileNotFoundErr=
or:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal=
(&quot;Failure in searching patches&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignored, patched, unpatched=
, status =3D check_cves(d, patched_cves)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if patched or unpatched or =
(d.getVar(&quot;CVE_CHECK_COVERAGE&quot;) =3D=3D &quot;1&quot;<br>
&gt; and status):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data =3D =
get_cve_info(d, patched + unpatched + ignored)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_dat=
a(d, patched, unpatched, ignored, cve_data, status)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data, status =3D check_=
cves(d, patched_cves)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(cve_data) or (d.getV=
ar(&quot;CVE_CHECK_COVERAGE&quot;) =3D=3D &quot;1&quot; and<br>
&gt; status):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_cve_info(=
d, cve_data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_dat=
a(d, cve_data, status)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;No CVE d=
atabase found, skipping CVE check&quot;)<br>
&gt; <br>
&gt; @@ -294,7 +294,51 @@ ROOTFS_POSTPROCESS_COMMAND:prepend =3D<br>
&gt; &quot;${@&#39;cve_check_write_rootfs_manifest &#39; if d<br>
&gt;=C2=A0 do_rootfs[recrdeptask] +=3D &quot;${@&#39;do_cve_check&#39; if<b=
r>
&gt; d.getVar(&#39;CVE_CHECK_CREATE_MANIFEST&#39;) =3D=3D &#39;1&#39; else =
&#39;&#39;}&quot;<br>
&gt;=C2=A0 do_populate_sdk[recrdeptask] +=3D &quot;${@&#39;do_cve_check&#39=
; if<br>
&gt; d.getVar(&#39;CVE_CHECK_CREATE_MANIFEST&#39;) =3D=3D &#39;1&#39; else =
&#39;&#39;}&quot;<br>
&gt; <br>
&gt; -def check_cves(d, patched_cves):<br>
&gt; +def cve_is_ignored(d, cve_data, cve):<br>
&gt; +=C2=A0 =C2=A0 if cve not in cve_data:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +=C2=A0 =C2=A0 if cve_data[cve][&#39;abbrev-status&#39;] =3D=3D &quot;=
Ignored&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt; +=C2=A0 =C2=A0 return False<br>
&gt; +<br>
&gt; +def cve_is_patched(d, cve_data, cve):<br>
&gt; +=C2=A0 =C2=A0 if cve not in cve_data:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return False<br>
&gt; +=C2=A0 =C2=A0 if cve_data[cve][&#39;abbrev-status&#39;] =3D=3D &quot;=
Patched&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return True<br>
&gt; +=C2=A0 =C2=A0 return False<br>
&gt; +<br>
&gt; +def cve_update(d, cve_data, cve, entry):<br>
<br>
I think that there is a fundamental change in behavior here.<br>
Previously we were taking (NVD) DB as base and only vulnerable CVEs were co=
mpared annotated with CVE_STATUS or our presence of CVE patches.<br>
Now we take the CVE_STATUS and CVE patches as base and add entries from DB =
only if they were not annotated yet.<br></blockquote><div><br></div><div>Th=
is was a little more complicated than that. get_patched_cves() was taking a=
 part of CVE_STATUS at the beginning of the process, then applying the NVD =
database.<br></div><div>The change is to import the totality and then updat=
e the status in the process. Now, the entries in CVE_STATUS had priority be=
fore, and they still have.</div><div>Now it is explicit, before it was hidd=
en in the code. I do not see changes in the end result, do you have a case =
in mind?<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
I am not arguing against it, I actually like it much more as we will be abl=
e to insert also CVEs not in DB into our reports.<br>
But I have two comments on this:<br>
* this should be explicitly described in commit message<br></blockquote><di=
v><br></div><div>Yes, we can add it here. The logic will be documented more=
 in the standalone tool, because with the CVE database, the update rule is =
even more complex.</div><div>(this is also good, it forces to write the lis=
t of priorities)<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
* this makes global cve includes spill into all recipe reports, so this com=
mit series should also get rid of cve-extra-exclusions.inc file finally (or=
 at least add a comment into it with this sideeffect)<br></blockquote><div>=
This is the plan. I do not want to push a series removing cve-extra-inclusi=
ons.inc with this one, but maybe, as you suggest, we add a warning to this =
file and then remove with a separate series?<br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 # If no entry, just add it<br>
&gt; +=C2=A0 =C2=A0 if cve not in cve_data:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[cve] =3D entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 # If we are updating, there might be change in the stat=
us<br>
&gt; +=C2=A0 =C2=A0 bb.debug(&quot;Trying CVE entry update for %s from %s t=
o %s&quot; % (cve,<br>
&gt; cve_data[cve][&#39;abbrev-status&#39;], entry[&#39;abbrev-status&#39;]=
))<br>
&gt; +=C2=A0 =C2=A0 if cve_data[cve][&#39;abbrev-status&#39;] =3D=3D &quot;=
Unknown&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[cve] =3D entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 if cve_data[cve][&#39;abbrev-status&#39;] =3D=3D entry[=
&#39;abbrev-status&#39;]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 # Update like in {&#39;abbrev-status&#39;: &#39;Patched=
&#39;, &#39;status&#39;: &#39;version-not-in-range&#39;}<br>
&gt; to {&#39;abbrev-status&#39;: &#39;Unpatched&#39;, &#39;status&#39;: &#=
39;version-in-range&#39;}<br>
&gt; +=C2=A0 =C2=A0 if entry[&#39;abbrev-status&#39;] =3D=3D &quot;Unpatche=
d&quot; and cve_data[cve][&#39;abbrev-<br>
&gt; status&#39;] =3D=3D &quot;Patched&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if entry[&#39;status&#39;] =3D=3D &quot;v=
ersion-in-range&quot; and cve_data[cve][&#39;status&#39;] =3D=3D<br>
&gt; &quot;version-not-in-range&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # New result from the scan,=
 vulnerable<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_data[cve] =3D entry<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(&quot;CVE entry %s=
 update from Patched to Unpatched from the<br>
&gt; scan result&quot; % cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 if entry[&#39;abbrev-status&#39;] =3D=3D &quot;Patched&=
quot; and cve_data[cve][&#39;abbrev-status&#39;]<br>
&gt; =3D=3D &quot;Unpatched&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if entry[&#39;status&#39;] =3D=3D &quot;v=
ersion-not-in-range&quot; and cve_data[cve][&#39;status&#39;] =3D=3D<br>
&gt; &quot;version-in-range&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Range does not match the =
scan, but we already have a vulnerable<br>
&gt; match, ignore<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(&quot;CVE entry %s=
 update from Patched to Unpatched from the<br>
&gt; scan result - not applying&quot; % cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 # If we have an &quot;Ignored&quot;, it has a priority<=
br>
&gt; +=C2=A0 =C2=A0 if cve_data[cve][&#39;abbrev-status&#39;] =3D=3D &quot;=
Ignored&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug(&quot;CVE %s not updating becaus=
e Ignored&quot; % cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +=C2=A0 =C2=A0 bb.warn(&quot;Unhandled CVE entry update for %s from %s=
 to %s&quot; % (cve,<br>
&gt; cve_data[cve], entry))<br>
&gt; +<br>
&gt; +def check_cves(d, cve_data):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Connect to the NVD database and find unpatched cve=
s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; @@ -304,28 +348,19 @@ def check_cves(d, patched_cves):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 real_pv =3D d.getVar(&quot;PV&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 suffix =3D d.getVar(&quot;CVE_VERSION_SUFFIX&quot;=
)<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 cves_unpatched =3D []<br>
&gt; -=C2=A0 =C2=A0 cves_ignored =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cves_status =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 cves_in_recipe =3D False<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # CVE_PRODUCT can contain more than one product (e=
g. curl/libcurl)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 products =3D d.getVar(&quot;CVE_PRODUCT&quot;).spl=
it()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # If this has been unset then we&#39;re not scanni=
ng for CVEs here (for example,<br>
&gt; image recipes)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if not products:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pv =3D d.getVar(&quot;CVE_VERSION&quot;).split(&qu=
ot;+git&quot;)[0]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # If the recipe has been skipped/ignored we return=
 empty lists<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if pn in d.getVar(&quot;CVE_CHECK_SKIP_RECIPE&quot=
;).split():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Recipe has been skippe=
d by cve-check&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [])<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 # Convert CVE_STATUS into ignored CVEs and check validi=
ty<br>
&gt; -=C2=A0 =C2=A0 cve_ignore =3D []<br>
&gt; -=C2=A0 =C2=A0 for cve in (d.getVarFlags(&quot;CVE_STATUS&quot;) or {}=
):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 decoded_status, _, _ =3D decode_cve_statu=
s(d, cve)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if decoded_status =3D=3D &quot;Ignored&qu=
ot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ignore.append(cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [])<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 import sqlite3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 db_file =3D d.expand(&quot;file:${CVE_CHECK_DB_FIL=
E}?mode=3Dro&quot;)<br>
&gt; @@ -344,11 +379,10 @@ def check_cves(d, patched_cves):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for cverow in cve_cursor:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve =3D cverow[0]<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve in cve_ignore:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_is_ignored(d, cve_da=
ta, cve):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(=
&quot;%s-%s ignores %s&quot; % (product, pv, cve))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves_ignored.=
append(cve)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cve in patched_cves:<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif cve_is_patched(d, cve_=
data, cve):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(=
&quot;%s has been patched&quot; % (cve))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Write status once on=
ly for each product<br>
&gt; @@ -364,7 +398,7 @@ def check_cves(d, patched_cves):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for row in product_cur=
sor:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (_, _, _=
, version_start, operator_start, version_end, operator_end) =3D<br>
&gt; row<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #bb.debu=
g(2, &quot;Evaluating row &quot; + str(row))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve in cve=
_ignore:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if cve_is_ign=
ored(d, cve_data, cve):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ignored =3D True<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 version_=
start =3D convert_cve_version(version_start)<br>
&gt; @@ -403,16 +437,16 @@ def check_cves(d, patched_cves):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vulne=
rable:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if ignored:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s is ignored in %s-%s&quot; % (cve, pn,=
 real_pv))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cves_ignored.append(cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cve_update(d, cve_data, cve, {&quot;abbrev-status&quot;: &qu=
ot;Ignored&quot;})<br>
<br>
I think that this case happens only when we ignore the CVE via CVE_STATUS.<=
br>
So calling this is not necessary as it is already prefilled from for it, co=
rrect?<br>
In case it would not be prefilled, then it would drop our enrichment...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s-%s is vulnerable to %s&quot; % (pn, r=
eal_pv, cve))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cves_unpatched.append(cve)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 cve_update(d, cve_data, cve, {&quot;abbrev-status&quot;: &qu=
ot;Unpatched&quot;,<br>
&gt; &quot;status&quot;: &quot;version-in-range&quot;})<br>
<br>
Could you please include the new statuses in cve-check-map.conf<br>
(e.g. version-in-range, version-not-in-range, fix-file-included)<br>
I think it&#39;s important to have all possible statuses there to be able t=
o correct the DB manually.<br></blockquote><div><br></div><div>Will add. Th=
ere will be a bigger pass on the doc after it is all merged, because there&=
#39;s one additional state &quot;Unknown&quot;.</div><div><br></div><div>Ki=
nd regards,</div><div>Marta<br></div></div></div>

--0000000000005544b1061d7e8b9c--

