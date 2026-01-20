Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCCBD2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6484.1768916294563153737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wthcg8st;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801d24d91bso37933265e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916293; x=1769521093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEhqBV5Wu/DtwoxgHyNBd07ATroqSdZK4ZbYilR2Tag=;
        b=wthcg8stCvJ5jC4HzWPpvsPG5BDvckMlZW15zy6Q9dzwavWwii7lex55DbnIwpU7C/
         SeN0dkjVThZMiOKUoMn/I+EgE9MzdAiDvjM3ZU3mS+09aYUlQGMvV06k753X0kdzaXkl
         QfWD6wCpIbMKm3Y4zvG9GEftZqitU6QzXV1J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916293; x=1769521093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LEhqBV5Wu/DtwoxgHyNBd07ATroqSdZK4ZbYilR2Tag=;
        b=MKiG9cFou7g8xfVdwBAIYwOgZ8CsclyJT3Yy4Bjlez/MNi6kjcMDvdENboQpEo1qqW
         Hl+3MO9liDVul4V94M9+wuKIJaOZQHCw4eS6CDMGPmsii9lwGsJHBpekjaOi3S2zFZYI
         LGCKfTQ9+wX0ccGn3aIFD1C0kjSF2FKYMPSrcT79DU13RFNBab73Z1/oaqU/mPbbUHrM
         kjyneiK0jigq294r5R318Odhm3NUInJUy/vWFf6/5+7zwuaVrisOXY6xB5W1++wPCz4Q
         wj86xsm5sovnjvP/9ZWQ+spibxBEzEtTnbJ6+nxYPKcIIkF5MtQAtM2fkSJQy3PZCWI9
         k/GQ==
X-Gm-Message-State: AOJu0YwWcnpfjPTtYKczdtXXlL09/MoGYd1cRhLswMB4onZnIHJOMOvM
	bu4NrNmIvxbiSDzIAJcbNcByEmwkU0VbYtGnhAu/ZA1g7MzTIWtZDWgA3+4drU2PlnomsSZeGuL
	Q78fV
X-Gm-Gg: AY/fxX6hpuSSbRkoI72L+55x1FAjzNUFbMCEM52SX2RECokKImcrT6lwHO0CenVWvyL
	g/Di//nJ97R7ilqNMZ9qZ6ZiloefBpVyT1zwMXs2YEG3cNE3lr4uAH71DBkETkPl8IvdflnW7Aa
	CcHVTbZkLEbkAl6KmKNe31Qb4tGwG4SmiiJ901nDI/T+zsr15LkwhAg7N8vx8SL/gSKvDuX4ucD
	DTYEqOLWctihSEcd3ZRTltSKAzWRYyghATJSVHEUtr2rZGWHoIbmQ6Q8LPYFbwmMcBAjtR6dLLY
	MQhO2hG/kxYQeKKEC+RVE8tYCz0qErv11/J4BroSajQ9mlD7mAvFIaNGnEywIKjcDBaC5h2eBBh
	v4X3yq3j0SpT09OzI1QEe7gqXNPbYbzIIz5nM05lAfqk9rjr3Y4rnJbZQb0YdNF8Ed25XcJAZqR
	5em79ck5YuIuJdYEGX8wSLHRcblKupcwbPjky/F7Dz2EA+rNDUxP2Ivv0F7MDR6pr6kBvQ7OWOw
	SWzM8bBmJsjAXhtDzl+FA==
X-Received: by 2002:a05:600c:3b90:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-4803e7f184amr26296545e9.25.1768916292638;
        Tue, 20 Jan 2026 05:38:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/26] libarchive: fix CVE-2025-60753 regression
Date: Tue, 20 Jan 2026 14:37:36 +0100
Message-ID: <b9f7d76975f634c93a599492a15d8a121274c6fb.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229720

From: Peter Marko <peter.marko@siemens.com>

Pick patch from PR mentioned in v3.8.5 release notes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...25-60753.patch => CVE-2025-60753-01.patch} |  0
 .../libarchive/CVE-2025-60753-02.patch        | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  3 +-
 3 files changed, 48 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch => CVE-2025-60753-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
similarity index 100%
rename from meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
rename to meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-01.patch
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
new file mode 100644
index 0000000000..525ee2462c
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
@@ -0,0 +1,46 @@
+From cfb02de558d843dc5355c4aa2aeb4af49f88bdb9 Mon Sep 17 00:00:00 2001
+From: Martin Matuska <martin@matuska.de>
+Date: Mon, 8 Dec 2025 21:40:46 +0100
+Subject: [PATCH] tar: fix off-bounds read resulting from #2787 (3150539ed)
+
+CVE: CVE-2025-60753
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/cfb02de558d843dc5355c4aa2aeb4af49f88bdb9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tar/subst.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/tar/subst.c b/tar/subst.c
+index a466f653..53497ad0 100644
+--- a/tar/subst.c
++++ b/tar/subst.c
+@@ -239,7 +239,7 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 		char isEnd = 0;
+ 		do {
+-            isEnd = *name == '\0';
++			isEnd = *name == '\0';
+ 			if (regexec(&rule->re, name, 10, matches, 0))
+ 				break;
+ 
+@@ -294,13 +294,13 @@ apply_substitution(struct bsdtar *bsdtar, const char *name, char **result,
+ 
+ 			realloc_strcat(result, rule->result + j);
+ 			if (matches[0].rm_eo > 0) {
+-                name += matches[0].rm_eo;
+-            } else {
+-                // We skip a character because the match is 0-length
+-                // so we need to add it to the output
+-                realloc_strncat(result, name, 1);
+-                name += 1;
+-            }
++				name += matches[0].rm_eo;
++			} else if (!isEnd) {
++				// We skip a character because the match is 0-length
++				// so we need to add it to the output
++				realloc_strncat(result, name, 1);
++				name += 1;
++			}
+ 		} while (rule->global && !isEnd); // Testing one step after because sed et al. run 0-length patterns a last time on the empty string at the end
+ 	}
+ 
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 66f30ec89b..e74326b40f 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -48,7 +48,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch \
            file://0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch \
            file://0001-Merge-pull-request-2768-from-Commandoss-master.patch \
-           file://CVE-2025-60753.patch \
+           file://CVE-2025-60753-01.patch \
+           file://CVE-2025-60753-02.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

