Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89971E77188
	for <webhook@archiver.kernel.org>; Fri, 10 Jan 2025 09:15:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.14628.1736500502782866859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jan 2025 01:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Sq1zwp81;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f664af5so21207815e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 01:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736500501; x=1737105301; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us35UuBcIKMTEBa9aeRvDVgE8c91FQrMAv4OPG5vP/c=;
        b=Sq1zwp81SD/MwirBhNB6ERhtfEjgydPtiA6Jj8idOKfiR6XQkvE6/SsWCQzvSL9CrR
         TCD3pIiJc6Bp7TcgyLcXWa5oYtha9+q1E44ACsW+XrmZW2TU2o6V8C1cSjQvm5UXhNrK
         dX+e1zcGag41T+8/tWLwAq0vQoBcloSk/OrKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736500501; x=1737105301;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Us35UuBcIKMTEBa9aeRvDVgE8c91FQrMAv4OPG5vP/c=;
        b=fhppR8X3IkEGg+kzzSXImQVt8ovxVWMdjNDjd+ixKCDlU5Gf6rI5Vte18e0dGOP9+Y
         wyuP1LTur7dQyqColqnk1VMmfKphOQK97uVitnGJQtB+xHXPHwvcqV7eAOs0Df4FwIYb
         V7DiA2tU53UNVIEpILYslvO0XDk9VhSP5yzDKaFGZ0Powpmlg7DKhasehs/pyc+LW+x+
         gyNJhwIpJTajWDXicwUVrKAwrriMiEc4F+Hrd/vBl8HV5P/0FetgLLOkLqJu7SfW5bnt
         Y0X7e4Va4EX98N2BGj6CNtHv0J07IMwb8aV+0h5DidfYjVK56noyzsavqLAYv+wyb0Ns
         bTlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSln0sEcgn4ndxw6qtJqCn9DBIxZmwkHWTRnZmLTVhwheEKmPo8IcIZ/nTTBpJJ5HDMJCnPPcYh+gy/3jc+7f+AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+c3lqoSByrhz8PzRYz4eluqJne4hs4j/dXzbwLpThePimUHvz
	Cbq1U7IqdIzMZie3uOGlToei/zIQGDthkttr5Ur776zvrIpAWOxQ8+aWCReJA3iOMWLm2V76vMb
	pFA8=
X-Gm-Gg: ASbGncsTKzzzifaKD6+HCmuWuhoyKvALAAu/ley0OdOk176oWOqt4n8yB7MVQirbl9R
	P8adyke3QX4VmCkYvRKmZbt2q2z/wTOxLWYiLTze6oYXxESZISQ83IEzBtT5BS/5JC+iOYB+3gi
	3ZN6mPRxHZGuojhWXx140P7FqSs0YwmFZ5d1WAbLvsvq3wV8NTJl0kqXIFxw3yoXK51voYu9ds1
	YELkoiTPBM9P5FLRQqMQVXZVPp/TafyVAXtuutGP9A/BsStZfckF9pkQU/c4UV/y8OVG449rorZ
	2tJdKyxFYX7mXJiIsrcP1RTyshdte0IxO6iZakQ3e0z6+A==
X-Google-Smtp-Source: AGHT+IFKcTN0DogB38H5/Ip6H3cYGxcRX1aEjjzNsBehrJJ4h+KIKWJBxYECvGpmiLoLhHVOA+9aTw==
X-Received: by 2002:a05:600c:1d0c:b0:434:ff25:19a0 with SMTP id 5b1f17b1804b1-436e2706f7emr79470645e9.21.1736500500665;
        Fri, 10 Jan 2025 01:15:00 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d? ([2001:8b0:aba:5f3c:d75e:67c5:40ee:6f3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm79634075e9.16.2025.01.10.01.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:14:59 -0800 (PST)
Message-ID: <a37f0dca03bc4b493cb5b463704b1b35783baf09.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCHv2] classes/ptest-python-pytest: simplify python
 ptest file overriding
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: derek@asterius.io, openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2025 09:14:58 +0000
In-Reply-To: <20250108183810.3413047-1-derek@asterius.io>
References: <20250108183810.3413047-1-derek@asterius.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jan 2025 09:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209636

On Wed, 2025-01-08 at 18:38 +0000, Derek Straka via lists.openembedded.org =
wrote:
> The complexity of overriding files from the bbclass made the behavior at
> times hard to follow and predict. This change replaces the default file w=
ith a
> heredoc equivalent that creates a default file if the user does not provi=
de their
> own version of run-ptest in the SRC_URI.
>=20
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> =C2=A0.../ptest-python-pytest.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 ++++++++++++-------
> =C2=A0meta/files/ptest-python-pytest/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 3 ---
> =C2=A02 files changed, 14 insertions(+), 11 deletions(-)
> =C2=A0delete mode 100755 meta/files/ptest-python-pytest/run-ptest
>=20
> diff --git a/meta/classes-recipe/ptest-python-pytest.bbclass b/meta/class=
es-recipe/ptest-python-pytest.bbclass
> index 801079e6ab..398a238300 100644
> --- a/meta/classes-recipe/ptest-python-pytest.bbclass
> +++ b/meta/classes-recipe/ptest-python-pytest.bbclass
> @@ -6,19 +6,25 @@
> =C2=A0
> =C2=A0inherit ptest
> =C2=A0
> -FILESEXTRAPATHS:prepend :=3D "${COREBASE}/meta/files:"
> -
> -SRC_URI:append =3D "\
> -=C2=A0=C2=A0=C2=A0 file://ptest-python-pytest/run-ptest=C2=A0\
> -"
> -
> =C2=A0# Overridable configuration for the directory within the source tre=
e
> =C2=A0# containing the pytest files
> =C2=A0PTEST_PYTEST_DIR ?=3D "tests"
> =C2=A0
> =C2=A0do_install_ptest() {
> -	if [ ! -f ${D}${PTEST_PATH}/run-ptest ]; then
> -		install -m 0755 ${UNPACKDIR}/ptest-python-pytest/run-ptest ${D}${PTEST=
_PATH}
> +=C2=A0=C2=A0=C2=A0 # Check if the recipe provides its own version of run=
-ptest
> +=C2=A0=C2=A0=C2=A0 # If nothing exists in the SRC_URI, dynamically creat=
e a=20
> +=C2=A0=C2=A0=C2=A0 # run-test script of "last resort" that has the defau=
lt
> +=C2=A0=C2=A0=C2=A0 # pytest behavior.
> +=C2=A0=C2=A0=C2=A0 #=20
> +=C2=A0=C2=A0=C2=A0 # Users can override this behavior by simply includin=
g a
> +=C2=A0=C2=A0=C2=A0 # custom script (run-ptest) in the source file list
> +	if [ ! -f "${UNPACKDIR}${PTEST_PATH}/run-ptest" ]; then
> +		cat > ${D}${PTEST_PATH}/run-ptest << EOF
> +#!/bin/sh
> +pytest --automake
> +EOF
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Ensure the newly created sc=
ript has the execute bit set
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod 755 ${D}${PTEST_PATH}/r=
un-ptest
> =C2=A0	fi

Thanks for the new version of the patch, I think this is a good change.

I did have to tweak the whitespace in the patch above, we use tabs to
indent shell and this function was mismatching with the rest of the
existing function.

> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -d "${S}/${PTEST_PYTEST_DIR}" ]; then
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${PTEST_P=
ATH}/${PTEST_PYTEST_DIR}


Secondly, there were ptest failures with this patch:

https://valkyrie.yoctoproject.org/#/builders/61/builds/713/steps/12/logs/st=
dio
https://valkyrie.yoctoproject.org/#/builders/73/builds/716/steps/12/logs/st=
dio

https://valkyrie.yocto.io/pub/non-release/20250109-78/testresults/qemuarm64=
-ptest/python3-pefile.log
https://valkyrie.yocto.io/pub/non-release/20250109-78/testresults/qemuarm64=
-ptest/python3-libarchive-c.log

Cheers,

Richard



