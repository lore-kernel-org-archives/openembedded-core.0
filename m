Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F5C4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 14:14:59 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.12393.1704896093373458004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 06:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dGoBS7uK;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55818b733f7so1951499a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 06:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704896092; x=1705500892; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaDKKDIhYx19g2mP+M2cx4TA/EMyxfrayPrMAm9nRh0=;
        b=dGoBS7uKcMh58zpp+xv8q6/H/V3nm6Mz5pKcLwA1Z6706mpDWAJ/FevPbcg1oL1kEr
         QrbjcYLceMgo/YBMcwG5MmDyl22z2qQaxzDQtX/R7w1olmOS3oB+f5C8D0Iw64mK/0Ba
         Hq2DIsXHGd1qcJskffzCjPfvep5ItimeGNUc945PBA9YZMXrk+kmzCiYgWJn2sBChY0S
         m0lxo8hz19Sd78nSyX3IsfHHL5eXu7km3NWWecMhG0zp527Okyk2JhY7sSllWXo8DgUF
         CC7qJK6bThzXAlHPtxvPOoKCREvwgLXj/toKZXJjefJeUnpNpotOPSX5UwXcwphVGttz
         2rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896092; x=1705500892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaDKKDIhYx19g2mP+M2cx4TA/EMyxfrayPrMAm9nRh0=;
        b=R4di+y3AJPg6QmvMFYt9HcktBUhSPi+/Zl0sNZJmoMhCg1m209uUp8kFmYaIbC45y5
         EVJm1nVrtwFAcjVy2gzg2feMCRynEJFlZCy5U49a3GOxOj5ORdORErPk5JYgL5iTVKYN
         ZAyYtPD/rc3TJNriAayVepDRMf198p4c9XjjzA/fg/LEC/Cp8D3XhBGBV2L3ritA4L7U
         0ySEzFoBAdYk7NPfdFWeA/fUWQ15sTjmZM3v7Ya0egOOj5rSLO4OgwOZCNxUgp5rnfYS
         8EeXIlDznABXLmUyKfE6zUXLAEcQMHpRAF9VUOJZfME2A2ckudoPRjcUjniVJgEmEt3R
         nCTw==
X-Gm-Message-State: AOJu0YwRRi3pkcx0/nk5NCFJ/PdE6pD3Ub31tX3tNMBHBgVAQGWONfka
	nm+Xx6uaTrLQBspu3s+OW/1vlFkzXrZmyFvU4ZH4oD3oc5WlVA==
X-Google-Smtp-Source: AGHT+IHJEZVWtsUd0H4ckWfJDAWo4ezfjxjQHDx5nE12PuW/AubxgfV2iyMLSG/0Mf6k02kYY3xNYQoaQjsG7lvv+3c=
X-Received: by 2002:a17:907:29c4:b0:a29:8bd8:6233 with SMTP id
 ev4-20020a17090729c400b00a298bd86233mr560406ejc.146.1704896091624; Wed, 10
 Jan 2024 06:14:51 -0800 (PST)
MIME-Version: 1.0
References: <0101018cf3337384-2df39066-4255-4a99-8684-851ee73b7326-000000@us-west-2.amazonses.com>
 <AS1PR10MB56978588EDE41492DC1AF896FD692@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56978588EDE41492DC1AF896FD692@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 10 Jan 2024 04:14:40 -1000
Message-ID: <CAOSpxdb170sH1E751bWXx80gMxXowUehGH7Y-MebF4aVZDUjDw@mail.gmail.com>
Subject: Re: Patchtest results for [OE-core][kirkstone][PATCH] openssl:
 Backport fix for CVE-2023-6129
To: peter.marko@siemens.com
Cc: "simone.p.weiss@posteo.com" <simone.p.weiss@posteo.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"patchtest@automation.yoctoproject.org" <patchtest@automation.yoctoproject.org>, Vivek Kumbhar <vkumbhar@mvista.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 14:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193512

On Wed, Jan 10, 2024 at 1:56=E2=80=AFAM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> CVE_STATUS was not backported to kirkstone.
> Any idea how to skip some tests for old branches?

Agreed, it would be nice!

It's interesting that the patch doesn't contain the string
CVE_CHECK_IGNORE, so it is picking up the CVE_CHECK_IGNORE that is
currently in the recipe.

Steve

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Patchtest via lists.openembedded.org
> Sent: Wednesday, January 10, 2024 12:48
> To: Vivek Kumbhar <vkumbhar@mvista.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Patchtest results for [OE-core][kirkstone][PATCH] openssl: Backp=
ort fix for CVE-2023-6129
>
> > Thank you for your submission. Patchtest identified one or more issues =
with the patch. Please see the log below for more information:
> >
> > ---
> > Testing patch /home/patchtest/share/mboxes/kirkstone-openssl-Backport-f=
ix-for-CVE-2023-6129.patch
> >
> > FAIL: test CVE check ignore: CVE_CHECK_IGNORE is deprecated and should =
be replaced by CVE_STATUS (test_metadata.TestMetadata.test_cve_check_ignore=
)
> >
> > PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_sr=
c_uri_left_files)
> > PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> > PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_b=
y_presence)
> > PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off=
_by_presence)
> > PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream=
_status_presence_format)
> > PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> > PASS: test commit message presence (test_mbox.TestMbox.test_commit_mess=
age_presence)
> > PASS: test lic files chksum modified not mentioned (test_metadata.TestM=
etadata.test_lic_files_chksum_modified_not_mentioned)
> > PASS: test max line length (test_metadata.TestMetadata.test_max_line_le=
ngth)
> > PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> > PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> > PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> > PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> > PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_=
left_files)
> >
> > SKIP: pretest pylint: No python related patches, skipping test (test_py=
thon_pylint.PyLint.pretest_pylint)
> > SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.t=
est_bugzilla_entry_format)
> > SKIP: test lic files chksum presence: No added recipes, skipping test (=
test_metadata.TestMetadata.test_lic_files_chksum_presence)
> > SKIP: test license presence: No added recipes, skipping test (test_meta=
data.TestMetadata.test_license_presence)
> > SKIP: test pylint: No python related patches, skipping test (test_pytho=
n_pylint.PyLint.test_pylint)
> > SKIP: test series merge on head: Merge test is disabled for now (test_m=
box.TestMbox.test_series_merge_on_head)
> > SKIP: test summary presence: No added recipes, skipping test (test_meta=
data.TestMetadata.test_summary_presence)
> > SKIP: test target mailing list: Series merged, no reason to check other=
 mailing lists (test_mbox.TestMbox.test_target_mailing_list)
> >
> > ---
> >
> > Please address the issues identified and submit a new revision of the p=
atch, or alternatively, reply to this email with an explanation of why the =
patch should be accepted. If you believe these results are due to an error =
in patchtest, please submit a bug at https://bugzilla.yoctoproject.org/ (us=
e the 'Patchtest' category > under 'Yocto Project Subprojects'). For more i=
nformation on specific failures, see: https://wiki.yoctoproject.org/wiki/Pa=
tchtest. Thank you!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193496): https://lists.openembedded.org/g/openembedde=
d-core/message/193496
> Mute This Topic: https://lists.openembedded.org/mt/103639021/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

