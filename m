Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7512BC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 09:33:57 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.169555.1698226432332979546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 02:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kw4y+jkY;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507a29c7eefso8126128e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698226430; x=1698831230; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0SJV042cLsaYErMLzvGfC8JjtLzKkf85+T9VeUFCSE=;
        b=Kw4y+jkYLx/rZlb5jKS4Aatfy1a7hplx4nuewQ3V2dXhUqMUgNoalpcTn3VcqGAE8E
         yXNWHJGA3t9dZS3j65QxgrHtisl+93+1uP3P8sDvWsZFjfO3k/HHY5yaP22vkLQGPQwO
         yZ5ZY3I9HgGwceLTbg4cNfuBMjsrq+k3/4J3CyMlVV2txXEHocAVQWg9OeXlGuQAPuux
         +9oL/IWA2h/B370byULkzRPf5otZ42ycykwu6/1deM9I9WVXS3OsqZE5GcnzeWMs5dTp
         OS/TUu6sIzSWsEV7nX2YNj+YON2alL7S1nu61NvlhbZGbAAZxzfYRAcE4q8slAM775Eb
         d5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698226430; x=1698831230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0SJV042cLsaYErMLzvGfC8JjtLzKkf85+T9VeUFCSE=;
        b=IDhv+I+VdKL4aOdFSbUAkCGz8JkhkupCAyfGX8x6oOTAJoHTrG29daJD4aTau6UXPR
         P23IHbjVKdLGZtmUJ/bX0V0pj2AaDChkqHKzUJug2SwEojSuhYIW8TavyhqqHMVmlDku
         9ISA08kyhUdJSmET75SqPo8IDdb/ldabNFi3CkSxos5cQRtK58Cd9GL8joeGjtVCl4IB
         lizT5UZRY4NUI9Wc8ABD5yXjA/7piwPQ7zZZgILfKseg15iSMjQhD3SFJ9cyVlmJSygB
         rtWGs9xYGqbGgfdXzD3WXBXRJStZyAoQ8b3ZnYLt2hoRLc03rqT9HCqTX2jfEd+9oFMj
         y/IA==
X-Gm-Message-State: AOJu0YwxpcQCIkF/mIrwfze9whuoGAHsyFOm80lXfje6kQ8ZD+1H22uV
	gsShe8vSA4SLmxvEpJ3GQdkxk7nKUnoqxJBE+O0=
X-Google-Smtp-Source: AGHT+IHUQaToqkBoe5TiNAjMun5bDj2yFrjg2ZwDAzcgk5D6KLq9ledj4dJB2rXdrTiaDq+wNgaQ5nE8594+EGUyKz0=
X-Received: by 2002:a2e:9649:0:b0:2c5:569:5aaf with SMTP id
 z9-20020a2e9649000000b002c505695aafmr10309050ljh.51.1698226429873; Wed, 25
 Oct 2023 02:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
 <20231025051344.24088-1-shin.matsunaga@fujitsu.com> <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
In-Reply-To: <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 Oct 2023 11:33:36 +0200
Message-ID: <CAApg2=RpNbt-QT3TW6qtyDn56LfG=pHXROccLW6Qh5ucDEM_ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3 statuses
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>, richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, 
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 09:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189672

Hi Andrej,
This is more complex. "Not affected" is also an issue that isn't present in=
 the
code - like when we have a version that has never had the vulnerability.
Those are also currently 'Patched' in cve-check.

This work is in sync with what VEX is doing, is it the use-case
Matsanaga-Shinji?

Regards,
Marta

On Wed, Oct 25, 2023 at 8:44=E2=80=AFAM Andrej Valek <andrej.v@skyrain.eu> =
wrote:
>
> Hi all,
>
> Do we really need a new "not_affected" state? I guess the ignore state
> is exactly designed for those purposes.
>
> Regards,
> Andrej
>
> On 25.10.2023 07:13, Matsunaga-Shinji wrote:
> > CVEs that are currently considered "Patched" are classified into the fo=
llowing 3 statuses:
> > 1. "Patched"      - means that a patch file that fixed the vulnerabilit=
y has been applied
> > 2. "Not affected" - means that the package version (PV) is not affected=
 by the vulnerability
> > 3. "Undecidable"  - means that versions cannot be compared to determine=
 if they are affected by the vulnerability
> >
> > Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> > Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> > ---
> >
> > Changes for v2:
> >     - Fix the status "Out of range" to "Not affected"
> >
> >   meta/classes/cve-check.bbclass | 55 +++++++++++++++++++++++----------=
-
> >   1 file changed, 38 insertions(+), 17 deletions(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bb=
class
> > index b55f4299da..502db324df 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -185,10 +185,10 @@ python do_cve_check () {
> >                   patched_cves =3D get_patched_cves(d)
> >               except FileNotFoundError:
> >                   bb.fatal("Failure in searching patches")
> > -            ignored, patched, unpatched, status =3D check_cves(d, patc=
hed_cves)
> > -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE")=
 =3D=3D "1" and status):
> > -                cve_data =3D get_cve_info(d, patched + unpatched + ign=
ored)
> > -                cve_write_data(d, patched, unpatched, ignored, cve_dat=
a, status)
> > +            ignored, patched, unpatched, not_affected, undecidable, st=
atus =3D check_cves(d, patched_cves)
> > +            if patched or unpatched or not_affected or undecidable or =
(d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1" and status):
> > +                cve_data =3D get_cve_info(d, patched + unpatched + ign=
ored + not_affected + undecidable)
> > +                cve_write_data(d, patched, unpatched, ignored, not_aff=
ected, undecidable, cve_data, status)
> >           else:
> >               bb.note("No CVE database found, skipping CVE check")
> >
> > @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
> >       products =3D d.getVar("CVE_PRODUCT").split()
> >       # If this has been unset then we're not scanning for CVEs here (f=
or example, image recipes)
> >       if not products:
> > -        return ([], [], [], [])
> > +        return ([], [], [], [], [], [])
> >       pv =3D d.getVar("CVE_VERSION").split("+git")[0]
> >
> >       # If the recipe has been skipped/ignored we return empty lists
> >       if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
> >           bb.note("Recipe has been skipped by cve-check")
> > -        return ([], [], [], [])
> > +        return ([], [], [], [], [], [])
> >
> >       # Convert CVE_STATUS into ignored CVEs and check validity
> >       cve_ignore =3D []
> > @@ -328,6 +328,8 @@ def check_cves(d, patched_cves):
> >       conn =3D sqlite3.connect(db_file, uri=3DTrue)
> >
> >       # For each of the known product names (e.g. curl has CPEs using c=
url and libcurl)...
> > +    cves_not_affected =3D []
> > +    cves_undecidable =3D []
> >       for product in products:
> >           cves_in_product =3D False
> >           if ":" in product:
> > @@ -355,6 +357,7 @@ def check_cves(d, patched_cves):
> >
> >               vulnerable =3D False
> >               ignored =3D False
> > +            undecidable =3D False
> >
> >               product_cursor =3D conn.execute("SELECT * FROM PRODUCTS W=
HERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
> >               for row in product_cursor:
> > @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
> >                           except:
> >                               bb.warn("%s: Failed to compare %s %s %s f=
or %s" %
> >                                       (product, pv, operator_start, ver=
sion_start, cve))
> > -                            vulnerable_start =3D False
> > +                            undecidable =3D True
> >                       else:
> >                           vulnerable_start =3D False
> >
> > @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
> >                           except:
> >                               bb.warn("%s: Failed to compare %s %s %s f=
or %s" %
> >                                       (product, pv, operator_end, versi=
on_end, cve))
> > -                            vulnerable_end =3D False
> > +                            undecidable =3D True
> >                       else:
> >                           vulnerable_end =3D False
> >
> > +                    if undecidable:
> > +                        bb.note("%s-%s is undecidable to %s" % (pn, re=
al_pv, cve))
> > +                        cves_undecidable.append(cve)
> > +                        break
> > +
> >                       if operator_start and operator_end:
> >                           vulnerable =3D vulnerable_start and vulnerabl=
e_end
> >                       else:
> > @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
> >                       break
> >               product_cursor.close()
> >
> > -            if not vulnerable:
> > +            if not undecidable and not vulnerable:
> >                   bb.note("%s-%s is not vulnerable to %s" % (pn, real_p=
v, cve))
> > -                patched_cves.add(cve)
> > +                cves_not_affected.append(cve)
> >           cve_cursor.close()
> >
> >           if not cves_in_product:
> > @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
> >       if not cves_in_recipe:
> >           bb.note("No CVE records for products in recipe %s" % (pn))
> >
> > -    return (list(cves_ignored), list(patched_cves), cves_unpatched, cv=
es_status)
> > +    return (list(cves_ignored), list(patched_cves), cves_unpatched, cv=
es_not_affected, cves_undecidable, cves_status)
> >
> >   def get_cve_info(d, cves):
> >       """
> > @@ -447,7 +455,7 @@ def get_cve_info(d, cves):
> >       conn.close()
> >       return cve_data
> >
> > -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> > +def cve_write_data_text(d, patched, unpatched, ignored, not_affected, =
undecidable, cve_data):
> >       """
> >       Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
> >       CVE manifest if enabled.
> > @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatched, igno=
red, cve_data):
> >           return
> >
> >       # Early exit, the text format does not report packages without CV=
Es
> > -    if not patched+unpatched+ignored:
> > +    if not patched+unpatched+ignored+not_affected+undecidable:
> >           return
> >
> >       nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
> > @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatched, igno=
red, cve_data):
> >       for cve in sorted(cve_data):
> >           is_patched =3D cve in patched
> >           is_ignored =3D cve in ignored
> > +        is_not_affected =3D cve in not_affected
> > +        is_undecidable =3D cve in undecidable
> >
> >           status =3D "Unpatched"
> >           if (is_patched or is_ignored) and not report_all:
> > @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpatched, ign=
ored, cve_data):
> >               status =3D "Ignored"
> >           elif is_patched:
> >               status =3D "Patched"
> > +        elif is_not_affected:
> > +            status =3D "Not affected"
> > +        elif is_undecidable:
> > +            status =3D "Undecidable"
> >           else:
> >               # default value of status is Unpatched
> >               unpatched_cves.append(cve)
> > @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output, direct_f=
ile, deploy_file, manifest_fi
> >           with open(index_path, "a+") as f:
> >               f.write("%s\n" % fragment_path)
> >
> > -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cve_=
status):
> > +def cve_write_data_json(d, patched, unpatched, ignored, not_affected, =
undecidable, cve_data, cve_status):
> >       """
> >       Prepare CVE data for the JSON format, then write it.
> >       """
> > @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatched, igno=
red, cve_data, cve_status):
> >       for cve in sorted(cve_data):
> >           is_patched =3D cve in patched
> >           is_ignored =3D cve in ignored
> > +        is_not_affected =3D cve in not_affected
> > +        is_undecidable =3D cve in undecidable
> > +
> >           status =3D "Unpatched"
> >           if (is_patched or is_ignored) and not report_all:
> >               continue
> > @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpatched, ign=
ored, cve_data, cve_status):
> >               status =3D "Ignored"
> >           elif is_patched:
> >               status =3D "Patched"
> > +        elif is_not_affected:
> > +            status =3D "Not affected"
> > +        elif is_undecidable:
> > +            status =3D "Undecidable"
> >           else:
> >               # default value of status is Unpatched
> >               unpatched_cves.append(cve)
> > @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpatched, ig=
nored, cve_data, cve_status):
> >
> >       cve_check_write_json_output(d, output, direct_file, deploy_file, =
manifest_file)
> >
> > -def cve_write_data(d, patched, unpatched, ignored, cve_data, status):
> > +def cve_write_data(d, patched, unpatched, ignored, not_affected, undec=
idable, cve_data, status):
> >       """
> >       Write CVE data in each enabled format.
> >       """
> >
> >       if d.getVar("CVE_CHECK_FORMAT_TEXT") =3D=3D "1":
> > -        cve_write_data_text(d, patched, unpatched, ignored, cve_data)
> > +        cve_write_data_text(d, patched, unpatched, ignored, not_affect=
ed, undecidable, cve_data)
> >       if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
> > -        cve_write_data_json(d, patched, unpatched, ignored, cve_data, =
status)
> > +        cve_write_data_json(d, patched, unpatched, ignored, not_affect=
ed, undecidable, cve_data, status)
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#189667): https://lists.openembedded.org/g/openembed=
ded-core/message/189667
> > Mute This Topic: https://lists.openembedded.org/mt/102172913/3619876
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
andrej.v@skyrain.eu]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

