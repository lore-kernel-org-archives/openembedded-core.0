Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653F5C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 12:44:08 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.172345.1698237842270697462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 05:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OSjcBMsB;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso81324211fa.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 05:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698237840; x=1698842640; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wAK4Ax3vVcE5231PzCPBlCoeMfXODb7DlGVDNVanTqo=;
        b=OSjcBMsBgbomlIjnqGOTchbZz0wRhXNU4ogyCOX/4AUke0tQVX5umycyKwHfOzyk5S
         TvkoRuOTLMe/ZoHk9mnq3lWjPEyn4Uwp3llCravQnId0J2I30ARBtyZ6OH246pIBALKN
         L4pOzIif3qQuFtg+WBIz1OlSS7R+2/Iw8C8un+NV8p+/UPyNDObgEQ/mSM6hy2yuNnN5
         cQ2HUkJ6/0JUisWj4SUvgphBcrPF1dBa6T6fgZjm188+//ObAX2pi419wZIRUa7kIbaf
         0v9yQWB39C0BDCbdxRguFyAolQ1QUC/lCQ6mW4mBDI3/Q5HbrJ1xUmzgptpYPlU0OPPi
         faSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698237840; x=1698842640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wAK4Ax3vVcE5231PzCPBlCoeMfXODb7DlGVDNVanTqo=;
        b=I/YAY80hf71mgU6UJvMqSGqeMa6uDjhCLn6Xc4Z/NQRxIxGwGQ7/jlPlrFlQmFVMd2
         CpCi3eSf4UxWENgRrtEYqHEpjsRvW+8sbkmpfqEedTanqLoLIsgy9Q4WAGokiGAud8u7
         U448Z5hWbHPvHCYthin/U5553hiEYXedn+TA5Wf1ksjPqLE27NoryVNKtP1Fi0cJhI1p
         IuWuGcFLiuaKFBpXliaZwaqyUjZK6u7tHkvTkZaZGwp6K9LJMAwegC61GGvBrnO87X8p
         LX89Wobz80QvEwMmCDgYzluX7Yw3w9wX+Lwv9/fzMd5TSfdj+enAMzYorWUeB67akfV1
         7QIw==
X-Gm-Message-State: AOJu0Ywg3NtKlQVxnJ92WwCDmvPp0atYgdZi0SXoGq/3WGtKR7mpfX/X
	QQaGiswl0BTtWIFRTvUJd40Zw2wQ2rkDwoHck0g=
X-Google-Smtp-Source: AGHT+IEMJ4z78WzqL1HRyJj8zwMmqm7i/7oL6kbkHAGXBosyEM4kWeMGlrfRk8llc+Q3O8N62uePRRw80KvB5vmYFN8=
X-Received: by 2002:a2e:984b:0:b0:2c5:3339:71d6 with SMTP id
 e11-20020a2e984b000000b002c5333971d6mr10471982ljj.19.1698237839970; Wed, 25
 Oct 2023 05:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230922083400.3157-1-shin.matsunaga@fujitsu.com>
 <20231025051344.24088-1-shin.matsunaga@fujitsu.com> <a69cb061-306a-4895-b0f9-28eb1c9ecc37@skyrain.eu>
 <CAApg2=RpNbt-QT3TW6qtyDn56LfG=pHXROccLW6Qh5ucDEM_ow@mail.gmail.com> <30cbb691-8425-4218-82e3-edef7e320411@skyrain.eu>
In-Reply-To: <30cbb691-8425-4218-82e3-edef7e320411@skyrain.eu>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 25 Oct 2023 14:43:47 +0200
Message-ID: <CAApg2=QTOKZkQmy5dW_fu-oRdpr0=j-wiFg0W0wFjVZPbm5dAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] cve-check: Classify patched CVEs into 3 statuses
To: Andrej Valek <andrej.v@skyrain.eu>
Cc: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Shunsuke Tokumoto <s-tokumoto@fujitsu.com>, Peter Marko <Peter.Marko@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000003216e7060889cf97"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 12:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189676

--0000000000003216e7060889cf97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Andrej,
This patch is splitting the Patched state, not the ignore one. This is not
incorrect CPE or anything else.

Currently Patched means one of two situations: either this issue has never
affected the code base (example: we have version 1.0, issue was introduced
in 2.0 and fixed in 2.1), or the issue has been fixed.

Yes, another reason to say ignore, not affected is a manual analysis
showing a thing like: the issue affects only windows.

Regards,
Marta


On Wed, 25 Oct 2023, 12:18 Andrej Valek, <andrej.v@skyrain.eu> wrote:

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
t
> in the
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
eu>
> wrote:
> >> Hi all,
> >>
> >> Do we really need a new "not_affected" state? I guess the ignore state
> >> is exactly designed for those purposes.
> >>
> >> Regards,
> >> Andrej
> >>
> >> On 25.10.2023 07:13, Matsunaga-Shinji wrote:
> >>> CVEs that are currently considered "Patched" are classified into the
> following 3 statuses:
> >>> 1. "Patched"      - means that a patch file that fixed the
> vulnerability has been applied
> >>> 2. "Not affected" - means that the package version (PV) is not
> affected by the vulnerability
> >>> 3. "Undecidable"  - means that versions cannot be compared to
> determine if they are affected by the vulnerability
> >>>
> >>> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> >>> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> >>> ---
> >>>
> >>> Changes for v2:
> >>>      - Fix the status "Out of range" to "Not affected"
> >>>
> >>>    meta/classes/cve-check.bbclass | 55
> +++++++++++++++++++++++-----------
> >>>    1 file changed, 38 insertions(+), 17 deletions(-)
> >>>
> >>> diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> >>> index b55f4299da..502db324df 100644
> >>> --- a/meta/classes/cve-check.bbclass
> >>> +++ b/meta/classes/cve-check.bbclass
> >>> @@ -185,10 +185,10 @@ python do_cve_check () {
> >>>                    patched_cves =3D get_patched_cves(d)
> >>>                except FileNotFoundError:
> >>>                    bb.fatal("Failure in searching patches")
> >>> -            ignored, patched, unpatched, status =3D check_cves(d,
> patched_cves)
> >>> -            if patched or unpatched or
> (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1" and status):
> >>> -                cve_data =3D get_cve_info(d, patched + unpatched +
> ignored)
> >>> -                cve_write_data(d, patched, unpatched, ignored,
> cve_data, status)
> >>> +            ignored, patched, unpatched, not_affected, undecidable,
> status =3D check_cves(d, patched_cves)
> >>> +            if patched or unpatched or not_affected or undecidable o=
r
> (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "1" and status):
> >>> +                cve_data =3D get_cve_info(d, patched + unpatched +
> ignored + not_affected + undecidable)
> >>> +                cve_write_data(d, patched, unpatched, ignored,
> not_affected, undecidable, cve_data, status)
> >>>            else:
> >>>                bb.note("No CVE database found, skipping CVE check")
> >>>
> >>> @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):
> >>>        products =3D d.getVar("CVE_PRODUCT").split()
> >>>        # If this has been unset then we're not scanning for CVEs here
> (for example, image recipes)
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
g
> curl and libcurl)...
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
S
> WHERE ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor)=
)
> >>>                for row in product_cursor:
> >>> @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):
> >>>                            except:
> >>>                                bb.warn("%s: Failed to compare %s %s %=
s
> for %s" %
> >>>                                        (product, pv, operator_start,
> version_start, cve))
> >>> -                            vulnerable_start =3D False
> >>> +                            undecidable =3D True
> >>>                        else:
> >>>                            vulnerable_start =3D False
> >>>
> >>> @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):
> >>>                            except:
> >>>                                bb.warn("%s: Failed to compare %s %s %=
s
> for %s" %
> >>>                                        (product, pv, operator_end,
> version_end, cve))
> >>> -                            vulnerable_end =3D False
> >>> +                            undecidable =3D True
> >>>                        else:
> >>>                            vulnerable_end =3D False
> >>>
> >>> +                    if undecidable:
> >>> +                        bb.note("%s-%s is undecidable to %s" % (pn,
> real_pv, cve))
> >>> +                        cves_undecidable.append(cve)
> >>> +                        break
> >>> +
> >>>                        if operator_start and operator_end:
> >>>                            vulnerable =3D vulnerable_start and
> vulnerable_end
> >>>                        else:
> >>> @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):
> >>>                        break
> >>>                product_cursor.close()
> >>>
> >>> -            if not vulnerable:
> >>> +            if not undecidable and not vulnerable:
> >>>                    bb.note("%s-%s is not vulnerable to %s" % (pn,
> real_pv, cve))
> >>> -                patched_cves.add(cve)
> >>> +                cves_not_affected.append(cve)
> >>>            cve_cursor.close()
> >>>
> >>>            if not cves_in_product:
> >>> @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):
> >>>        if not cves_in_recipe:
> >>>            bb.note("No CVE records for products in recipe %s" % (pn))
> >>>
> >>> -    return (list(cves_ignored), list(patched_cves), cves_unpatched,
> cves_status)
> >>> +    return (list(cves_ignored), list(patched_cves), cves_unpatched,
> cves_not_affected, cves_undecidable, cves_status)
> >>>
> >>>    def get_cve_info(d, cves):
> >>>        """
> >>> @@ -447,7 +455,7 @@ def get_cve_info(d, cves):
> >>>        conn.close()
> >>>        return cve_data
> >>>
> >>> -def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
> >>> +def cve_write_data_text(d, patched, unpatched, ignored, not_affected=
,
> undecidable, cve_data):
> >>>        """
> >>>        Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
> >>>        CVE manifest if enabled.
> >>> @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
> >>>            return
> >>>
> >>>        # Early exit, the text format does not report packages without
> CVEs
> >>> -    if not patched+unpatched+ignored:
> >>> +    if not patched+unpatched+ignored+not_affected+undecidable:
> >>>            return
> >>>
> >>>        nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
> >>> @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
> >>>        for cve in sorted(cve_data):
> >>>            is_patched =3D cve in patched
> >>>            is_ignored =3D cve in ignored
> >>> +        is_not_affected =3D cve in not_affected
> >>> +        is_undecidable =3D cve in undecidable
> >>>
> >>>            status =3D "Unpatched"
> >>>            if (is_patched or is_ignored) and not report_all:
> >>> @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpatched,
> ignored, cve_data):
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
> >>> @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output,
> direct_file, deploy_file, manifest_fi
> >>>            with open(index_path, "a+") as f:
> >>>                f.write("%s\n" % fragment_path)
> >>>
> >>> -def cve_write_data_json(d, patched, unpatched, ignored, cve_data,
> cve_status):
> >>> +def cve_write_data_json(d, patched, unpatched, ignored, not_affected=
,
> undecidable, cve_data, cve_status):
> >>>        """
> >>>        Prepare CVE data for the JSON format, then write it.
> >>>        """
> >>> @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
> >>>        for cve in sorted(cve_data):
> >>>            is_patched =3D cve in patched
> >>>            is_ignored =3D cve in ignored
> >>> +        is_not_affected =3D cve in not_affected
> >>> +        is_undecidable =3D cve in undecidable
> >>> +
> >>>            status =3D "Unpatched"
> >>>            if (is_patched or is_ignored) and not report_all:
> >>>                continue
> >>> @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
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
> >>> @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpatched,
> ignored, cve_data, cve_status):
> >>>
> >>>        cve_check_write_json_output(d, output, direct_file,
> deploy_file, manifest_file)
> >>>
> >>> -def cve_write_data(d, patched, unpatched, ignored, cve_data, status)=
:
> >>> +def cve_write_data(d, patched, unpatched, ignored, not_affected,
> undecidable, cve_data, status):
> >>>        """
> >>>        Write CVE data in each enabled format.
> >>>        """
> >>>
> >>>        if d.getVar("CVE_CHECK_FORMAT_TEXT") =3D=3D "1":
> >>> -        cve_write_data_text(d, patched, unpatched, ignored, cve_data=
)
> >>> +        cve_write_data_text(d, patched, unpatched, ignored,
> not_affected, undecidable, cve_data)
> >>>        if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
> >>> -        cve_write_data_json(d, patched, unpatched, ignored, cve_data=
,
> status)
> >>> +        cve_write_data_json(d, patched, unpatched, ignored,
> not_affected, undecidable, cve_data, status)
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#189667):
> https://lists.openembedded.org/g/openembedded-core/message/189667
> >>> Mute This Topic: https://lists.openembedded.org/mt/102172913/3619876
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
> [andrej.v@skyrain.eu]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>
>
>

--0000000000003216e7060889cf97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello Andrej,<div dir=3D"auto">This patch is splitti=
ng the Patched state, not the ignore one. This is not incorrect CPE or anyt=
hing else.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Currently Pat=
ched means one of two situations: either this issue has never affected the =
code base (example: we have version 1.0, issue was introduced in 2.0 and fi=
xed in 2.1), or the issue has been fixed.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Yes, another reason to say ignore, not affected is a manu=
al analysis showing a thing like: the issue affects only windows.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div dir=3D"auto">M=
arta=C2=A0</div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, 25 Oct 2023, 12:18 Andrej Valek, &lt;<a href=3D"mai=
lto:andrej.v@skyrain.eu" target=3D"_blank" rel=3D"noreferrer">andrej.v@skyr=
ain.eu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Marta,<br>
<br>
That&#39;s fine, as I said we designed the &quot;ignore&quot; with status <=
br>
&quot;cpe-incorrect&quot; or &quot;ignored&quot; exactly for those purposes=
. Extending the <br>
option with &quot;not affected&quot; doesn&#39;t make any sense.<br>
<br>
You have to set the status to &quot;why is not affected&quot; =3D &quot;ign=
ored&quot;. Which <br>
completely covers the requested case.<br>
<br>
Regards,<br>
Andrej<br>
<br>
On 25.10.2023 11:33, Marta Rybczynska wrote:<br>
&gt; Hi Andrej,<br>
&gt; This is more complex. &quot;Not affected&quot; is also an issue that i=
sn&#39;t present in the<br>
&gt; code - like when we have a version that has never had the vulnerabilit=
y.<br>
&gt; Those are also currently &#39;Patched&#39; in cve-check.<br>
&gt;<br>
&gt; This work is in sync with what VEX is doing, is it the use-case<br>
&gt; Matsanaga-Shinji?<br>
&gt;<br>
&gt; Regards,<br>
&gt; Marta<br>
&gt;<br>
&gt; On Wed, Oct 25, 2023 at 8:44=E2=80=AFAM Andrej Valek &lt;<a href=3D"ma=
ilto:andrej.v@skyrain.eu" rel=3D"noreferrer noreferrer" target=3D"_blank">a=
ndrej.v@skyrain.eu</a>&gt; wrote:<br>
&gt;&gt; Hi all,<br>
&gt;&gt;<br>
&gt;&gt; Do we really need a new &quot;not_affected&quot; state? I guess th=
e ignore state<br>
&gt;&gt; is exactly designed for those purposes.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Andrej<br>
&gt;&gt;<br>
&gt;&gt; On 25.10.2023 07:13, Matsunaga-Shinji wrote:<br>
&gt;&gt;&gt; CVEs that are currently considered &quot;Patched&quot; are cla=
ssified into the following 3 statuses:<br>
&gt;&gt;&gt; 1. &quot;Patched&quot;=C2=A0 =C2=A0 =C2=A0 - means that a patc=
h file that fixed the vulnerability has been applied<br>
&gt;&gt;&gt; 2. &quot;Not affected&quot; - means that the package version (=
PV) is not affected by the vulnerability<br>
&gt;&gt;&gt; 3. &quot;Undecidable&quot;=C2=A0 - means that versions cannot =
be compared to determine if they are affected by the vulnerability<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Shinji Matsunaga &lt;<a href=3D"mailto:shin.mat=
sunaga@fujitsu.com" rel=3D"noreferrer noreferrer" target=3D"_blank">shin.ma=
tsunaga@fujitsu.com</a>&gt;<br>
&gt;&gt;&gt; Signed-off-by: Shunsuke Tokumoto &lt;<a href=3D"mailto:s-tokum=
oto@fujitsu.com" rel=3D"noreferrer noreferrer" target=3D"_blank">s-tokumoto=
@fujitsu.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Changes for v2:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 - Fix the status &quot;Out of range&quot; =
to &quot;Not affected&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 meta/classes/cve-check.bbclass | 55 +++++++++++++=
++++++++++-----------<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 38 insertions(+), 17 deletions(-)=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve=
-check.bbclass<br>
&gt;&gt;&gt; index b55f4299da..502db324df 100644<br>
&gt;&gt;&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt;&gt;&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt;&gt;&gt; @@ -185,10 +185,10 @@ python do_cve_check () {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 patched_cves =3D get_patched_cves(d)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except =
FileNotFoundError:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.fatal(&quot;Failure in searching patches&quot;)<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignored, patched, u=
npatched, status =3D check_cves(d, patched_cves)<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if patched or unpat=
ched or (d.getVar(&quot;CVE_CHECK_COVERAGE&quot;) =3D=3D &quot;1&quot; and =
status):<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_d=
ata =3D get_cve_info(d, patched + unpatched + ignored)<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_w=
rite_data(d, patched, unpatched, ignored, cve_data, status)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignored, patched, u=
npatched, not_affected, undecidable, status =3D check_cves(d, patched_cves)=
<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if patched or unpat=
ched or not_affected or undecidable or (d.getVar(&quot;CVE_CHECK_COVERAGE&q=
uot;) =3D=3D &quot;1&quot; and status):<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_d=
ata =3D get_cve_info(d, patched + unpatched + ignored + not_affected + unde=
cidable)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_w=
rite_data(d, patched, unpatched, ignored, not_affected, undecidable, cve_da=
ta, status)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note=
(&quot;No CVE database found, skipping CVE check&quot;)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -308,13 +308,13 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 products =3D d.getVar(&quot;CVE_PRO=
DUCT&quot;).split()<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If this has been unset then we&#3=
9;re not scanning for CVEs here (for example, image recipes)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not products:<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [])<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [], [], [])<b=
r>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pv =3D d.getVar(&quot;CVE_VERSION&q=
uot;).split(&quot;+git&quot;)[0]<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If the recipe has been skipped/ig=
nored we return empty lists<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pn in d.getVar(&quot;CVE_CHECK_S=
KIP_RECIPE&quot;).split():<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;Recipe =
has been skipped by cve-check&quot;)<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [])<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ([], [], [], [], [], [])<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Convert CVE_STATUS into ignored C=
VEs and check validity<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_ignore =3D []<br>
&gt;&gt;&gt; @@ -328,6 +328,8 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 conn =3D sqlite3.connect(db_file, u=
ri=3DTrue)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # For each of the known product nam=
es (e.g. curl has CPEs using curl and libcurl)...<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cves_not_affected =3D []<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 cves_undecidable =3D []<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for product in products:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves_in_product =3D F=
alse<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;:&quot; in p=
roduct:<br>
&gt;&gt;&gt; @@ -355,6 +357,7 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnera=
ble =3D False<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ignored=
 =3D False<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undecidable =3D Fal=
se<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product=
_cursor =3D conn.execute(&quot;SELECT * FROM PRODUCTS WHERE ID IS ? AND PRO=
DUCT IS ? AND VENDOR LIKE ?&quot;, (cve, product, vendor))<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for row=
 in product_cursor:<br>
&gt;&gt;&gt; @@ -376,7 +379,7 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s: Failed t=
o compare %s %s %s for %s&quot; %<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (product, pv, operator_start, version_start, cve))<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnerable_start =3D False<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undecidable =3D True<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnerable_start =3D False<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; @@ -387,10 +390,15 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;%s: Failed t=
o compare %s %s %s for %s&quot; %<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (product, pv, operator_end, version_end, cve))<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnerable_end =3D False<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 undecidable =3D True<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnerable_end =3D False<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if undecidable:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s-%s is undecidable to %s&quot; % (=
pn, real_pv, cve))<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cves_undecidable.append(cve)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 if operator_start and operator_end:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vulnerable =3D vulnerable_start and vuln=
erable_end<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt; @@ -406,9 +414,9 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 break<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 product=
_cursor.close()<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not vulnerable:<=
br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not undecidable =
and not vulnerable:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.note(&quot;%s-%s is not vulnerable to %s&quot; % (pn, real_pv, cv=
e))<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 patch=
ed_cves.add(cve)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cves_=
not_affected.append(cve)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_cursor.close()<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cves_in_produc=
t:<br>
&gt;&gt;&gt; @@ -420,7 +428,7 @@ def check_cves(d, patched_cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not cves_in_recipe:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;No CVE =
records for products in recipe %s&quot; % (pn))<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 return (list(cves_ignored), list(patched_cves),=
 cves_unpatched, cves_status)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 return (list(cves_ignored), list(patched_cves),=
 cves_unpatched, cves_not_affected, cves_undecidable, cves_status)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 def get_cve_info(d, cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; @@ -447,7 +455,7 @@ def get_cve_info(d, cves):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 conn.close()<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cve_data<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -def cve_write_data_text(d, patched, unpatched, ignored, cve_d=
ata):<br>
&gt;&gt;&gt; +def cve_write_data_text(d, patched, unpatched, ignored, not_a=
ffected, undecidable, cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Write CVE information in WORKDIR; a=
nd to CVE_CHECK_DIR, and<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 CVE manifest if enabled.<br>
&gt;&gt;&gt; @@ -471,7 +479,7 @@ def cve_write_data_text(d, patched, unpatc=
hed, ignored, cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Early exit, the text format does =
not report packages without CVEs<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 if not patched+unpatched+ignored:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 if not patched+unpatched+ignored+not_affected+u=
ndecidable:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 nvd_link =3D &quot;<a href=3D"https=
://nvd.nist.gov/vuln/detail/" rel=3D"noreferrer noreferrer noreferrer" targ=
et=3D"_blank">https://nvd.nist.gov/vuln/detail/</a>&quot;<br>
&gt;&gt;&gt; @@ -482,6 +490,8 @@ def cve_write_data_text(d, patched, unpatc=
hed, ignored, cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in sorted(cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_patched =3D cve in=
 patched<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_ignored =3D cve in=
 ignored<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_not_affected =3D cve in not_af=
fected<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_undecidable =3D cve in undecid=
able<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;Unpa=
tched&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_patched or is_=
ignored) and not report_all:<br>
&gt;&gt;&gt; @@ -490,6 +500,10 @@ def cve_write_data_text(d, patched, unpat=
ched, ignored, cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =
=3D &quot;Ignored&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_patched:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =
=3D &quot;Patched&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_not_affected:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;No=
t affected&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_undecidable:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;Un=
decidable&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # defau=
lt value of status is Unpatched<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unpatch=
ed_cves.append(cve)<br>
&gt;&gt;&gt; @@ -561,7 +575,7 @@ def cve_check_write_json_output(d, output,=
 direct_file, deploy_file, manifest_fi<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(index_path,=
 &quot;a+&quot;) as f:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write=
(&quot;%s\n&quot; % fragment_path)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -def cve_write_data_json(d, patched, unpatched, ignored, cve_d=
ata, cve_status):<br>
&gt;&gt;&gt; +def cve_write_data_json(d, patched, unpatched, ignored, not_a=
ffected, undecidable, cve_data, cve_status):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Prepare CVE data for the JSON forma=
t, then write it.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt; @@ -606,6 +620,9 @@ def cve_write_data_json(d, patched, unpatc=
hed, ignored, cve_data, cve_status):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 for cve in sorted(cve_data):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_patched =3D cve in=
 patched<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_ignored =3D cve in=
 ignored<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_not_affected =3D cve in not_af=
fected<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_undecidable =3D cve in undecid=
able<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;Unpa=
tched&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (is_patched or is_=
ignored) and not report_all:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continu=
e<br>
&gt;&gt;&gt; @@ -613,6 +630,10 @@ def cve_write_data_json(d, patched, unpat=
ched, ignored, cve_data, cve_status):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =
=3D &quot;Ignored&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_patched:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =
=3D &quot;Patched&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_not_affected:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;No=
t affected&quot;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif is_undecidable:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;Un=
decidable&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # defau=
lt value of status is Unpatched<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unpatch=
ed_cves.append(cve)<br>
&gt;&gt;&gt; @@ -645,12 +666,12 @@ def cve_write_data_json(d, patched, unpa=
tched, ignored, cve_data, cve_status):<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_check_write_json_output(d, outp=
ut, direct_file, deploy_file, manifest_file)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -def cve_write_data(d, patched, unpatched, ignored, cve_data, =
status):<br>
&gt;&gt;&gt; +def cve_write_data(d, patched, unpatched, ignored, not_affect=
ed, undecidable, cve_data, status):<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Write CVE data in each enabled form=
at.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_FORMAT_=
TEXT&quot;) =3D=3D &quot;1&quot;:<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_data_text(d, patched, u=
npatched, ignored, cve_data)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_data_text(d, patched, u=
npatched, ignored, not_affected, undecidable, cve_data)<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 if d.getVar(&quot;CVE_CHECK_FORMAT_=
JSON&quot;) =3D=3D &quot;1&quot;:<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_data_json(d, patched, u=
npatched, ignored, cve_data, status)<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cve_write_data_json(d, patched, u=
npatched, ignored, not_affected, undecidable, cve_data, status)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt;&gt; View/Reply Online (#189667): <a href=3D"https://lists.openembe=
dded.org/g/openembedded-core/message/189667" rel=3D"noreferrer noreferrer n=
oreferrer" target=3D"_blank">https://lists.openembedded.org/g/openembedded-=
core/message/189667</a><br>
&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/=
102172913/3619876" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/mt/102172913/3619876</a><br>
&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists=
.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembe=
dded-core+owner@lists.openembedded.org</a><br>
&gt;&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=
=3D"mailto:andrej.v@skyrain.eu" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">andrej.v@skyrain.eu</a>]<br>
&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;&gt;<br>
<br>
</blockquote></div></div></div>

--0000000000003216e7060889cf97--

