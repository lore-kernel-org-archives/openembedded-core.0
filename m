Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D78C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5476.1784741055732349583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x7roblTG;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so27815835e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741054; x=1785345854; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSvMhQ3BQ7h2vEz6oZUTYyOYG63Bc4HFxEx06mF6kNU=;
        b=x7roblTGA/HG3qJldDVqxWdvUW/jfyBvhSt8fL0h/3piOT6Zm473nZfU3USwOXFgSh
         JHSe6feAHxfv8ab5oNrUy+2uLiKZBs2v92Yb8ZLw15mAmqzcPYIHdfR92QJkaY3hUrfc
         ogbG6qYbCDj2qva0n55Es8ZkqxekpVhTM32jE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741054; x=1785345854;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSvMhQ3BQ7h2vEz6oZUTYyOYG63Bc4HFxEx06mF6kNU=;
        b=NkukXG+3eIaLCMlGE2YVpcDJG0lhzPt7ISbnMAmfB6kmcN1nsbXfxDZbZMTGF5Ezsj
         7NYPNjmRJIDJ+cUfwjI/MRbfFxT4u1B0gftLsUZFrzogrSw4TSKXFhBros8bt/W8IxX8
         3Vp9mukKlVOI61a1wkWhQCr0DMOMEklWbvMt/+35IhWPmsjwV/W/gjGPfQ/nyrEHQg9i
         A4uoy8p9gbKB84um4pVyu7uh+kgScVZnwbnupJPqQozBVRzS7gdVzBftlRwGQV4b8oVm
         KBvtOye3fiXikRIxjrMEMWvWNLTkogplBkxk6xNzqCKTn8EE4vOkcbT6f+uQAfdRMMLy
         3Krg==
X-Gm-Message-State: AOJu0YwUGxZPVHYcq3mlYCsgxnuDwQxvtZts6OoNhqExVEg1QozK68Zh
	7f7ZizMiR2TGWv3N4gPZES+eWsT9vDRVyiv9sLCB+Ac4wIm+bT4qi+x2UMo0NwoseSgCLXqsWB2
	2+yhs+tE=
X-Gm-Gg: AR+sD11SIeYRFi+iGDu0r+26EnMk5CxyVvZCwNb7wJK9nv2ndPTXlNUt9TH8efZglO3
	uLYnbkg0LYX/dsKgU5pp9W6jVJs2tv5ZP6kOmtIr2wp0a5GBRsuGIIcSxNHli+q8y/y9YvAQ6U0
	3q1I93rTL2LzaslKi9pCOadiL3HyqglU+jMn0JRr7UEqcZLnOROBDdzlJv4GQNw2J32vweNBbjK
	S9no3R0frHn/vPBIqMO20ZuchjEjJunLMC+zN2hopj/5bPHknWdPfpxuK2RFlrtJxGdZqJnuEJZ
	vrqJWUpFokCT8kDlosVFUsY5XOWnru9BcYBUedKIWYQEpjFteP+YCuxSk+MC+Q56ztjw/7jkXeV
	fLHOU9hNPDTtSi0PRb3wUi04pku57DR+zZ2lYWqXQBymTPQqpVljf1U8w2tyq673O/7NC4+YTK0
	g5xF7j3q34gvdkpa/BnCNbNDPRoxYfzfGh11BPOnUXjjF5Dt/y7NoII9wk2v6Z1I0ajuh5KL+Mr
	jarAHjr38qG
X-Received: by 2002:a05:600c:4755:b0:493:c2cc:aecb with SMTP id 5b1f17b1804b1-4954a51590fmr296307635e9.38.1784741053913;
        Wed, 22 Jul 2026 10:24:13 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 27/27] gzip: Fix CVE-2026-41991
Date: Wed, 22 Jul 2026 19:23:40 +0200
Message-ID: <0dfe86a27167689ded394d72ebb5e22157fb9184.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241737

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix for CVE-2026-41991 as referenced
in [2], using the upstream commit identified in [1].

[1] https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-41991

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../gzip/gzip-1.14/CVE-2026-41991.patch       | 75 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
new file mode 100644
index 00000000000..20c35fe352e
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41991.patch
@@ -0,0 +1,75 @@
+From b1545c47cddc9948cb0743b2ceb140a63c88acbc Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Thu, 16 Apr 2026 12:11:44 -0700
+Subject: [PATCH] gzexe: use -C if lacking mktemp
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+(Problem reported by Michał Majchrowicz.)
+* gzexe.in: If mktemp is needed but not installed,
+use ‘set -C’ to avoid a race when creating a temporary file.
+* zdiff.in: Use the same pattern here, even though the old
+code was probably OK anyway.
+
+CVE: CVE-2026-41991
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.git/commit/?id=4e6f8b24ab823146ab8776f0b7fe486ab34d4269]
+
+(cherry picked from commit 4e6f8b24ab823146ab8776f0b7fe486ab34d4269)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ NEWS     | 5 +++++
+ gzexe.in | 1 +
+ zdiff.in | 7 +++----
+ 3 files changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 53bdf56..2d2eb81 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,10 @@
+ GNU gzip NEWS                                    -*- outline -*-
+ 
++  On old-fashioned or limited platforms lacking mktemp, gzexe and
++  zdiff no longer have a race when creating a temporary file.
++  [bug present since the beginning]
++
++
+ * Noteworthy changes in release 1.14 (2025-04-09) [stable]
+ 
+ ** Bug fixes
+diff --git a/gzexe.in b/gzexe.in
+index 1267d6e..09a2571 100644
+--- a/gzexe.in
++++ b/gzexe.in
+@@ -127,6 +127,7 @@ for i do
+     tmp=`mktemp "${dir}gzexeXXXXXXXXX"`
+   else
+     tmp=${dir}gzexe$$
++    (umask 77; set -C; > "$tmp")
+   fi && { cp -p "$file" "$tmp" 2>/dev/null || cp "$file" "$tmp"; } || {
+     res=$?
+     printf >&2 '%s\n' "$0: cannot copy $file"
+diff --git a/zdiff.in b/zdiff.in
+index a8689a0..c04a8c0 100644
+--- a/zdiff.in
++++ b/zdiff.in
+@@ -156,12 +156,11 @@ case $file2 in
+                           *) TMPDIR=/tmp/;;
+                         esac
+                         if command -v mktemp >/dev/null 2>&1; then
+-                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"` ||
+-                            exit 2
++                          tmp=`mktemp "${TMPDIR}zdiffXXXXXXXXX"`
+                         else
+-                          set -C
+                           tmp=${TMPDIR}zdiff$$
+-                        fi
++                          (umask 77; set -C; > "$tmp")
++                        fi &&
+                         'gzip' -cdfq -- "$file2" > "$tmp" || exit 2
+                         gzip_status=$(
+                           exec 4>&1
+-- 
+2.53.0
+
diff --git a/meta/recipes-extended/gzip/gzip_1.14.bb b/meta/recipes-extended/gzip/gzip_1.14.bb
index 99174a58c53..d6bd36f89f9 100644
--- a/meta/recipes-extended/gzip/gzip_1.14.bb
+++ b/meta/recipes-extended/gzip/gzip_1.14.bb
@@ -7,6 +7,7 @@ LICENSE = "GPL-3.0-or-later"
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-41992.patch \
+           file://CVE-2026-41991.patch \
            "
 SRC_URI:append:class-target = " file://wrong-path-fix.patch"
 

