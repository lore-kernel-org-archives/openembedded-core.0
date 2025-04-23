Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FEAC369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 01:48:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3161.1745372928905293730
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 18:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=62082053c6=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N1eUOk005793
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 18:48:48 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jhar6t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 18:48:48 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 22 Apr 2025 18:48:47 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 22 Apr 2025 18:48:46 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 2/2] systemd: systemd-journald fails to setup LogNamespace
Date: Wed, 23 Apr 2025 09:48:38 +0800
Message-ID: <20250423014838.2797584-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423012031.2750737-1-kai.kang@windriver.com>
References: <20250423012031.2750737-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: oqUp3FQkdolSQ7LYLEiDWbHBR0Fnf8qe
X-Proofpoint-ORIG-GUID: oqUp3FQkdolSQ7LYLEiDWbHBR0Fnf8qe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwOSBTYWx0ZWRfX2hinq15nevQ3 /qgYu7fz1cCPsHa7319+HAADFJAoESIlv2F+VuI6irV3OH/mE95b9ydkOn8Lgx5IqoXKrDCi2j+ AqpkBuLJYqCnHIS/0nYD2ybQ+60v58g3/Z9V2LL9yQJpJy9vD5d8Vn+LKD6AZQ8V+EKxTFsrx2x
 vQHqz+JYg6vR8bGnvvv3Q3NbuU/ZkffbxfSOcALuI4kGUalQl0p2my7HxvdjE4ev+iSOC6Q+13X 4ql3JxTdc08VDgHscY8L2QTmF0CPC1lKQNrqVmdB3jNsCttqJzNEjREnnWdKUjWEUNKp/liINaP 1YxsLXhOd4oE43TFtU5nF6P6LdlC8WMyTIcM09rJB/Uriq2sEMvtkvAPtCeKaKRXIiqm/aIE8I2
 ylqSa8ThlyFnPYd+grUkyPkg0K2ii029gZbE5yIdzmchvo65YmlB3X3XsAJUdnkPWxBgLBzx
X-Authority-Analysis: v=2.4 cv=Sa33duRu c=1 sm=1 tr=0 ts=68084700 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=20KFwNOVAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Rylh1WEjLm-x8K4FiwsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230009
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53N1eUOk005793
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215257

From: Haitao Liu <haitao.liu@windriver.com>

A LogNamespace error for systemd v250:

"""
Apr 28 17:44:00 a-rinline2b systemd[467]:
systemd-journald@tester.service: Failed to set up special execution
directory in /var/log: Not a directory
Apr 28 17:44:00 a-rinline2b systemd[467]:
systemd-journald@tester.service: Failed at step LOGS_DIRECTORY spawning
/lib/systemd/systemd-journald: Not a directory
"""
That's because that "/var/log/journal" couldn't be created during
program runtime.

Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...n-in-mkdir_p-when-parent-directory-e.patch | 78 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-basic-do-not-w=
arn-in-mkdir_p-when-parent-directory-e.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-=
mkdir_p-when-parent-directory-e.patch b/meta/recipes-core/systemd/systemd=
/0001-basic-do-not-warn-in-mkdir_p-when-parent-directory-e.patch
new file mode 100644
index 0000000000..723b8ca4f7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-basic-do-not-warn-in-mkdir_p=
-when-parent-directory-e.patch
@@ -0,0 +1,78 @@
+From e01e68e70ae1db9fe61adec3e7bdcced7adc1930 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
+Date: Thu, 10 Feb 2022 08:30:08 +0100
+Subject: [PATCH] basic: do not warn in mkdir_p() when parent directory e=
xists
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This effectively disables warnings about type/mode/ownership of existing
+directories when recursively creating parent directories. (Or files. If =
there's
+a file in a place we expect a directory, the code will later try to crea=
te
+a file and fail. This follows the general pattern where we do (void)mkdi=
r()
+if the mkdir() is immediately followed by opening of a file.)
+
+I was recently debugging an issue with the fstab-generator [1], and it s=
ays:
+'Directory "/tmp" already exists, but has mode 0777 that is too permissi=
ve (0644 was requested), refusing.'
+which is very specific but totally wrong in this context.
+This output was added in 37c1d5e97dbc869edd8fc178427714e2d9428d2b, and I=
 still
+think it is worth to do it, because if you actually *do* want the direct=
ory, if
+there's something wrong, the precise error message will make it much eas=
ier to
+diagnose. And we can't easily pass the information what failed up the ca=
ll chain
+because there are multiple things we check (ownership, permission mask, =
type)=E2=80=A6
+So passing a param whether to warn or not down into the library code see=
ms like
+the best solution, despite not being very elegant.
+
+[1] https://bugzilla.redhat.com/show_bug.cgi?id=3D2051285
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/e01=
e68e70ae1db9fe61adec3e7bdcced7adc1930]
+
+Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/basic/mkdir.c | 5 ++++-
+ src/basic/mkdir.h | 5 +++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
+index 27144dd45a..cf7cf4a357 100644
+--- a/src/basic/mkdir.c
++++ b/src/basic/mkdir.c
+@@ -55,6 +55,9 @@ int mkdir_safe_internal(
+                         return -errno;
+         }
+=20
++        if (flags & MKDIR_IGNORE_EXISTING)
++                return 0;
++
+         if (!S_ISDIR(st.st_mode))
+                 return log_full_errno(flags & MKDIR_WARN_MODE ? LOG_WAR=
NING : LOG_DEBUG, SYNTHETIC_ERRNO(ENOTDIR),
+                                       "Path \"%s\" already exists and i=
s not a directory, refusing.", path);
+@@ -142,7 +145,7 @@ int mkdir_parents_internal(const char *prefix, const=
 char *path, mode_t mode, ui
+                 s[n] =3D '\0';
+=20
+                 if (!prefix || !path_startswith_full(prefix, path, /* a=
ccept_dot_dot=3D */ false)) {
+-                        r =3D mkdir_safe_internal(path, mode, uid, gid,=
 flags, _mkdirat);
++                        r =3D mkdir_safe_internal(path, mode, uid, gid,=
 flags | MKDIR_IGNORE_EXISTING, _mkdirat);
+                         if (r < 0 && r !=3D -EEXIST)
+                                 return r;
+                 }
+diff --git a/src/basic/mkdir.h b/src/basic/mkdir.h
+index 34a5227577..c0c0ea6c4f 100644
+--- a/src/basic/mkdir.h
++++ b/src/basic/mkdir.h
+@@ -4,8 +4,9 @@
+ #include <sys/types.h>
+=20
+ typedef enum MkdirFlags {
+-        MKDIR_FOLLOW_SYMLINK =3D 1 << 0,
+-        MKDIR_WARN_MODE      =3D 1 << 1,
++        MKDIR_FOLLOW_SYMLINK  =3D 1 << 0,
++        MKDIR_IGNORE_EXISTING =3D 1 << 1,  /* Quietly accept a preexist=
ing directory (or file) */
++        MKDIR_WARN_MODE       =3D 1 << 2,  /* Log at LOG_WARNING when m=
ode doesn't match */
+ } MkdirFlags;
+=20
+ int mkdirat_errno_wrapper(int dirfd, const char *pathname, mode_t mode)=
;
+--=20
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-c=
ore/systemd/systemd_250.14.bb
index b79284d79c..b3e31e1f23 100644
--- a/meta/recipes-core/systemd/systemd_250.14.bb
+++ b/meta/recipes-core/systemd/systemd_250.14.bb
@@ -30,6 +30,7 @@ SRC_URI +=3D "file://touchscreen.rules \
            file://fix-vlan-qos-mapping.patch \
            file://0001-core-fix-build-when-seccomp-is-off.patch \
            file://0001-journal-Make-sd_journal_previous-next-return-0-at=
-HE.patch \
+           file://0001-basic-do-not-warn-in-mkdir_p-when-parent-director=
y-e.patch \
            "
=20
 # patches needed by musl
--=20
2.34.1


