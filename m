Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C61AD77892
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:26:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.699.1769189176934731798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y6c5WrLR;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43284ed32a0so1543139f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769189175; x=1769793975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C1c5JgJ1vlYPmYkEvs8sNCiL3X76jvU9lJfMa8YP0Gw=;
        b=y6c5WrLRJIt1FLr4ngbfGE/rklm5QbT4RJ9iiQ9Z3c1oLlksvQtR2FKrk8Y2ocJe4i
         /OteBrMpcyRvgJUsbwGflw9FxG/UFZonyOVTFYZL3fMHI6Ndye7F1v5iGr7ua1lBiNEo
         b8tnzQSGnt1UTogqrPpXMiUgOIC2IxJGfEG4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189175; x=1769793975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1c5JgJ1vlYPmYkEvs8sNCiL3X76jvU9lJfMa8YP0Gw=;
        b=JG81jGMn8v5IEq4U0pBufRQjySwIKFwbTKsujxMkRuCtgF8D11zgW1YwJ1QfU5ckkT
         btpXnHtBjuUPXic8z39BNhl2BcYEKq4IEO6tyUhgYoaNYoBBiC1vct1lBJykHRWQTgga
         lBAkOnwJ3+UYMEUqZdaSYesE5kezIup77dY2skmsdsmuI4accUXzH4jzrWepVPqXeKwk
         WjjDnqeshdJR+rlUDNqkJzkO3kEOPmW7GN1QkIgp9L5JGCvBdKKYpXNRQMRCmcosOEPf
         k/ImEJ1z3UmNcj8mLaRz1CEBIQ89IaBJViB1fMiLTE0K1zhqyqm/YB+Wha5wecego/uZ
         8wxw==
X-Gm-Message-State: AOJu0YyWfVyvQMetOThAU6NnlNbfY/k0L3e5TZ0izS36v1ZQjnx6Ar3a
	e6W5Ij5FGJ/rlFzlGKgg39uGpCCQItgShEN8mxwwuQ36EjJxdrkAwS5Ja1nBQ+kRgkIC4WwiNfG
	660D9fTM=
X-Gm-Gg: AZuq6aJS1bkwsh/Uqr4wXtUWyjbtqqXPdUFlWf9lXFpFvpyrwG6m5cllEvKSbXdJXj1
	UBlcw3Iic/L62pRNeHGyl/9xoDT97pDHD1d0Nmtj7ELX7Df5nkrVsJPz9+DwncOUiGdWUSB7Z/P
	OMuVKi2VX73kd6ROKKAd+gV4LO5Q2dNSYtaSVZ6vaTwT0pc7kMu/mx9HujQfNCjkC4S0rM4E00T
	Uyd/J6p2ufBwZYlfCdvwOhkEbaDlM6oI5NcXxgkRF6W67D5jpcqFaa4lrlZ7SRW6vsP2gDee/KC
	B7SQt41ok9VPHcduUVoUa2BHCth4tMSlwxmA9CUwbjdU8i5u+lmmgYf6khjgg2bVfSKfh6BIK1n
	pw5AbMhBjpOYDooyGmINJUw96QWn79C8MMoxRHfxRlfpgEl3Sru6e0aNRGgN8i++MgY8LSvT1S5
	VPVt+6ewabSZNTqF4F1l3HNUlx45gZyHirVDeqinIdPEpW/CMVZuKKkqwYEFR5BYouCVUKLkHTN
	+qF8kZ9eRY5sNyA05qf
X-Received: by 2002:a05:6000:4313:b0:435:97b2:a9b with SMTP id ffacd0b85a97d-435b15fb180mr6220731f8f.37.1769189175253;
        Fri, 23 Jan 2026 09:26:15 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f74b15sm8477017f8f.35.2026.01.23.09.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:26:15 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v5 1/2] oe-setup-layers: support inline URI
Date: Fri, 23 Jan 2026 18:26:12 +0100
Message-ID: <20260123172613.3305069-1-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 17:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229901

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

Notes:
    Changes in v5:
    - Rebase, no change since v4

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


