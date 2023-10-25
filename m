Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C55DC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 13:31:18 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.43629.1698240677647886560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 06:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBv52XOg;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2c50cd16f3bso81299281fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 06:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698240676; x=1698845476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ix4wfxJHoWKRrD6vCshH5yUiksmRHFam9rzU/cxJPeU=;
        b=MBv52XOg+BnKtoE8+fO6AMVQCkcYooA5yPEec+pXJSF5aCv69q+vm1Dy8mBHzlm/29
         MmQnlWqf3YqhC42RGjFfGEuLNkf8VfyhoNnaw6Tw14b6uxX4U/oRXyoJatUytu+vH3yk
         iNmR1cEIZU82JYYKtDsRasWv5OQd8nY2s95L32Z50rYgDWGFPRMLJhg0+D7Ujh2S9znv
         Hgw/lM9dVxJLZS7JEugZ9fzD4qWHQ5meIt3QSDkahSzvaVP9V8tp2MU1P/AiPlJHzRq8
         WRvkq94VviQAYsR+eaafsdTN1nEbRwRvz5iJ0HJvx6lcotcdTaPEXkCuvmI8BCMLqC28
         9tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698240676; x=1698845476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ix4wfxJHoWKRrD6vCshH5yUiksmRHFam9rzU/cxJPeU=;
        b=F8JFvlJofkluir+2ebOAmT4PHbqYLS+1KUYCY/afQdZcjHdR5kBO6whyyJpFdnYbZg
         IoXfixYwmyVUxIfsoQZRRWus8l3kGY3tVLEb5IrGcca+VYIH2CNXza5NB1wSJTOqKAfi
         RDKpaJcKiJQCfrU6SKN7EMdOijsyWqY/HKdNhPpMHtxGcchyaA/5KzEkfJ5b5h0Wx/hl
         imGQhXABJ6DkF5CoNB9J7y63HWsKuAqlqdmNHMJow3AILeNdiu3hxQVK+ZfQCX2elnjQ
         WJk9sjOT4EElDJhUkP8RajepwYumzqcVwDLE9k3/KCN0xBqutZDi3SIW6VgirSnwwssD
         XS2A==
X-Gm-Message-State: AOJu0YwBalx1paEqyOn5h2nv16OUqnhVZm8o5Ecu6UGR5BCOm+cczZ73
	9eV5HJgjyV0owQa5cZatxZoE7UzuiuKXYydDTY0=
X-Google-Smtp-Source: AGHT+IHg0vwF0gHPJYOpsae65/BVbEXvQLtJ11/PE8Wy9zZXHuaYLf5F5kaRtIw/Q/Mm0O5JWeAtEUDhsVxAyj/7XGA=
X-Received: by 2002:a2e:8699:0:b0:2bc:dd96:147c with SMTP id
 l25-20020a2e8699000000b002bcdd96147cmr10384433lji.34.1698240675473; Wed, 25
 Oct 2023 06:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
 <20231025051344.24088-1-shin.matsunaga@fujitsu.com> <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
 <CAApg2=RpNbt-QT3TW6qtyDn56LfG=pHXROccLW6Qh5ucDEM_ow@mail.gmail.com>
 <30cbb691-8425-4218-82e3-edef7e320411@skyrain.eu> <CAApg2=QTOKZkQmy5dW_fu-oRdpr0=j-wiFg0W0wFjVZPbm5dAw@mail.gmail.com>
 <AS1PR10MB5697967C4ABA818BF3C04AC4FDDEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697967C4ABA818BF3C04AC4FDDEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 Oct 2023 15:31:02 +0200
Message-ID: <CAApg2=Q79T5K+ynQ=6gCOx1c8DWKeTZcv9sQH-PyL9XTOYsY6g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3 statuses
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Andrej Valek <andrej.v@skyrain.eu>, Matsunaga-Shinji <shin.matsunaga@fujitsu.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 13:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189678

Hello Marko,
I think that we will need to go back to the drawing board and have a
look what we want to report from the CVE check.
I'm not totally happy with the solution proposed here, because it is
adding high-level states. However, it is a step
forward to be able to map our status to VEX. In the RFQ work on SPDX3
(which includes VEX in the "security" profile)
we had a look at that and realized that mapping of the information is
not possible, we're missing information.

The current state of "Ignore" is not great either. You have added
additional context, but still some statuses
do not make sense in Ignore. It is effectively used as an "override"
of everything.

I also have a multi-fetcher in the works, which downloads CVE data
from other sources that NVD. Results are
sometimes in conflict and we'll have to handle that too. And there are
other sources lurking behind too.

So, when the RFQ season is finished (Oct 31st), we'll get back to the
drawing board to design what statuses we really
want and need. I understand you'd like to be a part of this discussion.

Kind regards,
Marta

On Wed, Oct 25, 2023 at 3:09=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Hello Marta,
>
>
>
> Major reason why we introduced CVE_STATUS was exactly to avoid patch like=
 this.
>
> There were ideas to introduce 5 or 10 or 15 different statuses and we dec=
ided to keep 3 and introduce =E2=80=9Csub-statuses=E2=80=9D.
>
> These sub-statuses are listed in cve reports, too.
>
>
>
> Currently we have three main statuses:
>
> Patched =E2=80=93 common status for all sub-statuses which indicate that =
component is not vulnerable
>
> Unpatched - common status for all sub-statuses which indicate that compon=
ent is vulnerable
>
> Ignored - common status for all sub-statuses which indicate that componen=
t is vulnerable but not in yocto configuration context
>
>
>
> If we don=E2=80=99t like =E2=80=9CPatched=E2=80=9D we can rename it (e.g.=
 to  =E2=80=9CUnaffected=E2=80=9D) and have additional sub-statuses under t=
his new name.
>
> Otherwise we start exploding the statuses as someone will =E2=80=9Cneed=
=E2=80=9D additional one soon.
>
>
>
> If we really want to introduce these new statues (I hope not), please mod=
ify this patch to handle its CVE_STATUS flags, too.
>
> Additionally, I=E2=80=99d drop =E2=80=9CUndecidable=E2=80=9D and map it t=
o =E2=80=9CUnpatched=E2=80=9D (so someone needs to analyze as any other ope=
n vulnerability report)
>
>
>
> Best Regards,
>
>   Peter
>
>
>
> From: Marta Rybczynska <rybczynska@gmail.com>
> Sent: Wednesday, October 25, 2023 14:44
> To: Andrej Valek <andrej.v@skyrain.eu>
> Cc: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>; Richard Purdie <richar=
d.purdie@linuxfoundation.org>; OE-core <openembedded-core@lists.openembedde=
d.org>; Shunsuke Tokumoto <s-tokumoto@fujitsu.com>; Marko, Peter (ADV D EU =
SK BFS1) <Peter.Marko@siemens.com>
> Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3=
 statuses
>
>
>
> Hello Andrej,
>
> This patch is splitting the Patched state, not the ignore one. This is no=
t incorrect CPE or anything else.
>
>
>
> Currently Patched means one of two situations: either this issue has neve=
r affected the code base (example: we have version 1.0, issue was introduce=
d in 2.0 and fixed in 2.1), or the issue has been fixed.
>
>
>
> Yes, another reason to say ignore, not affected is a manual analysis show=
ing a thing like: the issue affects only windows.
>
>
>
> Regards,
>
> Marta
>
>
>
> On Wed, 25 Oct 2023, 12:18 Andrej Valek, <andrej.v@skyrain.eu> wrote:
>
> Hi Marta,
>
> That's fine, as I said we designed the "ignore" with status
> "cpe-incorrect" or "ignored" exactly for those purposes. Extending the
> option with "not affected" doesn't make any sense.
>
> You have to set the status to "why is not affected" =3D "ignored". Which
> completely covers the requested case.
>
> Regards,
> Andrej
>
> On 25.10.2023 11:33, Marta Rybczynska wrote:
> > Hi Andrej,
> > This is more complex. "Not affected" is also an issue that isn't presen=
t in the
> > code - like when we have a version that has never had the vulnerability=
.
> > Those are also currently 'Patched' in cve-check.
> >
> > This work is in sync with what VEX is doing, is it the use-case
> > Matsanaga-Shinji?
> >
> > Regards,
> > Marta
> >
> > On Wed, Oct 25, 2023 at 8:44=E2=80=AFAM Andrej Valek <andrej.v@skyrain.=
eu> wrote:
> >> Hi all,
> >>
> >> Do we really need a new "not_affected" state? I guess the ignore state
> >> is exactly designed for those purposes.
> >>
> >> Regards,
> >> Andrej
> >>
> >> On 25.10.2023 07:13, Matsunaga-Shinji wrote:
> >>> CVEs that are currently considered "Patched" are classified into the =
following 3 statuses:
> >>> 1. "Patched"      - means that a patch file that fixed the vulnerabil=
ity has been applied
> >>> 2. "Not affected" - means that the package version (PV) is not affect=
ed by the vulnerability
> >>> 3. "Undecidable"  - means that versions cannot be compared to determi=
ne if they are affected by the vulnerability
> >>>
> >>> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> >>> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> >>> ---
> >>>
> >>> Changes for v2:
> >>>      - Fix the status "Out of range" to "Not affected"
> >>>
> >>>    meta/classes/cve-check.bbclass | 55 +++++++++++++++++++++++-------=
----
> >>>    1 file changed, 38 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.=
bbclass
> >>> index b55f4299da..502db324df 100644
> >>> --- a/meta/classes/cve-check.bbclass
> >>> +++ b/meta/classes/cve-check.bbclass
> >>> @@ -185,10 +185,10 @@ python do_cve_check () {
> >>>                    patched_cves =3D get_patched_cves(d)
> >>>                except FileNotFoundError:
> >>>                    bb.fatal("Failure in searching patches")
> >>> -            ignored, patched, unpatched, status =3D check_cves(d, pa=
tched_cves)
> >>> -            if patched or unpatched or (d.getVar("CVE_CHECK_COVERAGE=
") =3D=3D "1" and status):
> >>> -                cve_data =3D get_cve_info(d, patched + unpatched + i=
gnored)
> >>> -                cve_write_data(d, patched, unpatched, ignored, cve_d=
ata, status)
> >>> +            ignored, patched, unpatched, not_affected, undecidable, =
status =3D check_cves(d, patched_cves)
> >>> +            if patched or unpatched or not_affected or undecidable o=
r (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1" and status):
> >>> +                cve_data =3D get_cve_info(d, patched + unpatched + i=
gnored + not_affected + undecidable)
> >>> +                cve_write_data(d, patched, unpatched, ignored, not_a=
ffected, undecidable, cve_data, status)
> >>>            else:
> >>>                bb.note("No CVE database found, skipping CVE check")
> >>>
> >>> @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
> >>>        products =3D d.getVar("CVE_PRODUCT").split()
> >>>        # If this has been unset then we're not scanning for CVEs here=
 (for example, image recipes)
> >>>        if not products:
> >>> -        return ([], [], [], [])
> >>> +        return ([], [], [], [], [], [])
> >>>        pv =3D d.getVar("CVE_VERSION").split("+git")[0]
> >>>
> >>>        # If the recipe has been skipped/ignored we return empty lists
> >>>        if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
> >>>            bb.note("Recipe has been skipped by cve-check")
> >>> -        return ([], [], [], [])
> >>> +        return ([], [], [], [], [], [])
> >>>
> >>>        # Convert CVE_STATUS into ignored CVEs and check validity
> >>>        cve_ignore =3D []
> >>> @@ -328,6 +328,8 @@ def check_cves(d, patched_cves):
> >>>        conn =3D sqlite3.connect(db_file, uri=3DTrue)
> >>>
> >>>        # For each of the known product names (e.g. curl has CPEs usin=
g curl and libcurl)...
> >>> +    cves_not_affected =3D []
> >>> +    cves_undecidable =3D []
> >>>        for product in products:
> >>>            cves_in_product =3D False
> >>>            if ":" in product:
> >>> @@ -355,6 +357,7 @@ def check_cves(d, patched_cves):
> >>>
> >>>                vulnerable =3D False
> >>>                ignored =3D False
> >>> +            undecidable =3D False
> >>>
> >>>                product_cursor =3D conn.execute("SELECT * FROM PRODUCT=
S WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)=
)
> >>>                for row in product_cursor:
> >>> @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
> >>>                            except:
> >>>                                bb.warn("%s: Failed to compare %s %s %=
s for %s" %
> >>>                                        (product, pv, operator_start, =
version_start, cve))
> >>> -                            vulnerable_start =3D False
> >>> +                            undecidable =3D True
> >>>                        else:
> >>>                            vulnerable_start =3D False
> >>>
> >>> @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
> >>>                            except:
> >>>                                bb.warn("%s: Failed to compare %s %s %=
s for %s" %
> >>>                                        (product, pv, operator_end, ve=
rsion_end, cve))
> >>> -                            vulnerable_end =3D False
> >>> +                            undecidable =3D True
> >>>                        else:
> >>>                            vulnerable_end =3D False
> >>>
> >>> +                    if undecidable:
> >>> +                        bb.note("%s-%s is undecidable to %s" % (pn, =
real_pv, cve))
> >>> +                        cves_undecidable.append(cve)
> >>> +                        break
> >>> +
> >>>                        if operator_start and operator_end:
> >>>                            vulnerable =3D vulnerable_start and vulner=
able_end
> >>>                        else:
> >>> @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
> >>>                        break
> >>>                product_cursor.close()
> >>>
> >>> -            if not vulnerable:
> >>> +            if not undecidable and not vulnerable:
> >>>                    bb.note("%s-%s is not vulnerable to %s" % (pn, rea=
l_pv, cve))
> >>> -                patched_cves.add(cve)
> >>> +                cves_not_affected.append(cve)
> >>>            cve_cursor.close()
> >>>
> >>>            if not cves_in_product:
> >>> @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
> >>>        if not cves_in_recipe:
> >>>            bb.note("No CVE records for products in recipe %s" % (pn))
> >>>
> >>> -    return (list(cves_ignored), list(patched_cves), cves_unpatched, =
cves_status)
> >>> +    return (list(cves_ignored), list(patched_cves), cves_unpatched, =
cves_not_affected, cves_undecidable, cves_status)
> >>>
> >>>    def get_cve_info(d, cves):
> >>>        """
> >>> @@ -447,7 +455,7 @@ def get_cve_info(d, cves):
> >>>        conn.close()
> >>>        return cve_data
> >>>
> >>> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> >>> +def cve_write_data_text(d, patched, unpatched, ignored, not_affected=
, undecidable, cve_data):
> >>>        """
> >>>        Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
> >>>        CVE manifest if enabled.
> >>> @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatched, ig=
nored, cve_data):
> >>>            return
> >>>
> >>>        # Early exit, the text format does not report packages without=
 CVEs
> >>> -    if not patched+unpatched+ignored:
> >>> +    if not patched+unpatched+ignored+not_affected+undecidable:
> >>>            return
> >>>
> >>>        nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
> >>> @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatched, ig=
nored, cve_data):
> >>>        for cve in sorted(cve_data):
> >>>            is_patched =3D cve in patched
> >>>            is_ignored =3D cve in ignored
> >>> +        is_not_affected =3D cve in not_affected
> >>> +        is_undecidable =3D cve in undecidable
> >>>
> >>>            status =3D "Unpatched"
> >>>            if (is_patched or is_ignored) and not report_all:
> >>> @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpatched, i=
gnored, cve_data):
> >>>                status =3D "Ignored"
> >>>            elif is_patched:
> >>>                status =3D "Patched"
> >>> +        elif is_not_affected:
> >>> +            status =3D "Not affected"
> >>> +        elif is_undecidable:
> >>> +            status =3D "Undecidable"
> >>>            else:
> >>>                # default value of status is Unpatched
> >>>                unpatched_cves.append(cve)
> >>> @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output, direct=
_file, deploy_file, manifest_fi
> >>>            with open(index_path, "a+") as f:
> >>>                f.write("%s\n" % fragment_path)
> >>>
> >>> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data, cv=
e_status):
> >>> +def cve_write_data_json(d, patched, unpatched, ignored, not_affected=
, undecidable, cve_data, cve_status):
> >>>        """
> >>>        Prepare CVE data for the JSON format, then write it.
> >>>        """
> >>> @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatched, ig=
nored, cve_data, cve_status):
> >>>        for cve in sorted(cve_data):
> >>>            is_patched =3D cve in patched
> >>>            is_ignored =3D cve in ignored
> >>> +        is_not_affected =3D cve in not_affected
> >>> +        is_undecidable =3D cve in undecidable
> >>> +
> >>>            status =3D "Unpatched"
> >>>            if (is_patched or is_ignored) and not report_all:
> >>>                continue
> >>> @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpatched, i=
gnored, cve_data, cve_status):
> >>>                status =3D "Ignored"
> >>>            elif is_patched:
> >>>                status =3D "Patched"
> >>> +        elif is_not_affected:
> >>> +            status =3D "Not affected"
> >>> +        elif is_undecidable:
> >>> +            status =3D "Undecidable"
> >>>            else:
> >>>                # default value of status is Unpatched
> >>>                unpatched_cves.append(cve)
> >>> @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpatched, =
ignored, cve_data, cve_status):
> >>>
> >>>        cve_check_write_json_output(d, output, direct_file, deploy_fil=
e, manifest_file)
> >>>
> >>> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status)=
:
> >>> +def cve_write_data(d, patched, unpatched, ignored, not_affected, und=
ecidable, cve_data, status):
> >>>        """
> >>>        Write CVE data in each enabled format.
> >>>        """
> >>>
> >>>        if d.getVar("CVE_CHECK_FORMAT_TEXT") =3D=3D "1":
> >>> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data=
)
> >>> +        cve_write_data_text(d, patched, unpatched, ignored, not_affe=
cted, undecidable, cve_data)
> >>>        if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
> >>> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data=
, status)
> >>> +        cve_write_data_json(d, patched, unpatched, ignored, not_affe=
cted, undecidable, cve_data, status)
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#189667): https://lists.openembedded.org/g/openemb=
edded-core/message/189667
> >>> Mute This Topic: https://lists.openembedded.org/mt/102172913/3619876
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [andrej.v@skyrain.eu]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

