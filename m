Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B609F4643B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46609.1773653415340466279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Njsb2s8I;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so26031835e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653413; x=1774258213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AD+PdVkD+iM+2kwBDqgfvInF9P1CbMP4CpbvfmdJf70=;
        b=Njsb2s8IttpzOXNaFengvZ6/NLJQUaNikOCxJFzOba3hHlP/8eghlmsh6UCZbFK2CY
         usgCa8ulAdKqHCmmMwO2J/Qb2FpRFFZPzu/pjjg/jTneW8BoYo+pA+5nj68v37/Uvm+q
         S/YiP3i74V7sQYETUklCxQB595jJtWoSfH/A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653413; x=1774258213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AD+PdVkD+iM+2kwBDqgfvInF9P1CbMP4CpbvfmdJf70=;
        b=s1sfwOM5555Yriw+H9RK4Mwdgx4ytK6C+iSKa7Sv1SV34Vmf5XpzJ9QVKw9WiDXY57
         vKNR7otigjxGOPRRhnFyQOBL0M5BIxgS+lF0ImOOA6oTSqLAoP+dKpXD1hoe+4UsuC5l
         Nw9ya+yMjXLdo6JEm1QeRdO669cggCtjlcUUULKJfpzZU2YajTlBZt3pKTklOwcu7DCG
         JHpN7G/1enionVNw3nNNTS1HXxrNXcRnq3OS3ROtj2nqXb1s4JzaA5mwtgzkAZhqyG9g
         lQqke2ZMhMVkekimCbovVYZpDEwwKaHfdKVwguQEdPjkqRHBFmhRrZS320HU2vdQuWYh
         YScg==
X-Gm-Message-State: AOJu0Yz9vrI8yQB3DR+P4ZKDs9LwnDo+XEwSvzjcaR7m8mUNtxl5OdfB
	5qNdoCt+l5TKuCk/F4opDxvU59eb2PxMQ1HaUg2AEgRElbYt372lcBsmb08otGyNm7HbfALB5cA
	0WA3i
X-Gm-Gg: ATEYQzyPaAht7qcyEop4kkeddQeajqGIJNdVtfOinriKuYnrUx+WSCJuOkM0oDvat2T
	IOnjnMQFJPiRf/zwRGaoy558LeQnCDwxVVQyoe5UfYHVWZHxxUJVaScRG1dHAUT3+egThV4zOtR
	quvPTOe5VcqF9ptN/cJknwSlcoqwRdlUq1gv0fUTE9XC8FeWHrRMEB5zbS3asAZ4M92C0frM5iC
	W2zyTnFHaqswtXvX81h8MWxem14OvJXV0+xsfXsC/HEnNzWJoykQpY+P79mBSzQIoDD8bV3GXOP
	SVnZbhVCvS2ytF0LAeh5/2U4bPTXChXwM0Q0jXipjwjtsxProteOhLCS9DllXtQfx6hUqNQVGrB
	9hTdNg4qEc/udBT0ul20CWFmvBF1xvApsFH5mCPrcIMJHwJaSWhCB2uULdTlqxgNtRuJOsO3eWq
	gApPhAwsRJihIDY+vasUXen15MXtnWuiaP8Htz//rMaOedX45MfwEpzDWIP9uvn52esaLtFm7pz
	2RkPmDcWOm30A+pIFIIHRiy/zSNRNqsoA==
X-Received: by 2002:a05:600c:3552:b0:485:3a59:99ca with SMTP id 5b1f17b1804b1-485566fab0bmr198447035e9.16.1773653413386;
        Mon, 16 Mar 2026 02:30:13 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/17] createrepo-c: Fix createrepo-c-native build on GCC14 hosts (e.g. Fedora 41)
Date: Mon, 16 Mar 2026 10:28:36 +0100
Message-ID: <ec995339f1f4143616f1b13814899acaf137b0b5.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233239

From: Yoann Congal <yoann.congal@smile.fr>

This version of createrepo-c does a wrong pointer assignment, and on GCC14[0]
hosts (e.g. Fedora 41), this fails to build with:
  FAILED: src/python/CMakeFiles/_createrepo_c.dir/createrepo_cmodule.c.o
  build/tmp-glibc/hosttools/gcc [...] python/createrepo_cmodule.c
  python/createrepo_cmodule.c:82:41: error: initialization of ‘PyObject * (*)(PyObject *, PyObject *)’ {aka ‘struct _object * (*)(struct _object *, struct _object *)’} from incompatible pointer type ‘PyObject * (*)(PyObject *, PyObject *, PyObject *)’ {aka ‘struct _object * (*)(struct _object *, struct _object *, struct _object *)’} [-Wincompatible-pointer-types]
     82 |     {"xml_parse_main_metadata_together",(PyCFunctionWithKeywords)py_xml_parse_main_metadata_together,
        |                                         ^
  src/python/createrepo_cmodule.c:82:41: note: (near initialization for ‘createrepo_c_methods[15].ml_meth’)

Add a patch to fix the pointer assignment. The patched code has since
been removed by upstream.

[0]: https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-proper-cast-for-PyMethodDef.ml_meth.patch | 41 +++++++++++++++++++
 .../createrepo-c/createrepo-c_0.19.0.bb       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch
new file mode 100644
index 00000000000..fc09fdfcdd8
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch
@@ -0,0 +1,41 @@
+From d2dd32bcdcc717a0da48d5e983c4396ccc79fc9c Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sun, 15 Mar 2026 23:25:16 +0100
+Subject: [PATCH] Use proper cast for PyMethodDef.ml_meth
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+PyMethodDef.ml_meth is of PyCFunction type. Using a
+PyCFunctionWithKeywords cast for its initializer trigger build failure
+with GCC >=14 [0]:
+| FAILED: src/python/CMakeFiles/_createrepo_c.dir/createrepo_cmodule.c.o
+| build/tmp-glibc/hosttools/gcc [...] python/createrepo_cmodule.c
+| python/createrepo_cmodule.c:82:41: error: initialization of ‘PyObject * (*)(PyObject *, PyObject *)’ {aka ‘struct _object * (*)(struct _object *, struct _object *)’} from incompatible pointer type ‘PyObject * (*)(PyObject *, PyObject *, PyObject *)’ {aka ‘struct _object * (*)(struct _object *, struct _object *, struct _object *)’} [-Wincompatible-pointer-types]
+|    82 |     {"xml_parse_main_metadata_together",(PyCFunctionWithKeywords)py_xml_parse_main_metadata_together,
+|       |                                         ^
+| src/python/createrepo_cmodule.c:82:41: note: (near initialization for ‘createrepo_c_methods[15].ml_meth’)
+
+Fix this by using the proper (PyCFunction) cast.
+
+[0]: https://gcc.gnu.org/gcc-14/porting_to.html#incompatible-pointer-types
+
+Upstream-Status: Inappropriate [Upstream removed the patched code in 7092ab2 (Remove python bindings for xml_parse_main_metadata_together, 2022-03-17)]
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ src/python/createrepo_cmodule.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/python/createrepo_cmodule.c b/src/python/createrepo_cmodule.c
+index c0b9200..94a206d 100644
+--- a/src/python/createrepo_cmodule.c
++++ b/src/python/createrepo_cmodule.c
+@@ -79,7 +79,7 @@ static struct PyMethodDef createrepo_c_methods[] = {
+         METH_VARARGS, xml_parse_repomd__doc__},
+     {"xml_parse_updateinfo",    (PyCFunction)py_xml_parse_updateinfo,
+         METH_VARARGS, xml_parse_updateinfo__doc__},
+-    {"xml_parse_main_metadata_together",(PyCFunctionWithKeywords)py_xml_parse_main_metadata_together,
++    {"xml_parse_main_metadata_together",(PyCFunction)py_xml_parse_main_metadata_together,
+         METH_VARARGS | METH_KEYWORDS, xml_parse_main_metadata_together__doc__},
+     {"checksum_name_str",       (PyCFunction)py_checksum_name_str,
+         METH_VARARGS, checksum_name_str__doc__},
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
index 82351252e5a..dec882fddc6 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-Use-proper-cast-for-PyMethodDef.ml_meth.patch \
            "
 
 SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"

