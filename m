Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB30D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:00:15 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5776.1768914006265026457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pO2d2gun;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359019da8cso557338f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:00:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768914005; cv=none;
        d=google.com; s=arc-20240605;
        b=A96BVhX00n9N55w0N0LLEVFDsydESY6cO/feKH5tSXndUGI7VJF+sPgp3sE0i2pm9U
         TOOUCC4dqdAJRcMCH1inXULL/uo8BW3bSQjR9oXDqw+G7u/3hg42Ou5vI4wnGqeYqpFm
         Ogkgb15z8RVvRLyDXsDJ5NnZxKZj2LewEmg/HhF4M97q4qnXT7RJEEutHSpnHRCthbZf
         0/HG9+njGHR8VTkSzkw0RKB+OHuPeYUNYW+qS8tOzM/IdoVAdYi+kCGjcLTNr6WXRPEk
         FVNgADhmpXPH60jAilrdOLedc9ysTl8qhRm1djNg8sb69HNhD6MJNV4BUFPi3rLmjNm3
         SmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aVracFgLTDpuERoVD0UDLr1F/5S1ra53iTUp8zkC4t4=;
        fh=xNbXtmcvWkFzPNhRc4YectMp/HLHLojZ/f7Nr+Q+63A=;
        b=kbiU6z3gW/+quR2kK0jxDzQGIUEnFaFJe+FDbAiyXvcxRPnX9tjRROQmHvGQlWRvRW
         r8AMxbTc8Wt4WXDAoQkSZA7ScMvjJIu1os3wvdj/jKi3OGUpU27g5b6Uo620eoBrtjQV
         A3adV6pNIq+5s16OLd5WwLVI4kQCIBxjqdj3URFRB3jOirPoGEoBgOvqdl7UsYHTXXsk
         /wNS/rSyq9Ng02F4g9MiwlRjwq9JrqCa+svWqZkBK9jwblX3S3BTKNlL4t3uf+uqzYwv
         RYWW0XFsZ1uAwVrXc37dnTjqvOWA5GogsUAZX9dYTtD0lw0FuzmR5rIMy4kjcjxcuZFg
         KKzA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768914005; x=1769518805; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aVracFgLTDpuERoVD0UDLr1F/5S1ra53iTUp8zkC4t4=;
        b=pO2d2gunhG72Sr0BPQ0kvRFHlItGhY6NpFY49YBb51alr4U7ISHd9SJkNDknKlXInQ
         LAI/yIf7jV1bHykoRAPtBixMRc7jeg8Tlbj+bCf+2pJfDTfn4Qw5pQbL2Q0ZYMo5EjX6
         luaplRasf6QC2bZZm1lxeOBMP1TgoJQASsEm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768914005; x=1769518805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVracFgLTDpuERoVD0UDLr1F/5S1ra53iTUp8zkC4t4=;
        b=FEKW/LV79Yqhyayr2PPJcmBXR1sjEZqnMvbimSZjJulW8R91IjOYzD1UChxZbbP+dv
         jgRGSVyMK8wXkrjaBa1h9npkMDLqC/X2T07IOWTf55fgcusrzk4jtLvlbv4Do0pjVJYZ
         4+D7OHsLyhBLFZzTg+PxBw/d27gem99R3hVnWKi0kcL0OS3jLoeP++XgWCDvNaQzsbx/
         G18J8rYa5nVmrnianWJTWJjoY2VZaJp26edZSqSd98vzTOWj+5cbGXf83IyT3iseENUj
         rheE7ezeBXg6YQBPl/+6uXhespVwA7VT5nK/qGjFwy0p5ZgAMZ/L84hNKJ2zdyIbNSxE
         CE0A==
X-Forwarded-Encrypted: i=1; AJvYcCXQjFFplhO0OycW2lWesQveYVHj4BquAJSY+1bgiU7ECSEr4KYOhn9EaBbDJHa4mF64sBgoQQoLFJPp1Id6iMQ/3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz09slWn4PiuHKvYKpv+usCYihk2W7lcClWzh9V2d+Wkv9QzQfS
	mlhNYdZJ9yNLUl/BrM5GV1UdKlwhyT91BzCDQbm9LeDCtEOTqbFiiQJ4HH50gwPPI+j5VWxtU6P
	rKPlTpIFAQf9kNBrXVs2GgkqneUSrGVjLPnhC7v0nKQ==
X-Gm-Gg: AZuq6aJepIOWwvfFY51IFWKEowXKk93jxMvsfPE/jsK7npgBYni0BUwzDAq79OLCM5A
	g6cHrwrp/YSwS5B7Rak5vQ5iN9X7/0OynmhotQ6YnTnuUY8N9FVqo+Y2F/pIz1iACWBE/UICZW7
	gL+pqbX8QaDSX7G5AtYNmJa5SEPc5PMuk0HLDM4wpJvNo9NVpLBVZz5IMQVt2D4wlzy32DmccQE
	qO0I+A95Fk8gbPgno1E4Mvx2sr+LrahAIWClMI5iHAwe4FALyMea/vvijJCo016/68/2Ei1nQ==
X-Received: by 2002:a05:6000:400f:b0:430:f41f:bd5d with SMTP id
 ffacd0b85a97d-4356a0897f0mr16856267f8f.55.1768914004354; Tue, 20 Jan 2026
 05:00:04 -0800 (PST)
MIME-Version: 1.0
References: <534f207c2869c6fbbef5d061607a28b6114c7a22.1768910519.git.yoann.congal@smile.fr>
 <0101019bdb562a2b-484d0628-8997-4935-86c3-0033faa83721-000000@us-west-2.amazonses.com>
 <AS1PR10MB56978D4AFCBC674510C81B86FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978D4AFCBC674510C81B86FD89A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 20 Jan 2026 13:59:38 +0100
X-Gm-Features: AZwV_QigAcwKGBoT7_5THG0ZXxW2lkIywxEnxtnxxF7UfwyjDbhe1piSmwGEVLM
Message-ID: <CAMSfU+6qqthiP2bD0VSu4XVJKOutwLHy=O+sByC5LXqJN2X2yg@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][scarthgap 11/22] cups: allow
 unknown directives in conf files
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "patchtest@automation.yoctoproject.org" <patchtest@automation.yoctoproject.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000de47b80648d16202"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229703

--000000000000de47b80648d16202
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 20 janv. 2026 =C3=A0 13:21, Marko, Peter <Peter.Marko@siemens.com> =
a
=C3=A9crit :

> False positive as this does not fix CVE, only mentions CVE in commit
> message.
>

Thanks for the analysis :)


> I'm wondering why this was sent now and not when I submitted the patch.
> In recent months there is almost 0 emails from patchtest.
> I guess it's broken and revives only from time to time?
>

Yup, that's it. It was down for a few weeks but looks better now.


> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Patchtest via
> > lists.openembedded.org
> > Sent: Tuesday, January 20, 2026 13:17
> > To: Yoann Congal <yoann.congal@smile.fr>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Patchtest results for [OE-core][scarthgap 11/22] cups: allow
> unknown
> > directives in conf files
> >
> > Thank you for your submission. Patchtest identified one
> > or more issues with the patch. Please see the log below for
> > more information:
> >
> > ---
> > Testing patch /home/patchtest/share/mboxes/scarthgap-11-22-cups-allow-
> > unknown-directives-in-conf-files.patch
> >
> > FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in
> patch file.
> > Correct or include the CVE tag in the patch with format: "CVE:
> CVE-YYYY-XXXX"
> > (test_patch.TestPatch.test_cve_tag_format)
> >
> > PASS: test Signed-off-by presence
> > (test_mbox.TestMbox.test_signed_off_by_presence)
> > PASS: test Signed-off-by presence
> > (test_patch.TestPatch.test_signed_off_by_presence)
> > PASS: test Upstream-Status presence
> > (test_patch.TestPatch.test_upstream_status_presence_format)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test commit message presence
> > (test_mbox.TestMbox.test_commit_message_presence)
> > PASS: test commit message user tags
> > (test_mbox.TestMbox.test_commit_message_user_tags)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > PASS: test target mailing list
> (test_mbox.TestMbox.test_target_mailing_list)
> >
> > SKIP: pretest pylint: No python related patches, skipping test
> > (test_python_pylint.PyLint.pretest_pylint)
> > SKIP: test bugzilla entry format: No bug ID found
> > (test_mbox.TestMbox.test_bugzilla_entry_format)
> > SKIP: test pylint: No python related patches, skipping test
> > (test_python_pylint.PyLint.test_pylint)
> > SKIP: test series merge on head: Merge test is disabled for now
> > (test_mbox.TestMbox.test_series_merge_on_head)
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


--=20
Yoann Congal
Smile ECS

--000000000000de47b80648d16202
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20=
 janv. 2026 =C3=A0=C2=A013:21, Marko, Peter &lt;<a href=3D"mailto:Peter.Mar=
ko@siemens.com">Peter.Marko@siemens.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">False positive as this =
does not fix CVE, only mentions CVE in commit message.<br></blockquote><div=
><br></div><div>Thanks for the analysis :)</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
I&#39;m wondering why this was sent now and not when I submitted the patch.=
<br>
In recent months there is almost 0 emails from patchtest.<br>
I guess it&#39;s broken and revives only from time to time?<br></blockquote=
><div><br></div><div>Yup, that&#39;s it. It was down for a few weeks but lo=
oks better now.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Patchtest via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Tuesday, January 20, 2026 13:17<br>
&gt; To: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=
=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: Patchtest results for [OE-core][scarthgap 11/22] cups: allow =
unknown<br>
&gt; directives in conf files<br>
&gt; <br>
&gt; Thank you for your submission. Patchtest identified one<br>
&gt; or more issues with the patch. Please see the log below for<br>
&gt; more information:<br>
&gt; <br>
&gt; ---<br>
&gt; Testing patch /home/patchtest/share/mboxes/scarthgap-11-22-cups-allow-=
<br>
&gt; unknown-directives-in-conf-files.patch<br>
&gt; <br>
&gt; FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in=
 patch file.<br>
&gt; Correct or include the CVE tag in the patch with format: &quot;CVE: CV=
E-YYYY-XXXX&quot;<br>
&gt; (test_patch.TestPatch.test_cve_tag_format)<br>
&gt; <br>
&gt; PASS: test Signed-off-by presence<br>
&gt; (test_mbox.TestMbox.test_signed_off_by_presence)<br>
&gt; PASS: test Signed-off-by presence<br>
&gt; (test_patch.TestPatch.test_signed_off_by_presence)<br>
&gt; PASS: test Upstream-Status presence<br>
&gt; (test_patch.TestPatch.test_upstream_status_presence_format)<br>
&gt; PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
&gt; PASS: test commit message presence<br>
&gt; (test_mbox.TestMbox.test_commit_message_presence)<br>
&gt; PASS: test commit message user tags<br>
&gt; (test_mbox.TestMbox.test_commit_message_user_tags)<br>
&gt; PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
&gt; PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<b=
r>
&gt; PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<b=
r>
&gt; PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<b=
r>
&gt; PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing=
_list)<br>
&gt; <br>
&gt; SKIP: pretest pylint: No python related patches, skipping test<br>
&gt; (test_python_pylint.PyLint.pretest_pylint)<br>
&gt; SKIP: test bugzilla entry format: No bug ID found<br>
&gt; (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
&gt; SKIP: test pylint: No python related patches, skipping test<br>
&gt; (test_python_pylint.PyLint.test_pylint)<br>
&gt; SKIP: test series merge on head: Merge test is disabled for now<br>
&gt; (test_mbox.TestMbox.test_series_merge_on_head)<br>
&gt; <br>
&gt; ---<br>
&gt; <br>
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
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000de47b80648d16202--

