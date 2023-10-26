Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA96CC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 10:51:15 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.197282.1698317470445536598
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 03:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AhecsJuA;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-507a3b8b113so1048523e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 03:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698317468; x=1698922268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F1weNQUYpAyG6P5aWvJBQH7jJdUNYaPzWCR4tj3G6Cs=;
        b=AhecsJuAJozVmBFkGSZnykHeSZLOgOWST3m9XwL2sLnHw6O6x7bZhmcidaU9hmrm5f
         nWDQlg5acbpmUm3aLsDrKyi0pleOkWg+WS4hsaqyY2bMio85sK7rBAu4zjo39G+7twhd
         RRXDvH0MTDjy/VXoQC/GFTm6KjblRTS3zqodkViAXb2cYwd3Q1jpDMqsiyRRadhGBVAi
         sN7Bk6IYWHEhQH/UUUT5wsmhpDQew+STqo2vWGmTo+yx7vmId+6eimLprP5XBYjBGobe
         3crzqyMoZ1/iNjPJQH2ah0OxOw4wQKRjHTv68bKk7Nz92tApEzwbuiUiEdyVLCflWYZR
         2hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698317468; x=1698922268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1weNQUYpAyG6P5aWvJBQH7jJdUNYaPzWCR4tj3G6Cs=;
        b=AEUJYLxU/eZ9913O82aJRkrWSPp1mbN/2FDocJXOJN12z/W5s6Rt9jeVzJomMvA2J+
         R88982UrXo6BDnvRo7hfqL358XI+fytgzrJRmeU33R/Y41CqJGBBU3QtyclQEHDg5iHL
         8gIGd1yBSrW45aJix+Knm8EtqVMMsoaq1/10mlHBc/w81TR2swOe08VE/HphyRu/UGQj
         cRHngD5wlpCfwxzSc9IOVmrN5yVpHDJiSZlqhLizxN3Hg73kvOlQb7yWj6eZulyf9Ep8
         vftp14+kYwkNNZDfx6/T/R7R8OgSUTdOBJaiCFF9OE06p2L0JT4czRUjdVlj884KTG/h
         LKSw==
X-Gm-Message-State: AOJu0YzpU53B7qabzUk8/8f12LGpdcZhCpluG80ng0XpJnTZ0bUWYZ2S
	q6ZJUXwpzEo34dScaAGcoR1SLT5p7txPQQ==
X-Google-Smtp-Source: AGHT+IEuKKTlyrz78N7H4j3urpoJfYnV5H2JC1DFtgZm48BmH9mJBu0r6V3QGzosAdtP0E4EVOmwHw==
X-Received: by 2002:a05:6512:314e:b0:507:9a8c:a8fe with SMTP id s14-20020a056512314e00b005079a8ca8femr11554359lfi.53.1698317467691;
        Thu, 26 Oct 2023 03:51:07 -0700 (PDT)
Received: from localhost.localdomain ([31.32.81.187])
        by smtp.gmail.com with ESMTPSA id f1-20020adff8c1000000b0032da75af3easm13936004wrq.80.2023.10.26.03.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 03:51:07 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Louis Rannou <louis.rannou@syslinbit.com>
Subject: [RFC][OE-core 2/7] oe/spdx: extend spdx.py objects
Date: Thu, 26 Oct 2023 12:48:42 +0200
Message-ID: <20231026105033.257971-3-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
References: <20231026105033.257971-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 10:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189713

From: Louis Rannou <louis.rannou@syslinbit.com>

Extend objects used to build the spdx scheme:

- add support for inheritance
- hide all attributes starting by _spdx
- add methods to list properties and item pairs
- improve the serializer to match the spdx3 scheme

Signed-off-by: Louis Rannou <louis.rannou@syslinbit.com>
---
 meta/lib/oe/sbom.py |  2 +-
 meta/lib/oe/spdx.py | 30 +++++++++++++++++++++++-------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index fd4b6895d8..824839378a 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -77,7 +77,7 @@ def write_doc(d, spdx_doc, arch, subdir, spdx_deploy=None, indent=None):
     dest = doc_path(spdx_deploy, spdx_doc.name, arch, subdir)
     dest.parent.mkdir(exist_ok=True, parents=True)
     with dest.open("wb") as f:
-        doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=indent)
+        doc_sha1 = spdx_doc.to_json(f, sort_keys=False, indent=indent)
 
     l = _doc_path_by_namespace(spdx_deploy, arch, spdx_doc.documentNamespace)
     l.parent.mkdir(exist_ok=True, parents=True)
diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
index 7aaf2af5ed..97b9e011ad 100644
--- a/meta/lib/oe/spdx.py
+++ b/meta/lib/oe/spdx.py
@@ -145,9 +145,13 @@ class MetaSPDXObject(type):
     def __new__(mcls, name, bases, attrs):
         attrs["_properties"] = {}
 
-        for key in attrs.keys():
-            if isinstance(attrs[key], _Property):
-                prop = attrs[key]
+        at = {}
+        for basecls in bases:
+            at.update(basecls._properties)
+        at.update(attrs)
+        for key in at.keys():
+            if isinstance(at[key], _Property):
+                prop = at[key]
                 attrs["_properties"][key] = prop
                 prop.set_property(attrs, key)
 
@@ -166,15 +170,27 @@ class SPDXObject(metaclass=MetaSPDXObject):
             if name in d:
                 self._spdx[name] = prop.init(d[name])
 
-    def serializer(self):
-        return self._spdx
-
     def __setattr__(self, name, value):
-        if name in self._properties or name == "_spdx":
+        # All attributes must be in _properties or are hidden variables which
+        # must be prefixed with _spdx
+        if name in self._properties or name[:len("_spdx")] == "_spdx":
             super().__setattr__(name, value)
             return
         raise KeyError("%r is not a valid SPDX property" % name)
 
+    def properties(self):
+        return self._properties.keys()
+
+    def items(self):
+        return self._properties.items()
+
+    def serializer(self, rootElement):
+        main = {"type": self.__class__.__name__[len("SPDX3"):]}
+        for (key, value) in self._spdx.items():
+            if key[0] == '_':
+                key = key[1:]
+            main.update({key: value})
+        return main
 #
 # These are the SPDX objects implemented from the spec. The *only* properties
 # that can be added to these objects are ones directly specified in the SPDX
-- 
2.42.0


