Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58C7CDD1AE
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 13:18:14 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.68888.1727443092919052684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Sep 2024 06:18:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=X6RRehjp;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e25d6342837so1348679276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727443092; x=1728047892; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJCRj2IvL55xIoy6ZthfB6E8x6sNAGGRXEOLDF8eZHM=;
        b=X6RRehjpDT6Qsm3gvjjpU5/VjQeVFzz77PkkeeYAu9JguAeTfiY3lUaBlyPQEsrBFw
         4EQRtrOrZLAX4Q7SoU3M4oA/sO+8ulrMMpQRpKTr3qjbE9VsbS5Bqzl7TQhgNonnrFLG
         hK2s2xGXY2BV8KVTQOFcSxdDWc4Vee1q5Y5UkggsAwRlXb09lqpfob5iBi89zIzq2thU
         jQ1n+TOrTxQuXQ+IP8paXXDTc/2lPv87qR+8uqo4kwVMNxQxUfHlI1WrNW/yLhJf7Viy
         uBlbGAxh5qOgJeV4Qbbz6bNYpr/Dy5f8yMR4P2YFVyZ21O0ZCmYzr4Gunoj/2BCys+qN
         iTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727443092; x=1728047892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJCRj2IvL55xIoy6ZthfB6E8x6sNAGGRXEOLDF8eZHM=;
        b=fLvTktx+lA+0W1l685NZrqcAr+TcCXDz4LiDLlV0f8U24/3pJrQJWio0pxFa86dZjV
         87/0Iy/e3c3OX+LLXcmEypzxQJUBNcOwcDcO9+8Lo3WsUEBNduzUZI03i/MNuAtE50qz
         OenlXgQEiuq5xcX9tqEEqPMnJOFA8Ia0IZCENOnA3J85BhpTcqlUO5n1e4kom2DteFDQ
         W9awheY+HCfwMyoTfi8Mk9ZnvH4QThWcpCzQNIdT6kutLWjK7G67gdnezXGpr0gBmMuw
         V9KAN2key2q7N0qWcsGXYh+Z0Ys+iZubTYCIe7PndeM1DyGvpcLtQKATJZrkY8H8W30a
         wOtw==
X-Forwarded-Encrypted: i=1; AJvYcCUtl1TFxN+5DFragAc/MHmQ+UL95YeRyDxMafXdwVDoLnC1epmi6zqPmU9T8drsQ78FE3226DcqVBvKvf+LiGsIjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXF0tHMuDOG8KKZyCgStmcMSUlE7TJqi0UTbAP3vP9m47z/V31
	7sdfEeMBnB4pCr8iN4wwl/dNQ7rwbIpliB81O55r5Qsqgs3V48znsFr6iJaWfYO9WeO4aGTxab7
	ZKcSfkscB2kdKSnKKUSDpHJCnmS8PNBOTnz69wA==
X-Google-Smtp-Source: AGHT+IHW6UhC9qqFQZGnBmyCuOue3+YNnTugnmGlMe11miKwLHjnkY123UIAWmhlDY88LNXHk7N0NXZl1OUgpiH+qHE=
X-Received: by 2002:a05:6902:1609:b0:e1d:c3ea:da04 with SMTP id
 3f1490d57ef6-e2604b3c91amr2361006276.13.1727443092005; Fri, 27 Sep 2024
 06:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <918f936e-68b2-449d-9521-3507c25f0a8b@electromag.com.au>
 <01010192310e86e5-dead12fa-f954-445e-b2b1-dadf7efdb3b4-000000@us-west-2.amazonses.com>
 <e21b0aa4-d7dc-467e-950c-95297cb7ffe6@electromag.com.au> <150d9aab-e3c4-4d54-98c3-2cadad694ac5@baylibre.com>
In-Reply-To: <150d9aab-e3c4-4d54-98c3-2cadad694ac5@baylibre.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 27 Sep 2024 06:18:00 -0700
Message-ID: <CAOSpxdbhAZ90hrtwBz8WpcshpbjX2MSFPHst4Nyq3Y__+u395A@mail.gmail.com>
Subject: Re: [OE-core] Patchtest results for scarthgap: kernel build failure
To: tgamblin@baylibre.com
Cc: preid@electromag.com.au, patchtest@automation.yoctoproject.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 13:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205022

On Fri, Sep 27, 2024 at 5:17=E2=80=AFAM Trevor Gamblin via
lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
wrote:
>
>
> On 2024-09-26 21:47, Phil Reid via lists.openembedded.org wrote:
> > patchtest has inadvertently detected the email question as a patch.
> > Email did contain a diff, but it was part of the query into the
> > problem being encountered.
>
> Seems like maybe I should tweak it so it also check for a [PATCH] tag in
> the subject line.

Not sure that is a good idea!  People don't always include PATCH in
the subject line.

I think I'd rather have the occasional  patchtest error than have
patches not checked.

Steve

> > On 27/09/2024 09:18, patchtest@automation.yoctoproject.org wrote:
> >> Thank you for your submission. Patchtest identified one
> >> or more issues with the patch. Please see the log below for
> >> more information:
> >>
> >> ---
> >> Testing patch
> >> /home/patchtest/share/mboxes/scarthgap-kernel-build-failure.patch
> >>
> >> FAIL: test Signed-off-by presence: Mbox is missing Signed-off-by. Add
> >> it manually or with "git commit --amend -s"
> >> (test_mbox.TestMbox.test_signed_off_by_presence)
> >>
> >> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> >> PASS: test commit message presence
> >> (test_mbox.TestMbox.test_commit_message_presence)
> >> PASS: test max line length
> >> (test_metadata.TestMetadata.test_max_line_length)
> >> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> >> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> >> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> >> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> >> PASS: test target mailing list
> >> (test_mbox.TestMbox.test_target_mailing_list)
> >>
> >> SKIP: pretest pylint: No python related patches, skipping test
> >> (test_python_pylint.PyLint.pretest_pylint)
> >> SKIP: pretest src uri left files: Patch cannot be merged
> >> (test_metadata.TestMetadata.pretest_src_uri_left_files)
> >> SKIP: test CVE check ignore: No modified recipes or older target
> >> branch, skipping test (test_metadata.TestMetadata.test_cve_check_ignor=
e)
> >> SKIP: test CVE tag format: No new CVE patches introduced
> >> (test_patch.TestPatch.test_cve_tag_format)
> >> SKIP: test Signed-off-by presence: No new CVE patches introduced
> >> (test_patch.TestPatch.test_signed_off_by_presence)
> >> SKIP: test Upstream-Status presence: No new CVE patches introduced
> >> (test_patch.TestPatch.test_upstream_status_presence_format)
> >> SKIP: test bugzilla entry format: No bug ID found
> >> (test_mbox.TestMbox.test_bugzilla_entry_format)
> >> SKIP: test lic files chksum modified not mentioned: No modified
> >> recipes, skipping test
> >> (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mention=
ed)
> >> SKIP: test lic files chksum presence: No added recipes, skipping test
> >> (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> >> SKIP: test license presence: No added recipes, skipping test
> >> (test_metadata.TestMetadata.test_license_presence)
> >> SKIP: test pylint: No python related patches, skipping test
> >> (test_python_pylint.PyLint.test_pylint)
> >> SKIP: test series merge on head: Merge test is disabled for now
> >> (test_mbox.TestMbox.test_series_merge_on_head)
> >> SKIP: test src uri left files: Patch cannot be merged
> >> (test_metadata.TestMetadata.test_src_uri_left_files)
> >> SKIP: test summary presence: No added recipes, skipping test
> >> (test_metadata.TestMetadata.test_summary_presence)
> >>
> >> ---
> >>
> >> Please address the issues identified and
> >> submit a new revision of the patch, or alternatively, reply to this
> >> email with an explanation of why the patch should be accepted. If you
> >> believe these results are due to an error in patchtest, please submit =
a
> >> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' categor=
y
> >> under 'Yocto Project Subprojects'). For more information on specific
> >> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> >> you!
> >>
> >>
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205017): https://lists.openembedded.org/g/openembedde=
d-core/message/205017
> Mute This Topic: https://lists.openembedded.org/mt/108679490/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

