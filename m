Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C17416E898
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 00:45:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 16:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,835,1384329600"; d="scan'208";a="482527295"
Received: from dvhart-mac01.jf.intel.com (HELO [10.24.159.36]) ([10.24.159.36])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2014 16:45:04 -0800
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Wed, 12 Feb 2014 16:45:24 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: =?ISO-8859-1?B?Sm/jbw==?= Henrique Ferreira de Freitas <joaohf@gmail.com>, 
	<openembedded-core@lists.openembedded.org>
Message-ID: <CF2152C5.6CB8D%dvhart@linux.intel.com>
Thread-Topic: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
In-Reply-To: <1392250819-10123-3-git-send-email-joaohf@gmail.com>
Mime-version: 1.0
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Thu, 13 Feb 2014 00:45:05 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

On 2/12/14, 16:20, "Jo=E3o Henrique Ferreira de Freitas" <joaohf@gmail.com>
wrote:

>fragmentconfig() is a new task that makes a diff between the
>old and new config files and writes to the fragment.cfg result file.
>menuconfig() always copy the original config file, so the user
>doesn't need to copy it.

Hi Jo=E3o,

Generally looks pretty good. Some comments below, mostly about usability
and robustness.

I do have reservations about the task name, partly because it's long and
hard to type.... I'm not coming up with something I like a lot better
though.... Maybe....

$ bitbake linux-yocto -c diffcfg

Or

$ bitbake linux-yocto -c diffconfig

I like the latter because it is consistent in naming, <action>config, with
menuconfig.

>
>Signed-off-by: Jo=E3o Henrique Ferreira de Freitas <joaohf@gmail.com>
>---
> meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
> 1 file changed, 35 insertions(+)
>
>diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
>index e292ecb..2053361 100644
>--- a/meta/classes/cml1.bbclass
>+++ b/meta/classes/cml1.bbclass
>@@ -16,8 +16,12 @@ HOST_LOADLIBES =3D "-lncurses"
> TERMINFO =3D "${STAGING_DATADIR_NATIVE}/terminfo"
>=20
> python do_menuconfig() {
>+    import os
>+    import shutil
>+
>     try:
>         mtime =3D os.path.getmtime(".config")
>+        shutil.copy(".config", ".config.orig")
>     except OSError:
>         mtime =3D 0
>=20
>@@ -38,3 +42,34 @@ do_menuconfig[depends] +=3D
>"ncurses-native:do_populate_sysroot"
> do_menuconfig[nostamp] =3D "1"
> addtask menuconfig after do_configure
>=20
>+python do_fragmentconfig() {
>+    import shutil
>+    import subprocess
>+
>+    workdir =3D d.getVar('WORKDIR', True)
>+    fragment =3D workdir + '/fragment.cfg'
>+    configorig =3D '.config.orig'
>+    config =3D '.config'
>+
>+    try:
>+        md5newconfig =3D bb.utils.md5_file(configorig)
>+        md5config =3D bb.utils.md5_file(config)
>+        isdiff =3D md5newconfig !=3D md5config
>+    except OSError:

We should be doing something to indicate failure here.

>+        isdiff =3D 0
>+
>+    if isdiff:
>+        bb.note("Dumping config fragment into: '%s'." % fragment)
>+        bb.note("new '%s' old '%s'" % (md5newconfig,md5config))

Nit, add space after ","

>+
>+        statement =3D 'diff -Nurp ' + configorig + ' ' + config + '| sed
>-n "s/^\+//p" >' + fragment
>+        subprocess.call(statement, shell=3DTrue)
>+
>+        shutil.copy(configorig, config)

We should be printing something to make it easy for the user to find the
fragment.

>+    else:
>+        if os.path.exists(fragment):
>+            os.unlink(fragment)
>+}
>+
>+do_fragmentconfig[nostamp] =3D "1"
>+addtask fragmentconfig
>--=20
>1.8.3.2
>
>


--=20
Darren Hart
Yocto Project - Linux Kernel
Intel Open Source Technology Center





