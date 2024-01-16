Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B770C47DA9
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 08:24:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.8367.1705393474869622684
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 00:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HdfgHCrk;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-336897b6bd6so9278000f8f.2
        for <Openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705393473; x=1705998273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=by0EPQfdybvs7j/rMb2dZ7JOmqvBZ6Xbud6eQbM7zJY=;
        b=HdfgHCrkEAxbXxnucm225xdFNJh4q9Ay2BNhaFmM96ePZxqw3DZsot+uL2DK46Zui8
         koajIHMilsWt7O/BmcmS6HXvBc+oC+P/66YsShSHfPJhH1xvnMdWf+DX0nOPEureTxmx
         LPik3eTpL07CTxj9a+NcBebRCF+fSrT4jMUjs5YXPxhGQx0raAfwJo/YIjVFSDw8blHO
         LPmtWGpJ53DC5q7jX0QyqAy/U+GXfIDImT8PONCvNPpwG5fCISHWf688wCFL936aAau6
         zXBAEIrGw2EuSBN8jVo4g6KHz3U8quWOsO4NBcCuQm83d0uhEHzKSWo/fnqy6Sd5a9FF
         mJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705393473; x=1705998273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=by0EPQfdybvs7j/rMb2dZ7JOmqvBZ6Xbud6eQbM7zJY=;
        b=Vo+DQkDNBBkdyQl/CMKAJZkZRX9sDav3riHBQK8Fp/KwYe9pyaNwxEhO1q4/B+Zy/T
         +urbPqytG/3LTpuTtsVo6uw4cXvN64TJ3X1X8D6noCDKQLYX6XHBnbjqA5kjL6Lk2cSK
         LwElxTa2PQ8NDLUngWBkP6BHqiLChh2QVqV14b6xerzm9x6swy6C5SbkYE1OHCDQWhTe
         0sui/0gTwWEzCqRQs/6BK9WcCsgnuAwAUUqgSmXluEyvoYBYB6EXcZmH1XfPWcN/+XSP
         ObRrct6f+NcWOWGyjSm/SvzPMt9BM5oNjCY2RubEa/WFghdDhPOphWfgN+PsUy9M0z64
         lLHQ==
X-Gm-Message-State: AOJu0YxAPKW4+CEmB866xI75/LIbCaVVDbOBxILF4Ax8mrLgYkM9C4fh
	YXOU+wZpEXeXnEJ3ZODHqQ5ith5waPVy7A==
X-Google-Smtp-Source: AGHT+IFR24adJIt6AJXGifHw/qK9veRXKGm71VgAtTQamdfe8jebwN/hCwfY5Ean1Rvzpd5giuylww==
X-Received: by 2002:a5d:51c6:0:b0:337:bc88:9260 with SMTP id n6-20020a5d51c6000000b00337bc889260mr218523wrv.133.1705393473065;
        Tue, 16 Jan 2024 00:24:33 -0800 (PST)
Received: from slackware.local ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id dv1-20020a0560000d8100b00337b55ed9afsm1091923wrb.95.2024.01.16.00.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 00:24:32 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: Openembedded-core@lists.openembedded.org
Cc: Lukas Funke <lukas.funke-oss@weidmueller.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 6/9] recipetool: Disregard version in URL for replaced modules
Date: Tue, 16 Jan 2024 09:23:24 +0100
Message-Id: <20240116082327.128990-6-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20240116082327.128990-1-uvv.mail@gmail.com>
References: <20240116082327.128990-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 08:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193829

Major module version is a part of name, but not necessary part of the
actual URL (See https://go.dev/ref/mod#module-path).

Nevertheless, name detection function can't handle that suffix, so get
rid of it to determine component name.

For replaced modules that name might be different that the actual module
name defined in go.mod file.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 scripts/lib/recipetool/create_go.py | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool/create_go.py
index 035ab9f7c1..c560831442 100644
--- a/scripts/lib/recipetool/create_go.py
+++ b/scripts/lib/recipetool/create_go.py
@@ -506,6 +506,7 @@ class GoRecipeHandler(RecipeHandler):
 
     def __go_handle_dependencies(self, go_mod, srctree, localfilesdir, extravalues, d):
 
+        import re
         src_uris = []
         src_revs = []
 
@@ -555,7 +556,9 @@ class GoRecipeHandler(RecipeHandler):
             src_uris.append(inline_fcn)
             src_revs.append(generate_src_rev(path, version, commithash))
 
-        pn, _ = determine_from_url(go_mod['Module']['Path'])
+        # strip version part from module URL /vXX
+        baseurl = re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
+        pn, _ = determine_from_url(baseurl)
         go_mods_basename = "%s-modules.inc" % pn
 
         go_mods_filename = os.path.join(localfilesdir, go_mods_basename)
@@ -636,7 +639,9 @@ class GoRecipeHandler(RecipeHandler):
                 lic_files_chksum.append(
                     'file://src/${GO_IMPORT}/vendor/%s;md5=%s' % (licvalue[1], licvalue[2]))
 
-        pn, _ = determine_from_url(go_mod['Module']['Path'])
+        # strip version part from module URL /vXX
+        baseurl = re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
+        pn, _ = determine_from_url(baseurl)
         licenses_basename = "%s-licenses.inc" % pn
 
         licenses_filename = os.path.join(localfilesdir, licenses_basename)
@@ -682,6 +687,13 @@ class GoRecipeHandler(RecipeHandler):
 
         localfilesdir = tempfile.mkdtemp(prefix='recipetool-go-')
         extravalues.setdefault('extrafiles', {})
+
+        # Use an explicit name determined from the module name because it
+        # might differ from the actual URL for replaced modules
+        # strip version part from module URL /vXX
+        baseurl = re.sub(r'/v(\d+)$', '', go_mod['Module']['Path'])
+        pn, _ = determine_from_url(baseurl)
+
         # go.mod files with version < 1.17 may not include all indirect
         # dependencies. Thus, we have to upgrade the go version.
         if go_version_major == 1 and go_version_minor < 17:
@@ -699,18 +711,18 @@ class GoRecipeHandler(RecipeHandler):
             # Write additional $BPN-modules.inc file
             self.__go_mod_vendor(go_mod, srctree, localfilesdir, extravalues, d)
             lines_before.append("LICENSE += \" & ${GO_MOD_LICENSES}\"")
-            lines_before.append("require ${BPN}-licenses.inc")
+            lines_before.append("require %s-licenses.inc" % (pn))
 
             self.__rewrite_src_uri(lines_before, ["file://modules.txt"])
 
             self.__go_handle_dependencies(go_mod, srctree, localfilesdir, extravalues, d)
-            lines_before.append("require ${BPN}-modules.inc")
+            lines_before.append("require %s-modules.inc" % (pn))
 
         # Do generic license handling
         handle_license_vars(srctree, lines_before, handled, extravalues, d)
         self.__rewrite_lic_uri(lines_before)
 
-        lines_before.append("GO_IMPORT = \"{}\"".format(go_import))
+        lines_before.append("GO_IMPORT = \"{}\"".format(baseurl))
         lines_before.append("SRCREV_FORMAT = \"${BPN}\"")
 
     def __update_lines_before(self, updated, newlines, lines_before):
-- 
2.35.1


