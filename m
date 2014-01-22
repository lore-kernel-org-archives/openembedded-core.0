Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3534A6C921
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 13:05:08 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id n15so278701lbi.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 05:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=B3D/nqAaJbfxXORUJRjw7zbze2dL0Ka5GAv+7Er3/lA=;
	b=At13sWFw8DiR9jbAYejWqSBgk86UEzs6c2YOUUwwuy4gr72TZ7UL7bnKQpwqxW0+G5
	e5R5hA+DiYCPQpuDzF+ji+em7c0N1KqkRRRdwHPjtdRL+amG58eUey+HVE1jmN7G8Q6h
	7hVkrdvqZRcEnzNXVu8UX+A0kezIMna76GQa58GEZdZQeX/UB4233nMcZIdsbgYjPQTU
	tY7NlQSHW6itm9v2HdN4CsZdS6GZAAEm0+YLYx8lTNW5dryJjarJBOFN3q97gd/UWpOx
	m5ZeSH3GiCPTJ8+8Tm9q67KdymXzVfFZJHPDs+WkPhqQy5sau8+ax+YDI7fFRkKOewVV
	F0CQ==
X-Received: by 10.112.126.164 with SMTP id mz4mr1018452lbb.52.1390395908565;
	Wed, 22 Jan 2014 05:05:08 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id wt2sm7543699lbb.2.2014.01.22.05.05.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Jan 2014 05:05:07 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 0E7151C61BD; Wed, 22 Jan 2014 14:05:00 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2014 14:04:44 +0100
Message-Id: <1390395885-5078-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH 1/2] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Wed, 22 Jan 2014 13:05:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding ability to use postinstalls intercepts in the nativesdk env, and
making sure the correlate between repo + SDK.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../postinst-intercept/postinst-intercept_1.0.bb      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb

diff --git a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
new file mode 100644
index 0000000..41b9a6e
--- /dev/null
+++ b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Postinstall scriptlets"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+FILES_${PN}_append_class-nativesdk = " ${datadir}/postinst-intercepts/*"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install_append_class-nativesdk() {
+	install -d ${D}${datadir}/postinst-intercepts
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/postinst_intercept ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_font_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_icon_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache ${D}${datadir}/postinst-intercepts/
+}
+
+BBCLASSEXTEND = "nativesdk"
+INHIBIT_DEFAULT_DEPS = "1"
-- 
1.8.3.2


