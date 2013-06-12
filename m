Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 43A396A96F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:51 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id j14so7309860eak.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=obGGGSTu52an8WikZmpgup+5m4JebWFJQqE9eYaAP+k=;
	b=irnR8gP/LnoOFkvm0n9P+mwdEmw1Ll11YTNJt+PIJY7ChONIv6ZK0GZqjMEgGGoCuj
	oLsqNYhE1mWyn8CGgt37CX82y2z3dp+0MKMtwc3UfnMPcjSyYffwbHuy1p1jIUNjL4Y6
	Z3eSK+RktIulL0cprBjR7j7dkoBc1P3fRWihmaNQ1rWMtaHXA+K1iHZvJFnGwU+f0YVf
	YgU4Z7EN6wrUoBqfhXd4AzUHVHWkBsY3VOc9kvMtAMDh+GVHgmfDZwkMdn/IMYHTiWOp
	LEGt24mBxb4pVZq5nEdxE1tG/3WmoIwXB4/fQCkJdEbXbzCCiXw7ems3DMOlpf2Ck2Ve
	+W8Q==
X-Received: by 10.14.206.193 with SMTP id l41mr21521502eeo.154.1371079192022; 
	Wed, 12 Jun 2013 16:19:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	c5sm39785108eeu.8.2013.06.12.16.19.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:20:02 +0200
Message-Id: <ffbd5019e7e1a1a492d0823b742e5ddd8930671d.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/10] mesa: use PACKAGESPLITFUNCS
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2caa238..b4e9b84 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,7 +105,7 @@ python __anonymous() {
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 }
 
-python populate_packages_prepend() {
+python mesa_populate_packages() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
 
     pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
@@ -119,6 +119,8 @@ python populate_packages_prepend() {
     do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
 
+PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
+
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-- 
1.8.2.1


