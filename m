Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0646DC0018C
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13938.1699451236389444965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OVhvAnse;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1cc0d0a0355so52799385ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451235; x=1700056035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHP3tw2h4nTW77qb+cqnfCePXvLJHxljCV+50coVXqI=;
        b=OVhvAnseVrjkokJXOZaDdLOX3IGvRAR1OXdk28nfQFb/cdrg1m/xvYWBcwpRQ3HurW
         yIYh9YEjaYWcfgBkISRWbvtBf+BdTTEHoQclxEiBVsv2POOJUDWETOsAGpJ5YXX9FTEL
         bdAhlvWYto313ioKUzHUQDXklKkTPCDB65QqTO11mrYXfnhie2oa9mQTfgCA3ZEI7bV0
         IEYk03EPFknjxzT6UPusGvcJmiQBcIMzi0sIuVTD4iFIedgaJG8pTkef30G64WiTVMuV
         AvjQmevJB7hRvpSgcc+cHQzKzAcEX1aCn9ROZouQz5QxiV5j+TVk3N4oEQpAkRUp0Pr9
         IelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451235; x=1700056035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHP3tw2h4nTW77qb+cqnfCePXvLJHxljCV+50coVXqI=;
        b=kOO6TxhohA9GUoyt45bZiDZ5XCjkE+odqg8Dapow8AUBEX0ua4y7QOJBJ9IKVZaYe+
         B5viQi+MRuJN+GRXcQNGcCXbo9o4FgubTjq2siWrGz5cc+RqlwO28M57w5PSEeDxvMrk
         o8c/WD3v0lRVtSzBBULudMWPwa6WSCPcm3iqJGaKqBbioHcLXf4l7WACtVy3ew0M3Nrr
         t9kUw5XBw3wh7VCnflyMV/BrJykJ4RmqfGhlNQntmV5Y+fPu5xAlLDc5IX3XyxC4S/J8
         Q7Gt8/pWsokf/FHhA4Ktl0cPDG82aydaq0hMBHzsKQsDTZWyTqSYIHCxh4Hg8hZadLdx
         zkTQ==
X-Gm-Message-State: AOJu0Yx+6MaDE4IlqE0W5iz7VUAdeDeyNkfo75i1zX+b8z7f8A6ZcBw4
	4EJYVomu5lTqidLrDPLPyh7c9GrhJf3sMsAh6cM0Sw==
X-Google-Smtp-Source: AGHT+IE9iU55voW2A6H9QiQSgXL+CZ3bM/x0wFb1OP7DooN0tWx2/PV8Y4ffNBXGYsHkbEatkr88HQ==
X-Received: by 2002:a17:902:ead4:b0:1cc:ef37:664a with SMTP id p20-20020a170902ead400b001ccef37664amr1803292pld.31.1699451235038;
        Wed, 08 Nov 2023 05:47:15 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.47.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:47:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/10] systemd: backport patch to fix warning in systemd-vconsole-setup
Date: Wed,  8 Nov 2023 03:46:51 -1000
Message-Id: <07c31cd6190476d9d9a4de750a30fe0fb3a93b21.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190336

From: Chen Qi <Qi.Chen@windriver.com>

The backported patch fixes the following warning:
systemd-vconsole-setup[221]: Failed to import credentials, ignoring: No such file or directory

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...l-return-0-for-missing-creds-in-read.patch | 139 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_253.1.bb    |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch b/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch
new file mode 100644
index 0000000000..953afd20b4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-shared-creds-util-return-0-for-missing-creds-in-read.patch
@@ -0,0 +1,139 @@
+From 78fc42be73d81ff625f6479784ce1950bd4741b3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Tue, 25 Apr 2023 17:58:34 +0200
+Subject: [PATCH] shared/creds-util: return 0 for missing creds in
+ read_credential_strings_many
+
+Realistically, the only thing that the caller can do is ignore failures related
+to missing credentials. If the caller requires some credentials to be present,
+they should just check which output variables are not NULL. One of the callers
+was already doing that, and the other wanted to, but missed -ENOENT. By
+suppressing -ENOENT and -ENXIO, both callers are simplified.
+
+Fixes a warning at boot:
+systemd-vconsole-setup[221]: Failed to import credentials, ignoring: No such file or directory
+
+(cherry picked from commit 55ace8e5c58441d1a2c64b297a38b232ef0c0e28)
+
+Upstream-Status: Backport [1575f1d9e78ab44beedd4eae4af3a14d45312d76]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/resolve/resolved-conf.c   |  7 +++----
+ src/shared/creds-util.c       | 18 +++++++++++-------
+ src/test/test-creds.c         |  8 ++++----
+ src/vconsole/vconsole-setup.c |  2 +-
+ 4 files changed, 19 insertions(+), 16 deletions(-)
+
+diff --git a/src/resolve/resolved-conf.c b/src/resolve/resolved-conf.c
+index d6929984e9..52e65caffa 100644
+--- a/src/resolve/resolved-conf.c
++++ b/src/resolve/resolved-conf.c
+@@ -476,10 +476,9 @@ static void read_credentials(Manager *m) {
+         if (!m->read_resolv_conf)
+                 return;
+ 
+-        r = read_credential_strings_many(
+-                        "network.dns", &dns,
+-                        "network.search_domains", &domains);
+-        if (r < 0 && !IN_SET(r, -ENXIO, -ENOENT))
++        r = read_credential_strings_many("network.dns", &dns,
++                                         "network.search_domains", &domains);
++        if (r < 0)
+                 log_warning_errno(r, "Failed to read credentials, ignoring: %m");
+ 
+         if (dns) {
+diff --git a/src/shared/creds-util.c b/src/shared/creds-util.c
+index 750ee2571e..617bae4205 100644
+--- a/src/shared/creds-util.c
++++ b/src/shared/creds-util.c
+@@ -96,17 +96,21 @@ int read_credential_strings_many_internal(
+ 
+         /* Reads a bunch of credentials into the specified buffers. If the specified buffers are already
+          * non-NULL frees them if a credential is found. Only supports string-based credentials
+-         * (i.e. refuses embedded NUL bytes) */
++         * (i.e. refuses embedded NUL bytes).
++         *
++         * 0 is returned when some or all credentials are missing.
++         */
+ 
+         if (!first_name)
+                 return 0;
+ 
+         r = read_credential(first_name, &b, NULL);
+-        if (r == -ENXIO) /* no creds passed at all? propagate this */
+-                return r;
+-        if (r < 0)
+-                ret = r;
+-        else
++        if (r == -ENXIO) /* No creds passed at all? Bail immediately. */
++                return 0;
++        if (r < 0) {
++                if (r != -ENOENT)
++                        ret = r;
++        } else
+                 free_and_replace(*first_value, b);
+ 
+         va_list ap;
+@@ -127,7 +131,7 @@ int read_credential_strings_many_internal(
+ 
+                 r = read_credential(name, &bb, NULL);
+                 if (r < 0) {
+-                        if (ret >= 0)
++                        if (ret >= 0 && r != -ENOENT)
+                                 ret = r;
+                 } else
+                         free_and_replace(*value, bb);
+diff --git a/src/test/test-creds.c b/src/test/test-creds.c
+index 44022e7324..25b0c34a59 100644
+--- a/src/test/test-creds.c
++++ b/src/test/test-creds.c
+@@ -16,7 +16,7 @@ TEST(read_credential_strings) {
+         if (e)
+                 assert_se(saved = strdup(e));
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENXIO);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(y == NULL);
+ 
+@@ -24,20 +24,20 @@ TEST(read_credential_strings) {
+ 
+         assert_se(setenv("CREDENTIALS_DIRECTORY", tmp, /* override= */ true) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(y == NULL);
+ 
+         assert_se(p = path_join(tmp, "bar"));
+         assert_se(write_string_file(p, "piff", WRITE_STRING_FILE_CREATE|WRITE_STRING_FILE_AVOID_NEWLINE) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(streq(y, "piff"));
+ 
+         assert_se(write_string_file(p, "paff", WRITE_STRING_FILE_TRUNCATE|WRITE_STRING_FILE_AVOID_NEWLINE) >= 0);
+ 
+-        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == -ENOENT);
++        assert_se(read_credential_strings_many("foo", &x, "bar", &y) == 0);
+         assert_se(x == NULL);
+         assert_se(streq(y, "piff"));
+ 
+diff --git a/src/vconsole/vconsole-setup.c b/src/vconsole/vconsole-setup.c
+index 7d3e9db73f..b2676eb487 100644
+--- a/src/vconsole/vconsole-setup.c
++++ b/src/vconsole/vconsole-setup.c
+@@ -442,7 +442,7 @@ int main(int argc, char **argv) {
+                         "vconsole.font", &vc_font,
+                         "vconsole.font_map", &vc_font_map,
+                         "vconsole.font_unimap", &vc_font_unimap);
+-        if (r < 0 && r != -ENXIO)
++        if (r < 0)
+                 log_warning_errno(r, "Failed to import credentials, ignoring: %m");
+ 
+         /* Load data from configuration file (middle priority) */
+-- 
+2.42.0
+
diff --git a/meta/recipes-core/systemd/systemd_253.1.bb b/meta/recipes-core/systemd/systemd_253.1.bb
index f306765168..3d8e2b4816 100644
--- a/meta/recipes-core/systemd/systemd_253.1.bb
+++ b/meta/recipes-core/systemd/systemd_253.1.bb
@@ -25,6 +25,7 @@ SRC_URI += " \
            file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0008-implment-systemd-sysv-install-for-OE.patch \
            file://0004-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
+           file://0001-shared-creds-util-return-0-for-missing-creds-in-read.patch \
            "
 
 # patches needed by musl
-- 
2.34.1


