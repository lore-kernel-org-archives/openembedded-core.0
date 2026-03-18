Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4254103E181
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 13:49:20 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14474.1773841752915099434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 06:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Np/g5L3F;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79a60975dc5so25057177b3.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 06:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773841752; cv=none;
        d=google.com; s=arc-20240605;
        b=TYZ+korvaxyEc/Qd40pKhP29fhC4JBh7Yoq7Ld7j7i9u5JxpshIeYv7P9t6ernp4c3
         nMZUH2zA6wXgT7737cqxF39LMbXJHY9Mvh0ybQWRlZR/CznhmU2QyPrpvjPh3F2AzNKk
         LfXdmj1gbpP4KnPR5IbdCpm9kq0Qmp8fVd6oPdG/O+vauV5/K10gLlREYBMAM9Ozg6Kr
         Za0cdByjvoJOfQj8req5yLj90v6CsDz/+XY9DES16xeMklXXWwV55PSQBhe+rfAAwf3E
         HlKGgufaBoYV8Pd4VhIrdtSKcz6b6rm3tViXl4nIS7JA4Ljp5gEKKBnSwaue9e+NizC2
         aoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xUK8wScwcJmG4DVjyddLSlDeN7SvBRiMAcUlNUdgR0U=;
        fh=BPTlcVXWLgEHw36ZghmNVTcZg+cK0nb61SqsUHg7QAM=;
        b=SemVcoAMeg92WQIPJA4wT25rNwH0t5aUGLv5v4eszw8YVYNQFLI73CZnjdTlox9u8a
         eZyqJRf0ePE0AYypTFZ9PijltoFzKWADQQ5e25QLkRe5GcPtIlP2pylbSzKrFufh6BWR
         f1W7PI6WiYkaKRUVAbIWoB4LFRrZgc+BQqFyuQfmSlXyt8uLKh3i6kP9x1ZDbv6dMJk+
         o4gSbFp7922kEfehk6z8OwtAuKtc4WSmPEOVKLeiDnWboPGIYOXPx3hcXH5dKD2Rlvte
         PHnvULMopRzr6RFtC9lppiGcVMBiSehBpUL4vChYv3XzdoKQc32QPoYVbuiJrf557zfR
         XqKA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773841752; x=1774446552; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUK8wScwcJmG4DVjyddLSlDeN7SvBRiMAcUlNUdgR0U=;
        b=Np/g5L3FYyu0RnLp/GOJHFFAfWhg4EKDrFq1hysler/ASr6ksCb9NqVR4bVWlorZYR
         RqE3GgFFUTfdr9CUoutjUduomqjMtEmmwyvwyhY3Bpp6qeHIqCfpG4T2y+J3GSCgEJ8Y
         HfhTr+tCGeX/KyPh8NmTBPkqB3gizyVm+vJg6DUOmCLxVdzpmesbVc+Uq4uDWxuIeCH2
         amPLB1ednK2e/Pyp3OS92nrATG+5TRPIgmpzsu14C0VxVj/fVz4dOLMGWdnzGvuN5p6O
         +jm51p0jbr24PNwPlF2flFy3RC2KYmnfuDFzrtVeKgYu5Nq7BXT9CpZVcJn2j98Dud9f
         p+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773841752; x=1774446552;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xUK8wScwcJmG4DVjyddLSlDeN7SvBRiMAcUlNUdgR0U=;
        b=lIVks2VZtsSh2JrUR7pUp5QZ506QPa/Wj+Kj6XNvaW2S5q4YROKcQOBD0gjxcmmn4h
         Pb9Op5gqm+8fP3tuvpF6mR8V7Y4Eadxsn4UopDwZj/luifjemqKj3L074tJMOrkY8h0q
         QAggF08wz4wkkPKmRg0KaCjdJyZ60DxoIuFQ8u2Ou10yK57BxKDn82j2t02pF7iNNh64
         XEj5sAjvCXjIraCDZ3a4FgH8cNHnkDp7tAGmCg5k2gB0dhVGwfzwQ8cDVN7tz2q6QVwh
         Y0y75ViSVNaCIFZ1b3hT2BZ+N/vhDRdT8BHJxsqbZIL/q7SsdwA1EDYiwR9RlGUj8VcK
         IpfQ==
X-Gm-Message-State: AOJu0YzhniWFfetzjZpk13wzxrk9Qx3vMNWQDaC/Pyf50qHqeSgh+dAG
	cd1TKLDquqPkCUsS6TrVsGdb2HnDh56npkW9V69Y0NH0DSnBpbvdG/spi5WzpUeVsWYBoi+qds9
	QfgDviu/0lChIXaLcuTHZ8OSf6ox9lEjeEA==
X-Gm-Gg: ATEYQzwJUZB09dlOjA4897CgxajknN1j6jYiWZEYhRizLQgJJBApdghhcsant4wGuvR
	JvRgVNoppqKG1voFRc3XdWoo6A6b4D6xh3aYrcbO6z7kpH61Xql0f81lYeB6yRUWLmw7H/arPfi
	m1ALIXTxKYiiSY4I1D2Wxx3t+U6juWSCherbhzZ4MrpkjSpIS7qzHZRHXP1vYywDDJxFc7z1H3P
	5LEtpPLYn/ed3E3q+diP3GRITlzVKAT4t7ykhC3AMc5YfLJV1Al/DMYDSEObE7PIR6vWrmUHZbL
	5JXYZycjsa5QGYoOD2lVpA==
X-Received: by 2002:a05:690c:e3ee:b0:796:4f04:bbc3 with SMTP id
 00721157ae682-79a71ad631emr32237307b3.35.1773841751699; Wed, 18 Mar 2026
 06:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260310184058.533343-1-JPEWhacker@gmail.com> <20260318134655.953233-1-JPEWhacker@gmail.com>
In-Reply-To: <20260318134655.953233-1-JPEWhacker@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 18 Mar 2026 07:49:00 -0600
X-Gm-Features: AaiRm52Vd7vjqCRylKHNzbUD2Ihhu3lFt0kGGGu3IGoEJGQ-8DJ4Lk6o1FRu0xw
Message-ID: <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
To: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Stefano Tondo <stondo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 13:49:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233403

Mathieu,

Here is my latest SPDX patch set (finally!). I'm sorry for the delay
and the mix up with Stefano's patches. I believe that you can now
stack Stefanos patches on top of mine and everything should be OK

Thank you,
Joshua


On Wed, Mar 18, 2026 at 7:46=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> Changes the SPDX 3 output to include a "recipe" package that describe
> static information available at parse time (without building). This is
> primarily useful for gathering SPDX 3 VEX information about some or all
> recipes, enabling SPDX 3 to be used in place of cve_check.bbclass and
> vex.bbclass.
>
> Special thanks to Benjamin Robin <benjamin.robin@bootlin.com> for
> helping work through this.
>
> V2: Fixes a bug where do_populate_sysroot was running when it should not
> be. Drops the patch to ignore ASSUME_PROVIDES recipes, since this is
> incorrect (this is already handled by bitbake in the taskgraph, and
> doesn't need to be manually removed).
>
> V3: Fixes a bug where meta-world-recipe-sbom was reporting a circular
> dependency. meta-world-recipe-sbom also no longer runs in world builds,
> as there's no reason to this. Finally, fixes a bug where
> NO_GENERIC_LICENSE files would fail to be found in do_create_spdx
> (because do_unpack was not run).
>
> V4: Fixes test cases. Adds SPDX_PACKAGE_INCLUDE_VEX to control if VEX
> information is linked to binary packages, or just recipes. Defaults to
> "0" to significantly reduce the size of the SPDX output.
>
> V5: Fixes dummy-sdk-packages to not generate SPDX output, since it
> does funny things with its arch which prevents it from rebuilding SPDX
> data properly, and no SPDX data is needed for it anyway
>
> V6: Fixes a bug where SPDX task would not correctly re-run when they
> change, which would cause errors about missing SPDX document. Also
> updates to the latest version of the SPDX bindings which improves
> performance
>
> V7: Makes meta-world-recipe-sbom create the world SBoM when run with a
> task (e.g. as part of do_build). Drops the removal of SPDX from
> dummy-sdk-packages as these have been fixed to work properly.
>
> Joshua Watt (12):
>   spdx3: Add recipe SPDX data
>   spdx3: Add recipe SBoM task
>   spdx3: Add is-native property
>   spdx30: Include patch file information in VEX
>   spdx: De-duplicate CreationInfo
>   spdx_common: Check for dependent task in task flags
>   spdx30: Remove package VEX
>   spdx: Remove fatal errors for missing providers
>   spdx3: Use common variable for vardeps
>   glibc-testsuite: Do not generate SPDX
>   spdx: Remove do_collect_spdx_deps task
>   spdx: Update to latest bindings
>
>  meta/classes-global/sstate.bbclass            |    4 +-
>  .../create-spdx-image-3.0.bbclass             |    4 +-
>  .../create-spdx-sdk-3.0.bbclass               |    4 +-
>  meta/classes-recipe/kernel.bbclass            |    2 +-
>  meta/classes-recipe/nospdx.bbclass            |    2 +-
>  meta/classes/create-spdx-2.2.bbclass          |   33 +-
>  meta/classes/create-spdx-3.0.bbclass          |   81 +-
>  meta/classes/spdx-common.bbclass              |   34 +-
>  meta/conf/distro/include/maintainers.inc      |    1 +
>  meta/lib/oe/sbom30.py                         |  239 +-
>  meta/lib/oe/spdx30/__init__.py                |    8 +
>  meta/lib/oe/spdx30/__main__.py                |   12 +
>  meta/lib/oe/spdx30/cmd.py                     |   75 +
>  meta/lib/oe/{spdx30.py =3D> spdx30/model.py}    | 5935 ++++++++++-------
>  meta/lib/oe/spdx30/stub.pyi                   | 2544 +++++++
>  meta/lib/oe/spdx30_tasks.py                   |  459 +-
>  meta/lib/oe/spdx_common.py                    |   78 +-
>  meta/lib/oeqa/selftest/cases/spdx.py          |   28 +-
>  .../glibc/glibc-testsuite_2.43.bb             |    1 +
>  .../meta/meta-world-recipe-sbom.bb            |   38 +
>  scripts/contrib/make-spdx-bindings.sh         |    3 +-
>  21 files changed, 6837 insertions(+), 2748 deletions(-)
>  create mode 100644 meta/lib/oe/spdx30/__init__.py
>  create mode 100644 meta/lib/oe/spdx30/__main__.py
>  create mode 100644 meta/lib/oe/spdx30/cmd.py
>  rename meta/lib/oe/{spdx30.py =3D> spdx30/model.py} (52%)
>  create mode 100644 meta/lib/oe/spdx30/stub.pyi
>  create mode 100644 meta/recipes-core/meta/meta-world-recipe-sbom.bb
>
> --
> 2.53.0
>

