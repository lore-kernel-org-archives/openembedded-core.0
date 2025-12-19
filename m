Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D111AD767DD
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:36:08 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14944.1766144165121154640
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dfOIIGg2;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso15934865e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144163; x=1766748963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riGC5pNkOfBd8/xW3q2WWIu1zJ70mMg2V3Q1M9KiEQo=;
        b=dfOIIGg2NJhgjmRPcYHrGKMuz+V4+kXvlOaThCgjbaXOpSpZ06opjhbFgzwHsXnGoI
         a6NAe26M5Q8iguNHFZBsZeu3E7BV0dkWSzGEIbWr12LUM+YPV7LsQQn/PwkwqyeUe4FH
         tfZ1WMCujiK/Hso3/Vw4V6FLE2Xxzr/U7suYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144163; x=1766748963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riGC5pNkOfBd8/xW3q2WWIu1zJ70mMg2V3Q1M9KiEQo=;
        b=DPVBQwxlT4G0juzB4W6eXlL2mZgcjgqA7FwqsFHEKbbTfx4YO/FJWJF3pP2XSIDM6j
         SYZ1UbXT8begr3uxDw1R1ENAmjPzzfNrv3FsFxB3dYREtZ3xHwkPCQVYZIjAd5ZUxsyx
         JOqU8sLCJFoCq5PQMBD8Zy6I4vJkXygqN+TDhvpF0ETBgWg3C6+MgKq7lIjpd593JygH
         PYafLc171H4vFf8HOFY3mIeN4PHgumpoouphondjtZnXbykgo3L9JxVmkDLwu0g84mt7
         LBbEOpCQj3mhbYOnDO2S4sJ1E5g52hNY82oUGT9ti9H/6W1Xm0EnvF40gn2+3gZqMCk3
         +vaA==
X-Gm-Message-State: AOJu0YwGYz69AcwT0yFF3G6P0AmNXZ/3Aq+CWaHCVecO8HxAXx4SvjNE
	gm2p3tuUUnOhgSuirxoJko2fogSCIAL+wUID3oc5OdXwcSSTg2ySZeLCxqfe3c5cjbe5v91TcyO
	EaMRfaQ0=
X-Gm-Gg: AY/fxX4LjecM/x6trgfxuTtHnUZStzj8E2Qob5Mi5cwHrsEgqb/3cNBRdMwzOXDbDBp
	+/K0CcJ+RjyUc913iSZYK9miLqJdMY4pn352mDEtnOii/HPNDB86AQ0dxFOAzrz97fmkGSUFkr/
	U7IYIONI3UdLkO5TqH1xLF6F+szYmoVGS/rQr8zIsxTRuBmXSB2inw/M1C4A/TGfWgba4TP3UdG
	glmzgDgNot0FJQpG8OwGblXIn6qk/tEGOqrGQVUoN7u/sUVLEg+cvuGxr+eHzAv2BLpXMVwzjLj
	X/VyDYGyqScPWJQhmHVOFi+z8Jcb6BHiwCNCJqmBBonta5tFlyU2zMGCbgntrE4AWpU9guwKzUd
	q+UmfuKfYvwh+MXtbQG5mT+7yk7XD5MYPHmR7sXaSfd5T16W8SiOdqa1gC1zuvwOArL+P9SBbQF
	lHU7KAOf750ZfAmBvdeLI1wsf/uPmKY2KLxs/l87k2EsAVMtLAc2YaLdRBCtzXziJ7qEqUkYVZn
	IUIUy6txL/aBA0DpHOAJ2wk2jj4fw==
X-Google-Smtp-Source: AGHT+IGG3EMDVcFD8LVrWSYdTZH3C7P1ROmFERxsC/PGuyjfZ05fEIHNrNM1uZu5wuVTeMB0sp/Lew==
X-Received: by 2002:a05:600c:4fd4:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-47d194cc59emr23285255e9.0.1766144163433;
        Fri, 19 Dec 2025 03:36:03 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm4243906f8f.23.2025.12.19.03.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:36:03 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 1/4] bitbake-setup: add inline URI
Date: Fri, 19 Dec 2025 12:35:55 +0100
Message-ID: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228214

Most of the time, when we describe a remote, a bitbake-setup source looks like this:

"bitbake": {
    "git-remote": {
        "remotes": {
            "origin": {
                "uri": "https://git.openembedded.org/bitbake"
            }
        },
        ...
    }
}

i.e. an URI with the common name 'origin'. Alternatively, we could simplify this, by
using a shorter structure with the property 'uri' only:

"bitbake": {
    "git-remote": {
        "uri": "https://git.openembedded.org/bitbake",
        ...
    }
}

These properties can be used together.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---

Changes in v3:
- Use a flat list of remotes, instead of a dictionary
- Add a better description for the 'uri' property
- Update bitbake-user-manual-environment-setup.rst

 bin/bitbake-setup | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/bin/bitbake-setup b/bin/bitbake-setup
index 73f734e73..809077518 100755
--- a/bin/bitbake-setup
+++ b/bin/bitbake-setup
@@ -89,14 +89,30 @@ def _write_layer_list(dest, repodirs):
     with open(layers_f, 'w') as f:
         json.dump({"version":"1.0","layers":layers}, f, sort_keys=True, indent=4)
 
+def _get_remotes(r_remote):
+    remotes = []
+
+    if not 'remotes' in r_remote and not 'uri' in r_remote:
+        raise Exception("Expected key(s): 'remotes', 'uri'")
+
+    if 'remotes' in r_remote:
+        for remote in r_remote['remotes']:
+            remotes.append(r_remote['remotes'][remote]['uri'])
+
+    if 'uri' in r_remote:
+        remotes.append(r_remote['uri'])
+
+    return remotes
+
 def checkout_layers(layers, layerdir, d):
     def _checkout_git_remote(r_remote, repodir, layers_fixed_revisions):
         rev = r_remote['rev']
         branch = r_remote.get('branch', None)
-        remotes = r_remote['remotes']
+
+        remotes = _get_remotes(r_remote)
 
         for remote in remotes:
-            prot,host,path,user,pswd,params = bb.fetch.decodeurl(remotes[remote]["uri"])
+            prot,host,path,user,pswd,params = bb.fetch.decodeurl(remote)
             fetchuri = bb.fetch.encodeurl(('git',host,path,user,pswd,params))
             logger.plain("    {}".format(r_name))
             if branch:
@@ -600,7 +616,8 @@ def are_layers_changed(layers, layerdir, d):
         changed = False
         rev = r_remote['rev']
         branch = r_remote.get('branch', None)
-        remotes = r_remote['remotes']
+
+        remotes = _get_remotes(r_remote)
 
         for remote in remotes:
             type,host,path,user,pswd,params = bb.fetch.decodeurl(remotes[remote]["uri"])
-- 
2.51.0


