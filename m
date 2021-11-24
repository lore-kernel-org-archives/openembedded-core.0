Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2649C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:15:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.99])
 by mx.groups.io with SMTP id smtpd.web09.3327.1637784945840376828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=iCa0+cU/;
 spf=pass (domain: outlook.com, ip: 40.92.74.99,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP3M2WGfpEi/B49vJMBrpj/Q/7kJ/NKp6yfyUTQE2Ud2tC1BOtLdVVE+OZqtQnSK3oTc2QX8hdjIokZtg6d4Qx+7qKQQpJHIOJbeFOtAar5OHbN4gYK2KShaML36ozt6Dl0qDyfEi7hdZOEUYd4rlK1jXFLUYC1Y7nDqeArGPOugxm+jrXKvrfugMB1Fx1nO+HoTQMFogsh3mtL86nMJx3G9gj9kFxvvoYQbBvUSzDu0E9kJdml0wV7+rCp5vHXssTasppDS9aulJH28z0cfrNShbDAeVp3GL81uo4fzZp+Lxr+jD0H9kz4dzspoe+ayg8x7lykjwOKQSVA1P4XP7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E95omb8zz1FaQ/ILs2k7QwAONGu/CCN5sOGzAvM6Uo=;
 b=Te7ypBj0pWJqEh4ivewOe8CwPMhf5/yj+UHTLc0ArQAmBV1ksJ3d7oPzGOjw/KWxJrQLCcmaGQ/n6y2aYYMcN86ElkN9TPDfLoBVsy9KB/4fvBp9XfWsTxotj643Xm1/M82CiVMQDS4+AhNcc09hB78XCPKkDpN1JQtRL7O7EwPfDNDYlA3xqqhxTsFk37TcKyhnt+x4Tiy/KsJeWTLKPekTj1jlCwnxh/1goryDzb248sVvjt0lL//5gZQJeAKUAfI1Ao6ostIwAADxisfi5isDpEKnq7UWy3kibFlUMkv0+/W+FBL3uGdBXOxOMAFa61Fy/zeC2YZHaGG8pPt0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6E95omb8zz1FaQ/ILs2k7QwAONGu/CCN5sOGzAvM6Uo=;
 b=iCa0+cU/lnVMdBe3c1EoQIdFvv2OkqrIvhx8jGtnj2deQX4zHOodQKsQqoIl4BRnBG5H2yeevCLI+XPQ2CvjSbyIlp+UKULgpq9+zBFeNn8Cnx7pgUqnhc318fBsDkpAhd0WR1spzNcegpcrHZz0e3LuO2qzoD2DykXg+FxyvuyXGvP6gV7Fpxgj6oyjJEYjY8DlReDBAJgJh5chhYdLpfTifuOX7d8djIvjaQNi1MGwNvZ9s3mUbnXZQq9G3MtvxqEzsK26PDUyt0A8RDTAgRHL+ViuWD0sd+nk1+5NBKFM7B8g+tYacJhiP3P/6VmAs0dg5zGSRtbRJXaQMojKiw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB5139.eurprd09.prod.outlook.com (2603:10a6:20b:300::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Wed, 24 Nov
 2021 20:15:44 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 20:15:44 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [RFC][PATCH 1/2] distutils3-legacy: fallback for missing setup.py
Date: Wed, 24 Nov 2021 21:15:08 +0100
Message-ID: 
 <AM9PR09MB46426836B8FC0FACE562A084A8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [FhyENuwCy6pt8ImRUNQhLPtfFR/wxINCC7ZIimFl3TAL1EeF9SVdlVNoyYf9LW2B]
X-ClientProxiedBy: AM4PR0501CA0049.eurprd05.prod.outlook.com
 (2603:10a6:200:68::17) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211124201509.3046484-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM4PR0501CA0049.eurprd05.prod.outlook.com (2603:10a6:200:68::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 24 Nov 2021 20:15:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ef64174-87d1-48a2-6eaf-08d9af873190
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUUWb0xobz58HATeFkxB7v3T2pEqlhG0Q2velADpfkOwdUc2XFZn43NVVtdM1zFKoPKIf5ZQNlAo1fr+3Y7sg4Aw+fjs59EdmoWmJ0OTLudiDAAgvym5bp2sDh74eUwY0tq3wdDZBvtnOy9Jgwcnnc5nQ3i86iB3ZxVuo2bwJbstTa+Z58kGKHoLowP0GdoZHAeLSupzne9P0DwOWKUlEN2sF44BaPoz0XzWnpXTOlJYTYTsVdf9AzZY6fgRY2RINIXSBqIpBOeovK0ibXmzgQeniTrspg04CgY93LqWxFeTVlzgR+LzUwQVbGycUdGqU2CoEWsLvgNEJasyPZLYwFfTzMOV/IyZsGLmD/Nz/MP1OBeLxmvbLAy1zptzFDsnpusWTqtpCoBpguKQ03wTMHqBiJ5+CHZYdGAEVIvv7yJEqBtETfK4jgN70WfP5na8sZFUxeXuvt9PuyF2pZOsEvYV5e2YEhtVuLN3ke1ibq6yAhzRn4a5c4RfS6//RQemPGRdnsTeYG7OflnmQ9DZ9QNQFB8HGEfn44WbWSMMRb7Qnx53B8LYdXl8jho4l+dCftNMaYblc7GwGlEuX7iOLfWe8XQloaukiSNGXw0tlrFkYThhQPYbT5USWP3pr5TyfQbPTFjwP0g4F2EeGbDYmU8bvfVXwAn7ni7TSDT8mslIyAHQvD7wz6XV9mV/V6Kx2fAkL2VkqotT6tSqeh9QWZmWl82fRKvw0ktM6ZQaz8hIL7XJ03krP0YwiiwMmpu0KbJNBBCMio+FEhYOt18QKp84erFon0xFQT1+lUuy5CsBTbFfU46Wc6Ab
X-MS-TrafficTypeDiagnostic: AM9PR09MB5139:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1Duve6pEGPi7jey6OU20oDeaD4Aos1cm3Q9rxiqfp2A6+KsYa9vObpFj0dWwTqTRIdRindoV5yS6GXBwCQ91GAtyml6Kpt4l3/N6YOUuOBMi2uNNPzph1yAPobfz1N3EToXvwF2T6hViJR377gOHR/fbDkmvizUSw3GFK1QloWv4oDC9Akc9viHRZfH8UbjHJ27fJXt/HesUf790pUfjMb+iycZmDH8IEFA6N0ROqUy0XXm8Lg579PyMBxMMykwOnSCF0DmXq300BMihWL75nRnbw2OiTATQVnyZ7RM3NFY61fiM1ajjcC73BfTtD525Vs7RHekzAftA116tdVgpb/mEJPAlFBYMeJrn//RrNbxVviwT+vXfbHE0UgEra7xmRe/0IJhZEuDel7mIpAh0ZuCAqx2zNdl2B1k0BMAfaNlBfF64ainWrepCQ8R/BnT8D0kG0TVQCjypjJMRHB/xmOuVWTWSs7uKswRxRGOyjFHLgeVROq/GuhdAXPDhFzj9o6ITQrli8wDfLwCuH2xhk10ej+WATekZPgfvbzTUuGU860GeAxydc2kPBS5d+8XWMgiShRUCItQdziPZUlQryiaMypV1tBr+EBkTAh/2zIJufq7Zp4emTPZOMhhGnLdH
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f+Oirk8J1NBf8kpFEbquZFPOncd3tBgPvJfaZ4Dl8/K8JVq3XArMJ3MX7khxO7i88i2u4SxW6MuD87mBs9+BLMOM9KeKM2g0QWNdXxqDVMJCIJYJjIgk0TYcMlQYKcaBnHnFVIT6lLEEPF+zMAZp1scW5fdzD87NT1l4KE5u9UWvF9dKTAnWqJK5QNSQA8Z2iiEQyA04MA34vlJ/qmx9LA8OYSSqtne902rLVeRwA5ubvTIJeFIc+TGSqSLeMYwdCX9MfLPfb8p4ONKUdY3Dd02dvhzXXExS1ttSOP6E1OPfvSqMEYtEhStuhCyZ9wwxZHWXw0/eskTK/LU0JUzIaAqv/RKz7ohW7JW/NEp5BTkqNNqEjcOeFY9BEKcxPm5Y5V0grzsmcr4Kaiaj//7H5F6xnSHNcx07mP0eVGkqyHy5Pg2V4H5Yi5+S40h2+Is2oZCGVppJ3jDg371Cb6CsmxZ0OGMzmkNguV8/+BLFk18+XRydYRASIdFAhiYqgAPnNMZryO5I3WQJW9V/u8zzW/hfz0uJaWtIfwFJ4VcQ21ayL2FEqn7qG3ydBKD4bxiWpGy0PvPboiMmvJ4SYFbm49Rvq1CP8dx/EJm+xSxUwZRZCua/gQZ6KLeKtTCGK1LSsVe4Qd/66IsY/Ee0pjq7utixo/9Od7n3gw/DeI1lj8RAvlgf5m6eW8Qq3zDfAJDYhcy/MPSPMZWXPevalWKaeYyA/VkXnGhH0nX0d/xVocaR/abqn+X9HgCLDIWHfIHZ54c24qHjiHMCS5miro3csQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ef64174-87d1-48a2-6eaf-08d9af873190
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 20:15:43.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB5139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:15:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158741

add a bbclass to disutils3 that generates a fallback setup.py in case
there is no setup.py available in the source dir, but a setup.cfg.

Use the mapping provided by
https://setuptools.pypa.io/en/latest/userguide/declarative_config.html
to translate the most essential items to legacy setuptools.setup
dictitonary.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/distutils3-legacy.bbclass | 112 +++++++++++++++++++++++++
 meta/classes/distutils3.bbclass        |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/classes/distutils3-legacy.bbclass

diff --git a/meta/classes/distutils3-legacy.bbclass b/meta/classes/distutil=
s3-legacy.bbclass
new file mode 100644
index 0000000000..266d30138f
--- /dev/null
+++ b/meta/classes/distutils3-legacy.bbclass
@@ -0,0 +1,112 @@
+# Helper to create a trimmed down setup.py from information found in
+# setup.cfg, in case there is no setup.py shipped with the sources
+
+# this functionality can be safely removed once the pypa community
+# comes up with a safe replacement for the functionality found in distutil=
s3.bbclass
+
+def distutils_legacy_package_name(d):
+    # use pypi name or fall back to BPN
+    return d.getVar("PYPI_PACKAGE") or d.getVar('BPN').replace('python-', =
'').replace('python3-', '')
+
+DISTUTILS_LEGACY_VERSION ?=3D "${PV}"
+DISTUTILS_LEGACY_NAME ?=3D "${@distutils_legacy_package_name(d)}"
+
+python do_create_setup_py_legacy() {
+    import os=20
+
+    if os.path.exists(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"), "setu=
p.py")):
+        return
+
+    from configparser import ConfigParser, NoOptionError, NoSectionError, =
ParsingError
+    import re
+
+    config =3D ConfigParser()
+    try:
+        config.read(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"), "setup.=
cfg"))
+    except FileNotFoundError:
+        return
+
+    def _strip(x):
+        return re.sub(r"\s|\t|\n", "", x)
+
+    def get_section(section):
+        try:
+            return dict(config.items(section=3Dsection))
+        except (NoSectionError, ParsingError):
+            return None
+
+    def get_option(section, option):
+        try:
+            return config.get(section=3Dsection, option=3Doption)
+        except (NoOptionError, NoSectionError, ParsingError):
+            return None
+
+    def extract_bool(section, option, default):
+        _option =3D get_option(section, option)
+        if _option is None:
+            return default
+        return bool(_strip(_option))
+
+    def extract_str(section, option, default):
+        _option =3D get_option(section, option)
+        if _option is None:
+            return default
+        return _strip(_option)
+
+    def extract_dict_vallist(section, default, delim=3D""):
+        _section =3D get_section(section)
+        if _section is None:
+            return default
+        return {_strip(k): [_strip(x) for x in re.split(delim, v)] if deli=
m else [ _strip(v) ] for k, v in _section.items()}
+
+    def extract_dict(section, default):
+        _section =3D get_section(section)
+        if _section is None:
+            return default
+        return {_strip(k): _strip(v) for k, v in _section.items()}
+
+    def extract_list(section, option, default, delim):
+        _option =3D get_option(section, option)
+        if _option is None:
+            return default
+        bb.warn("%s:%s -> %s" % (section, option, _option))
+        _listitems =3D re.split(delim, _option) if delim else [_option]
+        return [_strip(x) for x in _listitems]
+
+    def quote(x):
+        return '"%s"' % x
+
+    _pkginfo =3D {
+        "entry_points": extract_dict_vallist("options.entry_points", {}),
+        "include_package_data": extract_bool("options", "include_package_d=
ata", False),
+        "name": quote(extract_str("options", "name", d.getVar("DISTUTILS_L=
EGACY_NAME"))),
+        "package_data": extract_dict_vallist("options.package_data", {}, r=
"\s+|,"),
+        "packages": extract_list("options", "packages", [], ""),
+        "version": quote(d.getVar("DISTUTILS_LEGACY_VERSION")),
+        "zip_safe": extract_bool("options", "zip_safe", False),
+        "install_requires": extract_list("options", "install_requires", []=
, r"\t+|\n+"),
+        "python_requires": quote(extract_str("options", "python_requires",=
 ">0.0")),
+        "package_dir": extract_dict("package_dir", {}),
+        "py_modules": extract_list("options", "py_modules", [], r"\s+|,"),
+    }
+
+    # In case packages is using :find module
+    # we need to look for top level directories containing a __init__.py
+    if _pkginfo["packages"] =3D=3D ["find:"]:
+        # top level search dir can be adjusted by options.packages.find op=
tion
+        _path =3D extract_str("options.packages.find", "where", "")
+        _pkginfo["packages"] =3D set(x.name for x in os.scandir(os.path.jo=
in(
+            d.getVar("DISTUTILS_SETUP_PATH"), _path)) if os.path.isdir(x) =
and os.path.exists(os.path.join(x, "__init__.py")))
+
+    with open(os.path.join(d.getVar("DISTUTILS_SETUP_PATH"), "setup.py"), =
"w") as o:
+        o.write("import setuptools\n")
+        o.write("setuptools.setup(\n")
+        for k, v in _pkginfo.items():
+            o.write("%s =3D %s,\n" % (str(k), str(v)))
+        o.write(")")
+
+   =20
+}
+
+do_create_setup_py_legacy[doc] =3D "Create a fallback version of legacy se=
tup.py if not existing"
+addtask do_create_setup_py_legacy before do_configure after do_patch do_pr=
epare_recipe_sysroot
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbcl=
ass
index be645d37bd..f26f0d5184 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -1,4 +1,5 @@
 inherit distutils3-base
+inherit distutils3-legacy
=20
 B =3D "${WORKDIR}/build"
 distutils_do_configure[cleandirs] =3D "${B}"
--=20
2.25.1


