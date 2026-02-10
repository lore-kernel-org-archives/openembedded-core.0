Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD44EB26F2
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 17:23:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25137.1770744189287474414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 09:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+qbxIfR;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a9057b2ec3so5295175ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 09:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770744184; cv=none;
        d=google.com; s=arc-20240605;
        b=C09S34eHvb3m/jSxVdYm2Ph+wr1QOUdv7sknCr3jaS72oVRzzx4Z63E4OWkH+7VvwT
         CneYPfOkRF6Xpnh59G5tiIOLM5BPcPQvKTh/SFvnMdwRMuGfKrfO8Pg1yJEA4HwQDM40
         iy1ikSMJTz6Omz7HMO1VC4z+M+3a9v3J9NdYdZa5SPVIMIFvXVtX2C373xjUA0ZICtYf
         sB+SxzotKU1YfxQJjd0BOk/d8zXQ6j83BQqvF3TMf2wRPD9Nuil79RxYPHA0VQf0c7SZ
         Wj3nSyEbllWOa8s4CaD32uNpqeVvPr2GrrxTvOhCiH5K4XNe+y7z91G5vrYLv6QyDGyq
         L8tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0cy5QarrObGgDGLVsCw5fhO1LFCPup3arJoIk3gtzjM=;
        fh=2Ec9NGZKovF/KezecbAbVzsuLaeHhZhpU/MadZipEd0=;
        b=JxmpyLzm3gebjT+Y+fJaNMgklenNKiNkLuQjrKk69NGRTsuWSw2uvowu80FF8p/WbO
         H6dRm0Q2gZs0NMEFtg6avzCfCoiL7jMSmQiv3HJcxZF9HwujIJoiVzukoFuyI9nF5/H6
         SxbqApDb8+cNpznkr0S1o7MDfHdtV+/c9oJ+m2Ay6vFdLZNvIDaK7Z2/sMFUNxXg15kL
         dTdOkcegp5JrdM3qKannLWsMwWmEqD11NRlgiAOS2eNCjd2tLRMTuTyyrS1vcZ0wsdDM
         4FHfJZqo3PrfKH+O1wxdhryN7ErwOF0VGMmBIVgmENSntX1kG7JoMQrFynG3Lyz+NVXk
         55fA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770744184; x=1771348984; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0cy5QarrObGgDGLVsCw5fhO1LFCPup3arJoIk3gtzjM=;
        b=d+qbxIfR5x3qLnAw76nEOzOBR76lsAyIdvCTCDOn1fXEY3o24s+lz+o2jjWqrFYp+b
         3vUTN3un39NSsNhq+/QSI/zBkyBdL6dooWhBeX/RDEGkwUxCpQnG15gU+vOg+q/FFg0Q
         N8GdAYJsSHlvAus2rv2NNPEwTkbYPSKtQiXmRGE/4iMkPrv5Y0Ulb4i8djFxz/2dXPuj
         YkVclUyJDQGZ65eWRrdyYaJUGMTBmO/wT6/0bH0CgM2MYGSPqef3URhLkpdnSkRzKolN
         USf9BVOrrLEton0yJfwSXQrmsju+DmZVY7oPQPZq5boq9QXXFuIQRztoF7SaoVgq4Z/7
         wLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770744184; x=1771348984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cy5QarrObGgDGLVsCw5fhO1LFCPup3arJoIk3gtzjM=;
        b=jYqoF0VFlzoY19Ab7GePuambckEcch79B27xAJD//+zJDQQORIp0gWblnKVwipa8Kj
         OVaxYQMThef2vjrtPTh31D70AMoJIH2RI7GpWhNAft9bSvzy6QMGIEoqCpTElirlo68u
         3FU0Et5V5Eeb08IN+hCY1DuAbDr5MU3x/fcYrtCUzJex/qweSzXKUPDpwjqltt55fcbi
         brd45symiq6WjQTeaSy67KMLO4QQdpHEMabeVYLlgjq9LaEIHewKKDCmdjV95ejNGnlh
         D9w735ww2OiMw9tG5WQ2bZlbeeWku89GOlnTNESSXS3RzzspqMdcONik9EptusmdpLFm
         qoDA==
X-Forwarded-Encrypted: i=1; AJvYcCX1Amm19fD7ELDFY3CdV4TAjZuw0EnUNpMVLtzWjkHEnCYAFV8IRR1uIWDbcsVu/P34o07SXKnhU4+YI6x0gaavuQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw03oZZtAxq0z92QT3uMRRfYjv9WWdPvtIiiy6jhIrWmSdUyleO
	Grp5B+16CMpiMmv4lvt4+envJSno7ZL0vfZg2EWG2EB+/kFWJnPv588PdKIyl5+XmXDNZtN5g2y
	StSz7dX29W2Ubkdkh3pTqNdTNQgDe7sE=
X-Gm-Gg: AZuq6aI1nmjghdTIFvVBiHASA1WBheCYqs1kz38x/UogD9L8FgWuZEGP/cxg7Sh9vUL
	CaDckdmpGZesPiLmjKhUh7Dqbt1MFjw8lczfmM8PZsDVqAoDMFN51WWweFhf4rCvGWbhdYHE3I7
	/e647mejEHRs0Vt2GXNkQdAA8h5FnEhftVbMLAqdIwLtOG4o8fVtpMe4FRcS24+c2M+yJ4n/Y/H
	Wqi0UoNEx35Gsk5SVIpEtC+7ig+/TNpiewF6KU7slFWzl59rDT2oQxHzc2ggudPIaEOEszJcLTI
	25NdP3rBc2s/VVuy1xSG5uP21ojUSbsCFLBaZ8ww
X-Received: by 2002:a17:903:1b04:b0:2a2:f0cb:dfa2 with SMTP id
 d9443c01a7336-2a951625455mr137963645ad.13.1770744179694; Tue, 10 Feb 2026
 09:22:59 -0800 (PST)
MIME-Version: 1.0
References: <20260210031722.1347242-1-bruce.ashfield@gmail.com>
 <0101019c459a67ac-7a7642b7-51cc-4f2e-9261-7dc8d609e403-000000@us-west-2.amazonses.com>
 <DGBG18MCXMLV.11SNSFR77NI2Y@smile.fr>
In-Reply-To: <DGBG18MCXMLV.11SNSFR77NI2Y@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Feb 2026 12:22:47 -0500
X-Gm-Features: AZwV_QgIC-KascFKd-vkgAEe_zEGSTxzR0M5tDVcYarojmsR3WaLgVGOw_5j9_M
Message-ID: <CADkTA4M5oBenYe_ZJLE=ygH70HOaDTmMoB5YQzTBLKVf3QwMHA@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for [meta][whinlatter][PATCH 01/02]
 linux-yocto/6.12: update to v6.12.69
To: Yoann Congal <yoann.congal@smile.fr>
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d19f77064a7b8108"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 17:23:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230922

--000000000000d19f77064a7b8108
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 12:04=E2=80=AFPM Yoann Congal <yoann.congal@smile.f=
r> wrote:

> On Tue Feb 10, 2026 at 4:31 AM CET, Patchtest via lists.openembedded.org
> wrote:
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch
> /home/patchtest/share/mboxes/meta-whinlatter-01-02-linux-yocto-6.12-updat=
e-to-v6.12.69.patch
> >
> > FAIL: test commit message user tags: Mbox includes one or more
> GitHub-style username tags. Ensure that any "@" symbols are stripped out =
of
> usernames (test_mbox.TestMbox.test_commit_message_user_tags)
>
> Bruce, this error is caused by those lines:
> >     a1bf8ea50cbc4 mm, kfence: describe @slab parameter in
> __kfence_obj_info()
> >     d11475ea5c2a5 textsearch: describe @list member in ts_ops search
> >     7a01b91ad6327 mm: describe @flags parameter in memalloc_flags_save(=
)
> >     18b6574d4c647 net: bridge: Describe @tunnel_hash member in
> net_bridge_vlan_group struct
> Do you plan to send a v2 with a fix?
>
> Alternatively, If you are OK with it, I can simply remove the '@' when
> importing the patch in my branch.
>

Neither.

Patchtest is wrong on this. Those are upstream commit shortlogs,
leave them as-is.

We've been doing that, and ignoring patchtest for several years with
that warning.

Bruce



>
> Thanks!
>
> > PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > PASS: test target mailing list
> (test_mbox.TestMbox.test_target_mailing_list)
> >
> > SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> > SKIP: test CVE tag format: No new CVE patches introduced
> (test_patch.TestPatch.test_cve_tag_format)
> > SKIP: test Signed-off-by presence: No new CVE patches introduced
> (test_patch.TestPatch.test_signed_off_by_presence)
> > SKIP: test Upstream-Status presence: No new CVE patches introduced
> (test_patch.TestPatch.test_upstream_status_presence_format)
> > SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> > SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> >
> > ---
> >
> > Please address the issues identified and
> > submit a new revision of the patch, or alternatively, reply to this
> > email with an explanation of why the patch should be accepted. If you
> > believe these results are due to an error in patchtest, please submit a
> > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> > under 'Yocto Project Subprojects'). For more information on specific
> > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > you!
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d19f77064a7b8108
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 10, 2026 at 12:04=
=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Tue Feb 10, 2026 at 4:31 AM CET, Patchtest via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; Thank you for your submission. Patchtest identified one<br>
&gt; or more issues with the patch. Please see the log below for<br>
&gt; more information:<br>
&gt;<br>
&gt; ---<br>
&gt; Testing patch /home/patchtest/share/mboxes/meta-whinlatter-01-02-linux=
-yocto-6.12-update-to-v6.12.69.patch<br>
&gt;<br>
&gt; FAIL: test commit message user tags: Mbox includes one or more GitHub-=
style username tags. Ensure that any &quot;@&quot; symbols are stripped out=
 of usernames (test_mbox.TestMbox.test_commit_message_user_tags)<br>
<br>
Bruce, this error is caused by those lines:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a1bf8ea50cbc4 mm, kfence: describe @slab parameter =
in __kfence_obj_info()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d11475ea5c2a5 textsearch: describe @list member in =
ts_ops search<br>
&gt;=C2=A0 =C2=A0 =C2=A07a01b91ad6327 mm: describe @flags parameter in mema=
lloc_flags_save()<br>
&gt;=C2=A0 =C2=A0 =C2=A018b6574d4c647 net: bridge: Describe @tunnel_hash me=
mber in net_bridge_vlan_group struct<br>
Do you plan to send a v2 with a fix?<br>
<br>
Alternatively, If you are OK with it, I can simply remove the &#39;@&#39; w=
hen<br>
importing the patch in my branch.<br></blockquote><div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">Neither.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Patchtest is wrong on this. Those are up=
stream commit shortlogs,</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">leave them as-is.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">We&#39;ve been doing that, and ignoring patchtest for several years with=
</div><div class=3D"gmail_default" style=3D"font-size:small">that warning.<=
/div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
&gt; PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_=
by_presence)<br>
&gt; PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
&gt; PASS: test commit message presence (test_mbox.TestMbox.test_commit_mes=
sage_presence)<br>
&gt; PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
&gt; PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<b=
r>
&gt; PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<b=
r>
&gt; PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<b=
r>
&gt; PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing=
_list)<br>
&gt;<br>
&gt; SKIP: pretest pylint: No python related patches, skipping test (test_p=
ython_pylint.PyLint.pretest_pylint)<br>
&gt; SKIP: test CVE tag format: No new CVE patches introduced (test_patch.T=
estPatch.test_cve_tag_format)<br>
&gt; SKIP: test Signed-off-by presence: No new CVE patches introduced (test=
_patch.TestPatch.test_signed_off_by_presence)<br>
&gt; SKIP: test Upstream-Status presence: No new CVE patches introduced (te=
st_patch.TestPatch.test_upstream_status_presence_format)<br>
&gt; SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.=
test_bugzilla_entry_format)<br>
&gt; SKIP: test pylint: No python related patches, skipping test (test_pyth=
on_pylint.PyLint.test_pylint)<br>
&gt; SKIP: test series merge on head: Merge test is disabled for now (test_=
mbox.TestMbox.test_series_merge_on_head)<br>
&gt;<br>
&gt; ---<br>
&gt;<br>
&gt; Please address the issues identified and<br>
&gt; submit a new revision of the patch, or alternatively, reply to this<br=
>
&gt; email with an explanation of why the patch should be accepted. If you<=
br>
&gt; believe these results are due to an error in patchtest, please submit =
a<br>
&gt; bug at <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"noreferre=
r" target=3D"_blank">https://bugzilla.yoctoproject.org/</a> (use the &#39;P=
atchtest&#39; category<br>
&gt; under &#39;Yocto Project Subprojects&#39;). For more information on sp=
ecific<br>
&gt; failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest=
" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/P=
atchtest</a>. Thank<br>
&gt; you!<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d19f77064a7b8108--

