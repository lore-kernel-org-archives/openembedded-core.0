Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 128477706A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:42:15 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id f1so72268086igr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7GS3VRl5LLJgLSPDGzLdCEyDZS3WT/FzVGMDr1ne2lg=;
	b=boZ1YvhfLwJClgK8tUdcJ6U3J1YvPKnnOKVLJfryXSJt06IOz8TMT1DTuCDkrgB0WR
	LHGxOW3DVpYIVf8NDIQ5vId0l0DIOpC61J6m0RmNfBh9gg73qh6MSDZ/HAscXo7tmXze
	atqs+vNrJ1cS+ZQrT4Tr2TV4vrM+RBGUJ3UgSPWccGsQq4TPak/JHi6I/lHuxd0JZep+
	qbZn4wKotqPl3suZMHgda+mxSNHZbtNsrs79Lf0oECPBXlgFXKziy8r3wZZT1SObnwhP
	HrJsP//GYPwXKZcRJ7SGoQT/2Wqs5o/GM/Xg9nVyX5ILhvuvheoaMkuvp/4iFcol7xam
	wlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7GS3VRl5LLJgLSPDGzLdCEyDZS3WT/FzVGMDr1ne2lg=;
	b=PaeFKUeobhpoTVH3YjUGRqyDqIy87mYoJBiPnr95ujM5TA7ckQirnSm2Q/rkuTJs/O
	wOapTQvjnPXfX75RHDcNgEUbqXaDQH/x9QLPajD58arEOmk2S6SNhmqoFOS0fUftwC+M
	ENwYl5HjUTVM4yUEMzOit6z6YcxBmA8835J6mwlON7yAn9zqv5FZk0llDik1Rbnb/+2Q
	OIzXyBiDeaPhIIqxAJgHmEHXYaHiea6VYJ2VVq3ce0Qgu32autXfnyqmFz5nZIY/+MSu
	sIjZvfeWwZIzv+87mRlT28pdB7R3agw6SIRm5KhyALKPjB3+YAauLx40jRTh62yXceRU
	0Z+w==
X-Gm-Message-State: AD7BkJIQ/XqYQPI1nt6Oz7++Qu1vbR5M8Ej99t2KvTZzaJzIndu/wTSJeSIYFLdx0D4pX8AD
X-Received: by 10.107.134.151 with SMTP id q23mr15626296ioi.25.1459777335064; 
	Mon, 04 Apr 2016 06:42:15 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56B6F.dip0.t-ipconnect.de.
	[87.165.107.111]) by smtp.gmail.com with ESMTPSA id
	g67sm11657048ioe.34.2016.04.04.06.42.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:42:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 15:41:43 +0200
Message-Id: <af63dbfb9cff4fbbd38bccbff955af03cbda3f92.1459776943.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
References: <bcd7b4f85a904081342992ec49c92ca3bcf0449b.1459776943.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1459776943.git.patrick.ohly@intel.com>
References: <cover.1459776943.git.patrick.ohly@intel.com>
Subject: [PATCH 5/5] ca-certificates: support Toybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Apr 2016 13:42:17 -0000

"mktemp -t" is deprecated and does not work when using Toybox. Replace
with something that works also with Toybox.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../update-ca-certificates-support-Toybox.patch    | 35 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20160104.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
new file mode 100644
index 0000000..b3b21e2
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
@@ -0,0 +1,35 @@
+From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Thu, 17 Mar 2016 12:38:09 +0100
+Subject: [PATCH] update-ca-certificates: support Toybox
+
+"mktemp -t" is deprecated and does not work when using Toybox. Replace
+with something that works also with Toybox.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ sbin/update-ca-certificates | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index 79c41bb..ae9e3f1 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -113,9 +113,9 @@ trap cleanup 0
+ 
+ # Helper files.  (Some of them are not simple arrays because we spawn
+ # subshells later on.)
+-TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
+-ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
+-REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
++TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
++ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
++REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
+ 
+ # Adds a certificate to the list of trusted ones.  This includes a symlink
+ # in /etc/ssl/certs to the certificate file and its inclusion into the
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
index 4266926..e0f1939 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20160104.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-remove-c-rehash.patch \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
+           file://update-ca-certificates-support-Toybox.patch \
            file://default-sysroot.patch \
            file://sbindir.patch"
 
-- 
2.1.4


