Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRU00-0002gK-At
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 20:49:04 +0200
Received: by wwi18 with SMTP id 18so2757679wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 11:45:54 -0700 (PDT)
Received: by 10.216.68.9 with SMTP id k9mr3875158wed.65.1306867553360;
	Tue, 31 May 2011 11:45:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm228327wbb.51.2011.05.31.11.45.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 11:45:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1306865217.git.scott.a.garman@intel.com>
Date: Tue, 31 May 2011 20:45:47 +0200
Message-Id: <79A1BC44-8268-4177-BBC5-4A5B08BDC8B7@dominion.thruhere.net>
References: <cover.1306865217.git.scott.a.garman@intel.com>
To: Scott Garman <scott.a.garman@intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: "poky@yoctoproject.org Project" <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] [PATCH 0/7] User/group creation at preinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 May 2011 18:49:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Shouldn't patches like this be sent to the oe-core list? It wouldn't =
have saved me from the selinux bug in shadow, though :)

Op 31 mei 2011, om 20:13 heeft Scott Garman het volgende geschreven:

> Hi Saul,
>=20
> This pull request includes everything needed to add the ability to
> create custom users and groups in our images/packages and the
> corresponding ability to set custom ownership permissions.=20
>=20
> There is a useradd-example.bb file in meta-skeleton which provides
> a heavily-commented example recipe to demonstrate how this feature
> can be used.
>=20
> I'd like to request that Mark Hatle and Richard do a code review of
> this and offer their Acked-by: support if they are happy with things.
>=20
> Once this gets into master, I'm happy to write up a short section for
> the Poky Reference Manual to document it in a more visible way.
>=20
> Scott
>=20
> The following changes since commit =
1169f1b066d0028bd2ef7915440450bd42ef165e:
>=20
>  license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)
>=20
> are available in the git repository at:
>  git://git.pokylinux.org/poky-contrib sgarman/user-group-creation
>  =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dsgarman/user-group=
-creation
>=20
> Scott Garman (7):
>  shadow: recipe and patch cleanup
>  shadow: add a -native recipe with customized utilities
>  base-passwd: add -cross recipe with default login.defs
>  useradd.bbclass: new class for managing user/group permissions
>  useradd-example: example recipe for using inherit useradd
>  bitbake.conf: set PSEUDO_PASSWD within FAKEROOTENV
>  package_rpm.bbclass: make RPM use on-disk permissions
>=20
> .../recipes-skeleton/useradd/useradd-example.bb    |   59 +
> meta/classes/package_rpm.bbclass                   |    2 +
> meta/classes/useradd.bbclass                       |  136 ++
> meta/conf/bitbake.conf                             |    2 +-
> .../base-passwd/base-passwd-3.5.22/login.defs      |  386 ++++++
> .../base-passwd/base-passwd-cross_3.5.22.bb        |   53 +
> .../shadow/files/add_root_cmd_options.patch        | 1293 =
++++++++++++++++++++
> .../files/shadow-4.1.3-dots-in-usernames.patch     |    4 +
> .../shadow-4.1.4.2-env-reset-keep-locale.patch     |    4 +
> .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |    4 +
> .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |    4 +
> .../shadow/files/shadow.automake-1.11.patch        |    4 +
> .../shadow/shadow-native_4.1.4.3.bb                |   66 +
> meta/recipes-extended/shadow/shadow.inc            |  121 --
> meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  141 ++-
> 15 files changed, 2148 insertions(+), 131 deletions(-)
> create mode 100644 =
meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
> create mode 100644 =
meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
> create mode 100644 =
meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
> create mode 100644 =
meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
> create mode 100644 =
meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
> create mode 100644 meta/classes/useradd.bbclass
> create mode 100644 =
meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
> create mode 100644 =
meta/recipes-core/base-passwd/base-passwd-cross_3.5.22.bb
> create mode 100644 =
meta/recipes-extended/shadow/files/add_root_cmd_options.patch
> create mode 100644 =
meta/recipes-extended/shadow/shadow-native_4.1.4.3.bb
> delete mode 100644 meta/recipes-extended/shadow/shadow.inc
>=20
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky



