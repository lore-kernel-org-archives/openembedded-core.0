Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22955CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:23:00 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17507.1779182230702318571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 02:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P9UK2jJt;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: saisneha196@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30246cfd41aso320209eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 02:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779182230; x=1779787030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwF/RxOps7mGQwximLao371G7FVWTdIb4cbkMzV1oJY=;
        b=P9UK2jJtRqdS9ntd5+UPQ/hIwBwW/i4oBJOI6B8XhaqjM2XJPHPXU+OGDAygt/KK1A
         yiPfPSP6A0ccmYS9+R9mbNNkOZQMET8Dv/VdbrcP9q4jYwVYz1zbjzuj5xHgBMHge+LR
         Ll55bJXhpO49TeT/H/tuAibZyiCZ8htd6ISIKA+fVvNCEqYZdkeiVS+Dm9DVpNwr0S64
         HCsSBpK7ogrPZ6E0mEJLOIZZylfWdWlrJ5ANYryBn5dAoGwizOEj1vEUxV9j0Q/k24EM
         /p5NWFTq/OP86n4SAs6uevF0nJYkL7+3sBhjsgi/b8csF+tCbyvDHTNSIbwJSpzNJVeT
         9nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182230; x=1779787030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EwF/RxOps7mGQwximLao371G7FVWTdIb4cbkMzV1oJY=;
        b=h04v6gqLJNhT9ZZtIEEvRK8ASCeHRnBMQXFBY/objzBRHYs5IREyzZDho+SSt3DFw0
         6/pHTUVNqpLBUV2BmqQUnpkSWQnYbFYwqObnVEeBNYiqkYDyIMjsQFLHEM/MQwp0g3rZ
         rDSQhY3IORc15u0uhaLxpcW35R+/8XgE8FC0dXaQJw9B/dZU29HvfLLgD23tMGAyLjDn
         RQb5CZL9yZUqF9obAPMGgTcrH1fQ4U/bSCJB7OAI3/xQIgv7D4i9kUrniITJE69gV2X+
         HB9bVrWkddEiXK+RrB1RxXmsARwYo74E48W3387D1891RoFsFBU55DaI+8TU/XBCYlDx
         YVAQ==
X-Gm-Message-State: AOJu0YyidGDuu4QMLWcGisNUY4xaNYRGNjnkjYGb8brxxZT4a1r/NPw8
	NZG13hDLfbVR5Pt5bQFjW47pg9zAUMEZ5HcISWfEUKluE+nqxc56Fw+pZ9HOi7Vl
X-Gm-Gg: Acq92OG9nqQ66LtbBKvJUxcxKc7QReRYTVJwM/L8ZgfrmSk+IwQx9/3SoFXaqwqi3w0
	2RimHgAW8oooSZ9eSygAzC/jDP+UocFYRbrVayoTv8i7BkUS0WAx4XaHK/+3Hm+VSkpNPLwN4In
	CKK3enUrG+JcWOmsbzzM/wMb+MKuBUYXdT/wTiHMCRdHGM0S+vAOv6toBwpgEu78Zp0J1wlLm2A
	aiZkQnuzQcnAaO8TDR1ynERF0eqp8TsM0fh6UkNNeCDNopJcFZrSbv6VAzQz29QULTo85cDHWCX
	caGEi2P0fnAXmHpKvnBmao4F1LrH1AgovSNh9iNBGKGGChnTbATccyZwJPYirIIsdgOE4TjP+jW
	VJZEKWPOSDz+lWaMnNHtsWO4PiRugvvSNQL6yI6oBVvfbWjC89EMqHZsvvzHRyDzpO8W4AorOTv
	Xx9AVGkCok5Z6zL0SvLPzchIVYHLtow89nFQlLsHqMPAEkjyI=
X-Received: by 2002:a17:902:f38f:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2bd7e8352f7mr143396735ad.15.1779181769191;
        Tue, 19 May 2026 02:09:29 -0700 (PDT)
Received: from BLR1RLPT00004.localdomain ([152.57.112.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe4935sm187342225ad.42.2026.05.19.02.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:28 -0700 (PDT)
From: Sai Sneha <saisneha196@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	corentin.guillevic@smile.fr,
	Sai Sneha <saisneha196@gmail.com>
Subject: [PATCH 1/3] base.bbclass: warn when SRCREV is missing for SCM URIs at parse time
Date: Tue, 19 May 2026 14:39:16 +0530
Message-Id: <20260519090918.235880-2-saisneha196@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519090918.235880-1-saisneha196@gmail.com>
References: <20260519090918.235880-1-saisneha196@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 11:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237315

A recipe with a git:// (or other SCM) URI in SRC_URI must have a
corresponding SRCREV set. Without it, BitBake performs a live query
on the remote repository at every parse, breaking reproducibility
and causing parse failures under BB_NO_NETWORK=1.

The trivial fix of checking SRCREV in insane.bbclass do_recipe_qa
fails because fetcher_hashes_dummyfunc[vardepvalue] expands SRCREV
at parse time before QA checks run, causing a FetchError that halts
parsing entirely. This was identified by Corentin Guillevic's RFC
series and confirmed by Mathieu Dubois-Briand's autobuilder testing.

The fix intercepts at the vardepvalue expansion point by introducing
check_srcrev_set() which inspects SRC_URI and SRCREV using unexpanded
getVar() calls (False flag). This avoids triggering get_autorev() or
any live network fetch. The function is called conditionally:

  fetcher_hashes_dummyfunc[vardepvalue] =     "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"

Note on design choice: we intentionally use d.getVar(candidate, False)
rather than srcrev_internal_helper() because the latter expands SRCREV,
triggering get_autorev() and live network fetches -- the exact problem
this patch fixes. Our fallback chain mirrors BitBake's internal
resolution order exactly, as confirmed by the error messages BitBake
itself produces:
  SRCREV_default:pn-X, SRCREV_default, SRCREV:pn-X, SRCREV

The check handles:
- Full SRCREV resolution fallback chain matching BitBake's behavior
- Multiple SCM URIs in one recipe (all reported, not just the first)
- Inline rev= parameter in URI (skipped, no SRCREV needed)
- AUTOREV passthrough (legitimate devtool usage, let through)
- Parse-time severity respecting WARN_QA/ERROR_QA layer config

Note: parse-time warnings intentionally duplicate the QA-time warnings
added in insane.bbclass. This is necessary because CI pipelines running
'bitbake --parse-only' with BB_NO_NETWORK=1 (the original motivation
from Ross Burton) would miss the issue entirely if only QA-time
warnings existed. This pattern is already established in the codebase
(e.g. src-uri-bad fires at both parse and QA time).

Fixes: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16051
Signed-off-by: Sai Sneha <saisneha196@gmail.com>
---
 meta/classes-global/base.bbclass | 40 ++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 62f2814bb7..66b2e25f71 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -165,13 +165,49 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     if notfound and fatal:
         bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
 
+def check_srcrev_set(d):
+    import bb.fetch2
+    src_uri = (d.getVar('SRC_URI', False) or '').split()
+    pn = d.getVar('PN')
+    found_issue = False
+    for uri in src_uri:
+        try:
+            (scheme, _, _, _, _, params) = bb.fetch2.decodeurl(uri)
+        except Exception:
+            continue
+        if scheme not in ('git', 'gitsm', 'hg', 'svn'):
+            continue
+        if params.get('rev', ''):
+            continue
+        name = params.get('name', '') or 'default'
+        candidates = [
+            'SRCREV_%s:pn-%s' % (name, pn),
+            'SRCREV_%s' % name,
+            'SRCREV:pn-%s' % pn,
+            'SRCREV',
+        ]
+        raw = None
+        for candidate in candidates:
+            raw = d.getVar(candidate, False)
+            if raw:
+                break
+        if not raw or raw == 'INVALID':
+            found_issue = True
+            if bb.utils.contains('ERROR_QA', 'missing-srcrev', True, False, d):
+                bb.error("%s: %s not set for %s" % (pn, candidates[-1], uri))
+            elif bb.utils.contains('WARN_QA', 'missing-srcrev', True, False, d):
+                bb.warn("%s: %s not set for %s" % (pn, candidates[-1], uri))
+        elif '${AUTOREV}' in raw:
+            return True
+    return not found_issue
+        
+
 # We can't use vardepvalue against do_fetch directly since that would overwrite
 # the other task dependencies so we use an indirect function.
 python fetcher_hashes_dummyfunc() {
     return
 }
-fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d)}"
-
+fetcher_hashes_dummyfunc[vardepvalue] = "${@bb.fetch.get_hashvalue(d) if check_srcrev_set(d) else ''}"
 addtask fetch
 do_fetch[dirs] = "${DL_DIR}"
 do_fetch[file-checksums] = "${@bb.fetch.get_checksum_file_list(d)}"
-- 
2.34.1


