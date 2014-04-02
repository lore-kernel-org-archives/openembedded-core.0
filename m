Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E7F526F9FC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 12:25:59 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so132766wgg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Rlmdl9zRQvwcJKteH/JVKPyI8jpS345+x4KQsNHmkQE=;
	b=j4ymd9A1soW30cKpvp1cdaONkmVXFGuAp/nF0+sTuBKEnfKpTgpKNje1Rr9iUVtlPl
	tkyOoSOLD32SCBaFOT0HIrcamY370HLCrcWlLXYv2rUSlGaX5c+jz8WAxF5MitLYvBa1
	kTf3Qw3r8Z61yKJvDJ+blVFXmDIvnVYVGUfeQQu+Bnh/AgHl6zKzVtxrFxeyJKBQt7n2
	RTA7Dv5ywh2h+lVJWlr573O86vFhnVeM+e20AyTDBuEHg6yEkocm9V9bLm/Eg78OnfB5
	zP/xPps8hP+eYAcvqXIuWR5P1+eoBCUN9JbzYFMhNStAynMzVvDsjJUM8fDHPr9vy6yC
	CPnQ==
X-Received: by 10.194.57.239 with SMTP id l15mr469340wjq.40.1396441560482;
	Wed, 02 Apr 2014 05:26:00 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id 48sm4225121eee.2.2014.04.02.05.25.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Apr 2014 05:25:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 14:25:34 +0200
Message-Id: <1396441537-2911-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
References: <1396441537-2911-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] ed: remove infodir
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
X-List-Received-Date: Wed, 02 Apr 2014 12:26:01 -0000

* unlike 0.5 version, this doesn't use autotools.bbclass which removes infodir automatically
* fixes QA warning:
  ed-1.9: The /usr/share/info/dir file is not meant to be shipped in a particular package.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/ed/ed_1.9.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ed/ed_1.9.bb b/meta/recipes-extended/ed/ed_1.9.bb
index 8ae99cc..d162154 100644
--- a/meta/recipes-extended/ed/ed_1.9.bb
+++ b/meta/recipes-extended/ed/ed_1.9.bb
@@ -22,4 +22,8 @@ do_configure() {
 
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
+	# Info dir listing isn't interesting at this point so remove it if it exists.
+	if [ -e "${D}${infodir}/dir" ]; then
+		rm -f ${D}${infodir}/dir
+	fi
 }
-- 
1.9.1


