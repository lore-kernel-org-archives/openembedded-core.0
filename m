Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CCECF6C107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 10:40:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j10so4793450wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=uIZHhq2NhGh30VaEgH6812Tds1ng8g9dwjkcPFUsFNA=;
	b=aB66dNStNJnkXEqKtukjzvzsXSzIMApvZP08Iua0YmoUb57mPCPOrJJxZ93hdUv6iV
	V3L/oaNKB3DDVl76GxNA6RErCOAZidPklxf8Refn3hIWsP7kpbM5R+8+K9pMUvgFIO5G
	kMlym+LicFcPvH5yBCl7qGxChmpqA9hEvBCAW5GBNMZLtVk8bPXrU1sn+rn11n0aHriI
	S49ubAbFjzW7q2fRQn8+WCV5Wwzuq9qm3ae9seo+ge5f5gsNAXW7aCGZQWW6CCw8PLcf
	zApJ9P1okvjTx11coAe4eIjSfsZH3LNW5+Li0DUmbm4z0miDB/Pg9+cVMXczwhzOJnXq
	+nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=uIZHhq2NhGh30VaEgH6812Tds1ng8g9dwjkcPFUsFNA=;
	b=r/U67SZ/1tOZLfHAONbLg/mGJjT9tYbrHRxfI5Nw1WQ3WP67oUMCYkFSGV/rFlVgiH
	c4TvL8lcKq/KyDsxElHrXKn7GlBlwTXfEQq6JCWq/oaUE69jIquEuRpDQQ3qVqQvQ793
	OketUSkFJcelfjtxUn2HQrD/UuVs/f1ji/8UpjTnYpGE7Xn4Sk7g0nS1tR73i8n/g4db
	A36MHDrMw1acCxki399lyPD2wwBkPd7EYDKRF+VdLXkU+169A9ccGi7YVZkpIPoMrdvU
	Z2dF91xmjXKyxODXkEjsjpgxAgnUr9pHNOpLyjFLTYZYXpVQYQGH1bjJtiq6oUMKY531
	WWcw==
X-Gm-Message-State: AA+aEWau1oACmnfpEn9LK9xM7K+4iRg8pgCrCwu52OQmDBvebilKnOrr
	sv/2VzCheor7T3T3TZo8qTLriDKhAbM=
X-Google-Smtp-Source: AFSGD/V4AZBmc5G4jmkw1x9BoDkAKp4Tf9fRbDdhOWJa0UfMW/mHQJ11m7jjOuQtFMGifQYOw2mwpg==
X-Received: by 2002:adf:b30f:: with SMTP id j15mr4799511wrd.46.1543574441402; 
	Fri, 30 Nov 2018 02:40:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v6sm5199277wro.57.2018.11.30.02.40.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Nov 2018 02:40:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2018 10:40:38 +0000
Message-Id: <20181130104038.3131-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] binconfig: only try to mangles files
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
X-List-Received-Date: Fri, 30 Nov 2018 10:40:42 -0000

If a file matches the glob that is an absolute symlink then sed will try to
alter files on the host, so restrict the search to just actual files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/binconfig.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 39c3e2b17bb..133b9537cf0 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -31,7 +31,7 @@ BINCONFIG_GLOB ?= "*-config"
 PACKAGE_PREPROCESS_FUNCS += "binconfig_package_preprocess"
 
 binconfig_package_preprocess () {
-	for config in `find ${PKGD} -name '${BINCONFIG_GLOB}'`; do
+	for config in `find ${PKGD} -type f -name '${BINCONFIG_GLOB}'`; do
 		sed -i \
 		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
 		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
@@ -40,7 +40,7 @@ binconfig_package_preprocess () {
 		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
                     $config
 	done
-	for lafile in `find ${PKGD} -name "*.la"` ; do
+	for lafile in `find ${PKGD} -type f -name "*.la"` ; do
 		sed -i \
 		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
 		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
@@ -54,7 +54,7 @@ binconfig_package_preprocess () {
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
 
 binconfig_sysroot_preprocess () {
-	for config in `find ${S} -name '${BINCONFIG_GLOB}'` `find ${B} -name '${BINCONFIG_GLOB}'`; do
+	for config in `find ${S} -type f -name '${BINCONFIG_GLOB}'` `find ${B} -type f -name '${BINCONFIG_GLOB}'`; do
 		configname=`basename $config`
 		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
 		sed ${@get_binconfig_mangle(d)} $config > ${SYSROOT_DESTDIR}${bindir_crossscripts}/$configname
-- 
2.11.0


