Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CE8C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 10:15:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3709.1639995314143610038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pszIriNb;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id j18so19043335wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 02:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dmzx3fcIy0XWDOA9lCAtgfF98/dsF2yDkW+Uls+EWIM=;
        b=pszIriNbg3XV0INmpuFjwty2T5VZRlgR8XDmCst6VAaHESCCpN3qSoKftQ9n4VGRbX
         bNVMx4/Zxhbg1hN5jkKGzLWVMlqtHpqwrPALgrxcCCbvufL8caOD+ZFKxjczl9hahOuv
         wLdp/oxr7eZrrk2GxaE6GJmXG5KB7lPKkcTBF71HhKJnhzBVi9A/RlyRGYVekfKJMFV4
         1OYXV83k1O77e1GaIMTQ0Xk74wqUJ9Lpp9GT2eE+R7SUj1GX9HvXRee12Lv48LSdbdKM
         L+nqz5kdGJqr+Wb/K0jc/DvpnIy1IxT7PA9D4LM1i3+johQTLPb5/tPcy2OEx27dt6Ls
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dmzx3fcIy0XWDOA9lCAtgfF98/dsF2yDkW+Uls+EWIM=;
        b=dYtaqzzi2tvP1/8w2BuIQvZiY4ORtGdkHUnyt2hCxlgeUxaBct/ePDOg7OsGY/51ME
         rYuSHGWFHFvxcLspd0XC4ZUr0kyXldSD6qfpNYYQTQ36T+MsOcAiJdW2xTQlWc8ZNWtP
         Si9T1P8Icjwy1/d2ChYwGK+0aKlqW6F2dYSC7OlGEiHnRBN/OzRzBg1oLNPhoI38o9p2
         hcXB6GHJVNsCGx2S73rRiZReEvuSRt8k8Wlt+kdC4/Y7cUVNSZDqNjZ5b0SJwybwRTr3
         7+Y8RlxupAJ1/EACg70D74VAm2sAz2A+pPzT11FffkGoDmo8394WzOPz//V6wt6S6Tpy
         UiJA==
X-Gm-Message-State: AOAM533C07oBTsYLUrhG3LIt50WeO7F7psHVnhEbyiNpsyfkKa0vLGx4
	aAKjCcK6O3y9HXsQSL8GRzKcmREn6QQd2A==
X-Google-Smtp-Source: 
 ABdhPJwr5SWy6/jBPwQ/R5MHCDkfK4DIUj7DuoASyul0M6ZYZFMkKoCeNTLCDjgHV1Z8GPFLlJrFfw==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr12589892wra.715.1639995312513;
        Mon, 20 Dec 2021 02:15:12 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 m12sm2833563wrp.49.2021.12.20.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 02:15:12 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	kweihmann@outlook.com,
	bruce.ashfield@gmail.com,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	quentin.schulz@theobroma-systems.com
Subject: [oe][OE-core][Patch v2 1/2] lib/oe/patch.py: apply patches from
 src_uri specified directories
Date: Mon, 20 Dec 2021 11:14:04 +0100
Message-Id: <20211220101405.26735-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211220101405.26735-1-max.krummenacher@toradex.com>
References: <20211220101405.26735-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 10:15:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159860

The current developer manual specifies that patches that are
part of a directory which is given in SRC_URI are applied by
the do_patch task. However that is not implemented in the
current code.

Implement part of it with two differences:
- The implementation requires the parameter "apply=yes" and
  adds all files as patches, not only files ending in .patch
  and .diff.
  This keeps recipes which depend on the current implementation
  working.
- The possibility to exclude a file in that directory from being
  applied by a follow up entry with "apply=no" is dropped.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/lib/oe/patch.py | 92 ++++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 37 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..39f8fb5097 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -2,6 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
 import oe.path
 import oe.types
 import subprocess
@@ -794,68 +795,85 @@ class UserResolver(Resolver):
             raise
         os.chdir(olddir)
 
-
-def patch_path(url, fetch, workdir, expand=True):
-    """Return the local path of a patch, or return nothing if this isn't a patch"""
-
-    local = fetch.localpath(url)
-    if os.path.isdir(local):
-        return
+def is_patch(local, workdir, apply_all, expand):
     base, ext = os.path.splitext(os.path.basename(local))
     if ext in ('.gz', '.bz2', '.xz', '.Z'):
         if expand:
             local = os.path.join(workdir, base)
         ext = os.path.splitext(base)[1]
 
+    if ext in (".diff", ".patch") or apply_all:
+        return True
+    return False
+
+def patch_path(url, fetch, workdir, expand=True):
+    """Return a list of local paths of patches or return an empty list if there are no patches"""
+    patches = []
+    local = fetch.localpath(url)
     urldata = fetch.ud[url]
+
+    apply_all = False
     if "apply" in urldata.parm:
         apply = oe.types.boolean(urldata.parm["apply"])
         if not apply:
-            return
-    elif ext not in (".diff", ".patch"):
-        return
+            return patches
+        else:
+            apply_all = True
 
-    return local
+    if os.path.isdir(local) and apply_all:
+        for f in sorted(glob.glob(local + "/**", recursive=True)):
+            if os.path.isdir(f):
+                continue
+            if is_patch(f, workdir, apply_all, expand):
+                    patches.append(f)
+    else:
+        if is_patch(local, workdir, apply_all, expand):
+            patches.append(local)
+
+    return patches
 
 def src_patches(d, all=False, expand=True):
+    """Return a list of local paths from SRC_URI. With all=False all patches targeting do_patch, with all=True all other local paths"""
     workdir = d.getVar('WORKDIR')
     fetch = bb.fetch2.Fetch([], d)
     patches = []
     sources = []
     for url in fetch.urls:
-        local = patch_path(url, fetch, workdir, expand)
-        if not local:
+        locals = []
+        locals = locals + patch_path(url, fetch, workdir, expand)
+
+        if not locals:
             if all:
                 local = fetch.localpath(url)
                 sources.append(local)
             continue
-
-        urldata = fetch.ud[url]
-        parm = urldata.parm
-        patchname = parm.get('pname') or os.path.basename(local)
-
-        apply, reason = should_apply(parm, d)
-        if not apply:
-            if reason:
-                bb.note("Patch %s %s" % (patchname, reason))
-            continue
-
-        patchparm = {'patchname': patchname}
-        if "striplevel" in parm:
-            striplevel = parm["striplevel"]
-        elif "pnum" in parm:
-            #bb.msg.warn(None, "Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
-            striplevel = parm["pnum"]
         else:
-            striplevel = '1'
-        patchparm['striplevel'] = striplevel
+            for patch in locals:
+                parm = fetch.ud[url].parm
+                patchname = parm.get('pname') or os.path.basename(patch)
+
+                apply, reason = should_apply(parm, d)
+                if not apply:
+                    if reason:
+                        bb.note("Patch %s %s" % (patchname, reason))
+                    continue
+
+                patchparm = {'patchname': patchname}
+                if "striplevel" in parm:
+                    striplevel = parm["striplevel"]
+                elif "pnum" in parm:
+                    #bb.warn("Deprecated usage of 'pnum' url parameter in '%s', please use 'striplevel'" % url)
+                    striplevel = parm["pnum"]
+                else:
+                    striplevel = '1'
+                patchparm['striplevel'] = striplevel
 
-        patchdir = parm.get('patchdir')
-        if patchdir:
-            patchparm['patchdir'] = patchdir
+                patchdir = parm.get('patchdir')
+                if patchdir:
+                    patchparm['patchdir'] = patchdir
 
-        localurl = bb.fetch.encodeurl(('file', '', local, '', '', patchparm))
-        patches.append(localurl)
+                localurl = bb.fetch.encodeurl(('file', '', patch, '', '', patchparm))
+                patches.append(localurl)
 
     if all:
         return sources
-- 
2.20.1


