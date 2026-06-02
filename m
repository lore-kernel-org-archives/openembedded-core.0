Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F40CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 12:06:46 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23441.1780401425257051726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ayZDFENT;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-befd83e0521so77108266b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401424; x=1781006224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD5ff+/nldDPoGZws4bgUcri8eL4KD+Ciziznq46Qhg=;
        b=ayZDFENTyZ4nuPO+QIg4XbIctI22uIWZX44OlQgsy4ZFazcR3Red9HgwNEFBIUS6uO
         z1p1XBvXslL+bAu3/JsAOVPca9XHrriJMBthbk2PpAbFYReYpAOADgd2X/4qN6M1iAE0
         TXVO4DKAWtzhUQPXX5SqlpjMAtoDob+utbG9YPvplyb1r3821HBGkDe9nMAkFBLOVlCP
         EjTlMLwigEfYfxdY8ambm8MkKGbK5mpN6I6XFAzp1qeUfMloTS5JD3RVTKaCNs2PgVIt
         1BoLOYdpUeM4jfV49MxtSUXGcZ7AIKOELuvAZ6BFkrnUMcamxLuzvXS9UIXtETWkUrR1
         gd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401424; x=1781006224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yD5ff+/nldDPoGZws4bgUcri8eL4KD+Ciziznq46Qhg=;
        b=fxJSORiNwKIMEgtZgnZQinKZmdBSNpaVT5hqWpRxU2WfZLY6lj93SFjugetWSjuqbM
         1aYK2Xz+MhiyLnO5F3jqRzLGWsXedu2U4dKnz0Hb6Vp5HJywK1vJ/gWDDrYuzFWFx0G8
         2d6NWsJQyA9TpNWJdPiZhmvZRGKY5A9vGzYuB1kT4yrmexL515ueuufZYrOWYliD6aXM
         +RzDOTbFyr6d6BrDOrgP1co7K03eY/n2gwh8PzHIWt3CRH/YjINR/GpFNG4F6VSvmWUt
         k2cc7IykbryUkMSFfDBHfJff1W0Hfx+Twa/rChhwtKIOeHr5wS+7ipyMELAaBrfk8q/l
         i1IA==
X-Gm-Message-State: AOJu0Yx38o/uA5RK/G/t/5o0pe1OKupz2hH+DN6NCQe+2yhwGlZJ6UTS
	PBXpqzfMJrckU0rpESL2a3QA54y4yw3x7a+nR9QSfuAdHLgqWx9QL+MTwGMvDKBJ
X-Gm-Gg: Acq92OEeTyCTHEQHAD8cPT/sZYy4dPoRVXvZ8rCdhRsXcmkwO6bnwt7anQwvD0ZY4pz
	Br28BLqptP5Wk2Cnc12tw2IvTDJxOiki+4K6FajCyPCqy9K0Y9FaysOcl0UKKlhX1nnzFmDR4hQ
	L+l61GNYtQuwKuVNukudGSd5r0NEo0RHQAqPIcAmXAi0XW+hbFpQoi0fUGyLINkQTI7Ld7BtJIK
	LLjVtSNQ3xFfSwJm1alDlMlzjpMBkzmj+F5k1x6/6FeH1PCpn58kMDQWAgVDS7jg6sYvf7OOuTo
	nUjC8/C4eaSA4ChB8F0IkkWlfhoaKOlLLLHToF1Co9xH7jb7e4IZVfMjQRQm+o5Ewjto0EnEifT
	QkWleorMSXPvvAEplV8cwqFsLYJe9T+oesPnwjzOXdRoR6JKHEV7MCD28MxAH3fQW1ymOZyQBjc
	Jh4M/m58I3lRAXiyvCQqH99by11WYxjhecQ7ZTa8mMGmZUxHzK0YahskE8aQ==
X-Received: by 2002:a17:907:c1b:b0:beb:f357:7755 with SMTP id a640c23a62f3a-beefaee7734mr212742266b.12.1780401423462;
        Tue, 02 Jun 2026 04:57:03 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb7a7c70sm3320813a12.7.2026.06.02.04.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 04:57:03 -0700 (PDT)
From: =?UTF-8?B?RnJlZGVyaWsgQnLDpm5kc3RydXA=?= <frederikbraendstrup@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH 2/3] python3-py-utlx: add recipe
Date: Tue,  2 Jun 2026 13:56:31 +0200
Message-ID: <20260602115632.3105218-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602115632.3105218-1-frederikbraendstrup@gmail.com>
References: <20260602115632.3105218-1-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 12:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238039

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../python3-py-utlx/python3-py-utlx_2.4.0.bb    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python3-py-utlx/python3-py-utlx_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python3-py-utlx/python3-py-utlx_2.4.0.bb b/meta-python/recipes-devtools/python3-py-utlx/python3-py-utlx_2.4.0.bb
new file mode 100644
index 0000000000..55be32ba45
--- /dev/null
+++ b/meta-python/recipes-devtools/python3-py-utlx/python3-py-utlx_2.4.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python utility library (utlx)"
+HOMEPAGE = "https://pypi.org/project/py-utlx/"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5ec25ca3fcbff4a4c70d5244a47d2906"
+
+PYPI_PACKAGE = "py_utlx"
+
+SRC_URI[sha256sum] = "66b49b28113b11ae9e9710ea6dabeb9a0a18a5411be6896d1cbbc9f39845c15c"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += " \
+    python3-chardet \
+    python3-pkg-about \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.54.0


