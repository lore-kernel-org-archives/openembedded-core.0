Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id C213B6BA9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 15:54:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id y8so19323271wrn.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Lzqxda7GL84q1yFGabgACCE6kwGATWvDBW9gh5bppkM=;
	b=Q4ZtqKfgmsTDNJzJmJzxHUpiuH36vWA8FDm81bdHQ0Y9XJLzPxuC+g4GTffZ+dfdE0
	99NTZKd9Dai57UEV1Cnc6cwPBlyuy1zEY8x+pqIW5grWOxZvZ6wo8rEzzJUAPvYKdzxZ
	vnqQAoivYmOM9zyDPwHGsBxN2wfbOnMJUSZhweLWnmTrpJQKWZnrHuTwnlGfFGFBQmH9
	4NPpaM9+tHZPUkGiPP4yYIyNRnaIOPfaeMaKidqw4gKHgECNIrRmaEPX9e/0qksfNQlw
	ddX72GVRYhkujrtd/rpTGm3Nz8AHcTI0MrNYw735Pe1MJ2Dbhe0mcOSJCSWM5lUZyRXf
	XDTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Lzqxda7GL84q1yFGabgACCE6kwGATWvDBW9gh5bppkM=;
	b=lBJvpIihyHzz5MaMXHAavVkIyuymmYqfY53OLJDYp8vDGj/Keb8hV0+tJW7OYPzabt
	rgOv1Jqz2a7pmPAj6Egw9uL3dviGlXhQpaLsQ+F1HlS2Xp0BTlmiI0vFQA3TpN+1S8cB
	s7SRVUo4AGFTbqdlvYoHxQVOrW3wi1aSj1A2ItRVet2M21xaSNQYUM7y/7vFdB7rkJup
	uJaBw/qV1yP1gTrECFUd3WkYyNdjAo/sOjelqKGbtW40HzgrAHYLiY+ResB4QPgdUM4a
	4AQDRwdita7AQwc08aUuFhHL+MV7vtMZsom3QhLYNnDrIVRa2Rb6besgqtbgAl/DVEAh
	GU4g==
X-Gm-Message-State: APjAAAWSVBSifUTiECctSVS2i1ecQNlaofz4K911TFpVVdeS+jJf5FPp
	22LH2qsKy1unyWNQNldAUbAAKLL8
X-Google-Smtp-Source: APXvYqz0EnHKyJuVyyIly1j3aeXgCCNov9uE143TeDTJjJboopN983adu9UH4qWaedS6n6ZD4ljSbg==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr30964695wrv.49.1566921271178; 
	Tue, 27 Aug 2019 08:54:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 2sm4258753wmz.16.2019.08.27.08.54.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 27 Aug 2019 08:54:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 17:54:25 +0200
Message-Id: <20190827155425.105260-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] rpm: resolve a host contamination issue for mono packaging
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
X-List-Received-Date: Tue, 27 Aug 2019 15:54:31 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...es-requires-do-not-use-monodis-from-.patch | 58 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
new file mode 100644
index 00000000000..24aa4c7ffff
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
@@ -0,0 +1,58 @@
+From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 27 Aug 2019 17:42:34 +0200
+Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
+
+There was a host contamination issue here: if monodis was installed
+on the host, do_package would use that to resolve dependencies
+of mono libraries (and often fail in that). Without monodis,
+no dependencies are resolved, which is seemingly how things
+are supposed to work.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ scripts/mono-find-provides | 8 ++++----
+ scripts/mono-find-requires | 8 ++++----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
+index 9348457d3..b28872ffb 100644
+--- a/scripts/mono-find-provides
++++ b/scripts/mono-find-provides
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
+diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
+index ea58cae48..d270169e1 100644
+--- a/scripts/mono-find-requires
++++ b/scripts/mono-find-requires
+@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
+ build_bindir="$2/usr/bin"
+ build_libdir="$2$3"
+ 
+-if [ -x $build_bindir/monodis ]; then
+-    monodis="$build_bindir/monodis"
++if [ -x $build_bindir/monodis.bogus ]; then
++    monodis="$build_bindir/monodis.bogus"
+     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
+-elif [ -x /usr/bin/monodis ]; then
+-    monodis="/usr/bin/monodis"
++elif [ -x /usr/bin/monodis.bogus ]; then
++    monodis="/usr/bin/monodis.bogus"
+ else
+     exit 0;
+ fi
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 063f4269a57..c37330eb4c6 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -41,6 +41,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-perl-disable-auto-reqs.patch \
            file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
            file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
+           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            "
 
 PE = "1"
-- 
2.17.1


