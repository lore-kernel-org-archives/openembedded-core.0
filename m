Received: from fortimail.saucontech.com (fortimail.saucontech.com [72.2.176.80])
 by mx.groups.io with SMTP id smtpd.web10.1109.1594746550682744495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 10:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: saucontech.com, ip: 72.2.176.80, mailfrom: mdeneen@saucontech.com)
Received: from email.saucontech.com ([10.20.20.47])
	by fortimail.saucontech.com  with ESMTP id 06EH99WL030929-06EH99WN030929
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 13:09:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by email.saucontech.com (Postfix) with ESMTP id 7C38A4083C9
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2020 13:09:09 -0400 (EDT)
Received: from email.saucontech.com ([127.0.0.1])
	by localhost (email.saucontech.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rhnczxP6fKP7; Tue, 14 Jul 2020 13:09:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by email.saucontech.com (Postfix) with ESMTP id 6D78E40836F;
	Tue, 14 Jul 2020 13:09:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at email.saucontech.com
Received: from email.saucontech.com ([127.0.0.1])
	by localhost (email.saucontech.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id FJdInyRsXTMC; Tue, 14 Jul 2020 13:09:08 -0400 (EDT)
Received: from mdeneen.saucon.int (unknown [10.5.1.150])
	by email.saucontech.com (Postfix) with ESMTPSA id 4243040493C;
	Tue, 14 Jul 2020 13:09:08 -0400 (EDT)
From: "Mark Deneen" <mdeneen@saucontech.com>
To: openembedded-core@lists.openembedded.org
Cc: Mark Deneen <mdeneen@saucontech.com>
Subject: [PATCH v3] ppp: Allow arbitrary interface names to be specified in pppd config
Date: Tue, 14 Jul 2020 13:08:34 -0400
Message-Id: <20200714170833.2096002-1-mdeneen@saucontech.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

pppd is patched in most Linux distributions to allow arbitrary naming
of ppp interfaces, allowing users to create consistent firewall rules
rather than having interfaces named "ppp0", "ppp1", etc.  Yocto is
missing this option.

This patch, originally from SUSE, adds this option to pppd. It is not
included upstream because there are some pppd-supported platforms which
lack the ability to rename interfaces.

This is the same as the previous patch, but I messed up the subject line.

Upstream-Status: Inappropriate [not all platforms supported by pppd can r=
ename interfaces]

Signed-off-by: Mark Deneen <mdeneen@saucontech.com>
---
 .../ppp/ppp/0002-pppd-add-ifname-option.patch | 214 ++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.8.bb    |   1 +
 2 files changed, 215 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifnam=
e-option.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-optio=
n.patch b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.p=
atch
new file mode 100644
index 0000000000..8e54024d15
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0002-pppd-add-ifname-option.patch
@@ -0,0 +1,214 @@
+From bbcdc4366bbee6c3f4e1ddda31e4eec8c1b3ccc2 Mon Sep 17 00:00:00 2001
+From: Paul Mackerras <paulus@samba.org>
+Date: Tue, 23 Aug 2016 16:10:21 +1000
+Subject: [PATCH 13/16] pppd: allow use of arbitrary interface names
+
+This is a modified version of a patch from openSUSE that enables PPP int=
erfaces
+to be called arbitrary names, rather than simply pppX where X is the uni=
t
+number.
+
+The modifications from the stock openSUSE patch are:
+- refresh patch on top of 018_ip-up_option.diff
+- fix a printf format-string vulnerability in pppd/main.c:set_ifunit()
+- clarify the pppd.8 manpage additions
+- patch pppstats/pppstats.c to query renamed interfaces without complain=
t
+
+Origin: SUSE
+Bug-Debian: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D458646
+Forwarded: no
+Reviewed-by: Chris Boot <bootc@debian.org>
+Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
+---
+ pppd/main.c         | 16 ++++++----------
+ pppd/options.c      |  5 +++++
+ pppd/pppd.8         |  8 +++++++-
+ pppd/pppd.h         | 11 +++++++++++
+ pppd/sys-linux.c    | 15 +++++++++++++++
+ pppstats/pppstats.c | 12 ++++++------
+ 6 files changed, 50 insertions(+), 17 deletions(-)
+
+diff --git a/pppd/main.c b/pppd/main.c
+index 6d50d1bac1d9..f1986ed68d0b 100644
+--- a/pppd/main.c
++++ b/pppd/main.c
+@@ -124,7 +124,7 @@
+ static const char rcsid[] =3D RCSID;
+=20
+ /* interface vars */
+-char ifname[32];		/* Interface name */
++char ifname[MAXIFNAMELEN];	/* Interface name */
+ int ifunit;			/* Interface unit number */
+=20
+ struct channel *the_channel;
+@@ -298,13 +298,6 @@ struct protent *protocols[] =3D {
+     NULL
+ };
+=20
+-/*
+- * If PPP_DRV_NAME is not defined, use the default "ppp" as the device =
name.
+- */
+-#if !defined(PPP_DRV_NAME)
+-#define PPP_DRV_NAME	"ppp"
+-#endif /* !defined(PPP_DRV_NAME) */
+-
+ int
+ main(argc, argv)
+     int argc;
+@@ -737,8 +730,11 @@ void
+ set_ifunit(iskey)
+     int iskey;
+ {
+-    info("Using interface %s%d", PPP_DRV_NAME, ifunit);
+-    slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
++    if (req_ifname[0] !=3D '\0')
++	slprintf(ifname, sizeof(ifname), "%s", req_ifname);
++    else
++	slprintf(ifname, sizeof(ifname), "%s%d", PPP_DRV_NAME, ifunit);
++    info("Using interface %s", ifname);
+     script_setenv("IFNAME", ifname, iskey);
+     if (iskey) {
+ 	create_pidfile(getpid());	/* write pid to file */
+diff --git a/pppd/options.c b/pppd/options.c
+index c06a2b4ad8ed..177488ca6813 100644
+--- a/pppd/options.c
++++ b/pppd/options.c
+@@ -114,6 +114,7 @@ char	linkname[MAXPATHLEN];	/* logical name for link =
*/
+ bool	tune_kernel;		/* may alter kernel settings */
+ int	connect_delay =3D 1000;	/* wait this many ms after connect script *=
/
+ int	req_unit =3D -1;		/* requested interface unit */
++char	req_ifname[MAXIFNAMELEN];	/* requested interface name */
+ bool	multilink =3D 0;		/* Enable multilink operation */
+ char	*bundle_name =3D NULL;	/* bundle name for multilink */
+ bool	dump_options;		/* print out option values */
+@@ -284,6 +285,10 @@ option_t general_options[] =3D {
+       "PPP interface unit number to use if possible",
+       OPT_PRIO | OPT_LLIMIT, 0, 0 },
+=20
++    { "ifname", o_string, req_ifname,
++      "Set PPP interface name",
++      OPT_PRIO | OPT_PRIV | OPT_STATIC, NULL, MAXIFNAMELEN },
++
+     { "dump", o_bool, &dump_options,
+       "Print out option values after parsing all options", 1 },
+     { "dryrun", o_bool, &dryrun,
+diff --git a/pppd/pppd.8 b/pppd/pppd.8
+index c508d277df3a..06e945fce998 100644
+--- a/pppd/pppd.8
++++ b/pppd/pppd.8
+@@ -1079,7 +1079,13 @@ under Linux and FreeBSD 2.2.8 and later.
+ .TP
+ .B unit \fInum
+ Sets the ppp unit number (for a ppp0 or ppp1 etc interface name) for ou=
tbound
+-connections.
++connections.  If the unit is already in use a dynamically allocated num=
ber will
++be used.
++.TP
++.B ifname \fIstring
++Set the ppp interface name for outbound connections.  If the interface =
name is
++already in use, or if the name cannot be used for any other reason, ppp=
d will
++terminate.
+ .TP
+ .B unset \fIname
+ Remove a variable from the environment variable for scripts that are
+diff --git a/pppd/pppd.h b/pppd/pppd.h
+index 247fa153739b..1a1bf0b99582 100644
+--- a/pppd/pppd.h
++++ b/pppd/pppd.h
+@@ -80,6 +80,16 @@
+ #define MAXARGS		1	/* max # args to a command */
+ #define MAXNAMELEN	256	/* max length of hostname or name for auth */
+ #define MAXSECRETLEN	256	/* max length of password or secret */
++#define MAXIFNAMELEN	32	/* max length of interface name; or use IFNAMSI=
Z, can we
++				   always include net/if.h? */
++
++/*
++ * If PPP_DRV_NAME is not defined, use the default "ppp" as the device =
name.
++ * Where should PPP_DRV_NAME come from? Do we include it here?
++ */
++#if !defined(PPP_DRV_NAME)
++#define PPP_DRV_NAME	"ppp"
++#endif /* !defined(PPP_DRV_NAME) */
+=20
+ /*
+  * Option descriptor structure.
+@@ -318,6 +328,7 @@ extern bool	tune_kernel;	/* May alter kernel setting=
s as necessary */
+ extern int	connect_delay;	/* Time to delay after connect script */
+ extern int	max_data_rate;	/* max bytes/sec through charshunt */
+ extern int	req_unit;	/* interface unit number to use */
++extern char	req_ifname[MAXIFNAMELEN]; /* interface name to use */
+ extern bool	multilink;	/* enable multilink operation */
+ extern bool	noendpoint;	/* don't send or accept endpt. discrim. */
+ extern char	*bundle_name;	/* bundle name for multilink */
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index b4a435d2a993..b832031f7e26 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -643,6 +643,21 @@ static int make_ppp_unit()
+ 	}
+ 	if (x < 0)
+ 		error("Couldn't create new ppp unit: %m");
++
++	if (x =3D=3D 0 && req_ifname[0] !=3D '\0') {
++		struct ifreq ifr;
++		char t[MAXIFNAMELEN];
++		memset(&ifr, 0, sizeof(struct ifreq));
++		slprintf(t, sizeof(t), "%s%d", PPP_DRV_NAME, ifunit);
++		strncpy(ifr.ifr_name, t, IF_NAMESIZE);
++		strncpy(ifr.ifr_newname, req_ifname, IF_NAMESIZE);
++		x =3D ioctl(sock_fd, SIOCSIFNAME, &ifr);
++		if (x < 0)
++		    error("Couldn't rename interface %s to %s: %m", t, req_ifname);
++		else
++		    info("Renamed interface %s to %s", t, req_ifname);
++	}
++
+ 	return x;
+ }
+=20
+diff --git a/pppstats/pppstats.c b/pppstats/pppstats.c
+index 6367988eb96b..46cb9c24942b 100644
+--- a/pppstats/pppstats.c
++++ b/pppstats/pppstats.c
+@@ -88,7 +88,6 @@ int	aflag;			/* print absolute values, not deltas */
+ int	dflag;			/* print data rates, not bytes */
+ int	interval, count;
+ int	infinite;
+-int	unit;
+ int	s;			/* socket or /dev/ppp file descriptor */
+ int	signalled;		/* set if alarm goes off "early" */
+ char	*progname;
+@@ -449,6 +448,7 @@ main(argc, argv)
+ {
+     int c;
+ #ifdef STREAMS
++    int unit;
+     char *dev;
+ #endif
+=20
+@@ -506,11 +506,6 @@ main(argc, argv)
+     if (argc > 0)
+ 	interface =3D argv[0];
+=20
+-    if (sscanf(interface, PPP_DRV_NAME "%d", &unit) !=3D 1) {
+-	fprintf(stderr, "%s: invalid interface '%s' specified\n",
+-		progname, interface);
+-    }
+-
+ #ifndef STREAMS
+     {
+ 	struct ifreq ifr;
+@@ -535,6 +530,11 @@ main(argc, argv)
+     }
+=20
+ #else	/* STREAMS */
++    if (sscanf(interface, PPP_DRV_NAME "%d", &unit) !=3D 1) {
++	fprintf(stderr, "%s: invalid interface '%s' specified\n",
++		progname, interface);
++    }
++
+ #ifdef __osf__
+     dev =3D "/dev/streams/ppp";
+ #else
+--=20
+2.15.1
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.4.8.bb
index f9c60d6bad..231c40f6ca 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.8.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${BP=
}.tar.gz \
            file://fix-CVE-2015-3310.patch \
            file://0001-ppp-Remove-unneeded-include.patch \
            file://0001-pppd-Fix-bounds-check-in-EAP-code.patch \
+           file://0002-pppd-add-ifname-option.patch \
            "
=20
 SRC_URI_append_libc-musl =3D "\
--=20
2.27.0

