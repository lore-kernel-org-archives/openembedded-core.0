Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1DC356E2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:32:15 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id y10so2103084wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ix2t28ETtaf9uOVxGlf3ITMibIjbJh/F5+rYa7HG8uw=;
	b=UYWpBITF8uUG2PzQa6/uhD26ogOupMXC7peIMW5F6NXZRSQe6h0Fa2VxsIgo7RlMfc
	MbXEGFWwpD344Xqr0Hh/mvStWkZWseJOyTbQcjEIDOXA6FEiVgXu/pdA0RZh2QtrW8x5
	4+DQYd5T2S0tvdY/Lz6LetnA6HK4DhO4V0VlO7996MUXcLY9IXeKupVCdU51N1ILkHhm
	99gkz+CXfEkuNYqWGeEHgLe+SEh2n4rgh/lF5BTLJiluTsrlNCAj5Q78lwyssuWuaATY
	3y9enPC/U6Te2n2lN8kSLoy5T6Ffv8eTLVFfDjJjrbIV8iVm4/C6qPzmbRuLud8ZrEF2
	Va7A==
X-Gm-Message-State: ALoCoQmc3Ct/kWQd+ob0FjNfDuADOGK0Po6ADEBMMX79gj4Mk/dT1clLq6JWH/I6rWk6YXWFMHYa
X-Received: by 10.180.160.166 with SMTP id xl6mr3481594wib.43.1389807136200;
	Wed, 15 Jan 2014 09:32:16 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hy8sm3857058wjb.2.2014.01.15.09.32.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:32:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2014 17:32:11 +0000
Message-Id: <1389807131-22392-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] glib: add missing dependencies for ptest
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
X-List-Received-Date: Wed, 15 Jan 2014 17:32:16 -0000

Some of the GLib tests that we run under ptest are missing runtime dependencies.

iochannel-test needs the EUC-JP encoding.

convert needs the ISO-8859-1 and ISO-8859-15 encodings.

contenttype needs shared-mime-info.

Add these to the RDEPENDS so that these tests pass.

[ YOCTO #5696 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c690ba9..7b471e7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -78,6 +78,7 @@ RDEPENDS_${PN}-ptest += "\
             tzdata-posix \
             python-pygobject \
             python-dbus \
+            shared-mime-info \
            "
 
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
@@ -87,6 +88,9 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-charmap-cp1255 \
             eglibc-gconv-utf-32 \
             eglibc-gconv-utf-7 \
+            eglibc-gconv-euc-jp \
+            eglibc-gconv-iso8859-1 \
+            eglibc-gconv-iso8859-15 \
             eglibc-charmap-invariant \
             eglibc-localedata-translit-cjk-variants \
            "
-- 
1.7.10.4


