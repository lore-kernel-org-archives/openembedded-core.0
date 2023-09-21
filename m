Return-Path: <antoine.lubineau@easymile.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369DDE706ED
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 08:23:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.11252.1695284635576238981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 01:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@easymile.com header.s=easymile header.b=HA0OGctK;
 spf=pass (domain: easymile.com, ip: 209.85.221.41, mailfrom: antoine.lubineau@easymile.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-31f737b8b69so560338f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easymile.com; s=easymile; t=1695284633; x=1695889433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1L1VTbXdyb7chtajJrf0nkzAEOXzYR6g2e4J+AGzeHA=;
        b=HA0OGctKmf7w8DM3TmHknjKst92FzWJ4AAZzYJjsinK6NJ8KP4AH1A7fYuwsI99q6B
         IZIT9MnAOYx++DB1JjehubwMFosA2vTBl+XAfLJU//ZKvcCZQfOlMN4X1+oaOLUL/7/l
         AlhQWy6Cj2RKpG+dcdgOFht82ulFrfYeWwwtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695284633; x=1695889433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1L1VTbXdyb7chtajJrf0nkzAEOXzYR6g2e4J+AGzeHA=;
        b=JROwXPbbAsD7l2eGTjDVYzu5H7DWkVnfRfDxHLUHo79D5S8THQLCzMR3ShPaW4CpYh
         5+Gv3RfHQZ31Wy0DlSy4DBvPGGjOXv2miIRZskFoqb189NGVzJDj9eEr6HwtD5IR/+XL
         FSoDynpkru5Ak7HcvqKm0ArdhXio/VYPMSkB7kuIC5kMiaPxlTr4SkKEfSJKkcwtZket
         JhhT9YKIgVwai3xk3kX7W5fvVtA8SI/M0HbkOPN1UDUXfIJ2GX2NI80dFSz2gcw/hxrQ
         SMaCtWTp3+ajokeZc67A3eaCxI0+TSyGQ/elTmDZkgpL3rCmltnetZxZPhyYpdysmqeE
         /A7g==
X-Gm-Message-State: AOJu0Yy5pgexkZfbbhvoMjkCOqs9Rn8icpAh7/5bLbI5LvnXeoSrgTZb
	mvdBvWb4feyD5FobF2GG2R6VtoWDG9qlCPy5++CSFI/Vl6M0LQo+mtTZxqVFenuKj3UrszTQoQI
	oevXpTYP13fGOjKDHWhPBrSj1ADobneHuV/6wR88RVGkd8FUdc46dWyoRE64aKw5tI00bKmMTP4
	QejcvZjWWtvoVw4nToB78oKqA8dprwa/3xEah6BL8=
X-Google-Smtp-Source: AGHT+IGjBuM/Upd+6d/opVs9ZKQAGCPKQI0uN1GAy58IFHe9EwqGLJs4E5oRofsXvbPvfO3xGhqAOQ==
X-Received: by 2002:adf:f08f:0:b0:320:6d6:3167 with SMTP id n15-20020adff08f000000b0032006d63167mr4311240wro.47.1695284633404;
        Thu, 21 Sep 2023 01:23:53 -0700 (PDT)
Received: from fr001036.. ([185.116.129.142])
        by smtp.gmail.com with ESMTPSA id m16-20020a056000009000b0031c71693449sm1076445wrx.1.2023.09.21.01.23.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 01:23:53 -0700 (PDT)
From: Antoine Lubineau <antoine.lubineau@easymile.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: add CVSS vector string to CVE database and reports
Date: Thu, 21 Sep 2023 10:23:52 +0200
Message-Id: <20230921082352.21065-1-antoine.lubineau@easymile.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 08:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187980

This allows building detailed vulnerability analysis tools without
relying on external resources.

Signed-off-by: Antoine Lubineau <antoine.lubineau@easymile.com>
---
 meta/classes/cve-check.bbclass                   |  5 ++++-
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 11 ++++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 55ae298024..b55f4299da 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -32,7 +32,7 @@ CVE_PRODUCT ??=3D "${BPN}"
 CVE_VERSION ??=3D "${PV}"
=20
 CVE_CHECK_DB_DIR ?=3D "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2.db"
+CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/nvdcve_2-1.db"
 CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
=20
 CVE_CHECK_LOG ?=3D "${T}/cve.log"
@@ -442,6 +442,7 @@ def get_cve_info(d, cves):
             cve_data[row[0]]["scorev3"] =3D row[3]
             cve_data[row[0]]["modified"] =3D row[4]
             cve_data[row[0]]["vector"] =3D row[5]
+            cve_data[row[0]]["vectorString"] =3D row[6]
         cursor.close()
     conn.close()
     return cve_data
@@ -507,6 +508,7 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
         write_string +=3D "VECTOR: %s\n" % cve_data[cve]["vector"]
+        write_string +=3D "VECTORSTRING: %s\n" % cve_data[cve]["vectorStri=
ng"]
         write_string +=3D "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
=20
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
@@ -623,6 +625,7 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
             "scorev2" : cve_data[cve]["scorev2"],
             "scorev3" : cve_data[cve]["scorev3"],
             "vector" : cve_data[cve]["vector"],
+            "vectorString" : cve_data[cve]["vectorString"],
             "status" : status,
             "link": issue_link
         }
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipe=
s-core/meta/cve-update-nvd2-native.bb
index 2f7dad7e82..d0321f1bb5 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -225,7 +225,7 @@ def initialize_db(conn):
         c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, D=
ATE TEXT)")
=20
         c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY=
 TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+            SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT, VEC=
TORSTRING TEXT)")
=20
         c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
             VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START =
TEXT, \
@@ -299,6 +299,7 @@ def update_db(conn, elt):
     """
=20
     accessVector =3D None
+    vectorString =3D None
     cveId =3D elt['cve']['id']
     if elt['cve']['vulnStatus'] =3D=3D  "Rejected":
         return
@@ -309,25 +310,29 @@ def update_db(conn, elt):
     date =3D elt['cve']['lastModified']
     try:
         accessVector =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['accessVector']
+        vectorString =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssDat=
a']['vectorString']
         cvssv2 =3D elt['cve']['metrics']['cvssMetricV2'][0]['cvssData']['b=
aseScore']
     except KeyError:
         cvssv2 =3D 0.0
     cvssv3 =3D None
     try:
         accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['attackVector']
+        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V30'][0]['cvssData']['vectorString']
         cvssv3 =3D elt['cve']['metrics']['cvssMetricV30'][0]['cvssData']['=
baseScore']
     except KeyError:
         pass
     try:
         accessVector =3D accessVector or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['attackVector']
+        vectorString =3D vectorString or elt['cve']['metrics']['cvssMetric=
V31'][0]['cvssData']['vectorString']
         cvssv3 =3D cvssv3 or elt['cve']['metrics']['cvssMetricV31'][0]['cv=
ssData']['baseScore']
     except KeyError:
         pass
     accessVector =3D accessVector or "UNKNOWN"
+    vectorString =3D vectorString or "UNKNOWN"
     cvssv3 =3D cvssv3 or 0.0
=20
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector]).clos=
e()
+    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?)"=
,
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector, vecto=
rString]).close()
=20
     try:
         for config in elt['cve']['configurations']:
--=20
2.39.2


--=20


*This email and any attachment contains EasyMile's confidential=20
information, and must not be modified or circulated without EasyMile's=20
prior written consent. It is intended exclusively for their recipient.s. If=
=20
you received this message by mistake, please notify us promptly and=20
immediately delete this email and any of its attachments.*

*As data=20
controller, EasyMile processes personal data, in compliance with the=20
European GDPR (EU) 2016/679 of 27 April 2016. To exercise your rights, you=
=20
can contact EasyMile at privacy@easymile.com, and if necessary, you may=20
contact the local competent supervisory authority."*

*Cet e-mail et toute=20
pi=E8ce jointe contiennent des informations confidentielles d'EasyMile et n=
e=20
doivent pas =EAtre modifi=E9s ou diffus=E9s sans le consentement =E9crit pr=
=E9alable=20
d'EasyMile. Ils sont destin=E9s exclusivement =E0 leur destinataire.s. Si v=
ous=20
avez re=E7u ce message par erreur, veuillez nous en informer rapidement et=
=20
supprimer imm=E9diatement cet e-mail et toutes ses pi=E8ces jointes.  *

*En=20
tant que responsable de traitement, EasyMile traite des donn=E9es=20
personnelles, conform=E9ment au RGPD europ=E9en (UE) 2016/679 du 27 avril 2=
016.=20
Pour exercer vos droits, vous pouvez contacter EasyMile =E0=20
privacy@easymile.com <mailto:privacy@easymile.com>, et si n=E9cessaire, vou=
s=20
pouvez contacter l'autorit=E9 de contr=F4le locale comp=E9tente.*

