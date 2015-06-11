Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 06D447324E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 15:32:28 +0000 (UTC)
Received: by wifx6 with SMTP id x6so12521261wif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 08:32:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xZnTqdjUX3Cp6Zn+a9TfgumOBuJU+m0ug7OpO3msJE4=;
	b=HRX5qM3WRmowRNSvbkEmHGgpaXjr0hWjk+W5n0ynibi0+a/zajyu7VW3VtwWd9wTt8
	3w7u4e0F31quokzGi8z+Gp4rgoy1ao76CU2yaiMzbzEbCYIxnNUEJUwAs7Ao4F2Mdsla
	6hEH0k+n8y4rJg4c9j/6yFpEzk0MWf3mm5bIHQ7dCxJID2CmR/3f63Lib8TBnPjgqYs4
	pBZOhPvpV3504C3vxEwvU3ihVCio0mxnShg0OfW8IZ+Yuc576NAsc3AHn9hSEQIRVMSn
	QsdifP+Eku3Z8iESzGuV8zbKRmORJGCbREwxoAMi1hN+Yybq1ndoYIrqcCYrayCQw8ux
	eukw==
X-Gm-Message-State: ALoCoQnbAmdgVxA8WI4OxXVTYMXaOTFqZzj6avF+WB0sHgudCsbFf9yjGatQucpfXdkRy2SmIN+X
X-Received: by 10.194.103.130 with SMTP id fw2mr16828745wjb.130.1434036749748; 
	Thu, 11 Jun 2015 08:32:29 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id pd7sm1571963wjb.27.2015.06.11.08.32.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jun 2015 08:32:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 16:27:46 +0100
Message-Id: <1434036466-14340-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] pulseaudio: fix version when building inside a dirty git checkout
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
X-List-Received-Date: Thu, 11 Jun 2015 15:32:30 -0000

If the build directory is a subdirectory of a git clone, and that git clone is
dirty, PulseAudio will build thinking it's version is 6.0-dirty.  Fix
git-version-gen so it doesn't do the git checks for tarball builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../pulseaudio/fix-git-version-gen.patch           | 24 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
new file mode 100644
index 0000000..ed94250
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
@@ -0,0 +1,24 @@
+git-version-gen gets confused if a tarball is being built inside a git directory
+(ie your build directory is a subdirectory of a poky clone), and ends up calling
+the release 6.0-dirty.  Add a shortcut exit so if a tarball is detected it
+doesn't attempt to look at the git status.
+
+Upstream-Status: Submitted (https://bugs.freedesktop.org/show_bug.cgi?id=90936)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/git-version-gen b/git-version-gen
+index 7546884..079b93e 100755
+--- a/git-version-gen
++++ b/git-version-gen
+@@ -84,7 +84,10 @@ then
+     v=`cat $tarball_version_file` || exit 1
+     case $v in
+ 	*$nl*) v= ;; # reject multi-line output
+-	[0-9]*) ;;
++	[0-9]*)
++		echo "$v" | tr -d '\012'
++		exit 0
++		;;
+ 	*) v= ;;
+     esac
+     test -z "$v" \
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index 10969bd..31e9096 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -4,6 +4,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0001-conf-parser-add-support-for-.d-directories.patch \
+           file://fix-git-version-gen.patch \
            file://volatiles.04_pulse \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
-- 
2.1.4


