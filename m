Return-Path: <corentin.guillevic@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B762BD767E0
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 11:36:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14946.1766144172181080015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 03:36:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=aoO2b0+x;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: corentin.guillevic@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430fbb6012bso1189741f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1766144170; x=1766748970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ma4NVhkjtSUmoFMFBl/xlOWpNKtRTxHX3lfQZzkESI=;
        b=aoO2b0+x+LBh/A+HfJ9z2xWNwW6MrKj0JSfLMotujpiT46k8vrHdPUApF+Um5N9EI6
         g6+ZceaUuiyTBLaD2PFTp1iX4XGdeqKn2vsOwEAk/ac+wSO8IkeHnj0Q8c7gv43fo0R9
         Z8K/EnaoGJRnufwRRtkIiuCVoVO4igFy+Y4bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144170; x=1766748970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ma4NVhkjtSUmoFMFBl/xlOWpNKtRTxHX3lfQZzkESI=;
        b=PK85WSLZKbUJqdbRQ7y7B6yFPgFkuiUtJKyyGaRiJ5Wrz+/AClsrZP/hckO2uqygl8
         GsfV5pByrJPCw9D1nHM48sb7lxLj6hdOtJHj3BdKuCTMfAW5Hcy7w4CRrPuTFJJzBHlA
         +lpEyc04GhahV+njYHbs6Hxffw6JnerrG7i9utXMT3TT9TUNOdUdrSddZqtulo1HUFq2
         umzFFHCDaUQrXZz6CbBlHmbiFxAZAoy9TQALv7+Okoey4k8D46L9Fp3lyqYNycjzpMG7
         4F34BY65CDMPvm3CW37Z5vy4+5/Pl9Z6NvchXV4GY4TO2ffXVBg/wUgi86aTA1AgQDb3
         Trug==
X-Gm-Message-State: AOJu0YyS1tb8AIt6sZsHaw/fvXqtswjgWv1hcrMaaBZ7IY4/PCwPBEk9
	BrDVci2cbG15hEgstK8+1KAbIsqbaG36fya+JqpHHjCHGgAQ49vNdIGS6Ax3qhp94siiIO+3hC5
	t11WX0OY=
X-Gm-Gg: AY/fxX6NV1WvxOdX10fVTluBzA4EUGLyeWBhQxVpejfMNZgkITGiP4DaIFGkOuI5O6b
	AVY2M08YsgO9f1joKVVNnIGXO4UXbyZHQX3en+/WzzXoXXsliyX8lANdt6AqOItw6qYT0X0SRlD
	MXvOohzczEKwXs278MIPi0GkkNWU8PXFi72POezeH/ZfWGN1ITa8XWdsqDpS2nFRXPiXoxa3j+u
	c8JIHBNpIMwuAl7FAnd9vei9DMCy7GGvX6zHTHR/tEFKrpbfbJTpl4PWWijcqCBxuy1DAFRXzoC
	pYZnyeRf6qe9HRUpqZfdyKTAwr8BEIID9fEKuflagq5BLH1l1SJOeQKo/xnWJSzb2ionFZiiSRV
	c9UitWprFoqcAgV5ZKDBPhEpX/mBbrj4Vfs3hmiX65B1BbqlKKOL54kstcmnjnYcMYVPtsJFdDP
	+a57NJX+yG1pqS8tUcN59BRhMcthqBuuMJgl2zAILaGDHjIbqjYyRRYKg+kD/UaTKujmHD4BEmZ
	gA8VcU/ERm1LW4tsTc=
X-Google-Smtp-Source: AGHT+IFpJwGU1X9Fo5eImt6vfuzOXNRWP4mrG7FVwYti9d2m+O/cp1yuvfOX5+JlzoP9pTOMnqIsIg==
X-Received: by 2002:a05:6000:178e:b0:431:16d:63a3 with SMTP id ffacd0b85a97d-4324e510400mr3019181f8f.46.1766144170541;
        Fri, 19 Dec 2025 03:36:10 -0800 (PST)
Received: from heaven.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fa1sm4243906f8f.23.2025.12.19.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:36:10 -0800 (PST)
From: Corentin Guillevic <corentin.guillevic@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Corentin Guillevic <corentin.guillevic@smile.fr>
Subject: [PATCH v3 3/4] bitbake-setup: use URI shortcut for all configurations
Date: Fri, 19 Dec 2025 12:35:57 +0100
Message-ID: <20251219113558.1573766-3-corentin.guillevic@smile.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
References: <20251219113558.1573766-1-corentin.guillevic@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 11:36:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228216

Currently, no source has several remotes. So we can replace their entire
structure 'remote' -> 'origin' -> 'uri' with a shorter one (property 'uri'
only).

Signed-off-by: Corentin Guillevic <corentin.guillevic@smile.fr>
---
 .../oe-nodistro-master.conf.json              | 18 +++-----------
 .../oe-nodistro-whinlatter.conf.json          | 18 +++-----------
 .../configurations/poky-master.conf.json      | 24 ++++---------------
 .../configurations/poky-whinlatter.conf.json  | 24 ++++---------------
 4 files changed, 14 insertions(+), 70 deletions(-)

diff --git a/default-registry/configurations/oe-nodistro-master.conf.json b/default-registry/configurations/oe-nodistro-master.conf.json
index 180d2008a..e4e842177 100644
--- a/default-registry/configurations/oe-nodistro-master.conf.json
+++ b/default-registry/configurations/oe-nodistro-master.conf.json
@@ -3,33 +3,21 @@
     "sources": {
         "bitbake": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/bitbake"
-                    }
-                },
+                "uri": "https://git.openembedded.org/bitbake",
                 "branch": "master",
                 "rev": "master"
             }
         },
         "openembedded-core": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/openembedded-core"
-                    }
-                },
+                "uri": "https://git.openembedded.org/openembedded-core",
                 "branch": "master",
                 "rev": "master"
             }
         },
         "yocto-docs": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/yocto-docs"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/yocto-docs",
                 "branch": "master",
                 "rev": "master"
             }
diff --git a/default-registry/configurations/oe-nodistro-whinlatter.conf.json b/default-registry/configurations/oe-nodistro-whinlatter.conf.json
index 7b183ae1c..8342f2cf5 100644
--- a/default-registry/configurations/oe-nodistro-whinlatter.conf.json
+++ b/default-registry/configurations/oe-nodistro-whinlatter.conf.json
@@ -4,33 +4,21 @@
     "sources": {
         "bitbake": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/bitbake"
-                    }
-                },
+                "uri": "https://git.openembedded.org/bitbake",
                 "branch": "2.16",
                 "rev": "2.16"
             }
         },
         "openembedded-core": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/openembedded-core"
-                    }
-                },
+                "uri": "https://git.openembedded.org/openembedded-core",
                 "branch": "whinlatter",
                 "rev": "whinlatter"
             }
         },
         "yocto-docs": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/yocto-docs"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/yocto-docs",
                 "branch": "whinlatter",
                 "rev": "whinlatter"
             }
diff --git a/default-registry/configurations/poky-master.conf.json b/default-registry/configurations/poky-master.conf.json
index 1de038bab..82464e8ab 100644
--- a/default-registry/configurations/poky-master.conf.json
+++ b/default-registry/configurations/poky-master.conf.json
@@ -3,44 +3,28 @@
     "sources": {
         "bitbake": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/bitbake"
-                    }
-                },
+                "uri": "https://git.openembedded.org/bitbake",
                 "branch": "master",
                 "rev": "master"
             }
         },
         "openembedded-core": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/openembedded-core"
-                    }
-                },
+                "uri": "https://git.openembedded.org/openembedded-core",
                 "branch": "master",
                 "rev": "master"
             }
         },
         "meta-yocto": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/meta-yocto"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/meta-yocto",
                 "branch": "master",
                 "rev": "master"
             }
         },
         "yocto-docs": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/yocto-docs"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/yocto-docs",
                 "branch": "master",
                 "rev": "master"
             }
diff --git a/default-registry/configurations/poky-whinlatter.conf.json b/default-registry/configurations/poky-whinlatter.conf.json
index bfa67426d..80b3c7f8c 100644
--- a/default-registry/configurations/poky-whinlatter.conf.json
+++ b/default-registry/configurations/poky-whinlatter.conf.json
@@ -4,44 +4,28 @@
     "sources": {
         "bitbake": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/bitbake"
-                    }
-                },
+                "uri": "https://git.openembedded.org/bitbake",
                 "branch": "2.16",
                 "rev": "2.16"
             }
         },
         "openembedded-core": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.openembedded.org/openembedded-core"
-                    }
-                },
+                "uri": "https://git.openembedded.org/openembedded-core",
                 "branch": "whinlatter",
                 "rev": "whinlatter"
             }
         },
         "meta-yocto": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/meta-yocto"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/meta-yocto",
                 "branch": "whinlatter",
                 "rev": "whinlatter"
             }
         },
         "yocto-docs": {
             "git-remote": {
-                "remotes": {
-                    "origin": {
-                        "uri": "https://git.yoctoproject.org/yocto-docs"
-                    }
-                },
+                "uri": "https://git.yoctoproject.org/yocto-docs",
                 "branch": "whinlatter",
                 "rev": "whinlatter"
             }
-- 
2.51.0


