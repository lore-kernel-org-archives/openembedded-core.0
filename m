Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWY7R-0002ku-1i
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 19:45:57 +0100
Received: by wgbds11 with SMTP id ds11so1436369wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 10:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=bLRsO5KMmQCTWMCmzoBSsqpAVCoJ2uSeiFtPBuvSZ7Y=;
	b=ILEQybJpxSCxWsWbYAByNcIglFZoLTyDJC0qSXUw3lw1L5ckFOO0OGhuJ3xsDPRWwq
	Mh4EG+hkyp56Rsgo/h/eXqFzJT57vg6MK5zD9ZrKgweU/joDYg5g3AqdQpQVgW0BZxDj
	c6SemcQ/zw2PZpypZjhPVAReCu4QrF/3svlgE=
Received: by 10.216.212.82 with SMTP id x60mr789494weo.68.1322851154075;
	Fri, 02 Dec 2011 10:39:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fk3sm11461682wbb.10.2011.12.02.10.39.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 10:39:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 19:39:04 +0100
Message-Id: <1322851144-6988-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <1322844163.25960.10.camel@ted>
References: <1322844163.25960.10.camel@ted>
Subject: [PATCHv2] bitbake.conf: add default PRINC 0 to be able to increment it
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
X-List-Received-Date: Fri, 02 Dec 2011 18:45:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/base.bbclass |    2 +-
 meta/conf/bitbake.conf    |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index ea53498..fbcaefb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -335,7 +335,7 @@ python () {
 
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = d.getVar('PRINC', True)
-    if princ:
+    if princ and princ != "0":
         pr = d.getVar('PR', True)
         pr_prefix = re.search("\D+",pr)
         prval = re.search("\d+",pr)
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acba388..e80cc32 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -167,6 +167,7 @@ ASSUME_PROVIDED = "\
 PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
+PRINC ?= "0"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][d.getVar('PE',1) > 0]}"
 P = "${PN}-${PV}"
-- 
1.7.8.rc4



