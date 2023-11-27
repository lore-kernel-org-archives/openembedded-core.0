Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701CFC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 14:40:19 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.96320.1701096009751939924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 06:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5g+V7Pm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54af61f2a40so3965885a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 06:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701096008; x=1701700808; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9nJRZ6AV9rArTi+9v+uzuTmTaIAMPBSk+Q6sAza0M8=;
        b=M5g+V7PmS742Hj/OjK48p1kiHIuUC6yHdKyVgojAoxqrklcAF9OJsgHRTZI5vIDk97
         R1+JMowQZGKJkrABgf4ZkyhPbuRNfY/nNMLjLI807W+QFh/+PfZoDhW1b14DpA42yMdJ
         p2qZjpW2eJLLp28Izo8nV9tjkvDHPX+E2spRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701096008; x=1701700808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U9nJRZ6AV9rArTi+9v+uzuTmTaIAMPBSk+Q6sAza0M8=;
        b=up9hJIECb8ME2KfdivXuBoI4excVAqSEOfPN+Tr7mQYRuxEqykQlEjPtJrtDWeiiqj
         XPycUHUHrOIZK5fq9tHNHSWqV1H3n+LJDFpWECSEzz8a6aGjZvCVT05w7AZqQe8Sb7Qn
         RNyZoKRiQrCTWDLpSWYHCHfA+20WEk/Co/PqSKr/Za/Owa2nBAVjiN6W8c70vJvgbD5f
         rCP/PGVPzSCNtM0agSOhFJuRMBbnpj1h35ii+mt/OLDaOKLnReXGLfGqfOjLj+hNKZlE
         Ka20B61FDiMIRFoLCvZEnGS+XkmGqQTNi/syWWuuWNOSUQaJp2fObGo6tmUFdYvCtza7
         Eqsw==
X-Gm-Message-State: AOJu0Yxz0z08uoUhf5MMl+Y0n7ETryhQu2vBAMBy52Z0C+tgNbDnUY9P
	92SUA7Lq6WHdJtQe5xSPDZpmcSH/HWmzSPBQxZI=
X-Google-Smtp-Source: AGHT+IETTUwPBtmmEqIwUtafMhrSsGPLfevuQM4JIlVoztCM0Lv/uCQNVu8b+wiwv3b9cEz8DK581Q==
X-Received: by 2002:a05:6402:1744:b0:54a:fcfd:224 with SMTP id v4-20020a056402174400b0054afcfd0224mr6778060edx.17.1701096008171;
        Mon, 27 Nov 2023 06:40:08 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:430c:b470:8466:3e0? ([2001:8b0:aba:5f3c:430c:b470:8466:3e0])
        by smtp.gmail.com with ESMTPSA id v3-20020a056402348300b0054b585a4690sm1609287edc.37.2023.11.27.06.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:40:07 -0800 (PST)
Message-ID: <abec9cde3a703c4caacf564c966727bf96f31c53.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC 1/2] usergrouptests: Add initial useradd testing
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2023 14:40:06 +0000
In-Reply-To: <9dc02c0f89156ed4ce47350f90d44cb05e7d3897.1700746611.git.pidge@baylibre.com>
References: <cover.1700746611.git.pidge@baylibre.com>
	 <9dc02c0f89156ed4ce47350f90d44cb05e7d3897.1700746611.git.pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191305

On Thu, 2023-11-23 at 13:49 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> This commit tests for
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13419
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14961
>=20
> Fixes for these are in following commits.
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  .../selftest-users/creategroup1.bb            | 32 +++++++++++++++++++
>  .../selftest-users/creategroup2.bb            | 32 +++++++++++++++++++
>  .../selftest-users/useraddbadtask.bb          | 20 ++++++++++++
>  .../lib/oeqa/selftest/cases/usergrouptests.py | 32 +++++++++++++++++++
>  4 files changed, 116 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup=
1.bb
>  create mode 100644 meta-selftest/recipes-test/selftest-users/creategroup=
2.bb
>  create mode 100644 meta-selftest/recipes-test/selftest-users/useraddbadt=
ask.bb
>  create mode 100644 meta/lib/oeqa/selftest/cases/usergrouptests.py
>=20
> diff --git a/meta-selftest/recipes-test/selftest-users/creategroup1.bb b/=
meta-selftest/recipes-test/selftest-users/creategroup1.bb
> new file mode 100644
> index 00000000000..2b0c443858c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-users/creategroup1.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "creategroup pt 1"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +LICENSE =3D "MIT"
> +
> +DEPENDS:append =3D "coreutils-native"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit useradd allarch
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "-u 5555 --gid grouptest gt1"
> +GROUPADD_PARAM:${PN} =3D "-r grouptest"
> +
> +TESTDIR =3D "${D}${sysconfdir}/creategroup"
> +
> +do_install() {
> +	install -d   ${TESTDIR}
> +	install -d   ${TESTDIR}/dir
> +	touch        ${TESTDIR}/file
> +	ln -s ./file ${TESTDIR}/symlink
> +	install -d   ${TESTDIR}/fifotest
> +	mkfifo       ${TESTDIR}/fifotest/fifo
> +    which chown
> +	chown    gt1:grouptest ${TESTDIR}/file
> +	chown -R gt1:grouptest ${TESTDIR}/dir
> +	chown -h gt1:grouptest ${TESTDIR}/symlink
> +	chown -R gt1:grouptest ${TESTDIR}/fifotest
> +}
> +
> +FILES:${PN} =3D "${sysconfdir}/creategroup/*"
> diff --git a/meta-selftest/recipes-test/selftest-users/creategroup2.bb b/=
meta-selftest/recipes-test/selftest-users/creategroup2.bb
> new file mode 100644
> index 00000000000..6f25592c09f
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-users/creategroup2.bb
> @@ -0,0 +1,32 @@
> +SUMMARY =3D "creategroup pt 2"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +LICENSE =3D "MIT"
> +
> +DEPENDS:append =3D "coreutils-native creategroup1"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit useradd allarch
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "-u 5556 --gid grouptest gt2"
> +
> +TESTDIR =3D "${D}${sysconfdir}/creategroup"
> +
> +do_install() {
> +	install -d   ${TESTDIR}
> +	install -d   ${TESTDIR}/dir
> +	touch        ${TESTDIR}/file
> +	ln -s ./file ${TESTDIR}/symlink
> +	install -d   ${TESTDIR}/fifotest
> +	mkfifo       ${TESTDIR}/fifotest/fifo
> +
> +	chown    gt2:grouptest ${TESTDIR}/file
> +	chown -R gt2:grouptest ${TESTDIR}/dir
> +	chown -h gt2:grouptest ${TESTDIR}/symlink
> +	chown -R gt2:grouptest ${TESTDIR}/fifotest
> +}
> +
> +FILES:${PN} =3D "${sysconfdir}/creategroup/*"
> +
> diff --git a/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb =
b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
> new file mode 100644
> index 00000000000..99e04a80b34
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-users/useraddbadtask.bb
> @@ -0,0 +1,20 @@
> +SUMMARY =3D "UserAddBadTask"
> +LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
> +
> +LICENSE =3D "MIT"
> +
> +DEPENDS:append =3D "coreutils-native"
> +
> +S =3D "${WORKDIR}"
> +
> +inherit useradd allarch
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "-u 5555 --gid groupaddtask useraddtask"
> +GROUPADD_PARAM:${PN} =3D "-r groupaddtask"
> +
> +do_badthingshappen() {
> + echo "foo"
> +}
> +
> +addtask badthingshappen after do_populate_sysroot before do_package
> diff --git a/meta/lib/oeqa/selftest/cases/usergrouptests.py b/meta/lib/oe=
qa/selftest/cases/usergrouptests.py
> new file mode 100644
> index 00000000000..14f7a0beab0
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/usergrouptests.py
> @@ -0,0 +1,32 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake, get_bb_var
> +import bb.utils
> +import os
> +
> +class UserGroupTests(OESelftestTestCase):
> +    def test_group_from_dep_package(self):
> +        self.logger.info("Building creategroup2")
> +        self.logger.info("Cleaning sstate for creategroup1 and creategro=
up2")
> +        bitbake(' creategroup1 creategroup2 -f -c cleansstate')

Unfortunately this test isn't safe for a shared sstate cache like we
have on the autobuilder since we should never use cleansstate there
without special handling (isolated cache). You would also never need -f
with clean*.

Instead you could do something like a "bitbake creategroup2 -C fetch"
if you always want it to rebuild.

Cheers,

Richard

