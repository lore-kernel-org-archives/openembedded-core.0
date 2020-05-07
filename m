Received: from mx02.twl-kom.de (mx02.twl-kom.de [217.151.146.121])
 by mx.groups.io with SMTP id smtpd.web10.1742.1588836331974610408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 00:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: anapur.de, ip: 217.151.146.121, mailfrom: t.ulrich@anapur.de)
Received: from [217.151.146.114] (helo=mailcore01.twl-kom.de)
	by mx02.twl-kom.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <T.Ulrich@anapur.de>)
	id 1jWauO-0003EO-WA
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 09:25:29 +0200
Received: from [217.91.215.69] (helo=AN04.anapur.local)
	by mailcore01.twl-kom.de with esmtps (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.90_1)
	(envelope-from <T.Ulrich@anapur.de>)
	id 1jWauO-0005Dj-Rn
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 09:25:28 +0200
Received: from AN04.anapur.local ([fe80::6c75:475a:8e71:924f]) by
 AN04.anapur.local ([fe80::6c75:475a:8e71:924f%11]) with mapi id
 14.01.0438.000; Thu, 7 May 2020 09:25:28 +0200
From: t.ulrich@anapur.de
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] cve-check: add option to format reports as comma seperated values
Thread-Topic: [PATCH] cve-check: add option to format reports as comma
 seperated values
Thread-Index: AdYkQKq42USJPB+ZTPmQ4rkUKP/hRQ==
Date: Thu, 7 May 2020 07:25:27 +0000
Message-ID: <7DAEF4FFB8C5EB45824E60252FB85E291F78D2AF@AN04.anapur.local>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.0.35]
x-tm-as-product-ver: SMEX-10.1.0.2244-7.000.1014-22482.002
x-tm-as-result: No--37.925900-5.000000-31
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
MIME-Version: 1.0
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

cve-check will check if CVE_CHECK_FORMAT_CSV is set and format the outputs =
(manifest etc.) as CSV for use in spreadsheets.

Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
---
 meta/classes/cve-check.bbclass | 49 +++++++++++++++++++++++++---------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s index 2a530a0489..a7803c7aba 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -35,6 +35,7 @@ CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?=3D "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUF=
FIX}.cve"
 CVE_CHECK_COPY_FILES ??=3D "1"
 CVE_CHECK_CREATE_MANIFEST ??=3D "1"
+CVE_CHECK_FORMAT_CSV ??=3D "0"
=20
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?=3D ""
@@ -98,10 +99,24 @@ python cve_check_write_rootfs_manifest () {
         manifest_name =3D d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file =3D d.getVar("CVE_CHECK_TMP_FILE")
=20
+        if d.getVar("CVE_CHECK_FORMAT_CSV") =3D=3D "1":
+            manifest_name +=3D ".csv"
+           =20
+            with open(cve_tmp_file, "r") as f:
+                db_update_timestamp =3D f.readline()
+                orig_tmp_file =3D f.readlines()[1:]
+            with open(cve_tmp_file, "w") as f:
+                f.write(db_update_timestamp+'\n')
+                f.write("PACKAGE NAME;PACKAGE VERSION;CVE;CVE STATUS;"
+                       "CVE SUMMARY;CVSS v2 BASE SCORE;CVSS v3 BASE SCORE;=
"
+                       "VECTOR;MORE INFORMATION\n")
+            with open(cve_tmp_file, "a") as f:
+                f.writelines(orig_tmp_file)
+
         shutil.copyfile(cve_tmp_file, manifest_name)
=20
         if manifest_name and os.path.exists(manifest_name):
-            manifest_link =3D os.path.join(deploy_dir, "%s.cve" % link_nam=
e)
+            manifest_link =3D os.path.join(deploy_dir, "%s.cve%s" %=20
+ (link_name, ".csv" if d.getVar("CVE_CHECK_FORMAT_CSV") =3D=3D "1" else=20
+ ""))
             # If we already have another manifest, update symlinks
             if os.path.exists(os.path.realpath(manifest_link)):
                 os.remove(manifest_link) @@ -295,26 +310,32 @@ def cve_wri=
te_data(d, patched, unpatched, whitelisted, cve_data):
=20
     cve_file =3D d.getVar("CVE_CHECK_LOG")
     nvd_link =3D "https://web.nvd.nist.gov/view/vuln/detail?vulnId=3D"
+    eol_char =3D '\n' if d.getVar("CVE_CHECK_FORMAT_CSV") !=3D "1" else ';=
'
     write_string =3D ""
     unpatched_cves =3D []
     bb.utils.mkdirhier(os.path.dirname(cve_file))
=20
     for cve in sorted(cve_data):
-        write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string +=3D "PACKAGE VERSION: %s\n" % d.getVar("PV")
-        write_string +=3D "CVE: %s\n" % cve
+        write_string +=3D "%s%s%c" % ("PACKAGE NAME: " if d.getVar("CVE_CH=
ECK_FORMAT_CSV") !=3D "1" else "", d.getVar("PN"), eol_char)
+        write_string +=3D "%s%s%c" % ("PACKAGE VERSION: " if d.getVar("CVE=
_CHECK_FORMAT_CSV") !=3D "1" else "", d.getVar("PV"), eol_char)
+        write_string +=3D "%s%s%c" % ("CVE: " if d.getVar("CVE_CHECK_FORMA=
T_CSV") !=3D "1" else "", cve, eol_char)
+        if d.getVar("CVE_CHECK_FORMAT_CSV") !=3D "1":
+            write_string +=3D "CVE STATUS: "
         if cve in whitelisted:
-            write_string +=3D "CVE STATUS: Whitelisted\n"
+            write_string +=3D "Whitelisted"
         elif cve in patched:
-            write_string +=3D "CVE STATUS: Patched\n"
+            write_string +=3D "Patched"
         else:
             unpatched_cves.append(cve)
-            write_string +=3D "CVE STATUS: Unpatched\n"
-        write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
-        write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
-        write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
-        write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
+            write_string +=3D "Unpatched"
+        write_string +=3D eol_char
+        write_string +=3D "%s\"%s\"%c" % ("CVE SUMMARY: " if d.getVar("CVE=
_CHECK_FORMAT_CSV") !=3D "1" else "", cve_data[cve]["summary"], eol_char)
+        write_string +=3D "%s%s%c" % ("CVSS v2 BASE SCORE: " if d.getVar("=
CVE_CHECK_FORMAT_CSV") !=3D "1" else "", cve_data[cve]["scorev2"], eol_char=
)
+        write_string +=3D "%s%s%c" % ("CVSS v3 BASE SCORE: " if d.getVar("=
CVE_CHECK_FORMAT_CSV") !=3D "1" else "", cve_data[cve]["scorev3"], eol_char=
)
+        write_string +=3D "%s%s%c" % ("VECTOR: " if d.getVar("CVE_CHECK_FO=
RMAT_CSV") !=3D "1" else "", cve_data[cve]["vector"], eol_char)
+        write_string +=3D "%s%s%s\n" % ("MORE INFORMATION: " if d.getVar("=
CVE_CHECK_FORMAT_CSV") !=3D "1" else "", nvd_link, cve)
+        if d.getVar("CVE_CHECK_FORMAT_CSV") !=3D "1":
+            write_string +=3D '\n'
=20
     if unpatched_cves:
         bb.warn("Found unpatched CVE (%s), for more information check %s" =
% (" ".join(unpatched_cves),cve_file)) @@ -328,6 +349,10 @@ def cve_write_d=
ata(d, patched, unpatched, whitelisted, cve_data):
         bb.utils.mkdirhier(cve_dir)
         deploy_file =3D os.path.join(cve_dir, d.getVar("PN"))
         with open(deploy_file, "w") as f:
+            if d.getVar("CVE_CHECK_FORMAT_CSV") =3D=3D "1":
+                f.write("PACKAGE NAME;PACKAGE VERSION;CVE;CVE STATUS;"
+                       "CVE SUMMARY;CVSS v2 BASE SCORE;CVSS v3 BASE SCORE;=
"
+                       "VECTOR;MORE INFORMATION\n")
             f.write(write_string)
=20
     if d.getVar("CVE_CHECK_CREATE_MANIFEST") =3D=3D "1":
--
2.17.1

