Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E50FC3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 15:41:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.316.1721749313284393952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 08:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFcg31Gc;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso1568545b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 08:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749313; x=1722354113; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IY5GR3XL/73irwJWMS41/ugc6hxH+paO+TJAFjDTQpY=;
        b=bFcg31Gc0ub6sEnsMy6mNSwN6mXIxAVUEYFiLe5KWKzDMD6QQ3ShXAmlXCfMjDF0sx
         7iPgDoSC2re1h2NoWh5FI2HFIgkvSPjknG/9kYeja5tWj/v2/pbS2DZayD8eUT3JyeXA
         r9eZO3DJEMroTBmsHRE/UZQAnKHuQ4MHx9IPAJLh8sB229uRqeNb/6onzIXjIMSBcTuC
         mFE64vN3VvLx4FmxIaRVZJa3wJ01aPT6ToWhUJCEoEMxt/qNmzvq8ByvznbMOWDS/oRD
         2LLBwu8x5+DeiER+HvHTbJnCjo2oHJZI1OuHEQwpnjm/I3nmNi3x4SogHDjqHwXYYX6T
         bSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749313; x=1722354113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IY5GR3XL/73irwJWMS41/ugc6hxH+paO+TJAFjDTQpY=;
        b=TcFuYRhOLYA63tOJ5wg/LSzuQ2icg+czyyxIkrEDwbRD6z7Ojg3onAJUz1Gn86JKgg
         uPIG3Exz9Y9cK2rBGZondyvHnPWQrHkwxJF3JnWnJl4FWioEgMXr/pb9CXoOy0eOYQaH
         eE8MaNDOKrf8lKLyhyUOL1FnSzZuBOqNMgeUZbXKKSc/MzHkiSuZI/8zack7waB3ntsm
         a2cAeucaqRs8x/Vwil/c6KX9mnl64+OQgMfY1dNZhPC/DFD2sW2rBaw0XjTJvhUISa6y
         rjkz+mq8pBwrgG+zH0Dq6ACIe5FsAqnwP03WePDdvA1OkoU2RMQ5l6hsrATkp5dXZAWr
         aKVg==
X-Gm-Message-State: AOJu0YwUhT6Jrm7NQt/6GEgNmixKPIeNYwfYDjYqKeTxA8cLNlk4ZAu5
	FNmfjaypRDQ0KFdd7MZEaGkzCI1WCpXaX/qxXV01NWusiCQk5a98IZUlO7th9bOalMdJGwjXK0n
	q/0bvhfGcXtwYOQTFIjer+OguE00=
X-Google-Smtp-Source: AGHT+IF1dP0I2QJr3sq8BXLUcc/OPY7+3j+9V7aX3uBCFC+ebXUNjhrQT7JuV6w4mFuSpsaj2kW2L91OhYNbNYOyM4w=
X-Received: by 2002:a05:6a00:3d03:b0:70d:1b17:3c5e with SMTP id
 d2e1a72fcca58-70d1b173cfdmr7277113b3a.6.1721749312514; Tue, 23 Jul 2024
 08:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com> <01010190df81d582-311d068f-ddf1-407e-b094-e21c54daa85f-000000@us-west-2.amazonses.com>
In-Reply-To: <01010190df81d582-311d068f-ddf1-407e-b094-e21c54daa85f-000000@us-west-2.amazonses.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 23 Jul 2024 17:41:40 +0200
Message-ID: <CAApg2=St6hdjiyQuZvdR7FFEgL0DSoYFRkkPjEBoT9jA43MZ9Q@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][PATCH v2 1/5] cve-check: annotate
 CVEs during analysis
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002a3600061dec0013"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 15:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202408

--0000000000002a3600061dec0013
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems to be a false positive. Possibly the path 2/5 has an issue. I'm
looking into the source code of patchtest to verify.

Regards,
Marta

On Tue, Jul 23, 2024 at 2:12=E2=80=AFPM <patchtest@automation.yoctoproject.=
org>
wrote:

> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch
> /home/patchtest/share/mboxes/v2-1-5-cve-check-annotate-CVEs-during-analys=
is.patch
>
> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it
> manually or with "git commit --amend -s"
> (test_mbox.TestMbox.test_signed_off_by_presence)
>
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test max line length
> (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
>
> SKIP: pretest src uri left files: No modified recipes, skipping pretest
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch,
> skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced
> (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced
> (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced
> (test_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes,
> skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest
> (test_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_summary_presence)
> SKIP: test target mailing list: Series merged, no reason to check other
> mailing lists (test_mbox.TestMbox.test_target_mailing_list)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>

--0000000000002a3600061dec0013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This seems to be a false positive. Possibly the path =
2/5 has an issue. I&#39;m looking into the source code of patchtest to veri=
fy.</div><div><br></div><div>Regards,</div><div>Marta<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul =
23, 2024 at 2:12=E2=80=AFPM &lt;<a href=3D"mailto:patchtest@automation.yoct=
oproject.org">patchtest@automation.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Thank you for your submi=
ssion. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/v2-1-5-cve-check-annotate-CVEs-d=
uring-analysis.patch<br>
<br>
FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add it ma=
nually or with &quot;git commit --amend -s&quot; (test_mbox.TestMbox.test_s=
igned_off_by_presence)<br>
<br>
PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length=
)<br>
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test pylint (test_python_pylint.PyLint.test_pylint)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
<br>
SKIP: pretest src uri left files: No modified recipes, skipping pretest (te=
st_metadata.TestMetadata.pretest_src_uri_left_files)<br>
SKIP: test CVE check ignore: No modified recipes or older target branch, sk=
ipping test (test_metadata.TestMetadata.test_cve_check_ignore)<br>
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPa=
tch.test_cve_tag_format)<br>
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patc=
h.TestPatch.test_signed_off_by_presence)<br>
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_upstream_status_presence_format)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test lic files chksum modified not mentioned: No modified recipes, sk=
ipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_=
mentioned)<br>
SKIP: test lic files chksum presence: No added recipes, skipping test (test=
_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
SKIP: test license presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_license_presence)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
SKIP: test src uri left files: No modified recipes, skipping pretest (test_=
metadata.TestMetadata.test_src_uri_left_files)<br>
SKIP: test summary presence: No added recipes, skipping test (test_metadata=
.TestMetadata.test_summary_presence)<br>
SKIP: test target mailing list: Series merged, no reason to check other mai=
ling lists (test_mbox.TestMbox.test_target_mailing_list)<br>
<br>
---<br>
<br>
Please address the issues identified and<br>
submit a new revision of the patch, or alternatively, reply to this<br>
email with an explanation of why the patch should be accepted. If you<br>
believe these results are due to an error in patchtest, please submit a<br>
bug at <a href=3D"https://bugzilla.yoctoproject.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://bugzilla.yoctoproject.org/</a> (use the &#39;Patcht=
est&#39; category<br>
under &#39;Yocto Project Subprojects&#39;). For more information on specifi=
c<br>
failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtest" rel=
=3D"noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Patcht=
est</a>. Thank<br>
you!<br>
</blockquote></div>

--0000000000002a3600061dec0013--

