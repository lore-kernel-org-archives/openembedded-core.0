Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2414CC88E53
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:16:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50975.1789164951348883214
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VAWDV2yO;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so11142515e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164949; x=1789769749; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZZ+YAE/hs0KF7SZXSQyxjN8a0Sr3LiITFFM1iNHgM1g=;
        b=VAWDV2yOKOlsi/7yoBa7etzckwQZL9PIS8itbdJJx3bzj/3URFg7JJ+EQTlJkQp/1a
         rbFF6YoWcSiHwZUwu6WDzD87CrRTzSldVjpAZMG71rPhlkothMofoEEOzfT+cyEkBClf
         aEOBsLXtd23Rw5djetEbHaMPPUNHGzxL6+LgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164949; x=1789769749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZZ+YAE/hs0KF7SZXSQyxjN8a0Sr3LiITFFM1iNHgM1g=;
        b=tTUvCpL4yYVqFfOHHH8M4LMBp06ehYNlLYLamQKmU10qqULC94PopS6WBeV8XZyrY+
         0YvC3y9zvsr6Oh3/007JQ7dqy/t3LQhRLcpgPlO8pUwBEyIcO+nrBEKksgx362V7VBkL
         FMqdsAa4y3wRRwprkS992tX5GJ8YRL0BspJObncGCB8D87CkF+VZZeyO6OI7in57xUsM
         I8zyOeWi/RpxepV8WrDTehFaVX35XT/hThIEY1Q/2FO7vlXv0+5l2t7HRhRntha430KU
         alUZTlWcVv/nCkAF5xEs6YPsNjoS1e7JludtH2zn7AeFeqbY/KBwMRW+dSxNvxqbDe68
         hpzw==
X-Gm-Message-State: AFuF++nVocaBJVarvSVAoOMua9t+Vf105fk0jw4HO4b/edAgeT38BJvo
	drusluQfGHGmCZg8K1cUNzVCZY3zSmfvRHT13F8piAWyOZWM5splPAt/0q2suk31/LZnkZh7TxC
	o3Ylp51c=
X-Gm-Gg: AYBFou0QpBN6ebpqK2tnKK4xBJC53xu75LS6req0cvZu+qVsSGZ2Aj2FzPYVo0DqzW0
	/g7883+mmnvBDZdN22QjUniRNnU8De3Xj9fZegwz2rPMAlMIfeM9JPHCPO55FKC7LCZIebQxKJ3
	xH7FziC9gTk1sfXBp27S4lCVNCO6J9ewOitfWe+w8p6uXSJgQGz5j6p/qQ5YMcGSLLlub6my+/H
	rt+Cz+Eg/otk1Am/8iF3eO2NAdQ97WNEILjg7L5z6cMoVM9HD4+7ccrd7vVWuJ6luG55T0TtYle
	X7+avTvMAdwvUYLBDdZ2S9iGX+4s1akHSzgRvja5XSbPZZahJeabDEroBx37jmqCekbqg9538ZG
	zwTWYrWcQAmrfa9atl5z/91unCsxDuH657G9rCCT4OxD1xxhPoGgsUBaUrgd87oX5gC+8BYaoBm
	ZenpUso7cB98S0ZI7+es11waPGshXC0HUnUr0FusZ6jqnOe4ruWTJeE5BOxzPg1jgE9CwIfiofK
	MbivNPWa0RSwC/LTS/7Cj0iTuBVKhhVhcthP2YOThWUHIzDYxuCPyRZOrCFM3LHGdtuoi0maj7Z
	CdYc9pjSqA==
X-Received: by 2002:a05:600c:3b27:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49e619cc2aemr76560605e9.23.1789164949418;
        Fri, 11 Sep 2026 15:15:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/13] python3-lxml: fix CVE-2026-41066
Date: Sat, 12 Sep 2026 00:15:04 +0200
Message-ID: <1f18d27577b802e65c9d44bb497cbc27eb7f1f1e.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245680

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

Regenerate etree.c with the matching Cython 3.0.9 release.  Keep the
iterparse source layout line-stable so that the generated diff contains
only the functional and documentation changes instead of unrelated
source-location updates.

[1] https://github.com/lxml/lxml/commit/ab431ea0b9a7357d968f1d1c5c614649e9a=
af358
[2] https://github.com/lxml/lxml/security/advisories/GHSA-vfmq-68hx-4jfw

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-lxml/CVE-2026-41066.patch  | 262 ++++++++++++++++++
 .../python/python3-lxml_5.0.2.bb              |   4 +-
 2 files changed, 265 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-lxml/CVE-2026-4106=
6.patch

diff --git a/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch=
 b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
new file mode 100644
index 00000000000..a58a0734723
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-lxml/CVE-2026-41066.patch
@@ -0,0 +1,262 @@
+From 4fe0735416504223919151aa43c8ccba4626597f Mon Sep 17 00:00:00 2001
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
+- Keep the lxml 5.0.2 XMLParser signature without decompress.
+- Keep the iterparse documentation and signature changes on existing
+  source lines, avoiding unrelated Cython source-location changes in
+  etree.c.
+- Regenerate src/lxml/etree.c with Cython 3.0.9 using Python 3.12:
+  python3.12 setup.py build_ext -i --with-cython --warnings -j1.
+  The command was run from an otherwise clean lxml 5.0.2 source tree
+  after applying the .pxi changes; the generated C file is retained
+  because the Scarthgap recipe does not depend on Cython at build time.
+
+(cherry picked from commit ab431ea0b9a7357d968f1d1c5c614649e9aaf358)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ src/lxml/etree.c       | 40 ++++++++++++++++++++--------------------
+ src/lxml/iterparse.pxi |  6 +++---
+ src/lxml/parser.pxi    |  6 +++---
+ 3 files changed, 26 insertions(+), 26 deletions(-)
+
+diff --git a/src/lxml/etree.c b/src/lxml/etree.c
+index 6012a1b..41b3c45 100644
+--- a/src/lxml/etree.c
++++ b/src/lxml/etree.c
+@@ -3146,7 +3146,7 @@ struct __pyx_obj_4lxml_5etree__FeedParser {
+  *     )
+  *=20
+  * cdef class XMLParser(_FeedParser):             # <<<<<<<<<<<<<<
+- *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_=
pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=
=3DTrue)
++ *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, r=
emove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, c=
ompact=3DTrue)
+  *=20
+  */
+ struct __pyx_obj_4lxml_5etree_XMLParser {
+@@ -5424,7 +5424,7 @@ static struct __pyx_vtabstruct_4lxml_5etree__FeedPar=
ser *__pyx_vtabptr_4lxml_5et
+  *     )
+  *=20
+  * cdef class XMLParser(_FeedParser):             # <<<<<<<<<<<<<<
+- *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_=
pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=
=3DTrue)
++ *     u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, d=
td_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFals=
e, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_bl=
ank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, r=
emove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, c=
ompact=3DTrue)
+  *=20
+  */
+=20
+@@ -142620,7 +142620,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,             # <<<<<<<<<<<<<<
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  */
+     values[2] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[3] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -142630,7 +142630,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+  *     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,    =
         # <<<<<<<<<<<<<<
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  */
+     values[5] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -142640,17 +142640,17 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXML=
Parser_1__init__(PyObject *__pyx_v
+     /* "src/lxml/parser.pxi":1703
+  *                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue,
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,             # <<<<<<<<<<<<<<
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',             # <<<<<<<<<<<<<<
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):
+  */
+     values[8] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+-    values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
++    values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)__pyx_n_s_intern=
al));
+=20
+     /* "src/lxml/parser.pxi":1704
+  *                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,             # <<<<<<<<<<<<<<
+  *                  target=3DNone, compact=3DTrue):
+  *         XMLParser.__init__(self,
+@@ -142660,7 +142660,7 @@ static int __pyx_pw_4lxml_5etree_17ETCompatXMLPa=
rser_1__init__(PyObject *__pyx_v
+     values[13] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+=20
+     /* "src/lxml/parser.pxi":1705
+- *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,
++ *                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',
+  *                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdat=
a=3DTrue,
+  *                  target=3DNone, compact=3DTrue):             # <<<<<<<=
<<<<<<<
+  *         XMLParser.__init__(self,
+@@ -191418,7 +191418,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,  =
           # <<<<<<<<<<<<<<
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  */
+     values[3] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+     values[4] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -191427,7 +191427,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+  *     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
+  *                  attribute_defaults=3DFalse, dtd_validation=3DFalse,
+  *                  load_dtd=3DFalse, no_network=3DTrue, remove_blank_tex=
t=3DFalse,             # <<<<<<<<<<<<<<
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  */
+     values[5] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+@@ -191437,17 +191437,17 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1_=
_init__(PyObject *__pyx_v_self, Py
+     /* "src/lxml/iterparse.pxi":70
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
+  */
+     values[8] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
+-    values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_True));
++    values[9] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)__pyx_n_s_interna=
l));
+     values[10] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_False));
+=20
+     /* "src/lxml/iterparse.pxi":71
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
+@@ -191457,7 +191457,7 @@ static int __pyx_pw_4lxml_5etree_9iterparse_1__i=
nit__(PyObject *__pyx_v_self, Py
+     values[13] =3D __Pyx_Arg_NewRef_VARARGS(((PyObject *)Py_None));
+=20
+     /* "src/lxml/iterparse.pxi":72
+- *                  compact=3DTrue, resolve_entities=3DTrue, remove_comme=
nts=3DFalse,
++ *                  compact=3DTrue, resolve_entities=3D'internal', remove=
_comments=3DFalse,
+  *                  remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNo=
ne,
+  *                  html=3DFalse, recover=3DNone, huge_tree=3DFalse, coll=
ect_ids=3DTrue,             # <<<<<<<<<<<<<<
+  *                  XMLSchema schema=3DNone):
+@@ -263534,7 +263534,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_XM=
LParser[] =3D {
+ };
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_XMLParser_slots[] =3D {
+-  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, ns_clean=3DFalse, recover=3DFalse, schema: XMLSchema =3DNone, huge=
_tree=3DFalse, remove_blank_text=3DFalse, resolve_entities=3DTrue, remove_c=
omments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue=
, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n    Parsers can =
be supplied as additional argument to various parse\n    functions of the l=
xml API.  A default parser is always available\n    and can be replaced by =
a call to the global function\n    'set_default_parser'.  New parsers can b=
e created at any time\n    without a major run-time overhead.\n\n    The ke=
yword arguments in the constructor are mainly based on the\n    libxml2 par=
ser configuration.  A DTD will also be loaded if DTD\n    validation or att=
ribute default values are requested (unless you\n    additionally provide a=
n XMLSchema from which the default\n    attributes can be read).\n\n    Ava=
ilable boolean keyword arguments:\n\n    - attribute_defaults - inject defa=
ult attributes from DTD or XMLSchema\n    - dtd_validation     - validate a=
gainst a DTD referenced by the document\n    - load_dtd           - use DTD=
 for parsing\n    - no_network         - prevent network access for related=
 files (default: True)\n    - ns_clean           - clean up redundant names=
pace declarations\n    - recover            - try hard to parse through bro=
ken XML\n    - remove_blank_text  - discard blank text nodes that appear ig=
norable\n    - remove_comments    - discard comments\n    - remove_pis     =
    - discard processing instructions\n    - strip_cdata        - replace C=
DATA sections by normal text content (default: True)\n    - compact        =
    - save memory for short text content (default: True)\n    - collect_ids=
        - use a hash table of XML IDs for fast access (default: True, alway=
s True with DTD validation)\n    - huge_tree          - disable security re=
strictions and support very deep trees\n      ""                     and ve=
ry long text content (only affects libxml2 2.7+)\n\n    Other keyword argum=
ents:\n\n    - resolve_entities - replace entities by their text value: Fal=
se for keeping the\n          entity references, True for resolving them, a=
nd 'internal' for resolving\n          internal definitions only (no extern=
al file/URL access).\n          The default used to be True and was changed=
 to 'internal' in lxml 5.0.\n    - encoding - override the document encodin=
g (note: libiconv encoding name)\n    - target   - a parser target object t=
hat will receive the parse events\n    - schema   - an XMLSchema to validat=
e against\n\n    Note that you should avoid sharing parsers between threads=
.  While this is\n    not harmful, it is more efficient to use separate par=
sers.  This does not\n    apply to the default parser.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("XMLParser(self, encoding=3DNone, attribu=
te_defaults=3DFalse, dtd_validation=3DFalse, load_dtd=3DFalse, no_network=
=3DTrue, ns_clean=3DFalse, recover=3DFalse, schema: XMLSchema =3DNone, huge=
_tree=3DFalse, remove_blank_text=3DFalse, resolve_entities=3D'internal', re=
move_comments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=
=3DTrue, target=3DNone, compact=3DTrue)\n\n    The XML parser.\n\n    Parse=
rs can be supplied as additional argument to various parse\n    functions o=
f the lxml API.  A default parser is always available\n    and can be repla=
ced by a call to the global function\n    'set_default_parser'.  New parser=
s can be created at any time\n    without a major run-time overhead.\n\n   =
 The keyword arguments in the constructor are mainly based on the\n    libx=
ml2 parser configuration.  A DTD will also be loaded if DTD\n    validation=
 or attribute default values are requested (unless you\n    additionally pr=
ovide an XMLSchema from which the default\n    attributes can be read).\n\n=
    Available boolean keyword arguments:\n\n    - attribute_defaults - inje=
ct default attributes from DTD or XMLSchema\n    - dtd_validation     - val=
idate against a DTD referenced by the document\n    - load_dtd           - =
use DTD for parsing\n    - no_network         - prevent network access for =
related files (default: True)\n    - ns_clean           - clean up redundan=
t namespace declarations\n    - recover            - try hard to parse thro=
ugh broken XML\n    - remove_blank_text  - discard blank text nodes that ap=
pear ignorable\n    - remove_comments    - discard comments\n    - remove_p=
is         - discard processing instructions\n    - strip_cdata        - re=
place CDATA sections by normal text content (default: True)\n    - compact =
           - save memory for short text content (default: True)\n    - coll=
ect_ids        - use a hash table of XML IDs for fast access (default: True=
, always True with DTD validation)\n    - huge_tree          - disable secu=
rity restrictions and support very deep trees""\n                          =
 and very long text content (only affects libxml2 2.7+)\n\n    Other keywor=
d arguments:\n\n    - resolve_entities - replace entities by their text val=
ue: False for keeping the\n          entity references, True for resolving =
them, and 'internal' for resolving\n          internal definitions only (no=
 external file/URL access).\n          The default used to be True and was =
changed to 'internal' in lxml 5.0.\n    - encoding - override the document =
encoding (note: libiconv encoding name)\n    - target   - a parser target o=
bject that will receive the parse events\n    - schema   - an XMLSchema to =
validate against\n\n    Note that you should avoid sharing parsers between =
threads.  While this is\n    not harmful, it is more efficient to use separ=
ate parsers.  This does not\n    apply to the default parser.\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_XMLParser},
+@@ -263582,7 +263582,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_XMLP=
arser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFa=
lse, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_=
blank_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remov=
e_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compa=
ct=3DTrue)\n\n    The XML parser.\n\n    Parsers can be supplied as additio=
nal argument to various parse\n    functions of the lxml API.  A default pa=
rser is always available\n    and can be replaced by a call to the global f=
unction\n    'set_default_parser'.  New parsers can be created at any time\=
n    without a major run-time overhead.\n\n    The keyword arguments in the=
 constructor are mainly based on the\n    libxml2 parser configuration.  A =
DTD will also be loaded if DTD\n    validation or attribute default values =
are requested (unless you\n    additionally provide an XMLSchema from which=
 the default\n    attributes can be read).\n\n    Available boolean keyword=
 arguments:\n\n    - attribute_defaults - inject default attributes from DT=
D or XMLSchema\n    - dtd_validation     - validate against a DTD reference=
d by the document\n    - load_dtd           - use DTD for parsing\n    - no=
_network         - prevent network access for related files (default: True)=
\n    - ns_clean           - clean up redundant namespace declarations\n   =
 - recover            - try hard to parse through broken XML\n    - remove_=
blank_text  - discard blank text nodes that appear ignorable\n    - remove_=
comments    - discard comments\n    - remove_pis         - discard processi=
ng instructions\n    - strip_cdata        - replace CDATA sections by norma=
l text content (default: True)\n    - compact            - save memory for =
short text content (default: True)\n    - collect_ids        - use a hash t=
able of XML IDs for fast access (default: True, always True with DTD valida=
tion)\n    - huge_tree          - disable security restrictions and support=
 very deep trees\n      ""                     and very long text content (=
only affects libxml2 2.7+)\n\n    Other keyword arguments:\n\n    - resolve=
_entities - replace entities by their text value: False for keeping the\n  =
        entity references, True for resolving them, and 'internal' for reso=
lving\n          internal definitions only (no external file/URL access).\n=
          The default used to be True and was changed to 'internal' in lxml=
 5.0.\n    - encoding - override the document encoding (note: libiconv enco=
ding name)\n    - target   - a parser target object that will receive the p=
arse events\n    - schema   - an XMLSchema to validate against\n\n    Note =
that you should avoid sharing parsers between threads.  While this is\n    =
not harmful, it is more efficient to use separate parsers.  This does not\n=
    apply to the default parser.\n    "), /*tp_doc*/
++  PyDoc_STR("XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse,=
 dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFa=
lse, recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_=
blank_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse,=
 remove_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone,=
 compact=3DTrue)\n\n    The XML parser.\n\n    Parsers can be supplied as a=
dditional argument to various parse\n    functions of the lxml API.  A defa=
ult parser is always available\n    and can be replaced by a call to the gl=
obal function\n    'set_default_parser'.  New parsers can be created at any=
 time\n    without a major run-time overhead.\n\n    The keyword arguments =
in the constructor are mainly based on the\n    libxml2 parser configuratio=
n.  A DTD will also be loaded if DTD\n    validation or attribute default v=
alues are requested (unless you\n    additionally provide an XMLSchema from=
 which the default\n    attributes can be read).\n\n    Available boolean k=
eyword arguments:\n\n    - attribute_defaults - inject default attributes f=
rom DTD or XMLSchema\n    - dtd_validation     - validate against a DTD ref=
erenced by the document\n    - load_dtd           - use DTD for parsing\n  =
  - no_network         - prevent network access for related files (default:=
 True)\n    - ns_clean           - clean up redundant namespace declaration=
s\n    - recover            - try hard to parse through broken XML\n    - r=
emove_blank_text  - discard blank text nodes that appear ignorable\n    - r=
emove_comments    - discard comments\n    - remove_pis         - discard pr=
ocessing instructions\n    - strip_cdata        - replace CDATA sections by=
 normal text content (default: True)\n    - compact            - save memor=
y for short text content (default: True)\n    - collect_ids        - use a =
hash table of XML IDs for fast access (default: True, always True with DTD =
validation)\n    - huge_tree          - disable security restrictions and s=
upport very deep trees""\n                           and very long text con=
tent (only affects libxml2 2.7+)\n\n    Other keyword arguments:\n\n    - r=
esolve_entities - replace entities by their text value: False for keeping t=
he\n          entity references, True for resolving them, and 'internal' fo=
r resolving\n          internal definitions only (no external file/URL acce=
ss).\n          The default used to be True and was changed to 'internal' i=
n lxml 5.0.\n    - encoding - override the document encoding (note: libicon=
v encoding name)\n    - target   - a parser target object that will receive=
 the parse events\n    - schema   - an XMLSchema to validate against\n\n   =
 Note that you should avoid sharing parsers between threads.  While this is=
\n    not harmful, it is more efficient to use separate parsers.  This does=
 not\n    apply to the default parser.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -263763,7 +263763,7 @@ static PyMethodDef __pyx_methods_4lxml_5etree_ET=
CompatXMLParser[] =3D {
+ };
+ #if CYTHON_USE_TYPE_SPECS
+ static PyType_Slot __pyx_type_4lxml_5etree_ETCompatXMLParser_slots[] =3D {
+-  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3DTrue,                  remove_comments=3DTr=
ue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3DNone, =
compact=3DTrue)\n\n    An XML parser with an ElementTree compatible default=
 setup.\n\n    See the XMLParser class for details.\n\n    This parser has =
``remove_comments`` and ``remove_pis`` enabled by default\n    and thus ign=
ores comments and processing instructions.\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone,=
 attribute_defaults=3DFalse,                  dtd_validation=3DFalse, load_=
dtd=3DFalse, no_network=3DTrue,                  ns_clean=3DFalse, recover=
=3DFalse, schema=3DNone,                  huge_tree=3DFalse, remove_blank_t=
ext=3DFalse, resolve_entities=3D'internal',                  remove_comment=
s=3DTrue, remove_pis=3DTrue, strip_cdata=3DTrue,                  target=3D=
None, compact=3DTrue)\n\n    An XML parser with an ElementTree compatible d=
efault setup.\n\n    See the XMLParser class for details.\n\n    This parse=
r has ``remove_comments`` and ``remove_pis`` enabled by default\n    and th=
us ignores comments and processing instructions.\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree__BaseParser},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree__BaseParser},
+   {Py_tp_methods, (void *)__pyx_methods_4lxml_5etree_ETCompatXMLParser},
+@@ -263811,7 +263811,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_ETCo=
mpatXMLParser =3D {
+   0, /*tp_setattro*/
+   0, /*tp_as_buffer*/
+   Py_TPFLAGS_DEFAULT|Py_TPFLAGS_HAVE_VERSION_TAG|Py_TPFLAGS_CHECKTYPES|Py=
_TPFLAGS_HAVE_NEWBUFFER|Py_TPFLAGS_BASETYPE|Py_TPFLAGS_HAVE_GC, /*tp_flags*/
+-  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue,                  ns_clean=3DFalse, recover=3DFalse, schema=3DN=
one,                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3DTrue,                  remove_comments=3DTrue, remove_pis=3DTru=
e, strip_cdata=3DTrue,                  target=3DNone, compact=3DTrue)\n\n =
   An XML parser with an ElementTree compatible default setup.\n\n    See t=
he XMLParser class for details.\n\n    This parser has ``remove_comments`` =
and ``remove_pis`` enabled by default\n    and thus ignores comments and pr=
ocessing instructions.\n    "), /*tp_doc*/
++  PyDoc_STR("ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=
=3DFalse,                  dtd_validation=3DFalse, load_dtd=3DFalse, no_net=
work=3DTrue,                  ns_clean=3DFalse, recover=3DFalse, schema=3DN=
one,                  huge_tree=3DFalse, remove_blank_text=3DFalse, resolve=
_entities=3D'internal',                  remove_comments=3DTrue, remove_pis=
=3DTrue, strip_cdata=3DTrue,                  target=3DNone, compact=3DTrue=
)\n\n    An XML parser with an ElementTree compatible default setup.\n\n   =
 See the XMLParser class for details.\n\n    This parser has ``remove_comme=
nts`` and ``remove_pis`` enabled by default\n    and thus ignores comments =
and processing instructions.\n    "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree__BaseParser, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree__BaseParser, /*tp_clear*/
+   0, /*tp_richcompare*/
+@@ -267005,7 +267005,7 @@ static struct PyGetSetDef __pyx_getsets_4lxml_5e=
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
ntent (default: True)\n     - compact: safe memory for short text content (=
default: True)\n     - resolve_entities: replace entities by their text val=
ue (default: True)\n     - huge_tree: disable security restrictions and sup=
port very deep trees\n                  and very long text content (only af=
fects libxml2 2.7+)\n     - html: parse input as HTML (default: XML)\n     =
- recover: try hard to parse through broken input (default: True for HTML,\=
n                False otherwise)\n\n    Other keyword arguments:\n     - e=
ncoding: override the document encoding\n     - schema: an XMLSchema to val=
idate against\n    ")},
++  {Py_tp_doc, (void *)PyDoc_STR("iterparse(self, source, events=3D(\"end\=
",), tag=3DNone,                   attribute_defaults=3DFalse, dtd_validati=
on=3DFalse,                   load_dtd=3DFalse, no_network=3DTrue, remove_b=
lank_text=3DFalse,                   compact=3DTrue, resolve_entities=3D'in=
ternal', remove_comments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, e=
ncoding=3DNone,                   html=3DFalse, recover=3DNone, huge_tree=
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
(default: True)\n     - compact: safe memory for short text content (defaul=
t: True)\n     - resolve_entities: replace entities by their text value (de=
fault: 'internal' only)\n     - huge_tree: disable security restrictions an=
d support very deep trees\n                  and very long text content (on=
ly affects libxml2 2.7+)\n     - html: parse input as HTML (default: XML)\n=
     - recover: try hard to parse through broken input (default: True for H=
TML,\n                False otherwise)\n\n    Other keyword arguments:\n   =
  - encoding: override the document encoding\n     - schema: an XMLSchema t=
o validate against\n    ")},
+   {Py_tp_traverse, (void *)__pyx_tp_traverse_4lxml_5etree_iterparse},
+   {Py_tp_clear, (void *)__pyx_tp_clear_4lxml_5etree_iterparse},
+   {Py_tp_iter, (void *)__pyx_pw_4lxml_5etree_9iterparse_7__iter__},
+@@ -267056,7 +267056,7 @@ static PyTypeObject __pyx_type_4lxml_5etree_iter=
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
strip_cdata: repla""ce CDATA sections by normal text content (default: True=
)\n     - compact: safe memory for short text content (default: True)\n    =
 - resolve_entities: replace entities by their text value (default: True)\n=
     - huge_tree: disable security restrictions and support very deep trees=
\n                  and very long text content (only affects libxml2 2.7+)\=
n     - html: parse input as HTML (default: XML)\n     - recover: try hard =
to parse through broken input (default: True for HTML,\n                Fal=
se otherwise)\n\n    Other keyword arguments:\n     - encoding: override th=
e document encoding\n     - schema: an XMLSchema to validate against\n    "=
), /*tp_doc*/
++  PyDoc_STR("iterparse(self, source, events=3D(\"end\",), tag=3DNone,    =
               attribute_defaults=3DFalse, dtd_validation=3DFalse,         =
          load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=3DFalse,  =
                 compact=3DTrue, resolve_entities=3D'internal', remove_comm=
ents=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone,     =
              html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=3DNon=
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
cdata: replace CDATA sections by normal text content (default: True)\n     =
- compact: safe memory for short text content (default: True)\n     - resol=
ve_entities: replace entities by their text value (default: 'internal' only=
)\n     - huge_tree: disable security restrictions and support very deep tr=
ees\n                  and very long text content (only affects libxml2 2.7=
+)\n     - html: parse input as HTML (default: XML)\n     - recover: try ha=
rd to parse through broken input (default: True for HTML,\n                =
False otherwise)\n\n    Other keyword arguments:\n     - encoding: override=
 the document encoding\n     - schema: an XMLSchema to validate against\n  =
  "), /*tp_doc*/
+   __pyx_tp_traverse_4lxml_5etree_iterparse, /*tp_traverse*/
+   __pyx_tp_clear_4lxml_5etree_iterparse, /*tp_clear*/
+   0, /*tp_richcompare*/
+diff --git a/src/lxml/iterparse.pxi b/src/lxml/iterparse.pxi
+index 2758b14..d8fc02f 100644
+--- a/src/lxml/iterparse.pxi
++++ b/src/lxml/iterparse.pxi
+@@ -6,7 +6,7 @@ cdef class iterparse:
+     u"""iterparse(self, source, events=3D("end",), tag=3DNone, \
+                   attribute_defaults=3DFalse, dtd_validation=3DFalse, \
+                   load_dtd=3DFalse, no_network=3DTrue, remove_blank_text=
=3DFalse, \
+-                  remove_comments=3DFalse, remove_pis=3DFalse, encoding=
=3DNone, \
++                  compact=3DTrue, resolve_entities=3D'internal', remove_c=
omments=3DFalse, remove_pis=3DFalse, strip_cdata=3DTrue, encoding=3DNone, \
+                   html=3DFalse, recover=3DNone, huge_tree=3DFalse, schema=
=3DNone)
+=20
+     Incremental parser.
+@@ -44,7 +44,7 @@ cdef class iterparse:
+      - remove_pis: discard processing instructions
+      - strip_cdata: replace CDATA sections by normal text content (defaul=
t: True)
+      - compact: safe memory for short text content (default: True)
+-     - resolve_entities: replace entities by their text value (default: T=
rue)
++     - resolve_entities: replace entities by their text value (default: '=
internal' only)
+      - huge_tree: disable security restrictions and support very deep tre=
es
+                   and very long text content (only affects libxml2 2.7+)
+      - html: parse input as HTML (default: XML)
+@@ -67,7 +67,7 @@ cdef class iterparse:
+     def __init__(self, source, events=3D(u"end",), *, tag=3DNone,
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
+index e9f4bec..bded239 100644
+--- a/src/lxml/parser.pxi
++++ b/src/lxml/parser.pxi
+@@ -1564,7 +1564,7 @@ _XML_DEFAULT_PARSE_OPTIONS =3D (
+     )
+=20
+ cdef class XMLParser(_FeedParser):
+-    u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, dtd_=
validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFalse, =
recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_blank=
_text=3DFalse, resolve_entities=3DTrue, remove_comments=3DFalse, remove_pis=
=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, compact=3D=
True)
++    u"""XMLParser(self, encoding=3DNone, attribute_defaults=3DFalse, dtd_=
validation=3DFalse, load_dtd=3DFalse, no_network=3DTrue, ns_clean=3DFalse, =
recover=3DFalse, schema: XMLSchema =3DNone, huge_tree=3DFalse, remove_blank=
_text=3DFalse, resolve_entities=3D'internal', remove_comments=3DFalse, remo=
ve_pis=3DFalse, strip_cdata=3DTrue, collect_ids=3DTrue, target=3DNone, comp=
act=3DTrue)
+=20
+     The XML parser.
+=20
+@@ -1686,7 +1686,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     u"""ETCompatXMLParser(self, encoding=3DNone, attribute_defaults=3DFal=
se, \
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue, \
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone, \
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue, \
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal', \
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue, \
+                  target=3DNone, compact=3DTrue)
+=20
+@@ -1700,7 +1700,7 @@ cdef class ETCompatXMLParser(XMLParser):
+     def __init__(self, *, encoding=3DNone, attribute_defaults=3DFalse,
+                  dtd_validation=3DFalse, load_dtd=3DFalse, no_network=3DT=
rue,
+                  ns_clean=3DFalse, recover=3DFalse, schema=3DNone,
+-                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3DTrue,
++                 huge_tree=3DFalse, remove_blank_text=3DFalse, resolve_en=
tities=3D'internal',
+                  remove_comments=3DTrue, remove_pis=3DTrue, strip_cdata=
=3DTrue,
+                  target=3DNone, compact=3DTrue):
+         XMLParser.__init__(self,
diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.2.bb b/meta/reci=
pes-devtools/python/python3-lxml_5.0.2.bb
index c0b385c7ea8..2d2d55202c0 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
@@ -20,7 +20,9 @@ DEPENDS +=3D "libxml2 libxslt"
=20
 SRC_URI[sha256sum] =3D "6399703c40ba53e2c3b72fdb56cb908d2b83c08082ecf17de8=
39b27e68d1e598"
=20
-SRC_URI +=3D "${PYPI_SRC_URI}"
+SRC_URI +=3D "${PYPI_SRC_URI} \
+            file://CVE-2026-41066.patch \
+           "
 inherit pkgconfig pypi setuptools3
=20
 # {standard input}: Assembler messages:

