Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web11.4100.1630705001231898300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 14:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=2Sd0AefM;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1630704997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FO5tWQktiwNmHRH7IBvD+wHstRtVeX9QQIbiFGKfN+Y=;
	b=2Sd0AefM+lmZGjfLXK+2Gt8rceovOdUyBCSIPyuzirUPI0E7mBBYayEE3C1NR+fcT80OQE
	ugDR/D9ZyFdIabnAxOZEWoGsnJEYNMIw2QKBfdxOYqG2yARrLxq18zRRGepFXCd+sXCgzT
	EoUF0OMd71IIPymJZUQx8/bkJbbQ7V8=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH v2] systemd: Add homed PACKAGECONFIG
Date: Fri,  3 Sep 2021 23:36:22 +0200
Message-Id: <20210903213622.43265-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

If systemd is built with fdisk support[1] and the openssl and cryptsetup
PACKAGECONFIG are enabled, systemd-homed[1] is automatically enabled.
The org.freedesktop.home1.conf file was forgotten, so this commit adds
the file and make enabling homed a explicit choice.

systemd-homed.service and systemd-homed-activate.service have a Also=3D o=
n
each other, so "systemctl" has been fixed to handle the circular
dependency.

userdb isn't strictly speaking needed for homed but "systemctl" can't
handle the missing unit file and upstream recommend enabling both[3].

[1] Automatically enabled if the fdisk dependency is installed which it
    is as util-linux is pulled in by systemd
[2] https://www.freedesktop.org/software/systemd/man/systemd-homed.servic=
e.html
[3] https://github.com/systemd/systemd/commit/871dc8d644eef7542a5330f84c2=
5b1db2617317c

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
V2:
Handle circular dependency in systemctl proberly.
Also require PACKAGECONFIG[userdb]

 meta/recipes-core/systemd/systemd-systemctl/systemctl | 5 +++--
 meta/recipes-core/systemd/systemd_249.3.bb            | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta=
/recipes-core/systemd/systemd-systemctl/systemctl
index e8c3d2d1ee..6324319a45 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -191,7 +191,7 @@ class SystemdUnit():
         except KeyError:
             pass
=20
-    def enable(self):
+    def enable(self, caller_unit=3DNone):
         # if we're enabling an instance, first extract the actual instan=
ce
         # then figure out what the template unit is
         template =3D re.match(r"[^@]+@(?P<instance>[^\.]*)\.", self.unit=
)
@@ -227,7 +227,8 @@ class SystemdUnit():
         try:
             for also in config.get('Install', 'Also'):
                 try:
-                    SystemdUnit(self.root, also).enable()
+                    if caller_unit !=3D also:
+                        SystemdUnit(self.root, also).enable(unit)
                 except SystemdUnitNotFoundError as e:
                     sys.exit("Error: Systemctl also enable issue with  %=
s (%s)" % (service, e.unit))
=20
diff --git a/meta/recipes-core/systemd/systemd_249.3.bb b/meta/recipes-co=
re/systemd/systemd_249.3.bb
index c2d4343f10..e848eea361 100644
--- a/meta/recipes-core/systemd/systemd_249.3.bb
+++ b/meta/recipes-core/systemd/systemd_249.3.bb
@@ -133,6 +133,7 @@ PACKAGECONFIG[gnu-efi] =3D "-Dgnu-efi=3Dtrue -Defi-li=
bdir=3D${STAGING_LIBDIR} -Defi-in
 PACKAGECONFIG[elfutils] =3D "-Delfutils=3Dtrue,-Delfutils=3Dfalse,elfuti=
ls"
 PACKAGECONFIG[firstboot] =3D "-Dfirstboot=3Dtrue,-Dfirstboot=3Dfalse"
 PACKAGECONFIG[repart] =3D "-Drepart=3Dtrue,-Drepart=3Dfalse"
+PACKAGECONFIG[homed] =3D "-Dhomed=3Dtrue,-Dhomed=3Dfalse"
 # Sign the journal for anti-tampering
 PACKAGECONFIG[gcrypt] =3D "-Dgcrypt=3Dtrue,-Dgcrypt=3Dfalse,libgcrypt"
 PACKAGECONFIG[gnutls] =3D "-Dgnutls=3Dtrue,-Dgnutls=3Dfalse,gnutls"
@@ -619,6 +620,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.con=
f \
                 ${datadir}/dbus-1/system.d/org.freedesktop.portable1.con=
f \
                 ${datadir}/dbus-1/system.d/org.freedesktop.oom1.conf \
+                ${datadir}/dbus-1/system.d/org.freedesktop.home1.conf \
                "
=20
 FILES:${PN}-dev +=3D "${base_libdir}/security/*.la ${datadir}/dbus-1/int=
erfaces/ ${sysconfdir}/rpm/macros.systemd"
@@ -717,6 +719,9 @@ python __anonymous() {
=20
     if bb.utils.contains('PACKAGECONFIG', 'repart', True, False, d) and =
not bb.utils.contains('PACKAGECONFIG', 'openssl', True, False, d):
         bb.error("PACKAGECONFIG[repart] requires PACKAGECONFIG[openssl]"=
)
+
+    if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and n=
ot bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, =
False, d):
+        bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], P=
ACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
 }
=20
 python do_warn_musl() {
--=20
2.25.1

