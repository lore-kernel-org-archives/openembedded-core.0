Return-Path: <net147@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id B79E6601AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:05:38 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so6227039pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sWGwxG29FVy16Wzmnrz+udGx/mY1SfZ/7I8J+qH4Lvg=;
	b=eD1LLbq9OU4vclU/i7QSuK9qJlsXQCx9f8XWYB0BX2laGRwPBQKBFm4okudJUyPam4
	O5REUH6161nW2kOcl3+mCMI4s6Iqazhx3L/KRC/1dmok5NbZjgSTW3JvOOPGneMybhKp
	G48wRhsbfboPH/LaThz348+Pvn09LbYctvTc22xUPmQXD7K6XxHJc4bcj5EaC6bLut3u
	ls5FnKha3TcgWIzNEjoGLsBO1IukTyqDwJk0S1itfgmPNkzccAMlrhV+pmzdCHOW4P7C
	LIc33kI/ZX7bDXJjSSz+FQiBxID4BMwvX4ASkUh0eiPjWqnyxxOEYqnWI1dI0aS8uwsz
	HKOA==
X-Received: by 10.66.171.231 with SMTP id ax7mr11633390pac.32.1371733539839;
	Thu, 20 Jun 2013 06:05:39 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id pb5sm197341pbc.29.2013.06.20.06.05.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Jun 2013 06:05:38 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jun 2013 23:19:53 +1000
Message-Id: <1371734393-27665-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] qt4: add eglibc-gconv-utf-16 to QtCore RRECOMMENDS when using glibc
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
X-List-Received-Date: Thu, 20 Jun 2013 13:05:38 -0000

This fixes the following warnings when running Qt applications:
QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv_open failed
QIconvCodec::convertToUnicode: using Latin-1 for conversion, iconv_open failed

Qt's QString class stores strings internally using UTF-16 encoding.
The UTF-16 iconv module is needed to convert between the system's local
8-bit representation and QString's UTF-16 encoding.

For example, the following functions would be affected:
QString::fromLocal8Bit(...)
QString::toLocal8Bit(...)

If the UTF-16 iconv module couldn't be loaded, it would use Latin-1
encoding instead of the system's encoding for conversion.

[YOCTO #349]

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 828e30a..ebe0ea5 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -134,6 +134,7 @@ FILES_${QT_BASE_NAME}-demos-doc = "${docdir}/${QT_DIR_NAME}/qch/qt.qch"
 RRECOMMENDS_${PN} = "${LIB_PACKAGES} ${OTHER_PACKAGES}"
 RRECOMMENDS_${PN}-dev = "${DEV_PACKAGES}"
 RRECOMMENDS_${PN}-dbg = "${DBG_PACKAGES}"
+RRECOMMENDS_${QT_BASE_LIB}core4_append_libc-glibc = " eglibc-gconv-utf-16"
 RRECOMMENDS_${QT_BASE_NAME}-demos += " \
             ${QT_BASE_NAME}-examples \
             ${QT_BASE_NAME}-plugin-sqldriver-sqlite \
-- 
1.8.3


