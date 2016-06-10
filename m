Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0D77560745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 16:57:35 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v199so508043wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DvmtdRcCYZquZR7fqOasyBtrcZ96xFasGlAnTNhd5iM=;
	b=rLw6NR9ksFibEFcKgd5ceqBhqdCBMCosPB6KkwMKiXo8GfKRGIAIbF+SlG71CYv1Xx
	QDDiaz/8UWjeR8otb9mrefczP5fgCStFjyCNaHkemQ6KueKQJMTGNd6SlxwGRdWk8K0u
	ROu5sJ8XNL13/6o453QaBLtonoWHRvAN0OOV/+WL2uQXiIQU+UymSoMGf1lBOi02QjX0
	iRRss7FkSu6fshTdK8PueacRPeZEQIV3K4Tr6BG/H00UxTKLQHKxmpZ/q7/65w1rOIRf
	DW8CWicVSvuzMYPjYm1w4YB9j0ZGYKK/vRU39juTMvSKYHb6Paa5TcyqdGTU/OQJvUq5
	1sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DvmtdRcCYZquZR7fqOasyBtrcZ96xFasGlAnTNhd5iM=;
	b=f9PPbJ8U+mASwdd/YidJhR+CmYVLYZpYHyUEGNaQBNmaAbQ/WEt1OM8Kfm2Wkxtx/j
	Tj1HEV5ykIagHq7cAiLnT7xHGdhRaEZVh9SFZ5eypW1W08EqWWPQzuY6v1WhV3cgJiVE
	2/xmunHVC8ZmSjVo4YBYq4gPjV1PgONtlHMoCVNczgWniKTU20X+G6ceIZavkODvEWsB
	5Q8haBCZ/UmpX3D7B8Khw7dj+7ItStDJ56i5jAW4xOPyk5ezLyjL649asBJ4lO4qRu7Q
	QDT7ZPBgLFVwGSxfunxHQr0zhgIR8Qe9RIUK9f4fphpViskiVlZycr8kxYLu3+lEyTIr
	vWxg==
X-Gm-Message-State: ALyK8tJCOuh9ATsslor5JO17gzansOb5ijXtliVG2AXUUKK1HYh1n9SvFtdjzewjO2+RiP6/
X-Received: by 10.28.65.85 with SMTP id o82mr76723wma.16.1465577855866;
	Fri, 10 Jun 2016 09:57:35 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	vu10sm3682755wjb.27.2016.06.10.09.57.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Jun 2016 09:57:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 17:57:31 +0100
Message-Id: <1465577851-7519-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] systemtap: add build dependency on ncurses
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
X-List-Received-Date: Fri, 10 Jun 2016 16:57:36 -0000

systemtap has a floating dependency on ncurses but as bash is a RDEPENDS the
build-rdeps sanity test doesn't fire due to a limitation of the test.

Add an explicit dependency on ncurses to ensure the build is deterministic.

[ YOCTO #9709 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index a4bda69..da30fa5 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Lin
 
 require systemtap_git.inc
 
-DEPENDS = "elfutils sqlite3 systemtap-native json-c"
+DEPENDS = "elfutils sqlite3 systemtap-native ncurses json-c"
 DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
 
-- 
2.8.0.rc3


