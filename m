Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0573375D65
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 14:26:59 +0000 (UTC)
Received: by wiclp1 with SMTP id lp1so22988523wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 07:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=AxMs0v0dPnrcgwUImiD7ya4kV9psSonaqdzFgFppdVc=;
	b=Qu5lXFc3F2WNYAR0qkAzMnyM8qD1GlQxl7Xcc1ASsiZtLRAyikH1e5cG+AtY9ShzAl
	rwqS8L+LBDIx5OkeHzGmHmM78n/sdsb3Hnr00WiemkOA/OIYYAR1VDvWYZwFPMUalXIb
	59jcDBrxwKKx4FkNCJdDsG0NpIP1hDYeIeFUKYTtQhzd9TpHoqrkQVoCg8AJVJZXFBzF
	X7fVfQDj4jA76uUezF4bOjNd5VbxaiT5yqXP1DjhfkLwIoQP5qOGoPFZ4DBfg4Zf3sKe
	CB++7BUnhjJGpIW45nbBQyhAXRyKXxlVsg7d1QRJIJEVjHhpe6ky0poAwSsvczK1UlCa
	BWkQ==
X-Gm-Message-State: ALoCoQkMFpUlS4OhazB1/aZdUcAx3+Y54QEOTGZmxXZ/0ozS4D42T3z3ZTPyCCVzKS9gqN69rlMS
X-Received: by 10.194.86.130 with SMTP id p2mr76428027wjz.99.1436192819026;
	Mon, 06 Jul 2015 07:26:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	ul1sm28431539wjc.30.2015.07.06.07.26.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Jul 2015 07:26:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 15:21:36 +0100
Message-Id: <1436192496-8040-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] ca-certificates: remove Debianism in run-parts invocation
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
X-List-Received-Date: Mon, 06 Jul 2015 14:27:04 -0000

ca-certificates comes from Debian but not all distros (i.e. Fedora) have a
leaner run-parts that doesn't support the -- separator between options and
paths, which causes this error:

| Running hooks in [...]/rootfs/etc/ca-certificates/update.d...
| [...]/usr/sbin/update-ca-certificates: line 194: Not: command not found

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ertificates-don-t-use-Debianisms-in-run-p.patch | 33 ++++++++++++++++++++++
 .../ca-certificates/ca-certificates_20141019.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
new file mode 100644
index 0000000..d7d487e
--- /dev/null
+++ b/meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch
@@ -0,0 +1,33 @@
+ca-certificates is a package from Debian, but some host distros such as Fedora
+have a leaner run-parts provided by cron which doesn't support --verbose or the
+ -- separator between arguments and paths.
+
+This solves errors such as
+
+| Running hooks in [...]/rootfs/etc/ca-certificates/update.d...
+| [...]/usr/sbin/update-ca-certificates: line 194: Not: command not found
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ sbin/update-ca-certificates | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
+index fed9c25..29ecc69 100755
+--- a/sbin/update-ca-certificates
++++ b/sbin/update-ca-certificates
+@@ -186,9 +186,7 @@ echo "$ADDED_CNT added, $REMOVED_CNT removed; done."
+ 
+ HOOKSDIR=$SYSROOT/etc/ca-certificates/update.d
+ echo -n "Running hooks in $HOOKSDIR...."
+-VERBOSE_ARG=
+-[ "$verbose" = 0 ] || VERBOSE_ARG=--verbose
+-eval run-parts $VERBOSE_ARG --test -- $HOOKSDIR | while read hook
++eval run-parts --test $HOOKSDIR | while read hook
+ do
+   ( cat $ADDED
+     cat $REMOVED ) | $hook || echo E: $hook exited with code $?.
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb b/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
index 421b87e..cc58e4d 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20141019.bb
@@ -17,6 +17,7 @@ SRCREV = "2b8a047c78aadbecd90bf8e49ccf68898a211610"
 SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
            file://0001-update-ca-certificates-remove-c-rehash.patch \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
+           file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
            file://sbindir.patch"
 
-- 
2.1.4


