Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id E6CE67162E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 19:02:15 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id x13so4744201wgg.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 11:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UaJiqXNPzRqJgUIF4NcV4fgU7njY899QLTYmbngel2k=;
	b=cwNj03htWFpu+3xLEDjjOx8J+Y+kMjbDLPyLnPeWtqPVEQK1F6s5U/VXYzUVpNa69B
	mGTwo/eNeoZRetYsk6itR4r9vZNBTh87sQ2Twg8iKssOdpVd8Nk5g7jbaLShPtrviYOj
	W/J21ERpCBBYeQqHvfzVywMbjld1WoGLxe6JUvBx/6xuTnPxVuKB052C0RlGgvyBiMCg
	sd+B4ALHgbdPUZP2egY8dHqtvCNte9NIScM9kz3pjJeJGwoXxX1UEDc1Fc76t868lz34
	BEo3uKDGH2Wr1PYbvv5rPywNZGNn2+gfFHka969Opp2Xn5Vg6B41QQ3D6HGsl+9RBJG8
	b9ZA==
X-Received: by 10.180.72.199 with SMTP id f7mr43692740wiv.53.1421175734679;
	Tue, 13 Jan 2015 11:02:14 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	je12sm15415940wic.22.2015.01.13.11.02.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 11:02:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 20:02:13 +0100
Message-Id: <1421175733-22762-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [RFC][PATCH] WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Tue, 13 Jan 2015 19:02:22 -0000

* this means that recipes with ARM_INSTRUCTION_SET explicitly changed
  to arm will be built in feed without thumb suffix, the same does apply
  for workdir, e.g. after "bitbake glib-2.0" you can see:

  tmp-glibc/work/armv5e-oe-linux-gnueabi:
  glib-2.0  glibc  glibc-initial

  tmp-glibc/work/armv5te-oe-linux-gnueabi:
  acl              db              gdk-pixbuf     kmod  ....

  and

  tmp-glibc/deploy/ipk:
  all  armv5e  armv5te  qemuarm

* feed config should be ok, because all default DEFAULTTUNEs always
  include "arm" variants of all supported PACKAGE_ARCHs

* for more details see
  http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091960.html
  the toolchain path issues were resolved in 1.8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/conf/machine/include/arm/feature-arm-thumb.inc
index 8e6619d..4c4eb6d 100644
--- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
+++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
@@ -32,7 +32,8 @@ python () {
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${ARM_M_OPT}', '', d)}"
 OVERRIDES .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb', '', d)}"
 
-ARMPKGSFX_THUMB .= "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${ARM_THUMB_SUFFIX}', '', d)}"
+# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set ARM_M_OPT to thumb
+ARMPKGSFX_THUMB .= "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar('ARM_M_OPT', True) == 'thumb' else ''}"
 
 # Whether to compile with code to allow interworking between the two
 # instruction sets. This allows thumb code to be executed on a primarily
-- 
2.2.1


