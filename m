Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD698C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 21:55:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.34791.1745790859273825162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 14:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SgvMiSbI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so27845925e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 14:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745790857; x=1746395657; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3bXlzJDuhFmkfa55jdZ9srEE9BM92iIgK2JlAS858g=;
        b=SgvMiSbI8xdnoRDQDayOpoeeeevSGoV9c7C9Ph+i6o/E80vqV6RTnfz6du/DNms/EK
         w8ayNZI3UZU+AmgnvVmZD+CbikVbgnVgnbl9PD3tyHqpt+0nlTcSirdAqDxDJviXiZFL
         7dqgjQaD/wwdN0MJb1JzKGdgDlfWD6TFZyVPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745790857; x=1746395657;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l3bXlzJDuhFmkfa55jdZ9srEE9BM92iIgK2JlAS858g=;
        b=cgzCE/cd4GCyfh5jH4m5Fd3DV3oyVZqt1X1Ip8MKi4OZqeT4Kg+POwyDF+2W5Geo4j
         sUwiB68Zm7WoFmf4HHsfT11yXoFmlSkJsnkNDzhXPOstVnlLRpHa0vURsfSUNiBZjc5u
         smzNgOzoF+2OP3MUrPg6v5WBDDB0aW6feSSN6wzGtsp1jGEOqPRudjvGb3wEtjJ4Nh7E
         pRM3Sn6coz7XPvWiEuE61p5JexUDRUtUmxn0VWGxxYYgol2GOrpWXwNuUTTgWoCaL9ui
         TacapC0ZCkWq0VSSUXdBGTuwq7foUEAyFFUDuJPjisQxzw+jrQlw7dmWqjJYT8Sf+uC3
         J9CA==
X-Forwarded-Encrypted: i=1; AJvYcCU7PE3o1hTDklF784TGNKEZGE2KPxqKEMc5UHDHMN2QaJb+C9f9aYLJsQeOVREvqHVgMlS4ZhJtuvdYiJwTmNC+/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYC7dOgdqiXiZl2H1DeNp0mgOjxTeAlbB8bnBdj5PKFXYv8nhi
	H5EyVSmxHPnE/lGupKTEHjrdtPo3eWHW+oi/rE5bZTq7goW6/4jOM2KU872t6R8=
X-Gm-Gg: ASbGncsTHYIHKOWiLNePC9DX+PdovyRRc7EACKzAZvw0nV0xgc80Iu+RAWt21XQCxSo
	Gs+pINSASjSJEEURcr2b9TYS8SXwFMrvAcxyCGYuUnz/pk+SGUL0xfy8mEZNPsVWQMUen8PSxrL
	8/QL5DKh6Ykn8YlJe7IkB5nRyHD1YO19C3iSE2KJhLLSaoSWBDhogANOxNpgNBFsupv2qEk/Tug
	jOUxROkJVFJcnct03hkbH7wSNFhgSwlIscSutaSr1vDNCkLm3Jtxj5OQzdWg3ZH0lyatqWBdGDy
	wQB/lZx5yIttIWNe+iDELTvU/O6EJ3bn+f6RJxKOcngbZ5PzGoVLhoxuzEdTujl/+jg7Ce6rCAS
	zhQ76jZzKQb1ZJuiHTANT+arA1+onqQ==
X-Google-Smtp-Source: AGHT+IF4hmFWfka8cbQTlYb2JgpUatXaYY1Imp/moF/r0L1vTWwgdsOcKyG5/hyB9e7m4EY9IfccGQ==
X-Received: by 2002:a05:600c:5252:b0:43d:7413:cb3e with SMTP id 5b1f17b1804b1-440a65ba0femr66813355e9.1.1745790857052;
        Sun, 27 Apr 2025 14:54:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2c4e:c25e:67a4:8168? ([2001:8b0:aba:5f3c:2c4e:c25e:67a4:8168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f4e3sm102880055e9.36.2025.04.27.14.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 14:54:16 -0700 (PDT)
Message-ID: <c67aba6bda61ca5c852855d60d8c54b3369d48ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.13.6 -> 2.14.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Sun, 27 Apr 2025 22:54:15 +0100
In-Reply-To: <20250427141012.2442478-1-peter.marko@siemens.com>
References: <20250427141012.2442478-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 21:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215567

On Sun, 2025-04-27 at 16:10 +0200, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handle CVE-2025-32414 and CVE-2025-32415.
>=20
> * rebased install-tests.patch
> * removed testsuite testThreads (merged into runtest.c)
> =C2=A0 * https://gitlab.gnome.org/GNOME/libxml2/-/commit/481fd6bbee029e15=
a6a4015e5160a332d7c18cba
> * removed IPv6 option (as part of with ftp support removal)
> =C2=A0 * https://gitlab.gnome.org/GNOME/libxml2/-/commit/dba1ed85a320c368=
07ee09f44d09fd30852b9370
> * added testsuites testlimits testparser (already present before but not =
executed)
>=20
> License-Update: Mention contributors in Copyright
> https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0da=
ac3a189d2fec8f7
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/recipes-core/libxml/libxml2/install-tests.patch=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
> =C2=A0meta/recipes-core/libxml/libxml2/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0.../libxml/{libxml2_2.13.6.bb =3D> libxml2_2.14.2.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 9 +++------
> =C2=A03 files changed, 6 insertions(+), 9 deletions(-)
> =C2=A0rename meta/recipes-core/libxml/{libxml2_2.13.6.bb =3D> libxml2_2.1=
4.2.bb} (92%)
>=20
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
> index 1c8c13ab5c..789aeca119 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
> =C2=A0index 4cb9a5c..8adcd7e 100644
> =C2=A0--- a/Makefile.am
> =C2=A0+++ b/Makefile.am
> -@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> +@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> =C2=A0=C2=A0	testparser \
> =C2=A0=C2=A0	testrecurse
> =C2=A0=20
> @@ -29,6 +29,6 @@ index 4cb9a5c..8adcd7e 100644
> =C2=A0+	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
> =C2=A0+	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
> =C2=A0+
> - bin_PROGRAMS =3D xmllint xmlcatalog
> + bin_PROGRAMS =3D xmllint
> =C2=A0=20
> =C2=A0 bin_SCRIPTS =3D xml2-config
> diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-co=
re/libxml/libxml2/run-ptest
> index f252a78f17..cbbdd5592f 100755
> --- a/meta/recipes-core/libxml/libxml2/run-ptest
> +++ b/meta/recipes-core/libxml/libxml2/run-ptest
> @@ -5,7 +5,7 @@ set -e
> =C2=A0export LC_ALL=3Den_US.UTF-8
> =C2=A0
> =C2=A0# testModule isn't that useful and hard-codes buildtree, so we don'=
t run that
> -TESTS=3D"runtest runsuite testrecurse testchar testdict testThreads runx=
mlconf testapi"
> +TESTS=3D"runtest runsuite testrecurse testchar testdict runxmlconf testa=
pi testlimits testparser"
> =C2=A0
> =C2=A0for T in $TESTS; do
> =C2=A0=C2=A0=C2=A0=C2=A0 echo Running $T
> diff --git a/meta/recipes-core/libxml/libxml2_2.13.6.bb b/meta/recipes-co=
re/libxml/libxml2_2.14.2.bb
> similarity index 92%
> rename from meta/recipes-core/libxml/libxml2_2.13.6.bb
> rename to meta/recipes-core/libxml/libxml2_2.14.2.bb
> index 3b3ca87e96..ab06282f17 100644
> --- a/meta/recipes-core/libxml/libxml2_2.13.6.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.14.2.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
> =C2=A0BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlib=
xml2"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Df437ed9058e8e5135e47c01e973=
376ba=C2=A0\
> +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D5873615e8a9ecbf5c8857c4312e=
e05d6=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://dict.c;beginline=3D=
6;endline=3D15;md5=3D2b4b7b827d2d8b080372433c4c9c85b6=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://list.c;beginline=3D=
4;endline=3D13;md5=3Db9c25b021ccaf287e50060602d20f3a7=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> @@ -19,7 +19,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/install-tests.patch=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> -SRC_URI[archive.sha256sum] =3D "f453480307524968f7a04ec65e64f2a83a825973=
bcd260a2e7691be82ae70c96"
> +SRC_URI[archive.sha256sum] =3D "353f3c83535d4224a4e5f1e88c90b5d4563ea8fe=
c11f6407df640fd28fc8b8c6"
> =C2=A0SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8=
d83e69a2be4722379f08702ea7273"
> =C2=A0
> =C2=A0# Disputed as a security issue, but fixed in d39f780
> @@ -27,11 +27,8 @@ CVE_STATUS[CVE-2023-45322] =3D "disputed: issue requir=
es memory allocation to fail
> =C2=A0
> =C2=A0BINCONFIG =3D "${bindir}/xml2-config"
> =C2=A0
> -PACKAGECONFIG ??=3D "python \
> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
> -"
> +PACKAGECONFIG ??=3D "python"
> =C2=A0PACKAGECONFIG[python] =3D "--with-python=3D${PYTHON},--without-pyth=
on,python3"
> -PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> =C2=A0
> =C2=A0inherit autotools pkgconfig binconfig-disabled ptest
> =C2=A0

This breaks lttng-tools unfortunately:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1449
(and more in that build)

Cheers,

Richard

