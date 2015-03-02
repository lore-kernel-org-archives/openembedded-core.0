Return-Path: <peter.gejgus@kistler.com>
Received: from mx2.kistler.com (mx2.kistler.com [195.49.77.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1D36A7378D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:49:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,675,1418079600"; 
   d="scan'208";a="2438331"
Received: from unknown (HELO kihagsepp01.int.kistler.com) ([192.168.52.67])
	by mx2.kistler.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	02 Mar 2015 12:49:29 +0100
Received: from kihagsepp01.int.kistler.com (localhost [127.0.0.1])
	by kihagsepp01.int.kistler.com (Postfix) with SMTP id 8CF157
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 12:49:29 +0100 (CET)
Received: from mx1.kistler.com (unknown [192.168.52.57])
	by kihagsepp01.int.kistler.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 12:49:25 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.09,675,1418079600"; d="scan'208";a="14692723"
Received: from kihagwinex01.int.kistler.com ([192.168.100.23])
	by mx1.kistler.com with ESMTP/TLS/AES128-SHA; 02 Mar 2015 12:49:25 +0100
Received: from kihagwinex02.int.kistler.com ([fe80::10cf:df86:bb65:2502]) by
	kihagwinex01.int.kistler.com ([fe80::d70:7df0:c903:4e43%16]) with mapi
	id 14.03.0224.002; Mon, 2 Mar 2015 12:49:17 +0100
From: Peter Gejgus <Peter.Gejgus@kistler.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Bitbake class - how to escape special characters?
Thread-Index: AdBU3ukJunOgFR2FRX6V67aWmYG8Yg==
Date: Mon, 2 Mar 2015 11:49:16 +0000
Message-ID: <672D6A2F0F2E8A43891580C45CE5D2E6013E3418@kihagwinex02.int.kistler.com>
Accept-Language: en-US, de-CH
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.116]
MIME-Version: 1.0
Subject: Bitbake class - how to escape special characters?
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
X-List-Received-Date: Mon, 02 Mar 2015 11:49:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

This is the excerpt of my bitbake class:

data_migration_common() {
	if [ x"$D" =3D "x" ]; then
		if [[ ! ${CURRENT_DATA_VERSION} =3D~ ^[0-9]?[0-9].[0-9]?[0-9]$ ]]; then
			error-exit "Version information was provided in invalid format!"
		fi
	...
	fi
}

python populate_packages_append() {
    data_migration_pkgs =3D d.getVar('DATA_MIGRATION_PACKAGES', True).split=
()

    for pkg in data_migration_pkgs:
        bb.note("adding data migration postinst scripts to %s" % pkg)
        postinst =3D d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('p=
kg_postinst', True)
        if not postinst:
            postinst =3D '#!/bin/sh\n'
        postinst +=3D d.getVar('data_migration_common', True)
        d.setVar('pkg_postinst_%s' % pkg, postinst)
}

This class generates post-install scriptlet for the packages inheriting fro=
m this bitbake class.

But bitbake is unable to parse the code in the data_migration_common functi=
on and claiming:
ERROR: ExpansionError during parsing .../xyz_0.1.0.bb: Failure expanding va=
riable data_migration_common: ShellSyntaxError: Invalid token "%s"

This problem is because the regular expression in the function data_migrati=
on_common contains character '$'. Bitbake succeeds when I remove character =
'$' from this regular expression. Is there some way to escape this '$' char=
acter? Because I need '$' in my regex.

Best Regards,
Peter


