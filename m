Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F62AC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 04:11:10 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.14715.1716869459892940037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 21:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGNLYpYm;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57857e0f38eso17803a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 21:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716869458; x=1717474258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ald1jGUhTjouWOnGmVLFMrpxyQuK7PpWTFfjTg9yGxo=;
        b=HGNLYpYmsvF2ipWdhy6ojiKrH6SQtd9XxArJeZAQmJHVVtwoWBT/cB44aNXHgKec17
         Phk9ZOevvgge86vql34uYkfh1Nr8U3f6SaItgpAzDCbFmsCOfJcCRQwnsCdM+IDZa1l2
         Wcf3CU11wxuHHUdplzJzJbA949p3Mk0QS+cKNNb6ZLlT+YEh+8CZD3o/cHyLz0ufiDY6
         YbXE28r/Qor85XReaX+abMX4Bb3GMxpQsZ/OgIsw8tZzXZvxuPHAZA/ycpbJ8p3waAKD
         bJHTfS3ihfYz78ypFPds/ejn8+i3Bz+aXVpMiZ7Lpt3IeNQ/T2M4zwrvo6d/oYIlRztY
         lLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716869458; x=1717474258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ald1jGUhTjouWOnGmVLFMrpxyQuK7PpWTFfjTg9yGxo=;
        b=n2l08pCvSjibOMWkkzd449SLaTDpf6rw9I5HjvMpzi9BPWU7+bHEm9MHcvacMI+a6P
         CveeACqNkheZtDO3iMvMd/fIAW0U6DjMdeokrgd1DKuasSLkYS3gfMu0gRnTwuG/xNqO
         RQQEOxnOhdSYDN2+P22f0OA6w0Ur2R6DOU6yzG0FpzN5M59YbB8FrJslymDYx1nwtFLH
         +Y7qCr3DgyCTZctNDNqueAuiWPmLjAYGTEp543Z65eGowJgNiqbmhXtsHpCUVdeoETz9
         HX5Zfj8GJlI0U0V0/0IM7fSQ3YREdDyd8Ks0nt829NOraWjZBrV9A1XoELp/4kWL1o5v
         YhRg==
X-Gm-Message-State: AOJu0Yy5tcUZE3mlCs9aQt2H5DUcK8LL/sC/Ac9iIPR1wt9tMdI5PQy5
	dTSG8b0LOyh7g+8AdCS8RfROS6K3KaiS+3s/om8WOL7AFuIBIj7LutwI7w==
X-Google-Smtp-Source: AGHT+IGpSbd7ZpStSMEpnCj+RrkBfGnZkyT+b42LzY+dHnICwUwWO5VlVQNreDEIvtXUJXwlWIWCCQ==
X-Received: by 2002:a17:906:3698:b0:a61:a581:d5c with SMTP id a640c23a62f3a-a6265257695mr798726066b.6.1716869457584;
        Mon, 27 May 2024 21:10:57 -0700 (PDT)
Received: from localhost.localdomain (ip5f5af7df.dynamic.kabel-deutschland.de. [95.90.247.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda4151sm559544966b.197.2024.05.27.21.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 21:10:57 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] iptables: Do not install /etc/ethertypes
Date: Tue, 28 May 2024 04:10:53 +0000
Message-Id: <20240528041053.11356-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 04:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199950

The patch file was deleted by mistaken during 1.8.10 upgrade.
Re-introduce the patch file after re-writing based on 1.8.10 code.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 ...ile.am-do-not-install-etc-ethertypes.patch | 44 +++++++++++++++++++
 .../iptables/iptables_1.8.10.bb               |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch

diff --git a/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
new file mode 100644
index 0000000000..3aa40ac635
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0003-Makefile.am-do-not-install-etc-ethertypes.patch
@@ -0,0 +1,44 @@
+From 77024225a4d7a39e362296f0d1e5188a7c9340d4 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 28 May 2024 03:55:50 +0000
+Subject: [PATCH] Makefile.am do not install etc ethertypes
+
+The /etc/ethertypes is provided by netbase since 6.0[1].
+Do not instal the file in ebtables, otherwise there would be a conflict:
+Error: Transaction test error:
+  file /etc/ethertypes conflicts between attempted installs of
+netbase-1:6.2-r0.corei7_64 and iptables-1.8.7-r0.corei7_64
+
+[1] https://salsa.debian.org/md/netbase/-/commit/316680c6a2c3641b6abc76b3eebf88781f609d35)
+
+This patch is based off of the same change made for the ebtables recipe:
+
+http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-filter/ebtables/ebtables-2.0.11/0001-Makefile.am-do-not-install-etc-ethertypes.patch?h=master
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
+---
+ Makefile.am | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 299ab46..7b60eb4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -18,11 +18,6 @@ SUBDIRS         += iptables
+ 
+ EXTRA_DIST	= autogen.sh iptables-test.py xlate-test.py
+ 
+-if ENABLE_NFTABLES
+-confdir		= $(sysconfdir)
+-dist_conf_DATA	= etc/ethertypes
+-endif
+-
+ .PHONY: tarball
+ tarball:
+ 	rm -Rf /tmp/${PACKAGE_TARNAME}-${PACKAGE_VERSION};
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index 5a87897742..8cb9b76ca1 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
+           file://0003-Makefile.am-do-not-install-etc-ethertypes.patch \
            file://0002-iptables-xshared.h-add-missing-sys.types.h-include.patch \
            file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
            "
-- 
2.34.1


