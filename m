Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CEBC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 18:00:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.35.1642615202684684248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 10:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aE/XHWAv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id p18so6708819wmg.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 10:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyGl/G1Rf8Oh9PO9yQ6a0Z1yl52OfnAcGUukT3lC/fs=;
        b=aE/XHWAvuMt9KtClAVQc6Mj0O3GIxgazTB+oGjM1LJ7M5QKenPSRRkotG+8doKtbOv
         y+eZewdjrh2n0SXPkN84I1P7c2LmBcki1zmy7jiOjo0iL+9embTWiY45aCTBVbiXqkeZ
         IKTCXEpK6N7BRpYS50GmTJ5QOhHuOR3+LnZb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YyGl/G1Rf8Oh9PO9yQ6a0Z1yl52OfnAcGUukT3lC/fs=;
        b=elMpkiaDcvdlMgywt7D6lcuE9WJqv+zOSASQfI6esNSezFUqGixtZzq+/sJAeTfSen
         adALAmwb1iepXAyT4lCTmqFyxtG1i5dcqM2NSJkeJrylq15NELtahnB9mMzMgkq+P6Ou
         O4qXBH/4BbHbKT9df0fWRbrG6i/JP/yXlPzUaFUOrXhI3yt0GF+MQA5bTtNXUkO1sOAh
         J19kQC5gVk+G19mBqeQ6ZGGXEDVgK+G3+PGbnP/fDMbyWVNJRdNZjAMpS1Zw996nIXFV
         i0CB/pFyh9qayrlMTYmae4uokdYsoTD0z1veqjlQYBFkJ4g1/74gCll5NLz11y3KMzCZ
         6/nw==
X-Gm-Message-State: AOAM5323nhIaZh/uU0fDCqTr5LNkyZn8sJUlmiKgo6AKm/CaavnOVaOQ
	EuyR+cyvW4QnjLeOKdcA8FtS8uiSR47qjg==
X-Google-Smtp-Source: 
 ABdhPJytLHXe2Rv7vwC8GoS6AkW+GSEZaQ49gSUHhl/ZZfh4vvuL6HsxIHVRQBGlA9uhtnwCB1avNw==
X-Received: by 2002:a5d:584a:: with SMTP id
 i10mr14856642wrf.198.1642615200772;
        Wed, 19 Jan 2022 10:00:00 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d])
        by smtp.gmail.com with ESMTPSA id
 p4sm5787920wmq.40.2022.01.19.10.00.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 10:00:00 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] crate-fetch: Switch to version contained in bitbake
Date: Wed, 19 Jan 2022 18:00:00 +0000
Message-Id: <20220119180000.1931833-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 18:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160743

This avoids various sstate fetch errors from weird silent failures in the sstate
archive testing code caused by lack of srcrev support in the crate fetcher.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo_common.bbclass |   1 -
 meta/classes/crate-fetch.bbclass  |  28 ------
 meta/lib/crate.py                 | 149 ------------------------------
 3 files changed, 178 deletions(-)
 delete mode 100644 meta/classes/crate-fetch.bbclass
 delete mode 100644 meta/lib/crate.py

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index 23d82aa6ab2..90fad754153 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -9,7 +9,6 @@
 ##
 
 # add crate fetch support
-inherit crate-fetch
 inherit rust-common
 
 # Where we download our registry and dependencies to
diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
deleted file mode 100644
index a7fa22b2a06..00000000000
--- a/meta/classes/crate-fetch.bbclass
+++ /dev/null
@@ -1,28 +0,0 @@
-#
-# crate-fetch class
-#
-# Registers 'crate' method for Bitbake fetch2.
-#
-# Adds support for following format in recipe SRC_URI:
-# crate://<packagename>/<version>
-#
-
-def import_crate(d):
-    import crate
-    if not getattr(crate, 'imported', False):
-        bb.fetch2.methods.append(crate.Crate())
-        crate.imported = True
-
-python crate_import_handler() {
-    import_crate(d)
-}
-
-addhandler crate_import_handler
-crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
-
-def crate_get_srcrev(d):
-    import_crate(d)
-    return bb.fetch2.get_srcrev(d)
-
-# Override SRCPV to make sure it imports the fetcher first
-SRCPV = "${@crate_get_srcrev(d)}"
diff --git a/meta/lib/crate.py b/meta/lib/crate.py
deleted file mode 100644
index d10f4418750..00000000000
--- a/meta/lib/crate.py
+++ /dev/null
@@ -1,149 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-"""
-BitBake 'Fetch' implementation for crates.io
-"""
-
-# Copyright (C) 2016 Doug Goldstein
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Based on functions from the base bb module, Copyright 2003 Holger Schurig
-
-import hashlib
-import json
-import os
-import shutil
-import subprocess
-import bb
-from   bb.fetch2 import logger, subprocess_setup, UnpackError
-from   bb.fetch2.wget import Wget
-
-
-class Crate(Wget):
-
-    """Class to fetch crates via wget"""
-
-    def _cargo_bitbake_path(self, rootdir):
-        return os.path.join(rootdir, "cargo_home", "bitbake")
-
-    def supports(self, ud, d):
-        """
-        Check to see if a given url is for this fetcher
-        """
-        return ud.type in ['crate']
-
-    def recommends_checksum(self, urldata):
-        return False
-
-    def urldata_init(self, ud, d):
-        """
-        Sets up to download the respective crate from crates.io
-        """
-
-        if ud.type == 'crate':
-            self._crate_urldata_init(ud, d)
-
-        super(Crate, self).urldata_init(ud, d)
-
-    def _crate_urldata_init(self, ud, d):
-        """
-        Sets up the download for a crate
-        """
-
-        # URL syntax is: crate://NAME/VERSION
-        # break the URL apart by /
-        parts = ud.url.split('/')
-        if len(parts) < 5:
-            raise bb.fetch2.ParameterError("Invalid URL: Must be crate://HOST/NAME/VERSION", ud.url)
-
-        # last field is version
-        version = parts[len(parts) - 1]
-        # second to last field is name
-        name = parts[len(parts) - 2]
-        # host (this is to allow custom crate registries to be specified
-        host = '/'.join(parts[2:len(parts) - 2])
-
-        # if using upstream just fix it up nicely
-        if host == 'crates.io':
-            host = 'crates.io/api/v1/crates'
-
-        ud.url = "https://%s/%s/%s/download" % (host, name, version)
-        ud.parm['downloadfilename'] = "%s-%s.crate" % (name, version)
-        ud.parm['name'] = name
-
-        logger.debug(2, "Fetching %s to %s" % (ud.url, ud.parm['downloadfilename']))
-
-    def unpack(self, ud, rootdir, d):
-        """
-        Uses the crate to build the necessary paths for cargo to utilize it
-        """
-        if ud.type == 'crate':
-            return self._crate_unpack(ud, rootdir, d)
-        else:
-            super(Crate, self).unpack(ud, rootdir, d)
-
-    def _crate_unpack(self, ud, rootdir, d):
-        """
-        Unpacks a crate
-        """
-        thefile = ud.localpath
-
-        # possible metadata we need to write out
-        metadata = {}
-
-        # change to the rootdir to unpack but save the old working dir
-        save_cwd = os.getcwd()
-        os.chdir(rootdir)
-
-        pn = d.getVar('BPN')
-        if pn == ud.parm.get('name'):
-            cmd = "tar -xz --no-same-owner -f %s" % thefile
-        else:
-            cargo_bitbake = self._cargo_bitbake_path(rootdir)
-
-            cmd = "tar -xz --no-same-owner -f %s -C %s" % (thefile, cargo_bitbake)
-
-            # ensure we've got these paths made
-            bb.utils.mkdirhier(cargo_bitbake)
-
-            # generate metadata necessary
-            with open(thefile, 'rb') as f:
-                # get the SHA256 of the original tarball
-                tarhash = hashlib.sha256(f.read()).hexdigest()
-
-            metadata['files'] = {}
-            metadata['package'] = tarhash
-
-        # path it
-        path = d.getVar('PATH')
-        if path:
-            cmd = "PATH=\"%s\" %s" % (path, cmd)
-        bb.note("Unpacking %s to %s/" % (thefile, os.getcwd()))
-
-        ret = subprocess.call(cmd, preexec_fn=subprocess_setup, shell=True)
-
-        os.chdir(save_cwd)
-
-        if ret != 0:
-            raise UnpackError("Unpack command %s failed with return value %s" % (cmd, ret), ud.url)
-
-        # if we have metadata to write out..
-        if len(metadata) > 0:
-            cratepath = os.path.splitext(os.path.basename(thefile))[0]
-            bbpath = self._cargo_bitbake_path(rootdir)
-            mdfile = '.cargo-checksum.json'
-            mdpath = os.path.join(bbpath, cratepath, mdfile)
-            with open(mdpath, "w") as f:
-                json.dump(metadata, f)
-- 
2.32.0


