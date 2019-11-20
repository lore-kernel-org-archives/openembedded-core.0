Return-Path: <prvs=220ad4c69=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id 11D876D6F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 21:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1574285995; x=1605821995;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=RnIXttqedIVEsy9ftH1cIqyyoDT3ceDglRnuhuyggOI=;
	b=jHapHgLgqW73mcNyEnhRj//HaRCAIwpjhhA/zVi7OKvng05TaPoAV+uD
	rKgPW72mZjb3ezmd7awIl9jHuKy8GjjJW9j5f/MvPNsdOHAlSP0xH/Lxk
	2QbGSwQZUpMvF8FPgQM1I8LnxzagnzB2ucf5Cef10HhwTJE90lDSD46Sz 8=;
IronPort-SDR: /5lvbor2Gd+JMFaFlEV9cMMy6HkQnNCLuaF+kbByP4adRDkQEcJOy6E5du6AFCiatIoDqcghlE
	KxevdNHapBWzbutNc/tAKBhsHw0jticAd9fenO8Cr+n0fHi29I7KH6aFwvI26MYwAvqB2p//Hc
	jTrlSCHayAAWa83kA8YzVFT7Z/rslWNcXc5JEpBOB8c/ZV6Mnufm7Rc++JQ/5sKKC9/2C76Jog
	uMx2BorFbAm0xp10j3prA8S9LWiU4IvwN5RHBawpFbAOnLfP4VkSzRhKQIGX8JAYDxuqpgJMjI
	8jk=
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 20 Nov 2019 22:39:53 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw6.muc with ESMTP/TLS;
	20 Nov 2019 22:39:52 +0100
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb2.muc with ESMTP/TLS; 20 Nov 2019 22:39:52 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Wed, 20 Nov 2019 22:39:52 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Wed, 20 Nov 2019 22:39:51 +0100
From: <Mikko.Rapeli@bmw.de>
To: <ryan.harkin@linaro.org>
Thread-Topic: [OE-core] How to backport openssl to Sumo
Thread-Index: AQHVn87w8ZAVFbXnIEGLd+JWxeWsfaeUhbKA
Date: Wed, 20 Nov 2019 21:39:51 +0000
Message-ID: <20191120213951.GA3527@hiutale>
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
In-Reply-To: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 21:39:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6E9D539C4599C4D94697F2F4E57C9FC@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2019 at 06:18:05PM +0000, Ryan Harkin wrote:
> I'm struggling with backporting OpenSSL to my Sumo build [1], so wondered
> if anyone else had done something similar with success.

I've done it by backporting following changes to poky (sorry for subject on=
ly):

openssh: upgrade 7.6p1 -> 7.7p1
openssh: drop sshd support for DSA host keys
openssh: stop adding -D__FILE_OFFSET_BITS=3D64 to CFLAGS
openssh: drop RCONFLICTS for openssh-keygen
openssh: minor indent cleanup for sshd init script
openssh: sync local ssh_config + sshd_config files with upstream 7.7p1
openssh: only create sshd host keys which have been enabled
openssh: update from 7.7p1 to 7.8p1
openssh: upgrade 7.8p1 -> 7.8p1+git to support openssl 1.1.x
openssl-1.1: rework packaging
openssl-1.1: /etc/ssl location compatibility
openssl: minor reformatting to align the 1.0 and 1.1 recipes
openssl: move the libdir openssl.cnf symlink into the openssl package
openssl: fix path in nativesdk environment-setup script
openssl: drop obsolete no-afalgeng workaround for aarch64
openssl: fix hardcoded paths in native for openssl 1.1
openssl: remove dependency on relative_symlinks class
openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the defau=
lt version
openssl: update to 1.1.1
openssl: do not tweak so names, use PRIVATE_LIBS instead
openssl: Handle -conf package file conflicts
openssl: rename PV to 1.1.1~pre9 to avoid future versions from going backwa=
rds
openssl_1.1.1: Fix Musl build by disabling async during configure
openssl: update to 1.1.1 final
openssl10: fix compile error for debian-mips64
openssl: skip ptest case `test_symbol_presence'
openssl: use deterministic perl Text::Template module bundled by openssl so=
urce
openssl: correct license comment
openssl: fix ptest
openssl: do an out-of-tree build
openssl: fix CVE-2018-0734 for both 1.0.2p and 1.1.1
openssl: fix CVE-2018-0735 for 1.1.1
openssl-1.1.1: remove build path from version info
openssl: update to 1.1.1a
openssl: correct bad path on package preprocess
python3{,-native}: backport openssl 1.1.1 compatibility changes
python3: fix openssl 1.1.1 changes
cryptodev-tests: port to openssl 1.1

Plus a patch to allow overriding openssl version in default-versions.inc,
and one hack to drop perl RDEPENDS from openssl-bin. This is still missing
the latest CVEs and letter releases.

Then meta-openembedded needed at least:

asio: Upgrade to 1.12.1
mailx: support openssl 1.1.x
cyrus-sasl: add UPSTREAM_CHECK_REGEX
cyrus-sasl: CLEANBROKEN =3D "1"
cyrus-sasl: Update to 2.1.27-rc7
cyrus-sasl: do not set CLEANBROKEN
cyrus-sasl: fix build out of source tree failed while configuring with `--e=
nable-ldapdb'
cyrus-sasl: fix parallel build issue

I could submit these too if someone wants to setup a communit maintenance b=
ranch for sumo.

Cheers,

-Mikko=

