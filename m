Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D9CFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 12:42:14 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12470.1777380128567407581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 05:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hzSObcdi;
 spf=pass (domain: mvista.com, ip: 74.125.82.175, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2d832f2f44cso9602371eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 05:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1777380128; x=1777984928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gc8Lmas5ZG1YYeX8RR0zFF45XiVRdVifdnTkOzh3qRM=;
        b=hzSObcdiQT8rzF1O/UOwz0qtaEyv57WggQ8DSDGvoWdWRqAFUUUyzkmtEV87fOBvgg
         ALsyCfY7tuIbz9y22L7YUSJzdZJR+KwAIyCLRrsfTJ1kXyf7jyLVgFENZ+PZN2/AYM9D
         9a7F+dxPeXEgkD/nu6X6YQq9uoQ3i8cLHiN40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777380128; x=1777984928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gc8Lmas5ZG1YYeX8RR0zFF45XiVRdVifdnTkOzh3qRM=;
        b=BR+zQ/pPbERAqtQnM5laSz7SjGysEQtLeodTaiqRdzJnO6ylBEN/GrTiyxqdT4fphj
         1oO1x9Quu7Kgkotqom6OCXcQXuvFjQhGY102Hq8f/HkB4g+2vOfmTCJqAS4nbvwujbum
         ycO80pyrYQX3iP0pbvqhSQR1FlIo3eWPgHBgkvCKBG2CVse8jMMxQ46UbZv3CUY1/B9O
         Xu5jL+Xl5a8F3EWJzOhfT/hx58d47tZFbzd1g/s95TH6Kc0nMoKGkjKC1T0ZGzBC4ES+
         JHbhp30sZVuPopOH5Ja+qSi2YqdAT1dLmTFkLs2Es0bmpaWW3HU6jSDUFDdVqg842L80
         fqUg==
X-Gm-Message-State: AOJu0Yy1sFPnehab7FWGza3d1nbs9uwwdBH4oTU8gZQtM/b//ITlK4bd
	k1XptskSC3PJMsCbyywYvQP+EYinHYXaDqZx3JJGgm8kUlG8ylNQfjOugf+WouIVa+VZpPOZ83J
	baJbT
X-Gm-Gg: AeBDietDmh+uJsrZqcFUkuiVtvVSz8cKKg6S4k1HsDL2LSn24i0afVGigyfgOGL1yzX
	kakVhp3qKrxpRES3Pf+J66c1eMGjweC73YtepcGRiBw1wXj3qbg6HCuKlWq0DtgdN1w5glDZwrZ
	lMf2dO2z9TmNMyiSwTm8KMmEXsn65b8dHSZqAOZ40rKPBF1hvnqPB8BNF74hb/lUysNNlLNpvk8
	RhClMpebh1zC2AERM/aynaFuHthQFy6in7UthVuiHjvKbvpwc01dthi1lFeWDCEEqnggMmFuuWx
	jaNzhypqwafExbQ7s0dNnqdjnO4iTttT1XuILJPt4CHAEJnKzpsVZ8Pm8hQ7SWPmEueVjGemlRq
	Z8plz8Yr+urTdf7rRuHR4qR7eZbdrO1CGu3mqX9WRQPa/J23qdMYMo8tiI+EzEZA6KSkgPAFNHc
	hUno0f4gtdC3FPri2Uy3lAcruVQjoTqrODczuDP4AUso7x899tBTYqjAs4ZQ==
X-Received: by 2002:a05:7300:642a:b0:2ea:b975:3db1 with SMTP id 5a478bee46e88-2ed0a0a8bb3mr1272021eec.23.1777380127579;
        Tue, 28 Apr 2026 05:42:07 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce761sm2153638eec.15.2026.04.28.05.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:42:07 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] systemd: fix for CVE-2026-40226
Date: Tue, 28 Apr 2026 18:12:00 +0530
Message-ID: <20260428124200.661553-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 12:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236061

Backport commit[0] and [1] which fixes this vulnerability as mentioned in Debian report [2].

[0] https://github.com/systemd/systemd/commit/773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a
[1] https://github.com/systemd/systemd/commit/bfa0a842822c4f79da9d47f8a773fd128d8f8a0a
[2] https://security-tracker.debian.org/tracker/CVE-2026-40226

More details : https://nvd.nist.gov/vuln/detail/CVE-2026-40226

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../systemd/systemd/CVE-2026-40226-01.patch   | 63 +++++++++++++++++++
 .../systemd/systemd/CVE-2026-40226-02.patch   | 39 ++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  2 +
 3 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
new file mode 100644
index 0000000000..6f2893cab7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40226-01.patch
@@ -0,0 +1,63 @@
+From 773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Wed, 11 Mar 2026 12:15:26 +0000
+Subject: [PATCH] nspawn: apply BindUser/Ephemeral from settings file only if
+ trusted
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for 2f8930449079403b26c9164b8eeac78d5af2c8df
+Follow-up for a2f577fca0be79b23f61f033229b64884e7d840a
+
+(cherry picked from commit 61bceb1bff4b1f9c126b18dc971ca3e6d8c71c40)
+(cherry picked from commit 718711ed876c870a72149eea279b819cdab14e91)
+(cherry picked from commit e4db9c12957d315c0ed22c6ca87a816d0927d6dc)
+
+
+CVE: CVE-2026-40226
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/773fd3b6e72e6c83cbb1cfc1cb20f3793db8649a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/nspawn/nspawn.c | 18 ++++++++++++++----
+ 1 file changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/nspawn/nspawn.c b/src/nspawn/nspawn.c
+index 005a3d2be1..0ac0c94f06 100644
+--- a/src/nspawn/nspawn.c
++++ b/src/nspawn/nspawn.c
+@@ -4275,8 +4275,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_EPHEMERAL) == 0 &&
+-            settings->ephemeral >= 0)
+-                arg_ephemeral = settings->ephemeral;
++            settings->ephemeral >= 0) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring ephemeral setting, file %s is not trusted.", path);
++                else
++                        arg_ephemeral = settings->ephemeral;
++        }
+ 
+         if ((arg_settings_mask & SETTING_DIRECTORY) == 0 &&
+             settings->root) {
+@@ -4444,8 +4449,13 @@ static int merge_settings(Settings *settings, const char *path) {
+         }
+ 
+         if ((arg_settings_mask & SETTING_BIND_USER) == 0 &&
+-            !strv_isempty(settings->bind_user))
+-                strv_free_and_replace(arg_bind_user, settings->bind_user);
++            !strv_isempty(settings->bind_user)) {
++
++                if (!arg_settings_trusted)
++                        log_warning("Ignoring bind user setting, file %s is not trusted.", path);
++                else
++                        strv_free_and_replace(arg_bind_user, settings->bind_user);
++        }
+ 
+         if ((arg_settings_mask & SETTING_NOTIFY_READY) == 0 &&
+             settings->notify_ready >= 0)
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch b/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch
new file mode 100644
index 0000000000..47f780e6c5
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2026-40226-02.patch
@@ -0,0 +1,39 @@
+From bfa0a842822c4f79da9d47f8a773fd128d8f8a0a Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <luca.boccassi@gmail.com>
+Date: Wed, 11 Mar 2026 13:27:14 +0000
+Subject: [PATCH] nspawn: normalize pivot_root paths
+
+Originally reported on yeswehack.com as:
+YWH-PGM9780-116
+
+Follow-up for b53ede699cdc5233041a22591f18863fb3fe2672
+
+(cherry picked from commit 7b85f5498a958e5bb660c703b8f4a71cceed3373)
+(cherry picked from commit 6566dc1451089e07090f5a114ae2eb43ed39188d)
+(cherry picked from commit 1c55a0a5e26a07df828f72092ad1203e221b60db)
+
+CVE: CVE-2026-40226
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/bfa0a842822c4f79da9d47f8a773fd128d8f8a0a]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/nspawn/nspawn-mount.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/nspawn/nspawn-mount.c b/src/nspawn/nspawn-mount.c
+index 470f477f22..09c442a63a 100644
+--- a/src/nspawn/nspawn-mount.c
++++ b/src/nspawn/nspawn-mount.c
+@@ -1255,7 +1255,9 @@ int pivot_root_parse(char **pivot_root_new, char **pivot_root_old, const char *s
+ 
+         if (!path_is_absolute(root_new))
+                 return -EINVAL;
+-        if (root_old && !path_is_absolute(root_old))
++        if (!path_is_normalized(root_new))
++                return -EINVAL;
++        if (root_old && (!path_is_absolute(root_old) || !path_is_normalized(root_old)))
+                 return -EINVAL;
+ 
+         free_and_replace(*pivot_root_new, root_new);
+-- 
+2.50.1
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
index fe9d699816..9c5f8af240 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -31,6 +31,8 @@ SRC_URI += " \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://CVE-2026-40225-01.patch \
            file://CVE-2026-40225-02.patch \
+           file://CVE-2026-40226-01.patch \
+           file://CVE-2026-40226-02.patch \
            "
 
 # patches needed by musl
-- 
2.50.1


