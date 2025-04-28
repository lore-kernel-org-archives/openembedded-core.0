Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BBAC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:44:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.44289.1745833445670999984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 02:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GMhI5PLW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso28535115e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745833444; x=1746438244; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQLNVPZnv4hTALvsiQU8rNDklrzNRGFL1p70b6xU8yY=;
        b=GMhI5PLWRsSovsxzt1rKY0SIr4M3byjZ3cbujPvDRjCk+NqcavIa5BJYvnbINNRa+o
         +fd0uPHVzbZtydqpmQR/fnR6zVyuSed6Q8FAdQUQnatiT46bV62MO29psiYmtRbUZpid
         daJC9UIDhIJ4in9o2vJu+/+4I8sBnffx6cwbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833444; x=1746438244;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQLNVPZnv4hTALvsiQU8rNDklrzNRGFL1p70b6xU8yY=;
        b=WAq0lM7BlCqnELwIOb6onIe+q1nywq9fMj06uP1XddyatxgOgFMm1loT3bvLMCUpnG
         zAH91J0PDdM5YyUqziStnSn20wJfZM1C2XgZQ+98WmpYFFJwXcdTuGkgm8zdU57hufPS
         7USk6UWVn06cQWHgZC2ZkmYZ8U3PNAY3IooTmVu/kVyou1/S2ysFvcE2RNoLH5drvmG5
         rOb4jzSfFwS2OVXuJFzdgT8SgnVX4v2xN+OSs1sA2Vjagl3ppAEJfRlDDC/WJUlPHge9
         XIa0EJp3ajiSR3x9fkATTlmPkpsB9P3izf7jsJqif3e/b+e3xxM/9w9/sdvGMzk3uSYW
         PxNw==
X-Forwarded-Encrypted: i=1; AJvYcCX+y0mghpjYG8He0Xmdiu6anjBLJgmh8MMsbqrv2uH11gxSR6cdSDfYe9GWjtoG0QCgDvpSf49+jR2DOXgmeG/hng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzB77DfTs/6A/pJ4NHWtWIaHUFTl1GrYVpAviGNVU+q2OWbN8D6
	5r4B6/3fWYbSZ3wDh3CPmkFLKifN+t7BV3SsGW8S3sdhh940aGpeOpjv5D0YkT0=
X-Gm-Gg: ASbGncsDWQPO+7w/GKAqX+oTCsbCcT1zk8d3QJkC1zKAZfTycDgdR6uL3Cx932oqxeE
	3DTPtJV2xshKkrabyG7+gYMWE1GlyIdnzvnVosOquwZlAKbMjxBbtFadIfyPN9w8q3HwhyX8CEf
	AE0QUBA9vZhVXpmVZQLTddv/k6C2NKtL3xsAVCfnLPL8qOjtTfNU0aGh3JgRGUrkdnQyTruBogT
	uWe386ly+xdPibTOewdA5uo0mi/5Z8oKodzzHEbQJmgq6tp9gt9cbnBE7NiS0MHiR9JPGfUyzbK
	rMeBDC1a/eRxgBHRkelt8tOkA80FB0kKd3n+rkB6aS3C3ymaM9+lbXSXF9NkoE9A9OBW0apBr/K
	TJ9SwwhE3OG5XeSTbKJ0eS2UqjAd2fA==
X-Google-Smtp-Source: AGHT+IF6u89uv5Ts8APp7Dr69WfwWZcURpjf6mOUCuI1Me2QIZLp7D2c2Y/wuxtV1fL7zTQBOEDSyw==
X-Received: by 2002:a05:600c:4447:b0:43d:16a0:d98d with SMTP id 5b1f17b1804b1-440a66a1c6emr86585445e9.15.1745833443965;
        Mon, 28 Apr 2025 02:44:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9969:e6a6:49a5:9ef1? ([2001:8b0:aba:5f3c:9969:e6a6:49a5:9ef1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d1e19e1sm149278975e9.0.2025.04.28.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:44:03 -0700 (PDT)
Message-ID: <d65afd4318372044fe276646f7365814faea382f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.13.6 -> 2.14.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Apr 2025 10:44:02 +0100
In-Reply-To: <AS1PR10MB569741B01B9E1692C1ED0207FD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250427141012.2442478-1-peter.marko@siemens.com>
	 <c67aba6bda61ca5c852855d60d8c54b3369d48ff.camel@linuxfoundation.org>
	 <AS1PR10MB569741B01B9E1692C1ED0207FD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 09:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215589

On Sun, 2025-04-27 at 22:12 +0000, Marko, Peter wrote:
>=20
>=20
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: Sunday, April 27, 2025 23:54
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.13.6 -> 2.14.2
> >=20
> > On Sun, 2025-04-27 at 16:10 +0200, Peter Marko via
> > lists.openembedded.org
> > wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >=20
> > > Handle CVE-2025-32414 and CVE-2025-32415.
> > >=20
> > > * rebased install-tests.patch
> > > * removed testsuite testThreads (merged into runtest.c)
> > > =C2=A0 * https://gitlab.gnome.org/GNOME/libxml2/-
> > /commit/481fd6bbee029e15a6a4015e5160a332d7c18cba
> > > * removed IPv6 option (as part of with ftp support removal)
> > > =C2=A0 * https://gitlab.gnome.org/GNOME/libxml2/-
> > /commit/dba1ed85a320c36807ee09f44d09fd30852b9370
> > > * added testsuites testlimits testparser (already present before
> > > but not
> > executed)
> > >=20
> > > License-Update: Mention contributors in Copyright
> > > https://gitlab.gnome.org/GNOME/libxml2/-
> > /commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7
> > >=20
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > ---
> > > =C2=A0meta/recipes-core/libxml/libxml2/install-tests.patch=C2=A0=C2=
=A0=C2=A0=C2=A0 | 4 ++-
> > > -
> > > =C2=A0meta/recipes-core/libxml/libxml2/run-ptest=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> > > =C2=A0.../libxml/{libxml2_2.13.6.bb =3D> libxml2_2.14.2.bb}=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 9
> > > +++------
> > > =C2=A03 files changed, 6 insertions(+), 9 deletions(-)
> > > =C2=A0rename meta/recipes-core/libxml/{libxml2_2.13.6.bb =3D>
> > > libxml2_2.14.2.bb}
> > (92%)
> > >=20
> > > diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > b/meta/recipes-
> > core/libxml/libxml2/install-tests.patch
> > > index 1c8c13ab5c..789aeca119 100644
> > > --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > > @@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
> > > =C2=A0index 4cb9a5c..8adcd7e 100644
> > > =C2=A0--- a/Makefile.am
> > > =C2=A0+++ b/Makefile.am
> > > -@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> > > +@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> > > =C2=A0=C2=A0	testparser \
> > > =C2=A0=C2=A0	testrecurse
> > >=20
> > > @@ -29,6 +29,6 @@ index 4cb9a5c..8adcd7e 100644
> > > =C2=A0+	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
> > > =C2=A0+	cp -r $(srcdir)/python/tests
> > > $(DESTDIR)$(ptestdir)/python
> > > =C2=A0+
> > > - bin_PROGRAMS =3D xmllint xmlcatalog
> > > + bin_PROGRAMS =3D xmllint
> > >=20
> > > =C2=A0 bin_SCRIPTS =3D xml2-config
> > > diff --git a/meta/recipes-core/libxml/libxml2/run-ptest
> > > b/meta/recipes-
> > core/libxml/libxml2/run-ptest
> > > index f252a78f17..cbbdd5592f 100755
> > > --- a/meta/recipes-core/libxml/libxml2/run-ptest
> > > +++ b/meta/recipes-core/libxml/libxml2/run-ptest
> > > @@ -5,7 +5,7 @@ set -e
> > > =C2=A0export LC_ALL=3Den_US.UTF-8
> > >=20
> > > =C2=A0# testModule isn't that useful and hard-codes buildtree, so we
> > > don't run that
> > > -TESTS=3D"runtest runsuite testrecurse testchar testdict
> > > testThreads runxmlconf
> > testapi"
> > > +TESTS=3D"runtest runsuite testrecurse testchar testdict runxmlconf
> > > testapi
> > testlimits testparser"
> > >=20
> > > =C2=A0for T in $TESTS; do
> > > =C2=A0=C2=A0=C2=A0=C2=A0 echo Running $T
> > > diff --git a/meta/recipes-core/libxml/libxml2_2.13.6.bb
> > > b/meta/recipes-
> > core/libxml/libxml2_2.14.2.bb
> > > similarity index 92%
> > > rename from meta/recipes-core/libxml/libxml2_2.13.6.bb
> > > rename to meta/recipes-core/libxml/libxml2_2.14.2.bb
> > > index 3b3ca87e96..ab06282f17 100644
> > > --- a/meta/recipes-core/libxml/libxml2_2.13.6.bb
> > > +++ b/meta/recipes-core/libxml/libxml2_2.14.2.bb
> > > @@ -4,7 +4,7 @@ HOMEPAGE =3D
> > > "https://gitlab.gnome.org/GNOME/libxml2"
> > > =C2=A0BUGTRACKER =3D
> > > "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
> > > =C2=A0SECTION =3D "libs"
> > > =C2=A0LICENSE =3D "MIT"
> > > -LIC_FILES_CHKSUM =3D
> > "file://Copyright;md5=3Df437ed9058e8e5135e47c01e973376ba=C2=A0\
> > > +LIC_FILES_CHKSUM =3D
> > "file://Copyright;md5=3D5873615e8a9ecbf5c8857c4312ee05d6=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > file://dict.c;beginline=3D6;endline=3D15;md5=3D2b4b7b827d2d8b0803724
> > 33c4c9c85b6=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e50060
> > 602d20f3a7=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > > @@ -19,7 +19,7 @@ SRC_URI +=3D
> > "
> > http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtest=
t
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi=
le://install-tests.patch=C2=A0\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > >=20
> > > -SRC_URI[archive.sha256sum] =3D
> > "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
> > > +SRC_URI[archive.sha256sum] =3D
> > "353f3c83535d4224a4e5f1e88c90b5d4563ea8fec11f6407df640fd28fc8b8c6"
> > > =C2=A0SRC_URI[testtar.sha256sum] =3D
> > "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
> > >=20
> > > =C2=A0# Disputed as a security issue, but fixed in d39f780
> > > @@ -27,11 +27,8 @@ CVE_STATUS[CVE-2023-45322] =3D "disputed: issue
> > requires memory allocation to fail
> > >=20
> > > =C2=A0BINCONFIG =3D "${bindir}/xml2-config"
> > >=20
> > > -PACKAGECONFIG ??=3D "python \
> > > -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}=
 \
> > > -"
> > > +PACKAGECONFIG ??=3D "python"
> > > =C2=A0PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--without-
> > python,python3"
> > > -PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> > >=20
> > > =C2=A0inherit autotools pkgconfig binconfig-disabled ptest
> > >=20
> >=20
> > This breaks lttng-tools unfortunately:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1449
> > (and more in that build)
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> OK, I'll check the lttng-tools tomorrow evening.
>=20
> Missing testdata.json is weird, I have run testimage with libxml2-
> ptest.
> But I can also try it with core-image-sato-sdk
>=20
> Regarding the send-error-reports, I'm not sure how to test that...

Those are consequences of the lttng-tools failures, that is the issue
we need to work out.

I've mentioned it on the lttng irc channel. I didn't see any patch in
their repo as of last night.

Cheers,

Richard

