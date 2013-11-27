Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 422966DE3B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:16 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so6120482wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O91gn02+QGbQZBbE1+dAhy5CPe2uICUtBDm1uCXdd7g=;
	b=nHt6UE5IIvZogMbQ1aMSyep/mpehH6Fb1x9X2ibXQuJfKsyRJeEq1eSHcngVWlGmvL
	IcZt39Dvts7IWyrKPlZQ5NUY0ngSTdxmB/WZejNRVFrTmOcEu6XGmIIWslmDHwxp0mtO
	IiN58FwenO6DG+WWiegVd+rpRuIc9dIaZO4EDE2IqRtSRR4B69+9VnIaKMFdaEY+tsxp
	6EnwLDe1dguC9eLHhd9ix4wrPo40T2Y7Xoci6hEDAmOitWNhlS1uT0UacT5uEQKa9n4X
	KrST4HwTl0zzUQJU41EVPIgrpVio9DKLalWx/LMC8mSQ1EQra0i6nz+975OXleBdk3D1
	+v2w==
X-Received: by 10.194.48.115 with SMTP id k19mr12386887wjn.47.1385575635567;
	Wed, 27 Nov 2013 10:07:15 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:14 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:01 -0700
Message-Id: <020746e50b94eb0d5cd8049437d7328cc2f025b0.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/7] update-rc.d: process symlinks recursively
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:16 -0000

From: Christopher Larson <chris_larson@mentor.com>

When processing startup scripts which use update-alternatives, we need to keep
resolving the symlink recursively until we hit a real file, due to the
alternatives indirection. This fixes the ability to run certain postinsts at
do_rootfs time, which is needed for good read-only-rootfs support.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 .../update-rc.d/check-if-symlinks-are-valid.patch  | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
index 6f402dd..075171a 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
+++ b/meta/recipes-core/update-rc.d/update-rc.d/check-if-symlinks-are-valid.patch
@@ -14,25 +14,31 @@ actually exists in rootfs path and then continue.
 Upstream-Status: Pending
 
 Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com> 
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
 Index: git/update-rc.d
 ===================================================================
---- git.orig/update-rc.d	2013-01-16 12:12:58.349814356 +0200
-+++ git/update-rc.d	2013-01-16 13:02:42.490864939 +0200
-@@ -147,13 +147,29 @@
+--- git.orig/update-rc.d
++++ git/update-rc.d
+@@ -147,13 +147,34 @@ fi
  bn=$1
  shift
  
 +sn=$initd/$bn
 +if [ -L "$sn" -a -n "$root" ]; then
-+	readlink=$(which readlink)
++	if which readlink >/dev/null; then
++		while true; do
++			linksn="$(readlink "$sn")"
++			if [ -z "$linksn" ]; then
++				break
++			fi
 +
-+	if [ -n "$readlink" ]; then
-+		sn=$($readlink "$sn")
-+		case "$sn" in
-+			/*) sn=${root}${sn} ;;
-+			*)  sn=$initd/$sn ;;
-+		esac
++			sn="$linksn"
++			case "$sn" in
++				/*) sn="$root$sn" ;;
++				*)  sn="$initd/$sn" ;;
++			esac
++		done
 +	else
 +		echo "update-rc.d: readlink tool not present, cannot check whether \
 +				$sn symlink points to a valid file." >&2
-- 
1.8.3.4


