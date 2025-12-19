Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3F7D767F7
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:43:28 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15104.1766144600229709347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:43:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ej1GJzGt;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso11685965e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144599; x=1766749399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhqWUByAkSvehtTlEpgsFsTVY6wqzyDLwvkVPsuDxf4=;
        b=ej1GJzGtnAaqEdFbkP7aaDojPjHrAFVi2V8fFZcI94kTXqAM+IIGx3pVFdtt4nx1ge
         2vAyTaHURXUnTrpeTnZsudQ+rnyAKYZWD42CaQmHxY3OEJOWe+e550mtmNAg5Db4oEPe
         EmNI66772hxNOiDneSP9/Ibn/8KFMQtjD6su4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144599; x=1766749399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhqWUByAkSvehtTlEpgsFsTVY6wqzyDLwvkVPsuDxf4=;
        b=bW0dm1+s/wRx5z0BaRCNaNy5ZuLvRTu9ZxQdmxrihJcKR8CwfRzDY7SvaQMMPZwKfZ
         DSJT8xzxtsYpKRU3F0e9LqpSrZdJOtTZi5Qv2vkTd+en40fdgXPgxFxgUg9k/FbfP5aU
         2dke+5hvwWhCPmaWn5cpYIVCGm5Zdon9d/8KhAi8oEWoFxSXjV9cc1G4F96I54auxdI5
         PtqZwgYNIn8jSvJJtClFXQyod/tgUrHx+teGyr9RKvrWWgRKEJU1DxdWVbQueT+SZt78
         kbj4zCvxfUF7X+UeaHUpUspz8OzrqNcsNZbSw0s4xs0uX3FTNhT/c1axyGhhM3IxZ7EH
         qC3Q==
X-Gm-Message-State: AOJu0YzLG2O63/gnD7dLY4boAeak2Ye7gmGfzjlC9NSBFiqQSuF25V86
	g43Cnm1+H/Xaa9x6gptBU9sFQm3S7s6ZRIr40S8Ok3/MM8jidwUXk84GixhoSWoZtuPrjKBqNR5
	Pkxa+25k=
X-Gm-Gg: AY/fxX6WpSRkZd32I7kIqp7wIAkq0LHPiudK7MuZGDKucVkQ89Jj+g3yAJSgTjqsOB2
	cofefGMJv7CSB8cBRst0aIT7YgIDRiDq9v/FEqyxnUoYY1T0w7O7Pp8yI6qjbjFwnbEm/1UpcSb
	FKf6CxkNGhkatga7dOZYOTseAyDWqaKOAM+lEwNCHw9ljMxgsxMFvuhFGUiZpZFnV1Mps0kH9q3
	ZgKMy0WgC0ulVjzjEiCpsiXe4+k671shldR6HBLmMPtmGlTZhA4qKHl9gaM5qNt4oxyNPKUtDAZ
	v+V0tX544zQsFAgSMD3mfWjlRxvXn+TY0x1/uDULMNJNA0jmSQ3CYAbhvUTYwskYhf+YBXi5609
	hSymrCKpAmGcF9gLD368UPXmPyRZYqYB086Ihh8Zl+r3oZplaGV6vpthRnBf5R6Eqf94H+EejH8
	SrMGW8xDNGGLd7iJs0+Kn3tIO9sJ0GSEnGvw+avZ1uzosHJyRIjBYiS3Xf/3pVb8B54CXWtZbAh
	SnGJ697QwsRIj5+V4o=
X-Google-Smtp-Source: AGHT+IERxdEZzzWpneDxbiF4V/DInZMKwWykC0wis6aH9bEr2NLOBAyTYs/mDl4iwWgHF5MSkDKztQ==
X-Received: by 2002:a05:600c:540e:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47d195522f7mr24136945e9.16.1766144598646;
        Fri, 19 Dec 2025 03:43:18 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b749esm92167635e9.14.2025.12.19.03.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:43:18 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 1/2] oe-setup-layers: support inline URI
Date: Fri, 19 Dec 2025 12:43:15 +0100
Message-ID: <20251219114316.1574858-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228218

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

Changes in v3:
- Use a more pythonic way to increment an integer

 scripts/oe-setup-layers | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 31cb963251..5ab7d8be96 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -60,6 +60,35 @@ def _write_layer_list(dest, repodirs):
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
+                        break
+
+                r_name = 'origin-{}'.format(i)
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
@@ -80,7 +109,8 @@ def _do_checkout(args, json):
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


