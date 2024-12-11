Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D55E7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 14:47:55 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.12658.1733928466245395964
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 06:47:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T4cdAr9r;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-724d23df764so6223563b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 06:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733928465; x=1734533265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYjMkaoGEaKt/q4iK2mzdmEZcsVOPf1Xvrsj8fXtqVU=;
        b=T4cdAr9rWYRXSWiEojuW5j6mB/hd5Jwx/Gj1gEMFx5Qjh2sR4qZ9ad4ORH1I4o03Kf
         WJeR9xKoe5n5sTjHuFQ7FOM4CddnoC+0NWjPriFBbMTtR976H87RsSNBC0E7DAG3bJ9g
         MOlmy345/f9fIBbaWycSn7uDrabvQj/M2itiV28d92vPEzCTP3bzAf0uZbGwMJ9I3pNi
         NdaUuowUhfK6FNiIP5bck+iQIvDJHm4v28+SxQXhKjasdEDRseBD30gJ7LhOL+3kISHl
         ySd9KfyJdqr3v8L/I1eN3PL5OxTY5apyuWxw8wT/rGOx3hgfAazXM9+WaVwyvpUk/oAJ
         BAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733928465; x=1734533265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYjMkaoGEaKt/q4iK2mzdmEZcsVOPf1Xvrsj8fXtqVU=;
        b=A5uv9ia5alAO2YpZStH/jQzzXmh6GiYVP5xP16lNpKWL6q+3L9hrqXQt1YdbIINW0S
         pQjfohpZSxh1cUv6SSu5drgYE8V40l8aT7mWBZd4EalKz9goW9/zE94cNAUoVoATilbI
         Erqo8zv3Qjr2IFL4fbQsY9o1N+AYRMtjVV0NbE2q0Mk5kckPVx+deRSPjZ29n4YA/LyE
         ulow/9C59IJ4j2ZhlJxRNshXgH/FhVjSOXxWuh8J9N1hDtoIu43rEjVfZ2Mjz8bZDgLL
         LamUVkcv2pw4HBVHOxnM1RwGjdHjFdxFv491JqaKX7o/HEQEsf9c2abE2m1jbTTbfBY+
         7uaw==
X-Gm-Message-State: AOJu0YwakfiZyXyyU2o1QcuDkDBMcMcmZCGkMhhGHfxTRWTCO9xzOvQz
	/fo+DJk9jn+DVbmHEsNNNutxNZklu+cUfGS0tCQ8n9dkigFsSCVgmeygiItL77zWCjQR/L4jaMH
	9
X-Gm-Gg: ASbGncsh5oy71N+iasm79qP4HmFD4ypBqTi1Cd263BPoT2CUWQdZzAvItmVfJhpl7Mx
	8xt/DeSPMMb34iY4/kjyMHJp8pTiuKRiONim096Qz2A5Sr1BtKy5krCFuOCnk9vjMx0mGgYN3Wt
	wx59qydLG8vQ+rcuMMeixs28hDTnX1iZKUMrby895ebAyQEZNMvRh3hwgVAnsvmMXP3e1ysR22q
	+wewWBS7KylE0Xk5ePbkYGTqIFTAYqHj+5cKrdkIv8=
X-Google-Smtp-Source: AGHT+IEdZ2+BtKQjpdJXIadOof1h9E5qAqLEvPjmkuADVXMK10WHgQdcF1l8aWMFpUfKBfrcGhB3Rw==
X-Received: by 2002:a05:6a20:ad0c:b0:1e1:9662:a6f2 with SMTP id adf61e73a8af0-1e1cdb210ddmr227588637.35.1733928465368;
        Wed, 11 Dec 2024 06:47:45 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd3891dc95sm7494377a12.42.2024.12.11.06.47.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 06:47:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] libpam: fix CVE-2024-10041
Date: Wed, 11 Dec 2024 06:47:32 -0800
Message-Id: <3422c2533caaa2664944315580c52a2272815305.1733928291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733928291.git.steve@sakoman.com>
References: <cover.1733928291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 14:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208587

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability was found in PAM. The secret information is
stored in memory, where the attacker can trigger the victim
program to execute by sending characters to its standard
input (stdin). As this occurs, the attacker can train the
branch predictor to execute an ROP chain speculatively.
This flaw could result in leaked passwords, such as those
found in /etc/shadow while performing authentications.

References:
https://security-tracker.debian.org/tracker/CVE-2024-10041

Upstream patches:
https://github.com/linux-pam/linux-pam/commit/b3020da7da384d769f27a8713257fbe1001878be

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pam/libpam/CVE-2024-10041.patch           | 98 +++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.5.2.bb     |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
new file mode 100644
index 0000000000..cb0490299b
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
@@ -0,0 +1,98 @@
+From b3020da7da384d769f27a8713257fbe1001878be Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Mon, 1 Jan 2024 12:00:00 +0000
+Subject: [PATCH] pam_unix/passverify: always run the helper to obtain shadow 
+ password file entries
+
+Initially, when pam_unix.so verified the password, it used to try to
+obtain the shadow password file entry for the given user by invoking
+getspnam(3), and only when that didn't work and the effective uid
+was nonzero, pam_unix.so used to invoke the helper as a fallback.
+
+When SELinux support was introduced by commit
+67aab1ff5515054341a438cf9804e9c9b3a88033, the fallback was extended
+also for the case when SELinux was enabled.
+
+Later, commit f220cace205332a3dc34e7b37a85e7627e097e7d extended the
+fallback conditions for the case when pam_modutil_getspnam() failed
+with EACCES.
+
+Since commit 470823c4aacef5cb3b1180be6ed70846b61a3752, the helper is
+invoked as a fallback when pam_modutil_getspnam() fails for any reason.
+
+The ultimate solution for the case when pam_unix.so does not have
+permissions to obtain the shadow password file entry is to stop trying
+to use pam_modutil_getspnam() and to invoke the helper instead.
+Here are two recent examples.
+
+https://github.com/linux-pam/linux-pam/pull/484 describes a system
+configuration where libnss_systemd is enabled along with libnss_files
+in the shadow entry of nsswitch.conf, so when libnss_files is unable
+to obtain the shadow password file entry for the root user, e.g. when
+SELinux is enabled, NSS falls back to libnss_systemd which returns
+a synthesized shadow password file entry for the root user, which
+in turn locks the root user out.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=2150155 describes
+essentially the same problem in a similar system configuration.
+
+This commit is the final step in the direction of addressing the issue:
+for password verification pam_unix.so now invokes the helper instead of
+making the pam_modutil_getspnam() call.
+
+* modules/pam_unix/passverify.c (get_account_info) [!HELPER_COMPILE]:
+Always return PAM_UNIX_RUN_HELPER instead of trying to obtain
+the shadow password file entry.
+
+Complements: https://github.com/linux-pam/linux-pam/pull/386
+Resolves: https://github.com/linux-pam/linux-pam/pull/484
+Link: https://github.com/authselect/authselect/commit/1e78f7e048747024a846fd22d68afc6993734e92
+
+CVE: CVE-2024-10041
+
+Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/commit/b3020da7da384d769f27a8713257fbe1001878be]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ modules/pam_unix/passverify.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/modules/pam_unix/passverify.c b/modules/pam_unix/passverify.c
+index f2474a5..b300522 100644
+--- a/modules/pam_unix/passverify.c
++++ b/modules/pam_unix/passverify.c
+@@ -237,20 +237,21 @@ PAMH_ARG_DECL(int get_account_info,
+ 			return PAM_UNIX_RUN_HELPER;
+ #endif
+ 		} else if (is_pwd_shadowed(*pwd)) {
++#ifdef HELPER_COMPILE
+ 			/*
+-			 * ...and shadow password file entry for this user,
++			 * shadow password file entry for this user,
+ 			 * if shadowing is enabled
+ 			 */
+-			*spwdent = pam_modutil_getspnam(pamh, name);
+-			if (*spwdent == NULL) {
+-#ifndef HELPER_COMPILE
+-				/* still a chance the user can authenticate */
+-				return PAM_UNIX_RUN_HELPER;
+-#endif
+-				return PAM_AUTHINFO_UNAVAIL;
+-			}
+-			if ((*spwdent)->sp_pwdp == NULL)
++			*spwdent = getspnam(name);
++			if (*spwdent == NULL || (*spwdent)->sp_pwdp == NULL)
+ 				return PAM_AUTHINFO_UNAVAIL;
++#else
++			/*
++			 * The helper has to be invoked to deal with
++			 * the shadow password file entry.
++			 */
++			return PAM_UNIX_RUN_HELPER;
++#endif
+ 		}
+ 	} else {
+ 		return PAM_USER_UNKNOWN;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
index 20745aa837..05fe232f6a 100644
--- a/meta/recipes-extended/pam/libpam_1.5.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://CVE-2022-28321-0002.patch \
            file://0001-pam_motd-do-not-rely-on-all-filesystems-providing-a-.patch \
            file://CVE-2024-22365.patch \
+           file://CVE-2024-10041.patch \
            "
 
 SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
-- 
2.34.1


