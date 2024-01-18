Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A3DC47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 22:26:52 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.7201.1705616804324003459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 14:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qug49EBy;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so13614066b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 14:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705616803; x=1706221603; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B/VB909FVdyhd5bMhTlhiO1iv2Uwijvo/rNK8/x+qr8=;
        b=qug49EBy3OzeEBaO5YuO4DoBBTYN8fnipm5NBcveTNkFJVDMqzjRKtKAIyNhKxIT1P
         kz2Z0uLm147T+w2+91Xx27AvPtrzSHxDvm5v8e94kzdY4ahvtOLjCzanpKty3z8uCWi8
         nCyGxccovKPXgoUbMhpbxW69BkLiN81hJ+99DgI1Vl2ipFrHS3lbrxzFQ47cboaNEcon
         /qprClCgnBp10iDD7UnrH0eaMcD2Bb6c9/DF4vEoQZ4aeIqbIzXDBZ54446fL3F3X0Qi
         mehjixCzamo3V787W30fGOOl+qIfloxKGcTc7b/u6oVcDnkUrFEO0jI1TP0Lah0BaGzG
         Q1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705616803; x=1706221603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/VB909FVdyhd5bMhTlhiO1iv2Uwijvo/rNK8/x+qr8=;
        b=gAqRwPUpz2kjgVYoT2t2HHzGZHMbzwg0GwOP5eKUoqlnpHbOizkoFU/hsIcfeXTqBn
         qnWcWH7jwElCah+3llTf5BD9MBymFCOWn8gUdYmRDb0H+4y1XQlfr08VGwKFTHscfkZ6
         q/+osn6rwrAWOVm0l/f6J/clt5qWDy8xcxbFJJrcPCJKvpn3nsp0P5Sdk1TxkAeUnH10
         hB/qBkOwL9/mqPI6I2fq1t/kTPNYtndMAzNWMWfpxxTABuHxxd2S/aArySPVUe0tGr2X
         ZVeO6UBZFCp4sk+KcakM8HPzL1Zli4rnJ/gyltXBARFcqH8WCy+5YImKAIaROExlpuJk
         /JSA==
X-Gm-Message-State: AOJu0Yw82f0K4ocIWCC2CfMvEPX8mXaDH5xCbtddAVdHHPFHvwhHVLaM
	4pDccRkWHtqcAD7rpu7Jx+mPjZ40pKlA+HboVNHAMpKcWnjC425yG8DE7S5S8fJdlfW4kMTQ/Uj
	fBcDb4I0P85cl31LfbsPWJZzPiAsxaSF5BicTVw==
X-Google-Smtp-Source: AGHT+IE5OBKBtlo3TtasqwVngu6KhFhVUsUuOcQkyYOyTBM/CnG1iu37yjhhC7QPwzSiRWEAkgu6NE4VnaKmW5tK2cU=
X-Received: by 2002:a17:906:70d6:b0:a27:6572:7455 with SMTP id
 g22-20020a17090670d600b00a2765727455mr712383ejk.75.1705616801708; Thu, 18 Jan
 2024 14:26:41 -0800 (PST)
MIME-Version: 1.0
References: <0101018d1c3d1efe-c3d3daa9-36b9-4ac0-bd6c-2d04c8750cda-000000@us-west-2.amazonses.com>
 <46f26c82-6ff5-4b62-a4b0-c190ad8f34a2@windriver.com>
In-Reply-To: <46f26c82-6ff5-4b62-a4b0-c190ad8f34a2@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 18 Jan 2024 12:26:30 -1000
Message-ID: <CAOSpxdaY1Cu0esFRFvF5Y9z53MbXGy33Hgp77ZrR+uWzU_34pQ@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][kirkstone][PATCH 1/1] tiff: fix CVE-2023-6228
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Yogita Urade <Yogita.Urade@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000096cc6d060f3fdb25"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 22:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194000

--00000000000096cc6d060f3fdb25
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 12:21=E2=80=AFPM Randy MacLeod <randy.macleod@windr=
iver.com>
wrote:

> Yogita,
> Pleae tell people if you will send a v2 or if you plan to fix the warning
> in a follow-up commit.
>
> I don't see your commit in Steve's kirkstone-nut repo so I think he's
> expecting a v2.
>
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut
> \
>

I was expecting a response as to which approach would be taken.  When there
was no response I removed the patch under the theory that it is better not
to merge a half right CVE fix.

Steve




> -------- Forwarded Message --------
> Subject: Patchtest results for [OE-core][kirkstone][PATCH 1/1] tiff: fix
> CVE-2023-6228
> Date: Thu, 18 Jan 2024 11:03:04 +0000
> From: Patchtest via lists.openembedded.org
> <patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org>
> <patchtest=3Dautomation.yoctoproject.org@lists.openembedded.org>
> Reply-To: patchtest@automation.yoctoproject.org
> To: yurade <yogita.urade@windriver.com> <yogita.urade@windriver.com>
> CC: openembedded-core@lists.openembedded.org
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch
> /home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE-2023-6228.patch
>
> FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should be
> replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore)
>
> PASS: pretest src uri left files
> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence
> (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence
> (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test lic files chksum modified not mentioned
> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length
> (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files
> (test_metadata.TestMetadata.test_src_uri_left_files)
>
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test
> (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
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
>

--00000000000096cc6d060f3fdb25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 18, 2024 at 12:21=E2=80=
=AFPM Randy MacLeod &lt;<a href=3D"mailto:randy.macleod@windriver.com">rand=
y.macleod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><u></u>

 =20
  <div>
    <p>Yogita,<br>
    </p>
    <div>Pleae tell people if you will
      send a v2 or if you plan to fix the warning in a follow-up commit.</d=
iv>
    <div><br>
    </div>
    <div>I don&#39;t see your commit in
      Steve&#39;s kirkstone-nut repo so I think he&#39;s expecting a v2.</d=
iv>
    <div><br>
    </div>
    <div><a href=3D"https://git.openembedded.org/openembedded-core-contrib/=
log/?h=3Dstable/kirkstone-nut" target=3D"_blank">https://git.openembedded.o=
rg/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut</a>\</div></div>=
</blockquote><div><br></div><div>I was expecting a response as to which app=
roach would be taken.=C2=A0 When there was no response I removed the patch =
under the theory that it is better not to merge a half right CVE fix.</div>=
<div><br></div><div>Steve</div><div><br></div><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>
      -------- Forwarded Message --------
      <table cellspacing=3D"0" cellpadding=3D"0" border=3D"0">
        <tbody>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">Subject:
            </th>
            <td>Patchtest results for [OE-core][kirkstone][PATCH 1/1]
              tiff: fix CVE-2023-6228</td>
          </tr>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">Date: </th>
            <td>Thu, 18 Jan 2024 11:03:04 +0000</td>
          </tr>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">From: </th>
            <td>Patchtest via <a href=3D"http://lists.openembedded.org" tar=
get=3D"_blank">lists.openembedded.org</a>
              <a href=3D"mailto:patchtest=3Dautomation.yoctoproject.org@lis=
ts.openembedded.org" target=3D"_blank">&lt;patchtest=3Dautomation.yoctoproj=
ect.org@lists.openembedded.org&gt;</a></td>
          </tr>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">Reply-To:
            </th>
            <td><a href=3D"mailto:patchtest@automation.yoctoproject.org" ta=
rget=3D"_blank">patchtest@automation.yoctoproject.org</a></td>
          </tr>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">To: </th>
            <td>yurade <a href=3D"mailto:yogita.urade@windriver.com" target=
=3D"_blank">&lt;yogita.urade@windriver.com&gt;</a></td>
          </tr>
          <tr>
            <th valign=3D"BASELINE" nowrap align=3D"RIGHT">CC: </th>
            <td><a href=3D"mailto:openembedded-core@lists.openembedded.org"=
 target=3D"_blank">openembedded-core@lists.openembedded.org</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      Thank you for your submission. Patchtest identified one<br>
      or more issues with the patch. Please see the log below for<br>
      more information:<br>
      <br>
      ---<br>
      Testing patch
      /home/patchtest/share/mboxes/kirkstone-1-1-tiff-fix-CVE-2023-6228.pat=
ch<br>
      <br>
      FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and
      should be replaced by CVE_STATUS
      (test_metadata.TestMetadata.test_cve_check_ignore)<br>
      <br>
      PASS: pretest src uri left files
      (test_metadata.TestMetadata.pretest_src_uri_left_files)<br>
      PASS: test CVE tag format
      (test_patch.TestPatch.test_cve_tag_format)<br>
      PASS: test Signed-off-by presence
      (test_mbox.TestMbox.test_signed_off_by_presence)<br>
      PASS: test Signed-off-by presence
      (test_patch.TestPatch.test_signed_off_by_presence)<br>
      PASS: test Upstream-Status presence
      (test_patch.TestPatch.test_upstream_status_presence_format)<br>
      PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
      PASS: test commit message presence
      (test_mbox.TestMbox.test_commit_message_presence)<br>
      PASS: test lic files chksum modified not mentioned
(test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)<b=
r>
      PASS: test max line length
      (test_metadata.TestMetadata.test_max_line_length)<br>
      PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
      PASS: test non-AUH upgrade
      (test_mbox.TestMbox.test_non_auh_upgrade)<br>
      PASS: test shortlog format
      (test_mbox.TestMbox.test_shortlog_format)<br>
      PASS: test shortlog length
      (test_mbox.TestMbox.test_shortlog_length)<br>
      PASS: test src uri left files
      (test_metadata.TestMetadata.test_src_uri_left_files)<br>
      <br>
      SKIP: pretest pylint: No python related patches, skipping test
      (test_python_pylint.PyLint.pretest_pylint)<br>
      SKIP: test bugzilla entry format: No bug ID found
      (test_mbox.TestMbox.test_bugzilla_entry_format)<br>
      SKIP: test lic files chksum presence: No added recipes, skipping
      test (test_metadata.TestMetadata.test_lic_files_chksum_presence)<br>
      SKIP: test license presence: No added recipes, skipping test
      (test_metadata.TestMetadata.test_license_presence)<br>
      SKIP: test pylint: No python related patches, skipping test
      (test_python_pylint.PyLint.test_pylint)<br>
      SKIP: test series merge on head: Merge test is disabled for now
      (test_mbox.TestMbox.test_series_merge_on_head)<br>
      SKIP: test summary presence: No added recipes, skipping test
      (test_metadata.TestMetadata.test_summary_presence)<br>
      SKIP: test target mailing list: Series merged, no reason to check
      other mailing lists (test_mbox.TestMbox.test_target_mailing_list)<br>
      <br>
      ---<br>
      <br>
      Please address the issues identified and<br>
      submit a new revision of the patch, or alternatively, reply to
      this<br>
      email with an explanation of why the patch should be accepted. If
      you<br>
      believe these results are due to an error in patchtest, please
      submit a<br>
      bug at <a href=3D"https://bugzilla.yoctoproject.org/" target=3D"_blan=
k">https://bugzilla.yoctoproject.org/</a> (use the &#39;Patchtest&#39;
      category<br>
      under &#39;Yocto Project Subprojects&#39;). For more information on
      specific<br>
      failures, see: <a href=3D"https://wiki.yoctoproject.org/wiki/Patchtes=
t" target=3D"_blank">https://wiki.yoctoproject.org/wiki/Patchtest</a>. Than=
k<br>
      you!<br>
      <br>
    </div>
  </div>

</blockquote></div></div>

--00000000000096cc6d060f3fdb25--

