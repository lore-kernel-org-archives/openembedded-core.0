Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C005C79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6443.1788939009290411048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IJsVaSyf;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4843f205a5bso3495957f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939007; x=1789543807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5m1oOCMLtzGGcNBbLHEBjCo/d3vcbBuAdYu5HYumcDI=;
        b=IJsVaSyf9Y45v9TUd2QvzkNoKEm0HHWf6I+d+Eizx8hOH4ERB4J3gvSAz2nK7xX+rw
         ojfV+2dEbEbbNGSIBBmU+Qe/5bH8DaTlvoz6UJX277nT30wGHUZ1ZvpcUQrvRcwl48zf
         00R7Wbq+3vrEPZqKUcxl8pVPlal+Hh3p7rFAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939007; x=1789543807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5m1oOCMLtzGGcNBbLHEBjCo/d3vcbBuAdYu5HYumcDI=;
        b=QbKbn2O1037/6qCqzN99lUh/ZMkJMvWb+REKs3IF5EBV41yEKdqYv6/wDreI9w/3Hp
         O7wKlleCOsED5I8L2uZpcHPA8COxB6bNV78zTjG7m6APQnlP2MkUZdzA6M6Xrb813DUJ
         145NlTp2M5WLtnCAU9I5f6ZlhyKun9dy9tyochmv0EEQ8kIerKmhZoEMa/zJt+tdnBmD
         Zl6uonfAJ5mCEtL8NWhSvkKYT3cq1aCb8PUGwy6jAOzyX1/DQg1rkv3fMi14wSzs6kK+
         2aBAdMhbFeBgfcGthv5olnLe0eyespaHqgl8FFTjdUMUgleRdQslS4Zw9QI2ZV7sNnmv
         cdlA==
X-Gm-Message-State: AFuF++l1q/+4EcWk+xvd/dRcPr/554zhDjesIl16zNTWzDcd5dP9nYUB
	GqU0qnJxm+MYcs1xO+yeb1vrVzGHYGRH8w/htqLwrERRS7tcS1gzrcOhojWBXrxR3Bf9cZjQGy9
	xv3GqL8k=
X-Gm-Gg: AYBFou2E3b9V/ooVSR+brlUuiNABMlKz7VSdh1dWnkOUVrcbMZO6NOLAGoAPQnvLLF/
	/QeW8oRyeXA6xnfC+LJWcXtPpwVKe8zZAUXugDNtOuAJxewd7C2zvx3CEtsazM8qKjQQS9sFBRk
	cUW0CmrDJSKXwk9aHebUYv/CWLg72sgS0wspROqyyZ2JsBgTOk8bTYlWlKo2+Nbgf1fvTdXqQ7u
	38OTMUqq9xw9fxeFbXqDQIg8GwACVgH5zncn4XLU2ikZa4YpGjJZYBkPNYE+Ccyy1bSM9Tb4BuX
	0dkdI4QS9CuOdATUqvvJTqN8MPvmaTo78+Qu2n4lENPmEPm6VmIm6jgbdg4ecxqBn0m8UzMtyr9
	6E3GnyPQenHcYXLUf1dC0g/8r53fEi6gZwEG+Ue/dU1jOmG0buWc1HiDKO5Hc0JuHHJwf3DwVpL
	MZ4FkXFIKtCyBs9PL4M9iutoCnepcmslSlLuJGQruhIJ4ZzlQ2v77D6ODwXVtZQObgSN+2zYEuC
	x53aAiGEZzuvfeTMUiS5JfW0M61Bbs+kUc6uGJRisiftVHByotpXnsBlIEAJ1tIlt666tDfJzA=
X-Received: by 2002:a05:6000:490e:b0:485:8a46:b3bc with SMTP id ffacd0b85a97d-4858a46b4b8mr33437005f8f.36.1788939007021;
        Wed, 09 Sep 2026 00:30:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/38] python3-lxml: fix CVE-2026-41066
Date: Wed,  9 Sep 2026 09:29:19 +0200
Message-ID: <a81aac9a18c30c8119fb3041fcfba21aec0bf717.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245429

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e9a=
af358
[2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-lxml/CVE-2026-41066.patch  | 349 ++++++++++++++++++
 .../python/python3-lxml_6.0.2.bb              |   4 +-
 2 files changed, 352 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-4106=
6.patch

diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch=
 b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
new file mode 100644
index 00000000000..b1a6f6629d3
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
@@ -0,0 +1,349 @@
+From 3a79355229f58e0fe51371385102dd7577bbfb26 Mon Sep 17 00:00:00 2001
+From: Stefan Behnel <stefan_ml@behnel.de>
+Date: Fri, 10 Apr 2026 10:13:03 +0200
+Subject: [PATCH] LP#2146291: Set "resolve_entities=3D'internal'" as defaul=
t for
+ all parser subclasses.
+
+CVE: CVE-2026-41066
+Upstream-Status: Backport [https://github.com/lxml/lxml/commit/ab431ea0b9a=
7357d968f1d1c5c614649e9aaf358]
+
+Backport Changes:
+- Reformat the iterparse signature and resolve_entities documentation
+  without semantic changes, preserving line numbers to avoid generated
+  source-location churn.
+- Regenerate src/lxml/etree.c with Cython 3.1.4, matching the version
+  recorded in the shipped file, using
+  "python setup.py build_ext -i --with-cython".
+- Restore the shipped Cython metadata field order and omit
+  the environment-only "-w" compiler flag to avoid unrelated
+  generated changes.
+
+(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/lxml/etree.c       | 60 +++++++++++++++++++++---------------------
+ src/lxml/iterparse.pxi | 10 +++----
+ src/lxml/parser.pxi    |  6 ++---
+ 3 files changed, 38 insertions(+), 38 deletions(-)
+
+diff --git a/src/lxml/etree.c b/src/lxml/etree.c
+index 29553531..f2208e43 100644
+--- a/src/lxml/etree.c
++++ b/src/lxml/etree.c
+@@ -147986,7 +147986,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,             # <<<<<<<<<<<<<<
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+ */
+       if (!values[2]) values[2] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[3]) values[3] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -147997,7 +147997,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,    =
         # <<<<<<<<<<<<<<
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+ */
+       if (!values[6]) values[6] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -148007,17 +148007,17 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXML=
Parser_1__init__(PyObject *__pyx_v
+       /* "src/lxml/parser.pxi":1734
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,             # <<<<<<<<<<<<<<
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',             # <<<<<<<<<<<<<<
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):
+ */
+       if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[10]) values[10] =3D __Pyx_NewRef(((PyObject *)Py_False)=
);
+-      if (!values[11]) values[11] =3D __Pyx_NewRef(((PyObject *)Py_True));
++      if (!values[11]) values[11] =3D __Pyx_NewRef(((PyObject *)__pyx_mst=
ate_global->__pyx_n_u_internal));
+=20
+       /* "src/lxml/parser.pxi":1735
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,             # <<<<<<<<<<<<<<
+  *                  target=3DNone, compact=3DTrue):
+  *         XMLParser.__init__(self,
+@@ -148027,7 +148027,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+       if (!values[14]) values[14] =3D __Pyx_NewRef(((PyObject *)Py_True));
+=20
+       /* "src/lxml/parser.pxi":1736
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):             # <<<<<<<=
<<<<<<<
+  *         XMLParser.__init__(self,
+@@ -148054,7 +148054,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,             # <<<<<<<<<<<<<<
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+ */
+       if (!values[2]) values[2] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[3]) values[3] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -148065,7 +148065,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,    =
         # <<<<<<<<<<<<<<
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+ */
+       if (!values[6]) values[6] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -148075,17 +148075,17 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXML=
Parser_1__init__(PyObject *__pyx_v
+       /* "src/lxml/parser.pxi":1734
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, decompress=3DFalse,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,             # <<<<<<<<<<<<<<
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',             # <<<<<<<<<<<<<<
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):
+ */
+       if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[10]) values[10] =3D __Pyx_NewRef(((PyObject *)Py_False)=
);
+-      if (!values[11]) values[11] =3D __Pyx_NewRef(((PyObject *)Py_True));
++      if (!values[11]) values[11] =3D __Pyx_NewRef(((PyObject *)__pyx_mst=
ate_global->__pyx_n_u_internal));
+=20
+       /* "src/lxml/parser.pxi":1735
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,             # <<<<<<<<<<<<<<
+  *                  target=3DNone, compact=3DTrue):
+  *         XMLParser.__init__(self,
+@@ -148095,7 +148095,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+       if (!values[14]) values[14] =3D __Pyx_NewRef(((PyObject *)Py_True));
+=20
+       /* "src/lxml/parser.pxi":1736
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):             # <<<<<<<=
<<<<<<<
+  *         XMLParser.__init__(self,
+@@ -195499,7 +195499,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D("end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,  =
           # <<<<<<<<<<<<<<
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+ */
+       if (!values[3]) values[3] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[4]) values[4] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -195508,7 +195508,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D("end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,             # <<<<<<<<<<<<<<
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+ */
+       if (!values[5]) values[5] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -195518,17 +195518,17 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+       /* "src/lxml/iterparse.pxi":71
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,             # <<<<<<<<<<<<<<
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,             # <<<<<<<<<<<<<<
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+ */
+       if (!values[8]) values[8] =3D __Pyx_NewRef(((PyObject *)Py_True));
+-      if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)Py_True));
++      if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)__pyx_mstat=
e_global->__pyx_n_u_internal));
+       if (!values[10]) values[10] =3D __Pyx_NewRef(((PyObject *)Py_False)=
);
+=20
+       /* "src/lxml/iterparse.pxi":72
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,             # <<<<<<<<<<<<<<
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):
+@@ -195538,7 +195538,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+       if (!values[13]) values[13] =3D __Pyx_NewRef(((PyObject *)Py_None));
+=20
+       /* "src/lxml/iterparse.pxi":73
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,             # <<<<<<<<<<<<<<
+  *                  XMLSchema schema=3DNone):
+@@ -195588,7 +195588,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D("end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,  =
           # <<<<<<<<<<<<<<
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+ */
+       if (!values[3]) values[3] =3D __Pyx_NewRef(((PyObject *)Py_False));
+       if (!values[4]) values[4] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -195597,7 +195597,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D("end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,             # <<<<<<<<<<<<<<
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+ */
+       if (!values[5]) values[5] =3D __Pyx_NewRef(((PyObject *)Py_False));
+@@ -195607,17 +195607,17 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+       /* "src/lxml/iterparse.pxi":71
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,             # <<<<<<<<<<<<<<
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,             # <<<<<<<<<<<<<<
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+ */
+       if (!values[8]) values[8] =3D __Pyx_NewRef(((PyObject *)Py_True));
+-      if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)Py_True));
++      if (!values[9]) values[9] =3D __Pyx_NewRef(((PyObject *)__pyx_mstat=
e_global->__pyx_n_u_internal));
+       if (!values[10]) values[10] =3D __Pyx_NewRef(((PyObject *)Py_False)=
);
+=20
+       /* "src/lxml/iterparse.pxi":72
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,             # <<<<<<<<<<<<<<
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,
+  *                  XMLSchema schema=3DNone):
+@@ -195627,7 +195627,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+       if (!values[13]) values[13] =3D __Pyx_NewRef(((PyObject *)Py_None));
+=20
+       /* "src/lxml/iterparse.pxi":73
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,             # <<<<<<<<<<<<<<
+  *                  XMLSchema schema=3DNone):
+@@ -263283,7 +263283,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_XM=
LParser[] =3D {
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_XMLParser_slots[] =3D {
+   {Py_tp_dealloc, (void *)__pyx_tp_dealloc_4lxml_5etree__BaseParser},
+-  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse,                  load_dtd=3DFa=
lse, no_network=3DTrue, decompress=3DFalse, ns_clean=3DFalse,              =
    recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse,         =
         remove_blank_text=3DFalse, resolve_entities=3DTrue,               =
   remove_comments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue,        =
          collect_ids=3DTrue, target=3DNone, compact=3DTrue)\n\n    The XML=
 parser.\n\n    Parsers can be supplied as additional argument to various p=
arse\n    functions of the lxml API.  A default parser is always available\=
n    and can be replaced by a call to the global function\n    'set_default=
_parser'.  New parsers can be created at any time\n    without a major run-=
time overhead.\n\n    The keyword arguments in the constructor are mainly b=
ased on the\n    libxml2 parser configuration.  A DTD will also be loaded i=
f DTD\n    validation or attribute default values are requested (unless you=
\n    additionally provide an XMLSchema from which the default\n    attribu=
tes can be read).\n\n    Available boolean keyword arguments:\n\n    - attr=
ibute_defaults - inject default attributes from DTD or XMLSchema\n    - dtd=
_validation     - validate against a DTD referenced by the document\n    - =
load_dtd           - use DTD for parsing\n    - no_network         - preven=
t network access for related files (default: True)\n    - decompress       =
  - automatically decompress gzip input\n                           (defaul=
t: False, changed in lxml 6.0, disabling only affects libxml2 2.15+)\n    -=
 ns_clean           - clean up redundant namespace declarations\n    - reco=
ver            - try hard to parse through broken XML\n    - remove_blank_t=
ext  - discard blank text nodes that appear ignorable\n    - remove_comment=
s    - discard comments\n    - remove_pis         - discard processing inst=
ructions\n    - strip_cdata        - replace CDATA sections by normal text =
content (default: True)\n    - compact        ""    - save memory for short=
 text content (default: True)\n    - collect_ids        - use a hash table =
of XML IDs for fast access\n                           (default: True, alwa=
ys True with DTD validation)\n    - huge_tree          - disable security r=
estrictions and support very deep trees\n                           and ver=
y long text content\n\n    Other keyword arguments:\n\n    - resolve_entiti=
es - replace entities by their text value: False for keeping the\n         =
 entity references, True for resolving them, and 'internal' for resolving\n=
          internal definitions only (no external file/URL access).\n       =
   The default used to be True and was changed to 'internal' in lxml 5.0.\n=
    - encoding - override the document encoding (note: libiconv encoding na=
me)\n    - target   - a parser target object that will receive the parse ev=
ents\n    - schema   - an XMLSchema to validate against\n\n    Note that yo=
u should avoid sharing parsers between threads.  While this is\n    not har=
mful, it is more efficient to use separate parsers.  This does not\n    app=
ly to the default parser.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse,                  load_dtd=3DFa=
lse, no_network=3DTrue, decompress=3DFalse, ns_clean=3DFalse,              =
    recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse,         =
         remove_blank_text=3DFalse, resolve_entities=3D'internal',         =
         remove_comments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue,  =
                collect_ids=3DTrue, target=3DNone, compact=3DTrue)\n\n    T=
he XML parser.\n\n    Parsers can be supplied as additional argument to var=
ious parse\n    functions of the lxml API.  A default parser is always avai=
lable\n    and can be replaced by a call to the global function\n    'set_d=
efault_parser'.  New parsers can be created at any time\n    without a majo=
r run-time overhead.\n\n    The keyword arguments in the constructor are ma=
inly based on the\n    libxml2 parser configuration.  A DTD will also be lo=
aded if DTD\n    validation or attribute default values are requested (unle=
ss you\n    additionally provide an XMLSchema from which the default\n    a=
ttributes can be read).\n\n    Available boolean keyword arguments:\n\n    =
- attribute_defaults - inject default attributes from DTD or XMLSchema\n   =
 - dtd_validation     - validate against a DTD referenced by the document\n=
    - load_dtd           - use DTD for parsing\n    - no_network         - =
prevent network access for related files (default: True)\n    - decompress =
        - automatically decompress gzip input\n                           (=
default: False, changed in lxml 6.0, disabling only affects libxml2 2.15+)\=
n    - ns_clean           - clean up redundant namespace declarations\n    =
- recover            - try hard to parse through broken XML\n    - remove_b=
lank_text  - discard blank text nodes that appear ignorable\n    - remove_c=
omments    - discard comments\n    - remove_pis         - discard processin=
g instructions\n    - strip_cdata        - replace CDATA sections by normal=
 text content (default: True)\n    - compact  ""          - save memory for=
 short text content (default: True)\n    - collect_ids        - use a hash =
table of XML IDs for fast access\n                           (default: True=
, always True with DTD validation)\n    - huge_tree          - disable secu=
rity restrictions and support very deep trees\n                           a=
nd very long text content\n\n    Other keyword arguments:\n\n    - resolve_=
entities - replace entities by their text value: False for keeping the\n   =
       entity references, True for resolving them, and 'internal' for resol=
ving\n          internal definitions only (no external file/URL access).\n =
         The default used to be True and was changed to 'internal' in lxml =
5.0.\n    - encoding - override the document encoding (note: libiconv encod=
ing name)\n    - target   - a parser target object that will receive the pa=
rse events\n    - schema   - an XMLSchema to validate against\n\n    Note t=
hat you should avoid sharing parsers between threads.  While this is\n    n=
ot harmful, it is more efficient to use separate parsers.  This does not\n =
   apply to the default parser.\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_XMLParser},
+@@ -263326,7 +263326,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_XMLP=
arser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse,                  load_dtd=3DFalse, no_network=3DTr=
ue, decompress=3DFalse, ns_clean=3DFalse,                  recover=3DFalse,=
 schema: XMLSchema =3DNone, huge_tree=3DFalse,                  remove_blan=
k_text=3DFalse, resolve_entities=3DTrue,                  remove_comments=
=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue,                  collect_=
ids=3DTrue, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n    Pa=
rsers can be supplied as additional argument to various parse\n    function=
s of the lxml API.  A default parser is always available\n    and can be re=
placed by a call to the global function\n    'set_default_parser'.  New par=
sers can be created at any time\n    without a major run-time overhead.\n\n=
    The keyword arguments in the constructor are mainly based on the\n    l=
ibxml2 parser configuration.  A DTD will also be loaded if DTD\n    validat=
ion or attribute default values are requested (unless you\n    additionally=
 provide an XMLSchema from which the default\n    attributes can be read).\=
n\n    Available boolean keyword arguments:\n\n    - attribute_defaults - i=
nject default attributes from DTD or XMLSchema\n    - dtd_validation     - =
validate against a DTD referenced by the document\n    - load_dtd          =
 - use DTD for parsing\n    - no_network         - prevent network access f=
or related files (default: True)\n    - decompress         - automatically =
decompress gzip input\n                           (default: False, changed =
in lxml 6.0, disabling only affects libxml2 2.15+)\n    - ns_clean         =
  - clean up redundant namespace declarations\n    - recover            - t=
ry hard to parse through broken XML\n    - remove_blank_text  - discard bla=
nk text nodes that appear ignorable\n    - remove_comments    - discard com=
ments\n    - remove_pis         - discard processing instructions\n    - st=
rip_cdata        - replace CDATA sections by normal text content (default: =
True)\n    - compact        ""    - save memory for short text content (def=
ault: True)\n    - collect_ids        - use a hash table of XML IDs for fas=
t access\n                           (default: True, always True with DTD v=
alidation)\n    - huge_tree          - disable security restrictions and su=
pport very deep trees\n                           and very long text conten=
t\n\n    Other keyword arguments:\n\n    - resolve_entities - replace entit=
ies by their text value: False for keeping the\n          entity references=
, True for resolving them, and 'internal' for resolving\n          internal=
 definitions only (no external file/URL access).\n          The default use=
d to be True and was changed to 'internal' in lxml 5.0.\n    - encoding - o=
verride the document encoding (note: libiconv encoding name)\n    - target =
  - a parser target object that will receive the parse events\n    - schema=
   - an XMLSchema to validate against\n\n    Note that you should avoid sha=
ring parsers between threads.  While this is\n    not harmful, it is more e=
fficient to use separate parsers.  This does not\n    apply to the default =
parser.\n    "), /*tp_doc*/
++  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse,                  load_dtd=3DFalse, no_network=3DTr=
ue, decompress=3DFalse, ns_clean=3DFalse,                  recover=3DFalse,=
 schema: XMLSchema =3DNone, huge_tree=3DFalse,                  remove_blan=
k_text=3DFalse, resolve_entities=3D'internal',                  remove_comm=
ents=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue,                  coll=
ect_ids=3DTrue, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n  =
  Parsers can be supplied as additional argument to various parse\n    func=
tions of the lxml API.  A default parser is always available\n    and can b=
e replaced by a call to the global function\n    'set_default_parser'.  New=
 parsers can be created at any time\n    without a major run-time overhead.=
\n\n    The keyword arguments in the constructor are mainly based on the\n =
   libxml2 parser configuration.  A DTD will also be loaded if DTD\n    val=
idation or attribute default values are requested (unless you\n    addition=
ally provide an XMLSchema from which the default\n    attributes can be rea=
d).\n\n    Available boolean keyword arguments:\n\n    - attribute_defaults=
 - inject default attributes from DTD or XMLSchema\n    - dtd_validation   =
  - validate against a DTD referenced by the document\n    - load_dtd      =
     - use DTD for parsing\n    - no_network         - prevent network acce=
ss for related files (default: True)\n    - decompress         - automatica=
lly decompress gzip input\n                           (default: False, chan=
ged in lxml 6.0, disabling only affects libxml2 2.15+)\n    - ns_clean     =
      - clean up redundant namespace declarations\n    - recover           =
 - try hard to parse through broken XML\n    - remove_blank_text  - discard=
 blank text nodes that appear ignorable\n    - remove_comments    - discard=
 comments\n    - remove_pis         - discard processing instructions\n    =
- strip_cdata        - replace CDATA sections by normal text content (defau=
lt: True)\n    - compact  ""          - save memory for short text content =
(default: True)\n    - collect_ids        - use a hash table of XML IDs for=
 fast access\n                           (default: True, always True with D=
TD validation)\n    - huge_tree          - disable security restrictions an=
d support very deep trees\n                           and very long text co=
ntent\n\n    Other keyword arguments:\n\n    - resolve_entities - replace e=
ntities by their text value: False for keeping the\n          entity refere=
nces, True for resolving them, and 'internal' for resolving\n          inte=
rnal definitions only (no external file/URL access).\n          The default=
 used to be True and was changed to 'internal' in lxml 5.0.\n    - encoding=
 - override the document encoding (note: libiconv encoding name)\n    - tar=
get   - a parser target object that will receive the parse events\n    - sc=
hema   - an XMLSchema to validate against\n\n    Note that you should avoid=
 sharing parsers between threads.  While this is\n    not harmful, it is mo=
re efficient to use separate parsers.  This does not\n    apply to the defa=
ult parser.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -263506,7 +263506,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_ET=
CompatXMLParser[] =3D {
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_ETCompatXMLParser_slots[] =3D {
+   {Py_tp_dealloc, (void *)__pyx_tp_dealloc_4lxml_5etree__BaseParser},
+-  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue, decompress=3DFalse,                  ns_cle=
an=3DFalse, recover=3DFalse, schema=3DNone,                  huge_tree=3DFa=
lse, remove_blank_text=3DFalse, resolve_entities=3DTrue,                  r=
emove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=3DTrue,              =
    target=3DNone, compact=3DTrue)\n\n    An XML parser with an ElementTree=
 compatible default setup.\n\n    See the XMLParser class for details.\n\n =
   This parser has ``remove_comments`` and ``remove_pis`` enabled by defaul=
t\n    and thus ignores comments and processing instructions.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue, decompress=3DFalse,                  ns_cle=
an=3DFalse, recover=3DFalse, schema=3DNone,                  huge_tree=3DFa=
lse, remove_blank_text=3DFalse, resolve_entities=3D'internal',             =
     remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=3DTrue,        =
          target=3DNone, compact=3DTrue)\n\n    An XML parser with an Eleme=
ntTree compatible default setup.\n\n    See the XMLParser class for details=
.\n\n    This parser has ``remove_comments`` and ``remove_pis`` enabled by =
default\n    and thus ignores comments and processing instructions.\n    ")=
},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_ETCompatXMLParser},
+@@ -263549,7 +263549,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_ETCo=
mpatXMLParser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue, decompress=3DFalse,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3DTrue,                  remove_comments=3DTr=
ue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3DNone, =
compact=3DTrue)\n\n    An XML parser with an ElementTree compatible default=
 setup.\n\n    See the XMLParser class for details.\n\n    This parser has =
``remove_comments`` and ``remove_pis`` enabled by default\n    and thus ign=
ores comments and processing instructions.\n    "), /*tp_doc*/
++  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue, decompress=3DFalse,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3D'internal',                  remove_comment=
s=3DTrue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3D=
None, compact=3DTrue)\n\n    An XML parser with an ElementTree compatible d=
efault setup.\n\n    See the XMLParser class for details.\n\n    This parse=
r has ``remove_comments`` and ``remove_pis`` enabled by default\n    and th=
us ignores comments and processing instructions.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -266739,7 +266739,7 @@ static struct PyGetSetDef __pyx_getsets_4lxml_5e=
tree_iterparse[] =3D {
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_iterparse_slots[] =3D {
+   {Py_tp_dealloc, (void *)__pyx_tp_dealloc_4lxml_5etree_iterparse},
+-  {Py_tp_doc, (void *)PyDoc_STR("iterparse(self, source, events=3D(\"end\=
",), tag=3DNone,                   attribute_defaults=3DFalse, dtd_validati=
on=3DFalse,                   load_dtd=3DFalse, no_network=3DTrue, remove_b=
lank_text=3DFalse,                   remove_comments=3DFalse, remove_pis=3D=
False, encoding=3DNone,                   html=3DFalse, recover=3DNone, hug=
e_tree=3DFalse, schema=3DNone)\n\n    Incremental parser.\n\n    Parses XML=
 into a tree and generates tuples (event, element) in a\n    SAX-like fashi=
on. ``event`` is any of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    F=
or 'start' and 'end', ``element`` is the Element that the parser just\n    =
found opening or closing.  For 'start-ns', it is a tuple (prefix, URI) of\n=
    a new namespace declaration.  For 'end-ns', it is simply None.  Note th=
at\n    all start and end events are guaranteed to be properly nested.\n\n =
   The keyword argument ``events`` specifies a sequence of event type names=
\n    that should be generated.  By default, only 'end' events will be\n   =
 generated.\n\n    The additional ``tag`` argument restricts the 'start' an=
d 'end' events to\n    those elements that match the given tag.  The ``tag`=
` argument can also be\n    a sequence of tags to allow matching more than =
one tag.  By default,\n    events are generated for all elements.  Note tha=
t the 'start-ns' and\n    'end-ns' events are not impacted by this restrict=
ion.\n\n    The other keyword arguments in the constructor are mainly based=
 on the\n    libxml2 parser configuration.  A DTD will also be loaded if va=
lidation or\n    attribute default values are requested.\n\n    Available b=
oolean keyword arguments:\n     - attribute_defaults: read default attribut=
es from DTD\n     - dtd_validation: validate (if DTD is available)\n     - =
load_dtd: use DTD for parsing\n     - no_network: prevent network access fo=
r related files\n     - remove_blank_text: discard blank text nodes\n     -=
 remove_comments: discard comments\n     - remove_pis: discard processing i=
nstructions\n     - strip_cdata: repla""ce CDATA sections by normal text co=
ntent (default: \n       True for XML, ignored otherwise)\n     - compact: =
safe memory for short text content (default: True)\n     - resolve_entities=
: replace entities by their text value (default: True)\n     - huge_tree: d=
isable security restrictions and support very deep trees\n                 =
 and very long text content (only affects libxml2 2.7+)\n     - html: parse=
 input as HTML (default: XML)\n     - recover: try hard to parse through br=
oken input (default: True for HTML,\n                False otherwise)\n\n  =
  Other keyword arguments:\n     - encoding: override the document encoding=
\n     - schema: an XMLSchema to validate against\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("iterparse(self, source, events=3D(\"end\=
",), tag=3DNone,                   attribute_defaults=3DFalse, dtd_validati=
on=3DFalse,                   load_dtd=3DFalse, no_network=3DTrue, remove_b=
lank_text=3DFalse,                   compact=3DTrue, resolve_entities=3D'in=
ternal', remove_comments=3DFalse,                   remove_pis=3DFalse, str=
ip_cdata=3DTrue, encoding=3DNone, html=3DFalse, recover=3DNone, huge_tree=
=3DFalse, schema=3DNone)\n\n    Incremental parser.\n\n    Parses XML into =
a tree and generates tuples (event, element) in a\n    SAX-like fashion. ``=
event`` is any of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    For 'st=
art' and 'end', ``element`` is the Element that the parser just\n    found =
opening or closing.  For 'start-ns', it is a tuple (prefix, URI) of\n    a =
new namespace declaration.  For 'end-ns', it is simply None.  Note that\n  =
  all start and end events are guaranteed to be properly nested.\n\n    The=
 keyword argument ``events`` specifies a sequence of event type names\n    =
that should be generated.  By default, only 'end' events will be\n    gener=
ated.\n\n    The additional ``tag`` argument restricts the 'start' and 'end=
' events to\n    those elements that match the given tag.  The ``tag`` argu=
ment can also be\n    a sequence of tags to allow matching more than one ta=
g.  By default,\n    events are generated for all elements.  Note that the =
'start-ns' and\n    'end-ns' events are not impacted by this restriction.\n=
\n    The other keyword arguments in the constructor are mainly based on th=
e\n    libxml2 parser configuration.  A DTD will also be loaded if validati=
on or\n    attribute default values are requested.\n\n    Available boolean=
 keyword arguments:\n     - attribute_defaults: read default attributes fro=
m DTD\n     - dtd_validation: validate (if DTD is available)\n     - load_d=
td: use DTD for parsing\n     - no_network: prevent network access for rela=
ted files\n     - remove_blank_text: discard blank text nodes\n     - remov=
e_comments: discard comments\n     - remove_pi""s: discard processing instr=
uctions\n     - strip_cdata: replace CDATA sections by normal text content =
(default:\n       True for XML, ignored otherwise)\n     - compact: safe me=
mory for short text content (default: True)\n     - resolve_entities: repla=
ce entities by their text value (default: 'internal' only)\n     - huge_tre=
e: disable security restrictions and support very deep trees\n             =
     and very long text content (only affects libxml2 2.7+)\n     - html: p=
arse input as HTML (default: XML)\n     - recover: try hard to parse throug=
h broken input (default: True for HTML,\n                False otherwise)\n=
\n    Other keyword arguments:\n     - encoding: override the document enco=
ding\n     - schema: an XMLSchema to validate against\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree_iterparse},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree_iterparse},
+   {Py_tp_iter, (void *)__pyx_pw_4lxml_5etree_9iterparse_7__iter__},
+@@ -266785,7 +266785,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_iter=
parse =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("iterparse(self, source, events=3D(\"end\",), tag=3DNone,    =
               attribute_defaults=3DFalse, dtd_validation=3DFalse,         =
          load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=3DFalse,  =
                 remove_comments=3DFalse, remove_pis=3DFalse, encoding=3DNo=
ne,                   html=3DFalse, recover=3DNone, huge_tree=3DFalse, sche=
ma=3DNone)\n\n    Incremental parser.\n\n    Parses XML into a tree and gen=
erates tuples (event, element) in a\n    SAX-like fashion. ``event`` is any=
 of 'start', 'end', 'start-ns',\n    'end-ns'.\n\n    For 'start' and 'end'=
, ``element`` is the Element that the parser just\n    found opening or clo=
sing.  For 'start-ns', it is a tuple (prefix, URI) of\n    a new namespace =
declaration.  For 'end-ns', it is simply None.  Note that\n    all start an=
d end events are guaranteed to be properly nested.\n\n    The keyword argum=
ent ``events`` specifies a sequence of event type names\n    that should be=
 generated.  By default, only 'end' events will be\n    generated.\n\n    T=
he additional ``tag`` argument restricts the 'start' and 'end' events to\n =
   those elements that match the given tag.  The ``tag`` argument can also =
be\n    a sequence of tags to allow matching more than one tag.  By default=
,\n    events are generated for all elements.  Note that the 'start-ns' and=
\n    'end-ns' events are not impacted by this restriction.\n\n    The othe=
r keyword arguments in the constructor are mainly based on the\n    libxml2=
 parser configuration.  A DTD will also be loaded if validation or\n    att=
ribute default values are requested.\n\n    Available boolean keyword argum=
ents:\n     - attribute_defaults: read default attributes from DTD\n     - =
dtd_validation: validate (if DTD is available)\n     - load_dtd: use DTD fo=
r parsing\n     - no_network: prevent network access for related files\n   =
  - remove_blank_text: discard blank text nodes\n     - remove_comments: di=
scard comments\n     - remove_pis: discard processing instructions\n     - =
strip_cdata: repla""ce CDATA sections by normal text content (default: \n  =
     True for XML, ignored otherwise)\n     - compact: safe memory for shor=
t text content (default: True)\n     - resolve_entities: replace entities b=
y their text value (default: True)\n     - huge_tree: disable security rest=
rictions and support very deep trees\n                  and very long text =
content (only affects libxml2 2.7+)\n     - html: parse input as HTML (defa=
ult: XML)\n     - recover: try hard to parse through broken input (default:=
 True for HTML,\n                False otherwise)\n\n    Other keyword argu=
ments:\n     - encoding: override the document encoding\n     - schema: an =
XMLSchema to validate against\n    "), /*tp_doc*/
++  PyDoc_STR("iterparse(self, source, events=3D(\"end\",), tag=3DNone,    =
               attribute_defaults=3DFalse, dtd_validation=3DFalse,         =
          load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=3DFalse,  =
                 compact=3DTrue, resolve_entities=3D'internal', remove_comm=
ents=3DFalse,                   remove_pis=3DFalse, strip_cdata=3DTrue, enc=
oding=3DNone, html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=3DNon=
e)\n\n    Incremental parser.\n\n    Parses XML into a tree and generates t=
uples (event, element) in a\n    SAX-like fashion. ``event`` is any of 'sta=
rt', 'end', 'start-ns',\n    'end-ns'.\n\n    For 'start' and 'end', ``elem=
ent`` is the Element that the parser just\n    found opening or closing.  F=
or 'start-ns', it is a tuple (prefix, URI) of\n    a new namespace declarat=
ion.  For 'end-ns', it is simply None.  Note that\n    all start and end ev=
ents are guaranteed to be properly nested.\n\n    The keyword argument ``ev=
ents`` specifies a sequence of event type names\n    that should be generat=
ed.  By default, only 'end' events will be\n    generated.\n\n    The addit=
ional ``tag`` argument restricts the 'start' and 'end' events to\n    those=
 elements that match the given tag.  The ``tag`` argument can also be\n    =
a sequence of tags to allow matching more than one tag.  By default,\n    e=
vents are generated for all elements.  Note that the 'start-ns' and\n    'e=
nd-ns' events are not impacted by this restriction.\n\n    The other keywor=
d arguments in the constructor are mainly based on the\n    libxml2 parser =
configuration.  A DTD will also be loaded if validation or\n    attribute d=
efault values are requested.\n\n    Available boolean keyword arguments:\n =
    - attribute_defaults: read default attributes from DTD\n     - dtd_vali=
dation: validate (if DTD is available)\n     - load_dtd: use DTD for parsin=
g\n     - no_network: prevent network access for related files\n     - remo=
ve_blank_text: discard blank text nodes\n     - remove_comments: discard co=
mments\n     - remove_pi""s: discard processing instructions\n     - strip_=
cdata: replace CDATA sections by normal text content (default:\n       True=
 for XML, ignored otherwise)\n     - compact: safe memory for short text co=
ntent (default: True)\n     - resolve_entities: replace entities by their t=
ext value (default: 'internal' only)\n     - huge_tree: disable security re=
strictions and support very deep trees\n                  and very long tex=
t content (only affects libxml2 2.7+)\n     - html: parse input as HTML (de=
fault: XML)\n     - recover: try hard to parse through broken input (defaul=
t: True for HTML,\n                False otherwise)\n\n    Other keyword ar=
guments:\n     - encoding: override the document encoding\n     - schema: a=
n XMLSchema to validate against\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree_iterparse, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree_iterparse, /*tp_clear*/
+   0, /*tp_richcompare*/
+diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
+index 42b75249..9319f646 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -6,8 +6,8 @@ cdef class iterparse:
+     """iterparse(self, source, events=3D("end",), tag=3DNone, \
+                   attribute_defaults=3DFalse, dtd_validation=3DFalse, \
+                   load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=
=3DFalse, \
+-                  remove_comments=3DFalse, remove_pis=3DFalse, encoding=
=3DNone, \
+-                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=
=3DNone)
++                  compact=3DTrue, resolve_entities=3D'internal', remove_c=
omments=3DFalse, \
++                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone=
, html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=3DNone)
+=20
+     Incremental parser.
+=20
+@@ -42,10 +42,10 @@ cdef class iterparse:
+      - remove_blank_text: discard blank text nodes
+      - remove_comments: discard comments
+      - remove_pis: discard processing instructions
+-     - strip_cdata: replace CDATA sections by normal text content (defaul=
t:=20
++     - strip_cdata: replace CDATA sections by normal text content (defaul=
t:
+        True for XML, ignored otherwise)
+      - compact: safe memory for short text content (default: True)
+-     - resolve_entities: replace entities by their text value (default: T=
rue)
++     - resolve_entities: replace entities by their text value (default: '=
internal' only)
+      - huge_tree: disable security restrictions and support very deep tre=
es
+                   and very long text content (only affects libxml2 2.7+)
+      - html: parse input as HTML (default: XML)
+@@ -68,7 +68,7 @@ cdef class iterparse:
+     def __init__(self, source, events=3D("end",), *, tag=3DNone,
+                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=
=3DFalse,
+-                 compact=3DTrue, resolve_entities=3DTrue, remove_comments=
=3DFalse,
++                 compact=3DTrue, resolve_entities=3D'internal', remove_co=
mments=3DFalse,
+                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone,
+                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, collect=
_ids=3DTrue,
+                  XMLSchema schema=3DNone):
+diff --git a/src/lxml/parser.pxi b/src/lxml/parser.pxi
+index 3106e610..ba9875c0 100644
+--- a/src/lxml/parser.pxi
++++ b/src/lxml/parser.pxi
+@@ -1584,7 +1584,7 @@ cdef class XMLParser(_FeedParser):
+     """XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, dtd_v=
alidation=3DFalse, \
+                  load_dtd=3DFalse, no_network=3DTrue, decompress=3DFalse,=
 ns_clean=3DFalse, \
+                  recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3D=
False, \
+-                 remove_blank_text=3DFalse, resolve_entities=3DTrue, \
++                 remove_blank_text=3DFalse, resolve_entities=3D'internal'=
, \
+                  remove_comments=3DFalse, remove_pis=3DFalse, strip_cdata=
=3DTrue, \
+                  collect_ids=3DTrue, target=3DNone, compact=3DTrue)
+=20
+@@ -1717,7 +1717,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     """ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=3DFals=
e, \
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue, decompress=3DFalse, \
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone, \
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue, \
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal', \
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue, \
+                  target=3DNone, compact=3DTrue)
+=20
+@@ -1731,7 +1731,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue, decompress=3DFalse,
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue,
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal',
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue,
+                  target=3DNone, compact=3DTrue):
+         XMLParser.__init__(self,
+--=20
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb b/meta/reci=
pes-devtools/python/python3-lxml_6.0.2.bb
index 876fda93b63..75894460ec5 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.0.2.bb
@@ -20,7 +20,9 @@ DEPENDS +=3D "libxml2 libxslt"
=20
 SRC_URI[sha256sum] =3D "cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c=
5cf27f96e0cd62"
=20
-SRC_URI +=3D "${PYPI_SRC_URI}"
+SRC_URI +=3D "${PYPI_SRC_URI} \
+            file://CVE-2026-41066.patch"
+
 inherit pkgconfig pypi setuptools3
=20
 # {standard input}: Assembler messages:

