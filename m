Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDA2C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 06:38:08 +0000 (UTC)
Received: from amphora.sui-inter.net (amphora.sui-inter.net [80.74.147.33])
 by mx.groups.io with SMTP id smtpd.web11.28371.1744267076458108851
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 23:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: hqv.ch, ip: 80.74.147.33, mailfrom: lw@hqv.ch)
Received: from [192.168.1.129] (localhost [127.0.0.1]) by amphora.sui-inter.net (Postfix) with ESMTPSA id 31B559681351
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 08:37:54 +0200 (CEST)
Authentication-Results: amphora.sui-inter.net;
        spf=pass (sender IP is 185.132.16.78) smtp.mailfrom=lw@hqv.ch smtp.helo=[192.168.1.129]
Received-SPF: pass (amphora.sui-inter.net: connection is authenticated)
Message-ID: <2c0885e1-8821-4470-8e54-dcad6a241834@hqv.ch>
Date: Thu, 10 Apr 2025 08:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Lukas Woodtli <lw@hqv.ch>
Subject: python3: Allow to specify which pyc files to keep
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:38:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214621

 From d7159cd842fd2a10ba5aeff62877be2ebb2eab87 Mon Sep 17 00:00:00 2001
From: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
Date: Mon, 7 Apr 2025 11:55:33 +0200
Subject: [PATCH] python3: Allow to specify which pyc files to keep

The pyc files for a specific optimization level can be kept and are
installed in the final image.

Signed-off-by: Lukas Woodtli <lukas.woodtli@husqvarnagroup.com>
---
 =C2=A0.../recipes-devtools/python/python3_3.13.2.bb | 32 +++++++++++++++=
----
 =C2=A01 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb=20
b/meta/recipes-devtools/python/python3_3.13.2.bb
index 7c36fd92ed..ac74432a2a 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -217,6 +217,12 @@ do_install:append:class-native() {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mv ${D}/${bindir}/${PN}=
/python*config ${D}/${bindir}/
 =C2=A0}

+# We want bytecode precompiled .py files (.pyc's) by default
+# but the user may set it on their own conf
+INCLUDE_PYCS ?=3D "1"
+
+PYCS_OPT_LEVEL ?=3D "0"
+
 =C2=A0do_install:append() {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for c in=20
${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 python3 ${UNPACKDIR}/reformat_sysconfig.py $c
@@ -249,10 +255,25 @@ do_install:append() {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # so remove it too
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f=20
${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*

-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Remove the opt-1.pyc and op=
t-2.pyc files. They effectively=20
waste space on embedded
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # style targets as they're on=
ly used when python is called with=20
the -O or -OO options
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # which is rare.
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find ${D} -name *opt-*.pyc -d=
elete
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${INCLUDE_PYCS}" -eq "1=
" ]; then
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 # Remove only the .pyc files of unused optimization level.
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ =
"${PYCS_OPT_LEVEL}" -eq "0" ]; then
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # keep only unoptimized .pyc files
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 find ${D} -name *.opt-1.pyc -exec rm -f {} \;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 find ${D} -name *.opt-2.pyc -exec rm -f {} \;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
[ "${PYCS_OPT_LEVEL}" -eq "1" ]; then
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # keep only .pyc files with optimization level 1
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 find ${D} -name *.pyc -and -not -name *.opt-1.pyc -exe=
c=20
rm -f {} \;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
[ "${PYCS_OPT_LEVEL}" -eq "2" ]; then
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # keep only .pyc files with optimization level 2
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 find ${D} -name *.pyc -and -not -name *.opt-2.pyc -exe=
c=20
rm -f {} \;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 bberror "Python optimization level ${PYCS_OPT_LEVEL} i=
s=20
not supported"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # rem=
ove all .pyc files
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 find =
${D} -name *.pyc -delete
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
 =C2=A0}

 =C2=A0do_install:append:class-nativesdk () {
@@ -326,9 +347,6 @@ py_package_preprocess () {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${PKGD}/${libdir=
}/python-sysconfigdata
 =C2=A0}

-# We want bytecode precompiled .py files (.pyc's) by default
-# but the user may set it on their own conf
-INCLUDE_PYCS ?=3D "1"

 =C2=A0python(){
 =C2=A0=C2=A0=C2=A0=C2=A0 import collections, json
--=20
2.43.0



