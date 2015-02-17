Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 357F665C85
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:02:35 +0000 (UTC)
Received: by mail-wg0-f54.google.com with SMTP id y19so37837032wgg.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KPXCrNO8xbwY/gH8Z+k1MiOqbuSXngA7NMYzz7T4E8U=;
	b=DqP8AvzvMWjNnvrKYfn6yEJ8LCL3rDEVmg77+6lbStDSsbP+YG6vZ9BnnMDdOOrjsv
	wW02cieC8B/riwlJynjasCJ+Cu8fU6PJKPlq0zIy6KdPfHWkdap4C9jvfbDuR0vBijxi
	MerEQWqOU3/tRoN7acRxW3CAQ9AhS6b2NybNvHrbLepYtXIBcpCP6G3z11l8nd0QthHS
	zu8ywbgAh+z89JNU5xyvgQn67OwWqIJaqy5W+SpiKbJHfs3BQT0Xm50eI8CeQYkXEq3p
	F+0pI88yT7pVMPVgLVw7i1mdppyxciwG3U7PxxxwaNfYa3Pk74y04zHmZo+7+gj4Ev1q
	HOqg==
X-Received: by 10.180.73.205 with SMTP id n13mr28210359wiv.64.1424199756815;
	Tue, 17 Feb 2015 11:02:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l4sm21471243wiw.9.2015.02.17.11.02.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 11:02:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 20:02:28 +0100
Message-Id: <1424199748-10800-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1424199748-10800-1-git-send-email-Martin.Jansa@gmail.com>
References: <CA+chaQdaa+S3AC8YYzmHdv7beMxBzP_03C25Jn=5NiE=DxmGjg@mail.gmail.com>
	<1424199748-10800-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] license.bbclass: fix unexpected operator for LICENSE values with space
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
X-List-Received-Date: Tue, 17 Feb 2015 19:02:37 -0000

* add quotes around pkged_lic so that it works correctly with spaces
* fixes following error:
  run.license_create_manifest.50601: 193: [: GPLv2: unexpected operator

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 13c1a0f..044b3b0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -50,7 +50,7 @@ license_create_manifest() {
 		pkged_pv="$(sed -n 's/^PV: //p' ${filename})"
 		pkged_name="$(basename $(readlink ${filename}))"
 		pkged_lic="$(sed -n "/^LICENSE_${pkged_name}: /{ s/^LICENSE_${pkged_name}: //; p }" ${filename})"
-		if [ -z ${pkged_lic} ]; then
+		if [ -z "${pkged_lic}" ]; then
 			# fallback checking value of LICENSE
 			pkged_lic="$(sed -n "/^LICENSE: /{ s/^LICENSE: //; p }" ${filename})"
 		fi
-- 
2.3.0


