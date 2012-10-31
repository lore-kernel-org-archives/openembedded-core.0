Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TTSHn-0005xO-Ok
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 08:00:28 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so686188pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 23:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/9R4GXUMocHQU0wsbozVvbAdmOqUiscS+iGY/n865gw=;
	b=rGXT+SN6atOUv1l0iwpwi5reEaKYLGL/VU4fKgToQXk1HAVodV2ZySsQx964A4jz6F
	BVNZHxdE5duRAbIwRgh3WAzaSUz7Hg/wvvDuKKsYCz3ixYs1ADtc5ZFiKeEWYsijcxER
	/klx914aLnNEFRXyfB/qWfWrmkh9sVJ62Bw73ITEiGOCdd9VpiunXQetCMLWKjHxXH5L
	xvTeKKHFQP2+3t0X1IDkCRuAGw/gCE0pQJis0+YuKmVqYgQFzOO06Q3h9doFQJGuAmWm
	FZXlpryU1PXE1zh0VV0ekeFVdomrIor7puSi+H6ukHQcHdKFE/P6u/xDQxJZmcga22Ko
	q4JA==
Received: by 10.69.1.1 with SMTP id bc1mr60377046pbd.102.1351666006783;
	Tue, 30 Oct 2012 23:46:46 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id g1sm1707105pax.21.2012.10.30.23.46.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 30 Oct 2012 23:46:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Oct 2012 23:45:47 -0700
Message-Id: <1351665947-6141-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] bitbake.conf: Add udev rules into ${PN} files by default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 07:00:29 -0000

As we move to systemd, udev is not provided by systemd where the arch
independent files are stored in /lib and /usr/lib and not in
${base_libdir} and ${libdir} which means the files like udev rules
go into /lib/udev or /usr/lib/udev. This patch adds these paths
to be packaged into default ${PN} output package from a recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e7fa731..bd9a5f1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -274,6 +274,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* \
             ${base_libdir}/*${SOLIBS} \
+            ${base_prefix}/lib/udev/rules.d ${prefix}/lib/udev/rules.d \
             ${datadir}/${BPN} ${libdir}/${BPN}/* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-- 
1.7.9.5



