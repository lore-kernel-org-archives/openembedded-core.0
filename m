Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D1D465CA8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 09:10:10 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so7360032wes.18
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 02:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f3+jShldLr3VhQ9WPUDKcJC/2fiR0g8HGaofZHUZlB8=;
	b=XEY3jviCfDMRLtHhYzXjMYP0V5Z+EtnvjlJrijzHy2alsIsU+theINQZ8UZyulvRjR
	hAo7Wdx4JOV0zaOhdH+nx6rR61VvC0LuGbaIWF5Hrafg0k5l6U5C2jmcd6qgYFgj94ft
	3c1dgg24clWF4LGQ+CQ0uPJLqn6xgF3SqdQBLf6uPzxJo/rx4ULJ7bhfsYmrvhiF9/zL
	3JzKLxp56f6zwD2NHCLLyTUUjC3pd+dbhgiPVmTRXUDZXspCwoY5fn1r5kRdaQj12pTt
	76M83wRLVXhjuBZi2eoTXB5SUBlaEHF596B/gdVfxWIXahn2zq6G7UIgGi671/+OGsM4
	RBDA==
X-Gm-Message-State: ALoCoQlkJiW0hpONR7cGzsNFXvfGPC6Ys1tkzwFPzFUr3UWj3pwXMQXDCZyJHw3eOWojXHMabTR7
X-Received: by 10.180.107.65 with SMTP id ha1mr26838354wib.59.1407143407532;
	Mon, 04 Aug 2014 02:10:07 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id w6sm42036022wjq.39.2014.08.04.02.10.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 02:10:06 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 11:10:02 +0200
Message-Id: <1407143402-6842-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] tcp-wrappers: fix do_install when $prefix == $base_prefix
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
X-List-Received-Date: Mon, 04 Aug 2014 09:10:16 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index c7954e7..11cc243 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -87,10 +87,12 @@ do_install () {
 	oe_libinstall -a libwrap ${D}${libdir}
 	oe_libinstall -C shared -so libwrap ${D}${base_libdir}
 
-	rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
-	libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
-	ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
-	rm -f ${D}${base_libdir}/libwrap.so
+	if [ "${libdir}" != "${base_libdir}" ] ; then
+		rel_lib_prefix=`echo ${libdir} | sed 's,\(^/\|\)[^/][^/]*,..,g'`
+		libname=`readlink ${D}${base_libdir}/libwrap.so | xargs basename`
+		ln -s ${rel_lib_prefix}${base_libdir}/${libname} ${D}${libdir}/libwrap.so
+		rm -f ${D}${base_libdir}/libwrap.so
+	fi
 
 	install -d ${D}${sbindir}
 	for b in ${BINS}; do
-- 
1.9.0


