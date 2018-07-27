Return-Path: <kergoth@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id A351574581
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 17:24:45 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id k3-v6so3611405pgq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 10:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Hv+KiVDgZHE0KxKJWYgh30adg6UGqKT92OJIqqAwbhQ=;
	b=WpfI63ViU9jzC3ne08llQ9jsATNdw0V7RX3NIk/mUJ2HMweqnUdjtwxGmnqW9MdMZw
	Im7HXK4Q6n8FxWR1+rIuScOT1cKQfSZzkl2ojwUeyJG/YtFH9iaYdPjmwok1jqx3j/pO
	ZyVf9psnhwpIcSDb6+Bhurqd+NuJk/EF5vxZHmlOgZ5SV5wQWjsc+7GAodV82GwwCD1N
	tl8pBpSYPq0b8WqBvBxVP6L2+98h7Mn2OxIYH9ZgtWR7n8Xf8n+xipYPD+TdsGMgnnYR
	NCiqQf7tEsdeF5XiSp5tGXFtG34Jcevve/ES8fPkJ4k7zAhxLJ3xbBzrFVo1UvSHAVIc
	G9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Hv+KiVDgZHE0KxKJWYgh30adg6UGqKT92OJIqqAwbhQ=;
	b=iUzSlcpPleBJY0tQjScIxWT5A5fERwOh8OhGd55+q9b4HXfyio8cwFx6QSNTdnX1mi
	QGbW4UNZxWaBA/iT2jtdoFb8ht2N7xqWVkZVC0tsJJMtn2GTffesKfM65EAW8EezcQ2c
	usaf8yO0iTbJSkdFCak54DWqYfdkM0Yyi0s8pFtIBb2Dh0VKr+aw+3lhIT7wTW685sxN
	ujgrpGEP9JvOpplPlL0ko7/sdBb1R2Vez6VqYH0RS4FWsq2POHkeblsYzglpJHfjkpgq
	Yrv6bsTTtRxrIUWq2xndgQnAyHU1bFIuOcdfATS0rkKftLYpAMnfYg9ABvdcQSijVjEm
	pDfw==
X-Gm-Message-State: AOUpUlH+wNm2NU3EmVXMlPIXEDcbjn69KcP9sSoG8Rd73IGJafNUP6Dm
	dyuabVjb57dX54QGroCNtOgoytBisjI=
X-Google-Smtp-Source: AAOMgpdYnJtjKu3uhAsyn5vmXHx56ZNSDPfno/nuULaDkhBXqorP/CM1pjd3I7taQExTTrNOhhDNdQ==
X-Received: by 2002:a63:90c8:: with SMTP id
	a191-v6mr6940677pge.173.1532712286621; 
	Fri, 27 Jul 2018 10:24:46 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	v17-v6sm6399195pfn.177.2018.07.27.10.24.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 10:24:45 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 22:24:28 +0500
Message-Id: <2059e62b623345dfdf7389027da85b2798e84916.1532711448.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1532711448.git.chris_larson@mentor.com>
References: <cover.1532711448.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/4] image-postinst-intercepts.bbclass: add class
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
X-List-Received-Date: Fri, 27 Jul 2018 17:24:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

This class sets POSTINST_INTERCEPTS and POSTINST_INTERCEPTS_CHECKSUMS,
to allow us to pull intercepts from BBPATH. This is kept as a separate
class, as it's needed by both image construction and sdk construction,
the latter to support meta-toolchain & similar recipes.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image-postinst-intercepts.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/classes/image-postinst-intercepts.bbclass

diff --git a/meta/classes/image-postinst-intercepts.bbclass b/meta/classes/image-postinst-intercepts.bbclass
new file mode 100644
index 00000000000..ed30bbd98d9
--- /dev/null
+++ b/meta/classes/image-postinst-intercepts.bbclass
@@ -0,0 +1,23 @@
+# Gather existing and candidate postinst intercepts from BBPATH
+POSTINST_INTERCEPTS_DIR ?= "${COREBASE}/scripts/postinst-intercepts"
+POSTINST_INTERCEPTS_PATHS ?= "${@':'.join('%s/postinst-intercepts' % p for p in '${BBPATH}'.split(':'))}:${POSTINST_INTERCEPTS_DIR}"
+
+python find_intercepts() {
+    intercepts = {}
+    search_paths = []
+    paths = d.getVar('POSTINST_INTERCEPTS_PATHS').split(':')
+    overrides = (':' + d.getVar('FILESOVERRIDES')).split(':') + ['']
+    search_paths = [os.path.join(p, op) for p in paths for op in overrides]
+    searched = oe.path.which_wild('*', ':'.join(search_paths), candidates=True)
+    files, chksums = [], []
+    for pathname, candidates in searched:
+        if os.path.isfile(pathname):
+            files.append(pathname)
+            chksums.append('%s:True' % pathname)
+            chksums.extend('%s:False' % c for c in candidates[:-1])
+
+    d.setVar('POSTINST_INTERCEPT_CHECKSUMS', ' '.join(chksums))
+    d.setVar('POSTINST_INTERCEPTS', ' '.join(files))
+}
+find_intercepts[eventmask] += "bb.event.RecipePreFinalise"
+addhandler find_intercepts
-- 
2.11.1


