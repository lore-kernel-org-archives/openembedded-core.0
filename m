Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8943BE6403C
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:55:01 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.10703.1732226096526782908
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YXsA/v8O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-72467c35ddeso1958818b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226096; x=1732830896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xR3XzQwId3B78T0KDvXSYIVDvrN6ffT3J6X+udF+pTA=;
        b=YXsA/v8OlKsPOgABUA52CCatl4St7g+2rCf4prFJPwNHJlrm4EohUtEiZbJPaKTmOV
         P+78mhm6edRdNgY4LHimbvVRr1949VgmBj0YcE6gDeRoh6aPZRDT8Z+DAC8XgWDuMxNO
         ekaCpo9XGmQ87AFK1dbmlHKJDHvFhjukuwL30IZpfWN20+Uxo8nl3jhBKfO5cf5RMgRS
         8B6q71veE/3vjIZKY3IPxQdttzHbSz6Gy2kjlTQ5DYcBXJQ3zQ3wylP8X2r0wV9d6JB3
         Nj2F76bsbe1gao6xKrEEEnNQfqCaNmkNwLr+tcG50AuzCh7vfalL02Q9+Y5yKpFZZvJI
         AzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226096; x=1732830896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xR3XzQwId3B78T0KDvXSYIVDvrN6ffT3J6X+udF+pTA=;
        b=P3i+FeT9p1DPaA+w9KWRVDKVuCf6wbUTJCQbqURX4/pe/A2dUg8pOJG+E1keQ85L2R
         w0DtZk3HOrXhO5hkpqKeLnWF16cVhAhv0cvXApT/Q5nHRK2/wekmWvTDHLb2SuXhJT/s
         qzEvtk8t+kPwfLUxE3ci86JwmZacwWAgJp8mKOo+vQmgkI+ZNnGyom+2xSchDO8Mk5h5
         QshqwbyrZGhKUp2oXbdyH0nVP6Jdyn/et96+y5SSUl+/UFCtdSG5rMVlDSR/v6jnn84X
         euQXB0xxlVdEsESLjBy2NHLFFlKncpTA0BsoFRrgD/NkqmlVawd6BXNQnvID9vJtHgKQ
         PwVg==
X-Gm-Message-State: AOJu0YzWsjL5oVE6cPPEcdG5dHqRiC9PdyjkJAD9Mgd1npFkiMF47fi0
	fqUqoh92xKH8h73MoPRwkkbp7huU6NQLpNy1VErrRLUPVDFMB5yZg1QdOxVvK40AVhKeIE5ahZK
	o
X-Gm-Gg: ASbGncve9FlJpXD12ffT7qcW5Dui9cRPtzY2/MQ0h4L/YWacQ6BWYiqlMCM0zlPVDW+
	E2O99wXnchMYFyoWUlXVLxxi2h2uOynseDdeID8WFichjrrwBtRN8OK4nnXCyrfBjTm79ZkO9Fe
	u/Fat3ZgmBXtBxNspaSfuIfmuNFGBGieLW6uVFzyKhvsaCTAG/avMPXJS2IrM7FELSlV2303E9s
	mfjCbHc9AEChGWOJwuMGvlY0Bh/DMOs0ZmYW70=
X-Google-Smtp-Source: AGHT+IFroI2mk5wNZo52nwZy9QUWfrw5MjCsmqPMe30EzDOJx1+ZMXrLRD8+7U1VPm3zdCfQlFWLow==
X-Received: by 2002:aa7:91cc:0:b0:724:d05e:3845 with SMTP id d2e1a72fcca58-724d05e39b0mr5601901b3a.4.1732226095728;
        Thu, 21 Nov 2024 13:54:55 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 23/27] groff: fix rare build race in hdtbl
Date: Thu, 21 Nov 2024 13:54:13 -0800
Message-Id: <135667502437b1b805711b77276466663b17fed3.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:55:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207578

From: Ross Burton <ross.burton@arm.com>

It's possible to build the hdtbl examples before grn has been build:

groff: error: couldn't exec grn: No such file or directory

Backport a dependency fix from upstream.

[ YOCTO #15610 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d590a32423d05cefc4e7282f971f633b3fa0b941)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...l-Fix-Savannah-66316-missing-grn-dep.patch | 38 +++++++++++++++++++
 meta/recipes-extended/groff/groff_1.23.0.bb   |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch

diff --git a/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
new file mode 100644
index 0000000000..d9455af2ac
--- /dev/null
+++ b/meta/recipes-extended/groff/files/0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch
@@ -0,0 +1,38 @@
+From 12169aa269341753d491a69e9adb86c58dca039a Mon Sep 17 00:00:00 2001
+From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
+Date: Thu, 10 Oct 2024 18:17:08 -0500
+Subject: [PATCH] [hdtbl]: Fix Savannah #66316 (missing `grn` dep).
+
+* hdtbl.am (HDTBLPROCESSEDEXAMPLEFILES): Declare dependency on `grn`;
+  because `-I` flags are used, it is dragged in even though not
+  explicitly needed.  Resolves race against `grn`'s availability in the
+  build tree.
+
+Fixes <https://savannah.gnu.org/bugs/?66316>.  Thanks to Ross Burton for
+the report.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ contrib/hdtbl/ChangeLog | 10 ++++++++++
+ contrib/hdtbl/hdtbl.am  |  3 +--
+ 2 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/hdtbl/hdtbl.am b/contrib/hdtbl/hdtbl.am
+index b6c334c18..3c37174f2 100644
+--- a/contrib/hdtbl/hdtbl.am
++++ b/contrib/hdtbl/hdtbl.am
+@@ -119,9 +119,8 @@ SUFFIXES += .roff .in .ps
+ 	&& sed -e "s|[@]fontdir[@]|$(fontdir)|" \
+ 	       -e "s|[@]EGREP[@]|$(EGREP)|" $< >$@
+ 
+-
+ $(HDTBLPROCESSEDEXAMPLEFILES): $(DOC_GNU_EPS) groff troff eqn pic tbl \
+-  grops font/devps/stamp contrib/hdtbl/examples/common.roff
++  grops grn font/devps/stamp contrib/hdtbl/examples/common.roff
+ 
+ uninstall_groffdirs: uninstall-hdtbl-hook
+ uninstall-hdtbl-hook:
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/groff/groff_1.23.0.bb b/meta/recipes-extended/groff/groff_1.23.0.bb
index 0fc4f831d8..8a16321479 100644
--- a/meta/recipes-extended/groff/groff_1.23.0.bb
+++ b/meta/recipes-extended/groff/groff_1.23.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/groff/groff-${PV}.tar.gz \
            file://0001-Make-manpages-mulitlib-identical.patch \
            file://0001-build-Fix-Savannah-64681-webpage.ps-deps.patch \
            file://0001-build-meintro_fr.ps-depends-on-tbl.patch \
+           file://0001-hdtbl-Fix-Savannah-66316-missing-grn-dep.patch \
            "
 
 SRC_URI[sha256sum] = "6b9757f592b7518b4902eb6af7e54570bdccba37a871fddb2d30ae3863511c13"
-- 
2.34.1


