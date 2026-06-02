Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBA3CD6E55
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 00:17:42 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13935.1780359453692612250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 17:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=s2fH4IpU;
 spf=pass (domain: konsulko.com, ip: 209.85.128.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7e8833c99fcso3970007b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 17:17:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780359453; cv=none;
        d=google.com; s=arc-20240605;
        b=FhvDAWqQx59Vqbmek07SaG9UfBdhqWTfc8XYiZXno+/MnSed/VNfHZ9nUPV+pwOpBL
         ddv2n+o+f2G1QQwf/vrTL2ux1wN7ggPrmTonzL0X+CU6f2XLvpNbg2BmhT130jnmGHSG
         jHZInEA82QXu+4ShP5XVlTUB7b+fNqPdNteiAwH1uozjxDmTZ4xBiy7tXkVHt+c1j8KF
         fytnjgHcYqYlL8S27/1a9GgVUlhHLTbMuaoH2Ksj3DFmVV1Ew07R3/hOFzHr0QWBHtcW
         J5ClXIwLiTLeyfHJZbXZIHwAUPM95LZuu+bKdTnbtx5j0By6cq8eGzILYbly2cfLmNXA
         kvnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vwe8SHlOoBQN08qfP0QKWKi+ujc1zylgYAakFhWex2Y=;
        fh=QP1U7e9PTMZaK8CP3hfjTtd4hPooggzNSEZrpZpKjrg=;
        b=FGTuL8ZlgZ9tP1uNeCFueW7SzE5gTJ3zZDkL1xq0t37vxRc725CcP6xWaonwSdQI9b
         POJ43eS4/ZtAOX86uEDlHz0XjhdzUsvDI5yfUdpNNaz220jgh5MPYm4EYCS37VVZtC1S
         eVJ4uz6b6SUPdh58fhrFdpgsnOER1s7+J4+Q2ZoZbaXrFMH7xmi5FJ58vnHLBV+wd9ZL
         L6txKXmhtGAA9sM0kwfNiORMmbAualXFJ1hU7t2x8BJZu/CGdWPkbuN9NbQi/ihKbCJ1
         cpzNKYPcswudZJlgLvsE58isNbQFOfkBtfQ0a++VXHB5soF+/GILCRWvfvnwsdQ4HAz3
         CT8A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780359453; x=1780964253; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vwe8SHlOoBQN08qfP0QKWKi+ujc1zylgYAakFhWex2Y=;
        b=s2fH4IpUHZwYH69AscedgPxSTEj05QxJLd7JmYOKxeoi0h17lLiYNeULvPMUWTKxtO
         dNafVx8QlB8/3W1nBsM9PXpqwtg/Y4hADwdyy6fgqBhMzNK0liDR5Woki4q0gNMVOcC5
         G+fPANJRPq0qUx6q2QFcLzLjTfScByJth8L+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780359453; x=1780964253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vwe8SHlOoBQN08qfP0QKWKi+ujc1zylgYAakFhWex2Y=;
        b=sH/L5Nc0+8eul1cSvSQF/swTHUqelVWcA9GluFcnAXZ+RtP0JqvTeQxggeoRJgLz+g
         jRCe6VtFcTPIkcn4onApUlc6oDv2QgKQLX9H2V0prsz8om+bc1g4n78TEfBophLlUWBN
         MxrzOE8jv8LrPoQ7EvjdWcTN3s6kXDuzQ7GN86JOU0vPKRqeppf+4TZ67mGSL7H58oVt
         l1b6d92OZvdP+7cEYhxcdJQO9nqPGywle2mDKIMPtTf2xRGGWYZ8vidu42bvwwZcb5uA
         1BDMX5pZ8Ih3xAVRs6miwBGSByaBTATjymHk+sIfFff1MLMmrd9sVqA3CELJ5z0cSD5y
         w7pQ==
X-Gm-Message-State: AOJu0YzSgunqDCLTJUzupxY2febD+m/w59N02BdmrcU9e3wXpHKcRcWw
	Ua4wpmnrkfmQxawhb/0ZqAMf+keBDoA5Qgo43FOsK1Usly5CK39+gD8xHsdRGtR5L57SK1R9vec
	TGQOQG+JoxClBs7DK6NWXlIiS6Qdc29GST+w4X1TlhA==
X-Gm-Gg: Acq92OEpFgP7m/7oaOjQDuHdNRL/wjWXUZVe59RAXSn+0tHDqNjID305Qs/FOMPztst
	QcOO4x1dAI4KkYxsEXvUWv6vLUPGx41K0TDNJmC5RF4RKih+IuNXbT4yCShT093Jr2PnIEZrwSY
	/h8HD0Vor2UkXLh2Z/9uv63wuP7O8LvrasiUUxOhYPJI6zyAGplIz/MKsEaByEujYruWGewRLe1
	pDQAGOSBc8Vlm07vgoSAzg/7hT3UIez3rtvXb3VtBAQ2S2eGJZnoW6YmUammBhfnQdpx2crFxGw
	82IzkY9bIpS+ugZRzQ==
X-Received: by 2002:a05:690c:338c:b0:7bf:9648:8c5c with SMTP id
 00721157ae682-7e0596dfa8cmr111715607b3.18.1780359452662; Mon, 01 Jun 2026
 17:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260601185900.294639-2-tim.orling@konsulko.com> <0101019e849d1901-175f5499-fc6b-460a-b77a-8c9ec89ead92-000000@us-west-2.amazonses.com>
In-Reply-To: <0101019e849d1901-175f5499-fc6b-460a-b77a-8c9ec89ead92-000000@us-west-2.amazonses.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 1 Jun 2026 17:17:21 -0700
X-Gm-Features: AVHnY4Kthy82eQHKiHvya8A_2XWUgKaKne8gGkv0DHeq9WXqXppBtGlQqgVPfcY
Message-ID: <CAOyo-86tP0ztN19_yrAykHi0VYds6Atp32xVNZZgA_eYh7=Hvw@mail.gmail.com>
Subject: Re: Patchtest results for [PATCH v2] curl: upgrade 8.19.0 -> 8.20.0
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bfac9906533a3c72"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 00:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237995

--000000000000bfac9906533a3c72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this is a false positive. The patch added is not, to my knowledge,
associated with a CVE.

On Mon, Jun 1, 2026 at 12:15=E2=80=AFPM <patchtest@automation.yoctoproject.=
org>
wrote:

> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch
> /home/patchtest/share/mboxes/v2-curl-upgrade-8.19.0---8.20.0.patch
>
> FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in
> patch file. Correct or include the CVE tag in the patch with format: "CVE=
:
> CVE-YYYY-XXXX" (test_patch.TestPatch.test_cve_tag_format)
>
> PASS: test Signed-off-by presence
> (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence
> (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence
> (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence
> (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags
> (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list
> (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found
> (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test pylint: No python related patches, skipping test
> (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now
> (test_mbox.TestMbox.test_series_merge_on_head)
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

--000000000000bfac9906533a3c72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think this is a false positive. The patch added is not, =
to my knowledge, associated with a CVE.</div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 1,=
 2026 at 12:15=E2=80=AFPM &lt;<a href=3D"mailto:patchtest@automation.yoctop=
roject.org">patchtest@automation.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Thank you for your submiss=
ion. Patchtest identified one<br>
or more issues with the patch. Please see the log below for<br>
more information:<br>
<br>
---<br>
Testing patch /home/patchtest/share/mboxes/v2-curl-upgrade-8.19.0---8.20.0.=
patch<br>
<br>
FAIL: test CVE tag format: Missing or incorrectly formatted CVE tag in patc=
h file. Correct or include the CVE tag in the patch with format: &quot;CVE:=
 CVE-YYYY-XXXX&quot; (test_patch.TestPatch.test_cve_tag_format)<br>
<br>
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_pr=
esence)<br>
PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_=
presence)<br>
PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_sta=
tus_presence_format)<br>
PASS: test author valid (test_mbox.TestMbox.test_author_valid)<br>
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_=
presence)<br>
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message=
_user_tags)<br>
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)<br>
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)<br>
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)<br>
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)<br>
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list=
)<br>
<br>
SKIP: pretest pylint: No python related patches, skipping test (test_python=
_pylint.PyLint.pretest_pylint)<br>
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_=
bugzilla_entry_format)<br>
SKIP: test pylint: No python related patches, skipping test (test_python_py=
lint.PyLint.test_pylint)<br>
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.=
TestMbox.test_series_merge_on_head)<br>
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

--000000000000bfac9906533a3c72--

