Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000A9E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 20:56:56 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3984.1733864207001019242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 12:56:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q02RLA8r;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3389770a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733864206; x=1734469006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck0vvc5jpzVntllXROP+LsBxGyUhnv6sotCL0ScrpKM=;
        b=Q02RLA8rDnQBahMfJquEv/G1JgaRnPq597eEGbNbowYskd1vVlu8byiDhLwQDbxxQV
         iH6MEM8BQVW2+3swb9S+6TSLQOTB0K+6Dh9+cNPAzvpqtx2Jhg81B23d0s1B4uI+NuDM
         n/L1gW4mtypWv3iMHyZxNVciDv7mPlVJlqXrO+JiZoQ68AEWSBH/eDfXmKpA2mPe8iNz
         eqHUhCvjfBfDYSe9NxAjWalfFpl1jQYRWzoQu+jk60z5j9jcY6AVnRklzgQgF5MqRle/
         dlHpvMKeInKw9+6vVk+GadtOIEeO9tBHovfNFTqdWB6QVLuk9iXewi4/WqIy6oMja2Av
         6odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733864206; x=1734469006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ck0vvc5jpzVntllXROP+LsBxGyUhnv6sotCL0ScrpKM=;
        b=pGQumT16G6iycvi7GF9GCMrrzmWSyEjltIU4lpOjNxsuJNQCOfmbdr4JCgPHNLn9hG
         KGOQ6RGcj2sKLoee0zOHbyYRSfJWnuVdM2c54HJjekOw4Pv0EK/WZ9KGIKN4SiPohfKT
         YzU++V4TJ0wmGhXMGiLoXUch7kstNUCck/WKAXoehj0dZ9+W2G9R96ava4nUz9ra2+Ja
         UmSPhtMUTmfPhwNJ1QvGcbFF+1f17CmZmQYhWpqrjHzddrLZBZimHBkLnNd++QJnhfAh
         9EcPfvdXRAjn0avYWuc061LBJ5aZY28+X/NHFW6ureQDmr5rLp0fm/kW2t+zD4JpaDbd
         5BdQ==
X-Gm-Message-State: AOJu0Yy7r+uBpdEROkBOvcmXBTKdm1FxO4JgMofo2QOpzsxFlPYmxqOR
	5jO4DZH2SEfiQTZGiq55EjYglFBON1kjz9i3ucp4Mb2Tq/TqIM+wztbk1r814C79X+BzkbnujZ2
	z
X-Gm-Gg: ASbGncu8SC9/JeFhgHUvfMYfOsTmuuu5mMXgKDVf8DMl9jT2y1y8lU0TBlyguXqJ6ZL
	/m8FY+sEX7fe4SJgdsezZB1ul0FpGp7/RviIpnjBQKk+5dbUozpMMSRKnzXWE8b65ehDGP6Qnwl
	6olsNAgVxc48NM7uJIEW5lYxh7LOc0afN5hzgwVOCM2nKcXX2V4TYxFoQ6vEMgmeN1b7J17V292
	rJBPcIpAOVms7o6bzDgWAkxHSOh6me6TuY1etLaWdU=
X-Google-Smtp-Source: AGHT+IEYaFFDknjMDrKasts68PpQ6t5d/c7raSU6uny2OpPBLEkaN5qBHkhB8vm8uAN9n4Co+5wsrQ==
X-Received: by 2002:a17:90b:2812:b0:2ea:7fd8:9dc1 with SMTP id 98e67ed59e1d1-2f127fdbcc9mr594765a91.18.1733864206297;
        Tue, 10 Dec 2024 12:56:46 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff77b9sm10245470a91.36.2024.12.10.12.56.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:56:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/12] libpam: fix CVE-2024-10041
Date: Tue, 10 Dec 2024 12:56:23 -0800
Message-Id: <0e76d9bf150ac3bf96081cc1bda07e03e16fe994.1733863624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733863624.git.steve@sakoman.com>
References: <cover.1733863624.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 20:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208550

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
 meta/recipes-extended/pam/libpam_1.5.3.bb     |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/CVE-2024-10041.patch

diff --git a/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch b/meta/recipes-extended/pam/libpam/CVE-2024-10041.patch
new file mode 100644
index 0000000000..41949cbf2a
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
+index 81b10d8..97a81d6 100644
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
diff --git a/meta/recipes-extended/pam/libpam_1.5.3.bb b/meta/recipes-extended/pam/libpam_1.5.3.bb
index f05272652d..55b4dd7ee1 100644
--- a/meta/recipes-extended/pam/libpam_1.5.3.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.3.bb
@@ -27,6 +27,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://0001-pam_namespace-include-stdint-h.patch \
            file://0001-pam_pwhistory-fix-passing-NULL-filename-argument-to-.patch \
            file://CVE-2024-22365.patch \
+           file://CVE-2024-10041.patch \
            "
 
 SRC_URI[sha256sum] = "7ac4b50feee004a9fa88f1dfd2d2fa738a82896763050cd773b3c54b0a818283"
-- 
2.34.1


