Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBB677CF4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 15:09:43 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id e75so114392311itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 08:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=EUgRDQ23s9YKHw+giggZgASSUjSBaYgfvjAZ31L3HUQ=;
	b=DX20l01xwItKuMslomB7VlpPOLk+k4wnsg1xZh1tq847GmRpdPAufsLseBsLYlQD6R
	A0n3sbV1ou5MJhi1YwuXTTTr/mAUMWcVX7ewsGCSkGETqYHZY0CLuCOLjHJxi4aW09wN
	h652E68+ISi62VKnn0GDIZBHI3eJjKq6J7QLfKSnNs1ndGOL2oE0sKpLWQPbgzINaQ9N
	thSNDoGPnyCb/+neYJ35A602cdUDuR5VxcOj2fIBzmQ812oQkz4z+nHwQdWiUuyPP7qe
	EPZHlTWeJpgWk7AIvhottwXtZb/wUrTJ++Nc0F/11QnWwurdClZbtqmdsl5FUMtP8r9E
	J4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EUgRDQ23s9YKHw+giggZgASSUjSBaYgfvjAZ31L3HUQ=;
	b=fgoqXpXTz51zEZ+MimK6T8O/P6KrVd3fpsDwF0Co9AJQqiDuKgi5DV37QP3EdXDREK
	CnGtwyqriknw77jVZuCIMpcI3AuSiQAEPJ0ntuw4O0ZKA1dEzio3liKas/szC9MPqswu
	bf/2uBXTTzDgJy8iaaxFFGjqjCyefsqdPVJRjhLd65aJShZ4DnVfXKzY4JHUP6fUrmR7
	Ze3MxsG+79Cr6tPILjKao64ddZiCOMVGBgekagQdbdk58E4olearKc+dThy/ItYnhZJs
	OfiYQMIKn3nPH87FY88FKHZP8iV/jhGCRakmydT9fM79AUZJbC5sEeJ4l0ZOiXQ65QOD
	hySg==
X-Gm-Message-State: AFeK/H0+/Os4/PsUa1MQLl554G54rjX0MB9eCCu/t8Hl2bZeNE0QrFwJjNtEQzJboCVw0veO
X-Received: by 10.36.13.74 with SMTP id 71mr4701864itx.62.1490886584591;
	Thu, 30 Mar 2017 08:09:44 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8CE63.dip0.t-ipconnect.de.
	[93.232.206.99]) by smtp.gmail.com with ESMTPSA id
	c100sm1468889itd.20.2017.03.30.08.09.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 08:09:43 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 17:09:36 +0200
Message-Id: <7e4d76293bf16287959f76b75aa4ed26c56ea170.1490886538.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] net-tools: enable native and nativesdk variant
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
X-List-Received-Date: Thu, 30 Mar 2017 15:09:43 -0000

net-tools-native is needed by swtpm-wrappers (in meta-security)
because swtpm_setup.sh calls netstat, which cannot be assumed to be
present in all Linux installations (for example, it is not in OpenSUSE
minimal base).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-extended/net-tools/net-tools_1.60-26.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index be26735..4152a4f 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -70,11 +70,20 @@ python do_patch() {
     bb.build.exec_func('patch_do_patch', d)
 }
 
+# i18n only enabled for the target, doesn't build for native
+# and isn't needed there.
+disable_i18n() {
+	sed -i -e 's/^I18N=1/# I18N=1/' ${S}/config.make
+}
+disable_i18n_class-target () {
+}
+
 do_configure() {
 	# net-tools has its own config mechanism requiring "make config"
 	# we pre-generate desired options and copy to source directory instead
 	cp ${WORKDIR}/net-tools-config.h    ${S}/config.h
 	cp ${WORKDIR}/net-tools-config.make ${S}/config.make
+	disable_i18n
 }
 
 do_compile() {
@@ -125,3 +134,4 @@ python __anonymous() {
 }
 ALTERNATIVE_PRIORITY = "100"
 
+BBCLASSEXTEND = "native nativesdk"

base-commit: e4f5d88b8e69964c40e7011c1e7f33f6484b9090
-- 
git-series 0.9.1

