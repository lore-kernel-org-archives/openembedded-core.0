Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEB1C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:28:02 +0000 (UTC)
Received: from avasout-peh-004.plus.net (avasout-peh-004.plus.net
 [212.159.14.20])
 by mx.groups.io with SMTP id smtpd.web09.68237.1638890880281640886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=KF+wOkrv;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.20, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id ucNomvLskmch0ucNpmpfMK; Tue, 07 Dec 2021 15:27:58 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=KtouZUaN c=1 sm=1 tr=0 ts=61af7d7e
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=IOMw9HtfNCkA:10 a=-An2I_7KAAAA:8 a=D9tCBEehAAAA:8 a=xgNKRjsPAoTik-psT1kA:9
 a=Sq34B_EcNBM9_nrAYB9S:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=Ilas5pWafAGqLh7o44zZMpThMicWTWaI5WDpUT3S2gU=; b=KF
	+wOkrvmC4YrAX4mxc3aBNN5M8lof41ZdOhramrYA8ZNMry0ZCtXn/4LYONHdki8X9AuNCeU22McWr
	q7e65++uHzk2h37uHS86rPfFwxmxyHDy/Nt/ktABVxgDNU1TDZpJdtAipgObk09RJRSzFIH/f+bSr
	5hbrRod7jvpcbKCzmiUwz3u3rIkoECeJyLmG1xiimP8MrcgYDUtNYiMCWuSw6u1uFRXk2Yo7lMn4r
	1ffucXOmgEhp+S5p7d4roCYG+lKDMkS74UNOj/i3l5t3ZAzJcWH6zISq6J5T12nmQWGzy/7TJtPaB
	CC/XuAkKeRfwtoeqBhJF1XxTpWisFkkw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mucNn-00GIa7-5i; Tue, 07 Dec 2021 15:27:55 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Phil Blundell <pb@pbcl.net>
Subject: [PATCH 1/2] package: Only snap libraries if they would be processed
 by ldconfig OS-12840
Date: Tue,  7 Dec 2021 15:27:35 +0000
Message-Id: <20211207152736.1294364-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4xfHnNQBMY0ZjdQoUEo2HKUOcFuRmVW9Wf8lQpTBUSFyOtDueoxUG080f0yQ39R5k+/oule5OeF1GPp76dj0joarRExJh7h3bQY9JPW7bYEjUub5hTXgdT
 1Q/dH0Ic6jakWhhSot4x4ZpCLh7kcPJkh9fc6iG+ZiTczHpBoqCJGT1BRaDxr0dzQmUYGP8ewTIFHxfod3+9aVENKBHzCmmJ7g4=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 15:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159306

PACKAGE_SNAP_LIB_SYMLINKS renames libraries based on their SONAME so
that they can be found directly rather than going via symlinks that
would be created by ldconfig. For example, without
PACKAGE_SNAP_LIB_SYMLINKS in ${libdir} we have:

 libharfbuzz.so.0 -> libharfbuzz.so.0.20600.4
 libharfbuzz.so.0.20600.4

but with PACKAGE_SNAP_LIB_SYMLINKS="1" we have just:

 libharfbuzz.so.0

Unfortunately, this renaming is done based on the SONAME which breaks
packages like mesa which install a single library with multiple hard
links:

-rwxr-xr-x root/root  13593488 2021-12-07 12:26 ./usr/lib/dri/i915_dri.so
-rwxr-xr-x root/root  13137328 2021-12-07 12:26 ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/iris_dri.so link to ./usr/lib/dri/i915_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/kms_swrast_dri.so link to ./usr/lib/dri/i915_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/nouveau_vieux_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/r200_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/radeon_dri.so link to ./usr/lib/dri/i965_dri.so
hrwxr-xr-x root/root         0 2021-12-07 12:26 ./usr/lib/dri/swrast_dri.so link to ./usr/lib/dri/i915_dri.so

The SONAME for i915_dri.so (and therefore all the other names that link
to the same file) is libgallium_dri.so. This means that
PACKAGE_SNAP_LIB_SYMLINKS causes do_package to successfully rename the
first name found to libgallium_dri.so. A similar thing happens to
i965_dri.so with its SONAME of libmesa_dri_drivers.so. The order is not
deterministic, so this means that although every build will be missing
one name, it's not always the same one.

-rwxr-xr-x root/root  13593488 2021-11-30 15:17 ./usr/lib/dri/i915_dri.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/kms_swrast_dri.so link to ./usr/lib/dri/i915_dri.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/libgallium_dri.so link to ./usr/lib/dri/i915_dri.so
-rwxr-xr-x root/root  13137328 2021-11-30 15:17 ./usr/lib/dri/libmesa_dri_drivers.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/nouveau_vieux_dri.so link to ./usr/lib/dri/libmesa_dri_drivers.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/r200_dri.so link to ./usr/lib/dri/libmesa_dri_drivers.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/radeon_dri.so link to ./usr/lib/dri/libmesa_dri_drivers.so
hrwxr-xr-x root/root         0 2021-11-30 15:17 ./usr/lib/dri/swrast_dri.so link to ./usr/lib/dri/i915_dri.so

This renaming means that the library cannot be found at runtime.

The simplest way to avoid this renaming is to only snap libraries that
would be processed by ldconfig.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Phil Blundell <pb@pbcl.net>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 84eafbd529..09cd376f4a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1878,7 +1878,7 @@ python package_do_shlibs() {
                         sonames.add(prov)
                 if libdir_re.match(os.path.dirname(file)):
                     needs_ldconfig = True
-                if snap_symlinks and (os.path.basename(file) != this_soname):
+                if needs_ldconfig and snap_symlinks and (os.path.basename(file) != this_soname):
                     renames.append((file, os.path.join(os.path.dirname(file), this_soname)))
         return (needs_ldconfig, needed, sonames, renames)
 
-- 
2.30.2


