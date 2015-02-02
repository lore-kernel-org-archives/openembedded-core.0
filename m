Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 682A4605F1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 14:04:37 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x12so38879842wgg.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 06:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Wea1vhG/wGeasyd8wtGjHkYnw+zAGpJ6lOJ/9r+AcUI=;
	b=BWlC2VUYqVem4dBna5fKNJYjttQSBIJkP1amNnXQa2WCMQyLsOFj68jqtQPHC/TQIC
	ZZFnht4h3p4JXz00iBiaSymLv7i/AyLg0ADhyxofzQmrlV/kX03t0godynHZX3F0bxiB
	wF4elKJUWndEKq7MQBZcPW5M0HNXVjzoZOBbi8l1yIn7ooT9/8OdEXKEfYOWSA0XJdmb
	MFoQA2dRaLgfS2RbcEbfqnZpqy6Xwh4EwjS1eCKQ0pTiME/duCE5xuUG2sapa/OpbVSH
	/xE/Xd0gbN+bIMauSczk7JP+V2zkxJFYHetGSx0iSNnE7cN8OunXiimP255wB0TMLtqT
	FYxg==
X-Gm-Message-State: ALoCoQma2V+Urh5Nn2HlCrtu9hI/keeDmy9+XQLZrsZz08HJKn79RNWT3ArWUihlCo628PI+SzCt
X-Received: by 10.194.76.228 with SMTP id n4mr44104989wjw.74.1422885878164;
	Mon, 02 Feb 2015 06:04:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28032136wjc.18.2015.02.02.06.04.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Feb 2015 06:04:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Feb 2015 14:02:32 +0000
Message-Id: <1422885752-5058-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] native: remove PN from DEPENDS automatically
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
X-List-Received-Date: Mon, 02 Feb 2015 14:04:48 -0000

If a recipe (say, wayland) has DEPENDS=wayland-native and BBCLASSEXTEND=native,
when built as wayland-native it has DEPENDS=wayland-native which results in a
circular dependency.

Typically this is resolved by having explicit DEPENDS_class-native statements
but as this is duplication which can lead to inconsistent dependencies,
automatically remove the circular dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/native.bbclass |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 4acc936..5ca5c95 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -132,7 +132,9 @@ python native_virtclass_handler () {
         deps = bb.utils.explode_deps(deps)
         newdeps = []
         for dep in deps:
-            if "-cross-" in dep:
+            if dep == pn:
+                continue
+            elif "-cross-" in dep:
                 newdeps.append(dep.replace("-cross", "-native"))
             elif not dep.endswith("-native"):
                 newdeps.append(dep + "-native")
-- 
1.7.10.4


