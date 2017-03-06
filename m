Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3D477576
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:43:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Mar 2017 07:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="232842674"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga004.fm.intel.com with ESMTP; 06 Mar 2017 07:43:52 -0800
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Mon, 6 Mar 2017 15:43:35 +0000
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.112]) by
	IRSMSX156.ger.corp.intel.com ([169.254.3.104]) with mapi id
	14.03.0248.002; Mon, 6 Mar 2017 15:43:35 +0000
From: "John, Maxin" <maxin.john@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [morty][PATCH] busybox: refresh the flock patch
Thread-Index: AQHScN2y1hkGwtO1JUOMsZp6zA6Lf6GIPixA
Date: Mon, 6 Mar 2017 15:43:34 +0000
Message-ID: <61C0517EAD808B429A1DE2DD9164D40030F5F53B@IRSMSX101.ger.corp.intel.com>
References: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
In-Reply-To: <1484670034-4647-1-git-send-email-maxin.john@intel.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [morty][PATCH] busybox: refresh the flock patch
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
X-List-Received-Date: Mon, 06 Mar 2017 15:43:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

It looks like this fell through the cracks. Please consider this for morty.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Maxin B. John
Sent: Tuesday, January 17, 2017 6:21 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [morty][PATCH] busybox: refresh the flock patch

Upstream accepted the flock fix with some improvements. Backport those chan=
ges.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...e-the-behaviour-of-c-parameter-to-match-u.patch | 77 ++++++++++--------=
----
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behavi=
our-of-c-parameter-to-match-u.patch b/meta/recipes-core/busybox/busybox/000=
1-flock-update-the-behaviour-of-c-parameter-to-match-u.patch
index 8bcbd73..78520f0 100644
--- a/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-of-=
c-parameter-to-match-u.patch
+++ b/meta/recipes-core/busybox/busybox/0001-flock-update-the-behaviour-
+++ of-c-parameter-to-match-u.patch
@@ -1,35 +1,24 @@
-From 198f18addf1d814c2fefcb492f3b9fbd221669bb Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Wed, 20 Apr 2016 18:24:45 +0300
-Subject: [PATCH] flock: update the behaviour of -c parameter to match upst=
ream
-
-In upstream, -c 'PROG ARGS' means "run sh -c 'PROG ARGS'"
+From e1d426fd65c00a6d01a10d85edf8a294ae8a2d2b Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 24 Apr 2016 18:19:49 +0200
+Subject: [PATCH] flock: fix -c; improve error handling of fork+exec
=20
 function                                             old     new   delta
-flock_main                                           286     377     +91
-.rodata                                           155849  155890     +41
+flock_main                                           254     334     +80
=20
-Upstream-Status: Submitted
-[ http://lists.busybox.net/pipermail/busybox/2016-April/084142.html ]
+Upstream-Status: Backport
=20
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- util-linux/flock.c | 20 ++++++++++++++------
- 1 file changed, 14 insertions(+), 6 deletions(-)
+ util-linux/flock.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
=20
 diff --git a/util-linux/flock.c b/util-linux/flock.c -index 05a747f..c85a2=
5d 100644
+index 05a747f..539a835 100644
 --- a/util-linux/flock.c
 +++ b/util-linux/flock.c
-@@ -20,6 +20,7 @@ int flock_main(int argc, char **argv) MAIN_EXTERNALLY_VI=
SIBLE;
- int flock_main(int argc UNUSED_PARAM, char **argv)
- {
- 	int mode, opt, fd;
-+    char *cmd_args[4];
- 	enum {
- 		OPT_s =3D (1 << 0),
- 		OPT_x =3D (1 << 1),
-@@ -57,7 +58,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
+@@ -57,7 +57,6 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  	/* If it is "flock FILE -c PROG", then -c isn't caught by getopt32:
  	 * we use "+" in order to support "flock -opt FILE PROG -with-opts",
  	 * we need to remove -c by hand.
@@ -37,35 +26,37 @@ index 05a747f..c85a25d 100644
  	 */
  	if (argv[0]
  	 && argv[0][0] =3D=3D '-'
-@@ -65,7 +65,10 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
- 	    || (ENABLE_LONG_OPTS && strcmp(argv[0] + 1, "-command") =3D=3D 0)
+@@ -66,6 +65,9 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  	    )
  	) {
--		argv++;
-+        if (argc !=3D optind + 3)
-+            bb_error_msg_and_die("-c requires exactly one command argumen=
t");
-+        else
-+            argv++;
+ 		argv++;
++		if (argv[1])
++			bb_error_msg_and_die("-c takes only one argument");
++		opt |=3D OPT_c;
  	}
 =20
  	if (OPT_s =3D=3D LOCK_SH && OPT_x =3D=3D LOCK_EX && OPT_n =3D=3D LOCK_NB=
 && OPT_u =3D=3D LOCK_UN) { -@@ -89,9 +92,14 @@ int flock_main(int argc UNU=
SED_PARAM, char **argv)
- 			return EXIT_FAILURE;
+@@ -90,8 +92,21 @@ int flock_main(int argc UNUSED_PARAM, char **argv)
  		bb_perror_nomsg_and_die();
  	}
--
+=20
 -	if (argv[0])
--		return spawn_and_wait(argv);
--
-+    if (argv[0]) {
-+        cmd_args[0] =3D getenv("SHELL");
-+        if (!cmd_args[0])
-+            cmd_args[0] =3D (char*)DEFAULT_SHELL;
-+        cmd_args[1] =3D (char*)"-c";
-+        cmd_args[2] =3D argv[0];
-+        cmd_args[3] =3D NULL;
-+        return spawn_and_wait(cmd_args);
-+    }
++	if (argv[0]) {
++		if (!(opt & OPT_c)) {
++			int rc =3D spawn_and_wait(argv);
++			if (rc < 0)
++				bb_simple_perror_msg(argv[0]);
++			return rc;
++		}
++		/* -c 'PROG ARGS' means "run sh -c 'PROG ARGS'" */
++		argv -=3D 2;
++		argv[0] =3D (char*)get_shell_name();
++		argv[1] =3D (char*)"-c";
++		/* argv[2] =3D "PROG ARGS"; */
++		/* argv[3] =3D NULL; */
+ 		return spawn_and_wait(argv);
++	}
+=20
  	return EXIT_SUCCESS;
  }
 --
--
2.4.0

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

