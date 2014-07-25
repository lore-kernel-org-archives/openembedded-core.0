Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id AF90A70675
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:56:37 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so4104757wes.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=wWrAXZn6ngozC6ogMqdjlIwER+G1k2GVoasjT4kjTvk=;
	b=Vejdd0cEcaC1TW/psbfroCvFL7hF0eP6+ur3oW+jHBNatDn/BvLF9asTeg8NN5Gje8
	OUcE4jNuCO1YnKh/tcFwyfxWFor9zYJOJeK9bYWvLFJr4HbgdWWmhh2LHFLwhONulMHD
	ntYLv6cDKeUOrmGodLRmhUCuxJEUZHKDtYJZVGwYg/3NCtGlvU7qDxN2CSSrglSHxqJY
	NQhH/5qvBWL56m3TIyvX4GEBm20tGRNkuDQvPt+CmaidBOqwYYShuopVqzL8i+rpgvYI
	u5jhqpR8H2iHc59JdTGAG1JAC5ps1HjFvWnwWiUyNSHnh0sAgm7IFOgfZy8GjvMUcnIk
	UxRA==
X-Gm-Message-State: ALoCoQke2oWvBaFxOHSsTx08tQQEBR7bwTdArsAcuLJM57p17aHuRTmICacISrvBXOk4XsOW2Ix1
X-Received: by 10.180.101.98 with SMTP id ff2mr4086279wib.13.1406285798385;
	Fri, 25 Jul 2014 03:56:38 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6c83:8eb5:d127:d6a8?
	([2001:610:612:0:6c83:8eb5:d127:d6a8])
	by mx.google.com with ESMTPSA id lg7sm8808781wjb.9.2014.07.25.03.56.37
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 03:56:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <f11514aea79be9f009030d3acb5964de15a26223.1406279934.git.Qi.Chen@windriver.com>
Date: Fri, 25 Jul 2014 12:56:35 +0200
Message-Id: <33866F61-B200-4CA4-AC52-69BD3EB109A1@dominion.thruhere.net>
References: <cover.1406279934.git.Qi.Chen@windriver.com>
	<f11514aea79be9f009030d3acb5964de15a26223.1406279934.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: upgrade to 215
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jul 2014 10:56:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2014, om 11:20 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:

> Upgrade systemd from 213 to 215.
>=20
> systemd-older-kernel.patch is removed as it's fixed in 215.

NAK! This will drop libraries and and leave files unpackages, you need =
something like this:

@@ -146,7 +146,9 @@ do_install_ptest () {
=20
 python populate_packages_prepend (){
     systemdlibdir =3D d.getVar("rootlibdir", True)
+    prefixlibdir =3D d.getVar("libdir", True)
     do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', =
'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
+    do_split_packages(d, prefixlibdir, '^lib(.*)\.so\.*', 'lib%s', =
'Systemd %s library', extra_depends=3D'', allow_links=3DTrue)
 }
 PACKAGES_DYNAMIC +=3D "^lib(udev|gudev|systemd).*"
=20
@@ -198,7 +200,10 @@ RRECOMMENDS_${PN}-vconsole-setup =3D "kbd =
kbd-consolefonts"
 CONFFILES_${PN} =3D "${sysconfdir}/systemd/journald.conf \
                 ${sysconfdir}/systemd/logind.conf \
                 ${sysconfdir}/systemd/system.conf \
-                ${sysconfdir}/systemd/user.conf"
+                ${sysconfdir}/systemd/user.conf \
+                ${libdir}/sysusers.d/systemd.conf \
+                ${libdir}/sysusers.d/basic.conf \
+                "
=20
 FILES_${PN} =3D " ${base_bindir}/* \
                 ${datadir}/bash-completion \
@@ -218,7 +223,8 @@ FILES_${PN} =3D " ${base_bindir}/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-                ${libdir}/libnss_myhostname.so.2 \
+                ${libdir}/libnss_*.so.* \
+                ${libdir}/sysusers.d \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \


lib*udev have moved, 2 nss plugins were added and the sysusers files =
should be added to CONFFILES.=20=

