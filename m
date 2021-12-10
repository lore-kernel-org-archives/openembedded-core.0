Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEABC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:05:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.6981.1639141552625668652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=maaRl1gb;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so6607927wmd.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoC7XsrTPrqdgAZuP1LJTqNtqXXO739CYfsH4UBF6RQ=;
        b=maaRl1gbtNig5RTSBRwj+JVKmNAFoCU38kVz6IFWCAMO/RP/PCJO+Ga3hIt6yqgxgN
         GTsKKt94iLGftuw9EaJDooJC7PmaUQfH4E4hhp6048uPCSbdu9lpR9gxiTssEKGZl0gr
         +yopdqHHRADnVcOG/dvklZQTKDZQtWbLxzBPUw/4jekopZlZZoKLi8LlDKYokw8JlZu8
         ohDJBTO5BEqItYgh668p6yd1ZqwbRDeK6em/peZL5JXWWN/Ea3KZx7UA8Jp9fyz9FI7y
         udXd4QzzwPkJGlW62BTnQ/dk2i2mgf2Z5ReX8b1JqrYpQHzMCk/VuPtS8EAkkVS6drSW
         ORzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoC7XsrTPrqdgAZuP1LJTqNtqXXO739CYfsH4UBF6RQ=;
        b=Rt6ckOHGpB5eHPd1hxN1vPvN7LMwGh02czStbvqawYfvCcvvl443r8yZyovKSj36uh
         uWme/zRjL8Af+fs3E/y4ao53rBMk33fGmxQPTLOgn/bxZu6vmMn+QcIgK9ud39bFpyOi
         kmv8gQy9Z56Elt47Z0cbXym1/7f+aVF2TUec2YRLYETdYOUebBSoWM69GKKVPtJTv+hL
         6ad2SrRYS3tugLKo/ZhBIzVpp5rbTZBWP2n1yFMf5BAA56Xsgirz4EBbvLPGWlIGowWf
         AzAWZvFSzzj74PmRQQ04/DbzDb9l6cN7xomkDcXscZNEJqDJigRX3SSmEcSLQjA26TTB
         WtmA==
X-Gm-Message-State: AOAM532gmA4qnF1qhjkqnOt20QUA6gtzP9psoFkUDkiwBvAevjECAoBd
	orbOjsXtSQOrB39Yn89HrPwoN3mpnhsnpQ==
X-Google-Smtp-Source: 
 ABdhPJxN39BgQMkFIBj+GECjjKU0Ts36uMu1CfVzg3ZZP6dXKUBhOBuq5te+d13tY7/jhvV7vixe1w==
X-Received: by 2002:a7b:cd02:: with SMTP id f2mr16168714wmj.115.1639141550982;
        Fri, 10 Dec 2021 05:05:50 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 v15sm2649214wro.35.2021.12.10.05.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:05:50 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 1/2] lib/oe/patch.py: apply patches from src_uri
 specified directories
Date: Fri, 10 Dec 2021 14:04:57 +0100
Message-Id: <20211210130458.39716-2-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211210130458.39716-1-max.krummenacher@toradex.com>
References: <20211210130458.39716-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:05:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159519

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
 meta/lib/oe/patch.py | 98 ++++++++++++++++++++++++++------------------
 1 file changed, 59 insertions(+), 39 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 950fe723dc..0d2afab2f9 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -794,68 +794,88 @@ class UserResolver(Resolver):
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
 
-    urldata = fetch.ud[url]
+    if ext in (".diff", ".patch") or apply_all:
+        return True
+    return False
+
+def patch_path(local, urldata, fetch, workdir, expand=True):
+    """Return a list of local paths of patches or return an empty list if there are no patches"""
+    patches = []
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
+
+    if os.path.isdir(local) and apply_all:
+        for f in sorted(os.listdir(local)):
+            sublocal = local + '/' + f
+            # Also search in subdirs
+            if os.path.isdir(sublocal):
+                patches = patches + patch_path(sublocal, urldata, fetch, workdir, expand)
+            else:
+                if is_patch(sublocal, workdir, apply_all, expand):
+                    patches.append(sublocal)
+    else:
+        if is_patch(local, workdir, apply_all, expand):
+            patches.append(local)
 
-    return local
+    return patches
 
 def src_patches(d, all=False, expand=True):
+    """Return a list of local paths from SRC_URI. With all=False all patches targeting do_patch, with all=True all other local paths"""
     workdir = d.getVar('WORKDIR')
     fetch = bb.fetch2.Fetch([], d)
     patches = []
     sources = []
-    for url in fetch.urls:
-        local = patch_path(url, fetch, workdir, expand)
-        if not local:
-            if all:
-                local = fetch.localpath(url)
-                sources.append(local)
-            continue
 
+    for url in fetch.urls:
+        local = fetch.localpath(url)
         urldata = fetch.ud[url]
-        parm = urldata.parm
-        patchname = parm.get('pname') or os.path.basename(local)
+        locals = []
+        locals = locals + patch_path(local, urldata, fetch, workdir, expand)
 
-        apply, reason = should_apply(parm, d)
-        if not apply:
-            if reason:
-                bb.note("Patch %s %s" % (patchname, reason))
+        if not locals:
+            if all:
+                sources.append(local)
             continue
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
+                parm = urldata.parm
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


