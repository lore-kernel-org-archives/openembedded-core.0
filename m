Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45925C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 10:08:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.9929.1724321279511977314
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 03:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Mm+8IGDp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428163f7635so4017805e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 03:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724321278; x=1724926078; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShJMmMytNCRAumUaScjPveXCVLmFMkAozqMlp71NgHc=;
        b=Mm+8IGDpH6wl6hGLqIt/kar8fndYH7zk50/3M+tNHEDP/cOlY3YCAlEaswn45jLyDw
         81rnWbWb8Hqvu5LDwoibOKmMa5vfskU1S1MDdwpgieFVrs5rUtbFieVS/zgMLzEAlxkO
         Ho5rKGJQZJtDn+dmQG0hXN9H4PIxS5HMi6g7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724321278; x=1724926078;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ShJMmMytNCRAumUaScjPveXCVLmFMkAozqMlp71NgHc=;
        b=SaGt9mcRHJtR1zxxQcAnyu/+P5IuM6QWwGWc/e8FeTDL67Lop5qbsLbgDZjeIFrI8d
         rIdhSEGR8AvtaG+viFdOISI2F24aO5ZJCCIsoG+nQ6xGjKaJvLUz2+j5JDkFs1fN45Y9
         dMQ/yt9vqPPPVcnZGXNKHcELL6N8GVUKB7e73mFfN52m1hDIiX6KKqX9pq8qjO3RZjtS
         bXdPW06szbfyynyBFDbz4xmDUsgguhUa7NoyvpmFIBXxCn7/cFld1xl1PEZ5OgYQN2z6
         8MDQvSgnEp6emswA9GBDxAeHsW+rzkp8rEixapz/nyJKGqTEqRe+T2TjG1+x2M6Pvchy
         rjqA==
X-Forwarded-Encrypted: i=1; AJvYcCWnwBZCBFGWKuZWmXm5lP3gsWtP+hGQ2Xl57McFfw3F5eN12y+LWrr7bO3U7AZ2E64DkTzMqS/uZRFk2sKCJ6G9Gg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJ74+um62Qx+H+YBXwMjL7rzHriviOHUGMmkyoJ3+GZAtBp9H4
	5OISUltezkHo4aIWfTOHDbCQJ1I7Az3Qw0I9Y6EYHTDSOuZAOkKMA2C7exG8YM1C069UXZbr18K
	j
X-Google-Smtp-Source: AGHT+IEU9cmO309UL9qXw4NBP7n8/BaoeQfQj1RfjVd5VMim3PX85plaijJwbHZ7Yf49EVzwJmlStQ==
X-Received: by 2002:a05:600c:35d5:b0:429:cc03:6450 with SMTP id 5b1f17b1804b1-42abf03ce34mr27581755e9.7.1724321277506;
        Thu, 22 Aug 2024 03:07:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a? ([2001:8b0:aba:5f3c:71f4:5834:b5b2:ea3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac5180339sm18674815e9.43.2024.08.22.03.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 03:07:57 -0700 (PDT)
Message-ID: <a47e293ac359b4947028a3e55e3c37c780843685.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv2 2/2] oeqa/selftest/bbclasses: Add tests for
 systemd and update-rc.d interaction
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2024 11:07:56 +0100
In-Reply-To: <20240820223140.770567-2-pkj@axis.com>
References: <20240820223140.770567-1-pkj@axis.com>
	 <20240820223140.770567-2-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 10:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203649

On Wed, 2024-08-21 at 00:31 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> These tests verify that the correct files are left behind when systemd
> is inherited and depending on whether the systemd and/or sysvinit distro
> features are enabled.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>=20
> PATCHv2: Change LICENSE to MIT and add EXCLUDE_FROM_WORLD to the test
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recipes
>=20
> =C2=A0.../bbclasses/systemd-and-sysvinit.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 17 +++
> =C2=A0.../recipes-test/bbclasses/systemd-only.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 12 ++
> =C2=A0meta/lib/oeqa/selftest/cases/bbclasses.py=C2=A0=C2=A0=C2=A0=C2=A0 |=
 106 ++++++++++++++++++
> =C2=A03 files changed, 135 insertions(+)
> =C2=A0create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-and=
-sysvinit.bb
> =C2=A0create mode 100644 meta-selftest/recipes-test/bbclasses/systemd-onl=
y.bb
> =C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/bbclasses.py
>=20
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb=
 b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> new file mode 100644
> index 0000000000..f9fc59a494
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-and-sysvinit.bb
> @@ -0,0 +1,17 @@
> +LICENSE =3D "MIT"
> +
> +inherit allarch systemd update-rc.d
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> +
> +	install -d ${D}${INIT_D_DIR}
> +	touch ${D}${INIT_D_DIR}/${BPN}
> +}
> +
> +INITSCRIPT_NAME =3D "${BPN}"
> +
> +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta-selftest/recipes-test/bbclasses/systemd-only.bb b/meta-=
selftest/recipes-test/bbclasses/systemd-only.bb
> new file mode 100644
> index 0000000000..590a27b9cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/bbclasses/systemd-only.bb
> @@ -0,0 +1,12 @@
> +LICENSE =3D "MIT"
> +
> +inherit allarch systemd
> +
> +do_install() {
> +	install -d ${D}${systemd_system_unitdir}
> +	touch ${D}${systemd_system_unitdir}/${BPN}.service
> +}
> +
> +SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
> +
> +EXCLUDE_FROM_WORLD =3D "1"
> diff --git a/meta/lib/oeqa/selftest/cases/bbclasses.py b/meta/lib/oeqa/se=
lftest/cases/bbclasses.py
> new file mode 100644
> index 0000000000..10545ebe65
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/bbclasses.py
> @@ -0,0 +1,106 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import get_bb_vars, bitbake
> +
> +class Systemd(OESelftestTestCase):
> +=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0 Tests related to the systemd bbclass.
> +=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0 def getVars(self, recipe):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.bb_vars =3D get_bb_vars(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'BPN',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'D',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'INIT_D_DIR',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'prefix',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'systemd_system_unitdir',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 'sysconfdir',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ],
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 recip=
e,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
> +
> +=C2=A0=C2=A0=C2=A0 def fileExists(self, filename):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertExists(filename.fo=
rmat(**self.bb_vars))
> +
> +=C2=A0=C2=A0=C2=A0 def fileNotExists(self, filename):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertNotExists(filename=
.format(**self.bb_vars))
> +
> +=C2=A0=C2=A0=C2=A0 def test_systemd_in_distro(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:=C2=A0=C2=A0=C2=A0 Ve=
rify that no sysvinit files are installed when the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd distro feature is enable=
d, but sysvinit is not.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expected:=C2=A0=C2=A0 Systemd=
 service file exists, but /etc does not.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product:=C2=A0=C2=A0=C2=A0 OE=
-Core
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0=C2=
=A0 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config("""
> +DISTRO_FEATURES:append =3D " systemd usrmerge"
> +DISTRO_FEATURES:remove =3D "sysvinit"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +""")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake("systemd-only systemd=
-and-sysvinit -c install")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-only")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{systemd_=
system_unitdir}/{BPN}.service")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-and-sys=
vinit")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{systemd_=
system_unitdir}/{BPN}.service")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{sysco=
nfdir}")
> +
> +=C2=A0=C2=A0=C2=A0 def test_systemd_and_sysvinit_in_distro(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:=C2=A0=C2=A0=C2=A0 Ve=
rify that both systemd and sysvinit files are installed
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when both the systemd and sysvin=
it distro features are
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enabled.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expected:=C2=A0=C2=A0 Systemd=
 service file and sysvinit initscript exist.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product:=C2=A0=C2=A0=C2=A0 OE=
-Core
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0=C2=
=A0 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config("""
> +DISTRO_FEATURES:append =3D " systemd sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager =3D "systemd"
> +""")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake("systemd-only systemd=
-and-sysvinit -c install")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-only")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{systemd_=
system_unitdir}/{BPN}.service")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-and-sys=
vinit")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{systemd_=
system_unitdir}/{BPN}.service")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{INIT_D_D=
IR}/{BPN}")
> +
> +=C2=A0=C2=A0=C2=A0 def test_sysvinit_in_distro(self):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Summary:=C2=A0=C2=A0=C2=A0 Ve=
rify that no systemd service files are installed when the
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysvinit distro feature is enabl=
ed, but systemd is not.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Expected:=C2=A0=C2=A0 The sys=
temd=C2=A0 service file does not exist, nor does /usr.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The sysvinit initscript exists.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Product:=C2=A0=C2=A0=C2=A0 OE=
-Core
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Author:=C2=A0=C2=A0=C2=A0=C2=
=A0 Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 """
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config("""
> +DISTRO_FEATURES:remove =3D "systemd"
> +DISTRO_FEATURES:append =3D " sysvinit usrmerge"
> +VIRTUAL-RUNTIME_init_manager =3D "sysvinit"
> +""")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake("systemd-only systemd=
-and-sysvinit -c install")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-only")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{syste=
md_system_unitdir}/{BPN}.service")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{prefi=
x}")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{sysco=
nfdir}")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}")
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.getVars("systemd-and-sys=
vinit")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{syste=
md_system_unitdir}/{BPN}.service")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileNotExists("{D}{prefi=
x}")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.fileExists("{D}{INIT_D_D=
IR}/{BPN}")
>=20

I'm really happy to see tests so thanks for that! Unfortunately
something isn't quite right, some builds passed and some failed. The
failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3754/ste=
ps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3754/ste=
ps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7088/step=
s/14/logs/stdio

and the passes:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/7074
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7096

At this point I've not looked into what happened, I'm just reporting the re=
sults.

Cheers,

Richard




