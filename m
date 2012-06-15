Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SffM3-000891-DZ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 00:50:59 +0200
Received: by pbbrq2 with SMTP id rq2so5623806pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 15:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=/HBzgoGWgUOfmXhmsQ/0xZ37fuVCN7FnAsfa38cyPZc=;
	b=DhVxrLQDZCF21rjsXmerw5m9I5W2vVLzcSHHvLwHU7dcUmAmsIDsT8Lx0RndF90OfC
	3crnV2Rbdp7F2I0drL3ijR6WOvoPs+K5fUr1yDoNYFggKX35yeNMEpcydByntLHHb4LT
	8nSfwFgBsOAF5jJoQQoiX2YHazgG0BVyeP8SB2GmPzddLq8DHcpQNp+Ic2NasEI7Noud
	SiNlmY3UTsMAZA9NGkQpEIHlvzvR6658blw4eYtgLAUbWkYl+hqOFOkRMqrFTcS6eRYU
	sAVjC8bKnDzuar5+tnBH91y+KRFqePm4fdB7Sej8/8SLaP0nz4FSVIM22g0xlOlzYddN
	I25g==
Received: by 10.68.226.226 with SMTP id rv2mr24829922pbc.101.1339800019267;
	Fri, 15 Jun 2012 15:40:19 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id tm2sm14612884pbc.69.2012.06.15.15.40.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 15:40:18 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	philb@gnu.org
Date: Fri, 15 Jun 2012 15:40:00 -0700
Message-Id: <5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339799869.git.dvhart@linux.intel.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1339799869.git.dvhart@linux.intel.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQkWIcWehpffZPLtJJEX+bv5Pg0IxMCscLpa8XVmnJrdbs3v1HSxlq4Y1qNzwhkjSMWkmEM3
Subject: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 22:50:59 -0000

When building very small systems, it can be useful to spawn a shell
from a simple init script, rather than a full System V Init
process. This requires the shell be the session leader and be able
to open the controlling terminal if it is to have job control.

Enable CONFIG_CTTYHACK and CONFIG_SETSID to enable this. The resulting
busybox binary does not change in size (I checked several times!).

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/busybox/busybox-1.19.4/defconfig |    4 ++--
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/defconfig b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
index 372d7b5..0a5d5c9 100644
--- a/meta/recipes-core/busybox/busybox-1.19.4/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.4/defconfig
@@ -700,7 +700,7 @@ CONFIG_MICROCOM=y
 # CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
-# CONFIG_SETSID is not set
+CONFIG_SETSID=y
 CONFIG_STRINGS=y
 # CONFIG_TASKSET is not set
 # CONFIG_FEATURE_TASKSET_FANCY is not set
@@ -960,7 +960,7 @@ CONFIG_ASH_BUILTIN_TEST=y
 CONFIG_ASH_OPTIMIZE_FOR_SIZE=y
 # CONFIG_ASH_RANDOM_SUPPORT is not set
 CONFIG_ASH_EXPAND_PRMT=y
-# CONFIG_CTTYHACK is not set
+CONFIG_CTTYHACK=y
 # CONFIG_HUSH is not set
 # CONFIG_HUSH_BASH_COMPAT is not set
 # CONFIG_HUSH_BRACE_EXPANSION is not set
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index 0717075..5b3f356 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.5.4



