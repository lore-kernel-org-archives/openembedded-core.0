Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F61D7879F
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 16:13:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20310.1766160798618110364
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 08:13:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kN/HVlbM;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so14020825e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 08:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766160797; x=1766765597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QELcxs+9LvSN++Wcl+N9gDoU15bdRgIsz22qN0ySY10=;
        b=kN/HVlbMYVzXrwgCUnWdRj0WNro7czk++6DPofiiHxF2BGjFVOEBanxCQys4lMBSb5
         Lmv/BeTJKdkWhdXOHU8sKoMIsPxJKn+s6F3twzz/Eo2tdDyjrHcD/SKAInlLEQrlebSQ
         1gd8D33o85LoqBJkXG3MhkpG49EGGPG3fsspM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160797; x=1766765597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QELcxs+9LvSN++Wcl+N9gDoU15bdRgIsz22qN0ySY10=;
        b=Pu086bPqIGABfR5r6SyrJhu7htfbNe+r5soS5HfaLMvQMd8B881+VpPDWznDO+yoN8
         SO5cmsX2egoHiryn6p/SqDYVMl72k984uWG/XWPX97KjsDbc+v2ghvnMT+hE9SuWdYGv
         Zjm8TXmE/M1Edkaym7VZYN16rzVTUK3yj32fpeNW1CpdRAXslf/gg0fUCxoXgsTSjy4R
         zdHyrc3f3dvZ5QEm/8oGAEaAGAFbc4bGsPZc7/n739jn0yiXT51cSkWt82elBeTC2551
         RsgM8uJ24lhJ1hW4QR6f+4Fd4ZUU+sh9jyqitL0QDFU+KKL1TVJUm9Qf1KeN1Lz7ksGk
         eSMw==
X-Gm-Message-State: AOJu0YwGj/L+qjJHt5UBMrEzErBct52tSvEMzEedRzFouzMACDr6dBeY
	VHnsFrnraVHywzOCUOUTkCfFrx1VnH4uJqOMQ+6lI8n3GrPf7JqjaFywVrIEAvlU3oAW+L6HB8L
	IRoPIx4o=
X-Gm-Gg: AY/fxX7P22RV8sMmu5uMEdXIq0RmSNxw97huxddHDFHquo7HWx/1a+3Oc0jNoSudgxB
	SSzdPW+zJoBxXf8tt6t+q/C2VBU30lpHGRiX8Jk+8Pi+TopR1mVq2kJyknhR3eVmb3QU2XEqKZG
	SpgNAuScmFf0RbMTK6Fjxw7aFWneNJ+0c3tgc+ccxnNpElqKuynVF3kfwwPCFBrrNboIYErAxic
	XiQjaY4GauC0YG2muNElziSVh8Y6pTXA+aaBwEwBndkrmWH+waWBJUHv+tTLCvDGz46e3A42s5F
	jj5ZiK1QY6QKVa/1Kn1LgNUOVzkZweQ5zwpnPftma/7+Q7tMHmv0B8/SIwhvyAcaG5jlCrC0IKX
	S/naMqlLeKGa0FwCL/6qq39eIE4f150F4mIn+iQiNOn8mwK/p6BCBg9U4AJ7fxiUzS7aXvmwOL7
	M2wlP8aEXS0cMDs2ipwGmT8LDcTswI1m14ov/erxTep8DKrHahJfwKwOy2BAzKezCiS/keJxqOu
	ZlUvOzScK6vNujKKGQ=
X-Google-Smtp-Source: AGHT+IGycoKa1LZ2LZsfom4Ca1Td6MjAffrDw+CSjsPmyHsDI8kajY6xSgMBgH1ozpnvU10cMnN3iw==
X-Received: by 2002:a05:600c:1550:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-47d1958af3dmr30497155e9.24.1766160797006;
        Fri, 19 Dec 2025 08:13:17 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08efsm5888287f8f.29.2025.12.19.08.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:13:16 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v4 1/2] oe-setup-layers: support inline URI
Date: Fri, 19 Dec 2025 17:13:10 +0100
Message-ID: <20251219161311.2293512-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 16:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228240

Most of the time, when we describe a remote, the layer data (also used by
the script bitbake-setup) looks like this:

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
        "uri": "https://git.openembedded.org/bitbake

",
        ...
    }
}

These properties can be used together.

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---

Changes in v4:
- Set r_name just before the break

 scripts/oe-setup-layers | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 31cb963251..4813d6f9dc 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -60,6 +60,34 @@ def _write_layer_list(dest, repodirs):
     with open(layers_f, 'w') as f:
         json.dump({"version":"1.0","layers":layers}, f, sort_keys=True, indent=4)
 
+def _get_remotes(r_remote):
+    remotes = {}
+
+    if not 'remotes' in r_remote and not 'uri' in r_remote:
+        raise Exception("Expected key(s): 'remotes', 'uri'")
+
+    if 'remotes' in r_remote:
+        remotes = r_remote['remotes'].copy()
+
+    if 'uri' in r_remote:
+        r_name = ''
+
+        if 'remotes' in r_remote:
+            if not 'origin' in r_remote['remotes']:
+                r_name = 'origin'
+            else:
+                import itertools
+                for i in itertools.count(start=1):
+                    if not 'origin-{}'.format(i) in r_remote['remotes']:
+                        r_name = 'origin-{}'.format(i)
+                        break
+        else:
+            r_name = 'origin'
+
+        remotes.update({r_name: {'uri': r_remote['uri']}})
+
+    return remotes
+
 def _do_checkout(args, json):
     repos = json['sources']
     repodirs = []
@@ -80,7 +108,8 @@ def _do_checkout(args, json):
         if not desc:
             desc = rev[:10]
         branch = r_remote['branch']
-        remotes = r_remote['remotes']
+
+        remotes = _get_remotes(r_remote)
 
         print('\nSetting up source {}, revision {}, branch {}'.format(r_name, desc, branch))
         if not _is_repo_git_repo(repodir):
-- 
2.51.0


