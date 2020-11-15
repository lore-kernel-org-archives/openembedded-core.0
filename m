Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
 by mx.groups.io with SMTP id smtpd.web10.16952.1605424799796329622
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2020 23:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pm.me header.s=protonmail header.b=a63FFi/B;
 spf=pass (domain: pm.me, ip: 185.70.40.131, mailfrom: jc.begue@pm.me)
Date: Sun, 15 Nov 2020 07:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
	t=1605424797; bh=Y29jK3pOKGY7mz7wwnlmoVD+OamGRp29OW3agRNPcn4=;
	h=Date:To:From:Reply-To:Subject:From;
	b=a63FFi/BvhF6ayrkMiHdcbQStCur56tAVmIOORmKjJf0G0cJ3ESgFrXxjhGRy50db
	 /tbMitNQ0jyKOT4DiBgzFesPaCF1xGNFYPmmkZn/UFIH17rMlX20p2nPO3nInSdB76
	 7js0yUdKJe0+HihrI1lbTa4QWkLxSycvlD9L4qLtBxowlu7T42p9eBCzdk81J9+hcj
	 wUmU5LDIpTDY4+e92I3TO0Ed1Fc1qE24306smJDFtNqzuOrkQm+FD2WM8PpuuGjSbn
	 H41xyUnBNdSCpsFwNVRPqcxdtzjM2+aJxEQyGTTotswikn4gt3EKXEvTR+qMr6RlBJ
	 BedT6E12aKZ6A==
To: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
From: jc.begue@pm.me
Reply-To: Jean-Christophe BEGUE <jc.begue@pm.me>
Subject: Using OE's native bzip2
Message-ID: <N8dTusv8HRYbXICsENrr0Xs8dy2xw-8TOU515yBu6Jg1TzOcH3ccglVEvtqNUlRIW-bOM29tttjs6vI6lcldLoX6bmYsRbDBaJAWqY8RTIY=@pm.me>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
	mailout.protonmail.ch
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello everyone,

I'm trying to build a native bzip2 version because my system's one isn't co=
mpatible with some archives.

To achieve that, I remove bzip2-native from ASSUME_PROVIDED:

ASSUME_PROVIDED_remove =3D "bzip2-native"

But then I get lots of circular dependencies, running bitbake bzip2-native:

[...]
Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool-nati=
ve_2.4.6.bb:do_compile (dependent Tasks ['libtool-native_2.4.6.bb:do_config=
ure'])
  Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool-na=
tive_2.4.6.bb:do_install (dependent Tasks ['libtool-native_2.4.6.bb:do_comp=
ile'])
  Task /home/jc/code/yocto/oe-core/meta/recipes-devtools/libtool/libtool-na=
tive_2.4.6.bb:do_populate_sysroot (dependent Tasks ['libtool-native_2.4.6.b=
b:do_install'])
  Task virtual:native:/home/jc/code/yocto/oe-core/meta/recipes-extended/bzi=
p2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot (dependent Tasks ['automake_1.1=
6.2.bb:do_populate_sysroot', 'gnu-config_git.bb:do_populate_sysroot', 'bzip=
2_1.0.8.bb:do_fetch', 'libtool-native_2.4.6.bb:do_populate_sysroot', 'autoc=
onf_2.69.bb:do_populate_sysroot'])
  Task virtual:native:/home/jc/code/yocto/oe-core/meta/recipes-extended/bzi=
p2/bzip2_1.0.8.bb:do_configure (dependent Tasks ['bzip2_1.0.8.bb:do_prepare=
_recipe_sysroot', 'bzip2_1.0.8.bb:do_patch'])
[...]

Is there a hope I could achieve this or should I look for another solution =
?

Jean-Christophe BEGUE


