Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016DEC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 04:32:06 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.3437.1721795520295373125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 21:32:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzyyhpUy;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fd640a6454so11748295ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 21:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721795519; x=1722400319; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rDEs1a6sZvJnGggx3fPuUNz4qHhKABja93yo/CF5CAg=;
        b=hzyyhpUyXqu8oqdT45Yk+geE3vCzhPzd97dmOP+D+v5WlxR/0Ec4vTEpEs7t5+d89V
         GDr0uKP/CzMZyG+CYhPKrMABzmRHImdwOybNx2oHWMOG48I3Riqcv1v60Cyf57ot2S20
         cYwHwtXMiITGJPK57cCAMppRNQKKX4NqxHjAIyQ9gmY9qqPPWWOgpR+ErtvsDLrekiE3
         EJRwsllCoATfLGiu+YrK6sS/NBBFEcm+/XaxloQAwA4i6PhLmxx85+7yRAqxRN8i72Lr
         i0snjAEfwiKp68/dVM/GxmO1PnWrCFFYymaftQhAG+qcL3Ui4ViGVTy9tm/kgHBG8q9+
         RBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721795519; x=1722400319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDEs1a6sZvJnGggx3fPuUNz4qHhKABja93yo/CF5CAg=;
        b=Rkp2zYSRaXJ6EwQWgtaprfsCAHlVOw1W1kmt8s41jt64xMYlizLX92WjO6ruhfbVCP
         ob2dG/hhgy6Kp3QA2TekyN4SJcd1YOfYC7lk9YxDYyg8jiNbq7HmDkfzKhKWrJnWPjdd
         knIQRXh4o6rp52mungJo6VWBLb4zdWPy8yKUbXA9l4Fti2Z0PDwoS0pk9KqJSNVbAuE5
         klmSZV5bTrX6fhWXs1H0WwIvcxbj5QB8GuuXWXId1xXt1qQ4zoq2RBX1Pdm9Cl+TqhW3
         McMENQOby+PR5CFhNggte3CTowrzVT486k4VAs+XinuEh9JA8j7/ee3MtleN7VnBVM54
         bvWg==
X-Forwarded-Encrypted: i=1; AJvYcCVvWMXh18I7CkNSPkfwaAvXI5S8FL1Y/9AaY9CSUJvf9nQkFMwuuYyEaFXvtdDRuGV3kaxGBKCDb7L5v8guly/fAyWTGyrYp9ZiSRPCfgHuHRQe0BzY6vgK
X-Gm-Message-State: AOJu0YwfzODdsxMBh12USCWuYVRIQ6B9pns/1g4c8rerWHFzRyuz0ZxG
	7gfd0Q7J6ex9UMw2ykS2/j7+ghzGsuEnwM7PsQ4Gb+gyqWAx83dZoqaJ77C6EuCgmk9D2TAOeD1
	NW11I8X1tLgOeLg6YTCdBJCnMnGo=
X-Google-Smtp-Source: AGHT+IGat+RCcMBUU7GIxju/zYA64Lzrw9G2b0G/pVZatepgYMNwo0F1vHO2K8gBSJa/ZnsbijyfCamQTkfdlFjTNTk=
X-Received: by 2002:a17:90b:1a90:b0:2c9:6f53:1f44 with SMTP id
 98e67ed59e1d1-2cdb5134f79mr1204189a91.3.1721795519285; Tue, 23 Jul 2024
 21:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
 <01010190df81d582-311d068f-ddf1-407e-b094-e21c54daa85f-000000@us-west-2.amazonses.com>
 <CAApg2=St6hdjiyQuZvdR7FFEgL0DSoYFRkkPjEBoT9jA43MZ9Q@mail.gmail.com> <2024072323280372fb9082@mail.local>
In-Reply-To: <2024072323280372fb9082@mail.local>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 24 Jul 2024 06:31:47 +0200
Message-ID: <CAApg2=RjJPh4hsWN68Fs1j6e+HGOvJnmKYWZ6rRbi3Dwnce+=w@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH v2 1/5] cve-check: annotate
 CVEs during analysis
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004d95a0061df6c2dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 04:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202423

--0000000000004d95a0061df6c2dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah.. it requires my SoB when the patch is from someone else? That could
explain the situation.

Still, it reported an error to patch 1/5 while the issue is in 2/5. Will
check what we can improve in the tool...

Kind regards,
Marta

On Wed, Jul 24, 2024 at 1:28=E2=80=AFAM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 23/07/2024 17:41:40+0200, Marta Rybczynska wrote:
> > This seems to be a false positive. Possibly the path 2/5 has an issue.
> I'm
> > looking into the source code of patchtest to verify.
>
> It is not, 2/5 is missing your SoB
>
> >
> > Regards,
> > Marta
> >
> > On Tue, Jul 23, 2024 at 2:12=E2=80=AFPM <patchtest@automation.yoctoproj=
ect.org>
> > wrote:
> >
> > > Thank you for your submission. Patchtest identified one
> > > or more issues with the patch. Please see the log below for
> > > more information:
> > >
> > > ---
> > > Testing patch
> > >
> /home/patchtest/share/mboxes/v2-1-5-cve-check-annotate-CVEs-during-analys=
is.patch
> > >
> > > FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add
> it
> > > manually or with "git commit --amend -s"
> > > (test_mbox.TestMbox.test_signed_off_by_presence)
> > >
> > > PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> > > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > > PASS: test commit message presence
> > > (test_mbox.TestMbox.test_commit_message_presence)
> > > PASS: test max line length
> > > (test_metadata.TestMetadata.test_max_line_length)
> > > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > > PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> > > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > >
> > > SKIP: pretest src uri left files: No modified recipes, skipping prete=
st
> > > (test_metadata.TestMetadata.pretest_src_uri_left_files)
> > > SKIP: test CVE check ignore: No modified recipes or older target
> branch,
> > > skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> > > SKIP: test CVE tag format: No new CVE patches introduced
> > > (test_patch.TestPatch.test_cve_tag_format)
> > > SKIP: test Signed-off-by presence: No new CVE patches introduced
> > > (test_patch.TestPatch.test_signed_off_by_presence)
> > > SKIP: test Upstream-Status presence: No new CVE patches introduced
> > > (test_patch.TestPatch.test_upstream_status_presence_format)
> > > SKIP: test bugzilla entry format: No bug ID found
> > > (test_mbox.TestMbox.test_bugzilla_entry_format)
> > > SKIP: test lic files chksum modified not mentioned: No modified
> recipes,
> > > skipping test
> > >
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> > > SKIP: test lic files chksum presence: No added recipes, skipping test
> > > (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > > SKIP: test license presence: No added recipes, skipping test
> > > (test_metadata.TestMetadata.test_license_presence)
> > > SKIP: test series merge on head: Merge test is disabled for now
> > > (test_mbox.TestMbox.test_series_merge_on_head)
> > > SKIP: test src uri left files: No modified recipes, skipping pretest
> > > (test_metadata.TestMetadata.test_src_uri_left_files)
> > > SKIP: test summary presence: No added recipes, skipping test
> > > (test_metadata.TestMetadata.test_summary_presence)
> > > SKIP: test target mailing list: Series merged, no reason to check oth=
er
> > > mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> > >
> > > ---
> > >
> > > Please address the issues identified and
> > > submit a new revision of the patch, or alternatively, reply to this
> > > email with an explanation of why the patch should be accepted. If you
> > > believe these results are due to an error in patchtest, please submit=
 a
> > > bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
> category
> > > under 'Yocto Project Subprojects'). For more information on specific
> > > failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> > > you!
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#202408):
> https://lists.openembedded.org/g/openembedded-core/message/202408
> > Mute This Topic: https://lists.openembedded.org/mt/107503127/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000004d95a0061df6c2dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Ah.. it requires my SoB when the patch is from someon=
e else? That could explain the situation.<br></div><div><br></div><div>Stil=
l, it reported an error to patch 1/5 while the issue is in 2/5. Will check =
what we can improve in the tool...</div><div><br></div><div>Kind regards,</=
div><div>Marta<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Jul 24, 2024 at 1:28=E2=80=AFAM Alexandre B=
elloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.bello=
ni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On 23/07/2024 17:41:40+0200, Marta Rybczynska wrote:<br>
&gt; This seems to be a false positive. Possibly the path 2/5 has an issue.=
 I&#39;m<br>
&gt; looking into the source code of patchtest to verify.<br>
<br>
It is not, 2/5 is missing your SoB<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Marta<br>
&gt; <br>
&gt; On Tue, Jul 23, 2024 at 2:12=E2=80=AFPM &lt;<a href=3D"mailto:patchtes=
t@automation.yoctoproject.org" target=3D"_blank">patchtest@automation.yocto=
project.org</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; Thank you for your submission. Patchtest identified one<br>
&gt; &gt; or more issues with the patch. Please see the log below for<br>
&gt; &gt; more information:<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt; Testing patch<br>
&gt; &gt; /home/patchtest/share/mboxes/v2-1-5-cve-check-annotate-CVEs-durin=
g-analysis.patch<br>
&gt; &gt;<br>
&gt; &gt; FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by.=
 Add it<br>
&gt; &gt; manually or with &quot;git commit --amend -s&quot;<br>
&gt; &gt; (test_mbox.TestMbox.test_signed_off_by_presence)<br>
&gt; &gt;<br>
&gt; &gt; PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)<b=
r>
&gt; &gt; PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br=
>
&gt; &gt; PASS: test commit message presence<br>
&gt; &gt; (test_mbox.TestMbox.test_commit_message_presence)<br>
&gt; &gt; PASS: test max line length<br>
&gt; &gt; (test_metadata.TestMetadata.test_max_line_length)<br>
&gt; &gt; PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
&gt; &gt; PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgra=
de)<br>
&gt; &gt; PASS: test pylint (test_python_pylint.PyLint.test_pylint)<br>
&gt; &gt; PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_form=
at)<br>
&gt; &gt; PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_leng=
th)<br>
&gt; &gt;<br>
&gt; &gt; SKIP: pretest src uri left files: No modified recipes, skipping p=
retest<br>
&gt; &gt; (test_metadata.TestMetadata.pretest_src_uri_left_files)<br>
&gt; &gt; SKIP: test CVE check ignore: No modified recipes or older target =
branch,<br>
&gt; &gt; skipping test (test_metadata.TestMetadata.test_cve_check_ignore)<=
br>
&gt; &gt; SKIP: test CVE tag format: No new CVE patches introduced<br>
&gt; &gt; (test_patch.TestPatch.test_cve_tag_format)<br>
&gt; &gt; SKIP: test Signed-off-by presence: No new CVE patches introduced<=
br>
&gt; &gt; (test_patch.TestPatch.test_signed_off_by_presence)<br>
&gt; &gt; SKIP: test Upstream-Status presence: No new CVE patches introduce=
d<br>
&gt; &gt; (test_patch.TestPatch.test_upstream_status_presence_format)<br>
&gt; &gt; SKIP: test bugzilla entry format: No bug ID found<br>
&gt; &gt; (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
&gt; &gt; SKIP: test lic files chksum modified not mentioned: No modified r=
ecipes,<br>
&gt; &gt; skipping test<br>
&gt; &gt; (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_me=
ntioned)<br>
&gt; &gt; SKIP: test lic files chksum presence: No added recipes, skipping =
test<br>
&gt; &gt; (test_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
&gt; &gt; SKIP: test license presence: No added recipes, skipping test<br>
&gt; &gt; (test_metadata.TestMetadata.test_license_presence)<br>
&gt; &gt; SKIP: test series merge on head: Merge test is disabled for now<b=
r>
&gt; &gt; (test_mbox.TestMbox.test_series_merge_on_head)<br>
&gt; &gt; SKIP: test src uri left files: No modified recipes, skipping pret=
est<br>
&gt; &gt; (test_metadata.TestMetadata.test_src_uri_left_files)<br>
&gt; &gt; SKIP: test summary presence: No added recipes, skipping test<br>
&gt; &gt; (test_metadata.TestMetadata.test_summary_presence)<br>
&gt; &gt; SKIP: test target mailing list: Series merged, no reason to check=
 other<br>
&gt; &gt; mailing lists (test_mbox.TestMbox.test_target_mailing_list)<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; Please address the issues identified and<br>
&gt; &gt; submit a new revision of the patch, or alternatively, reply to th=
is<br>
&gt; &gt; email with an explanation of why the patch should be accepted. If=
 you<br>
&gt; &gt; believe these results are due to an error in patchtest, please su=
bmit a<br>
&gt; &gt; bug at <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"nore=
ferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/</a> (use the &=
#39;Patchtest&#39; category<br>
&gt; &gt; under &#39;Yocto Project Subprojects&#39;). For more information =
on specific<br>
&gt; &gt; failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patc=
htest" rel=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/w=
iki/Patchtest</a>. Thank<br>
&gt; &gt; you!<br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#202408): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/202408" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/202408</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10750312=
7/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107503127/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000004d95a0061df6c2dc--

