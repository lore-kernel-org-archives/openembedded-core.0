Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A82FC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:27:07 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.665.1708378024666065426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V5kbj2y4;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d8ddbac4fbso3943246a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 13:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708378024; x=1708982824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Mnlb77d4OY0TuJcJ6lb+Bz7Zsi4/2Bes249sWxKeNE=;
        b=V5kbj2y4yZlOngMS37ohgfGZtEQCg6LIolJLurZEkfBpZRyVynh3b6zif+ewTDWo8t
         e87Cy0P+Tru4PYacDkvyUJeDhLfzqQAvsGHzhiFHehtbi+SK/yQzfs8h+71wh1IICSn6
         wjxOWgDdg3iD40mYfnFFXrLFw0/23xOkmJmSedKumu/lp1ORQ+xK3BXph4Io61anPGZd
         kkDsN0RFeHcnGAmvy2Fo+1o7VxZIeLQ/bWD60I/a2o7ywCLH8ZVWdxeAzXtI6lSN/+3W
         4xDOa1VEM/OQQh5A4z+kxdBB56d8BTSWy5uud1nRQU9hZTUS5dFiY6tofuIQOYe/ezJy
         MYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708378024; x=1708982824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Mnlb77d4OY0TuJcJ6lb+Bz7Zsi4/2Bes249sWxKeNE=;
        b=B5s7sYNWYHP7iWDe6qMBs5mJqmjS8yMLCbgd35O9kQB6CunziORxO2o4xIm0+bRPaw
         KBWtycNrfuj4OfuYZBVt1UHnuu0UbdqTTzLjmsrWCIROiFbjYvCTDx+cTU51JQUTYLL5
         SAEv1DSD48lETPEl+WED0JuhAFDawPoJWtY4QX1FAUr87+s1bwQjox9os74/X0kQL9sD
         hItKa+hWVT9KVTZzgsD55a5QPXUJaIqcQFB0jw+lclnw2iWto3gnZOmYN7azgOfCJg4B
         F44t+OlgaSvxqfg7Qhy2IfP5xSF+udc4f1kF89225M3Eo9/GLdie9TkBWuFNm+sFU8Vo
         pjpg==
X-Gm-Message-State: AOJu0YwXK3rxFcbCoKx0MYVYvO6tnTXsR+IrgCB5zZKMPnmWIEdZuVXK
	8o5bqOyKzEkpyHoIvG/Cs8LFvo2QSeUwOrGfqk04JhaDwo9RJFxh20rJA28z
X-Google-Smtp-Source: AGHT+IF3bzK9JERHyR8HFdklQe+90RyJJq8Bo0E6SO/3RXcRj7FNo8Rk8UQmq9hBc9gHlJ/N/z3J9g==
X-Received: by 2002:a17:902:684a:b0:1db:730c:c077 with SMTP id f10-20020a170902684a00b001db730cc077mr11875896pln.58.1708378023666;
        Mon, 19 Feb 2024 13:27:03 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0:7caf:da97:8daf:f655])
        by smtp.gmail.com with ESMTPSA id u3-20020a170903304300b001db561fa164sm4886519pla.25.2024.02.19.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:27:03 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pyproject-metadata: move from meta-python
Date: Mon, 19 Feb 2024 13:26:45 -0800
Message-Id: <20240219212644.2054283-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 21:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195898

This is a dependency for python3-meson-python.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../python/python3-pyproject-metadata_0.7.1.bb   | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1ab69175bb8..7e17e9b71fa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -629,6 +629,7 @@ RECIPE_MAINTAINER:pn-python3-dtschema-wrapper = "Bruce Ashfield <bruce.ashfield@
 RECIPE_MAINTAINER:pn-python3-editables = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-pyproject-metadata = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyrsistent = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-extras = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
new file mode 100644
index 00000000000..e0da1d96907
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pyproject-metadata_0.7.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "PEP 621 metadata parsing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=310439af287b0fb4780b2ad6907c256c"
+
+PYPI_PACKAGE = "pyproject-metadata"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "0a94f18b108b9b21f3a26a3d541f056c34edcb17dc872a144a15618fed7aef67"
+
+RDEPENDS:${PN} += " \
+    python3-logging \
+    python3-packaging \
+    python3-profile \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


