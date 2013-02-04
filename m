Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2Jod-0008QC-VI
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:30 +0100
Received: from mail-ee0-f72.google.com ([74.125.83.72])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:46:34 -0800
Received: by mail-ee0-f72.google.com with SMTP id b15so7355667eek.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=bxJ2QWrPhm9pkxylnK1ma7ZDoAUH7Ti1FixYA/+58bs=;
	b=EBZJosB7pk0dP931SWU+I9PaP7wntnF7vQWUOxIbIsgZ1JPDIbE75Aic1BA3ojjDst
	u8hbC74ft3IQZJ/infUVD1mPgeIsjJRITmzCBRKTKDKml11gXhk9vsUL/6zbSyEf8lVI
	SnEJLpaHKEXYD7Gx/O7K3GACBduxdb/2KGv51ClE5maaDtVAjfK/CTaRwfdFnlkqVMCl
	N/FEFb7iwz0LsiAsE5+l1M+aZHfhE6R9bRaNCgxWCypq4d8SJS2/rfDxUU7QLBuX5sJ2
	CqY3B+XCv949P027r5bK1NL/ts76zCongJA2GU25cVaBp4rcoG0QHYXM5UIZgboWK/bG
	aYfQ==
X-Received: by 10.180.82.9 with SMTP id e9mr9690491wiy.1.1359974792837;
	Mon, 04 Feb 2013 02:46:32 -0800 (PST)
X-Received: by 10.180.82.9 with SMTP id e9mr9690482wiy.1.1359974792782;
	Mon, 04 Feb 2013 02:46:32 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.31
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:32 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:16 +0000
Message-Id: <1359974656-21894-6-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
References: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl92CrSv04QOJjStPpq55QAg+bZmEHAnKi0X8qy2pE0F+74LSKVoQRRHgxpkHxadYhbgR6plQmJ7wos9iG0Vil+yT+Oz0iYZdwnDB6YVofgc0LUlHu5xPkPIzYKooMSpnDRn7dQEBGYHgspnp67biQgbEcsyNEwIqH66VHuMAMPialeRKbKPaNAbYXeRd9tmybvvZIR
Subject: [PATCH 5/5] libpcap: fix relative path references
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
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000

do_configure was using relative paths in do_configure with the assumption that
$S is the same as $B.  This isn't always true, so explicitly use $S.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index c87066c..b9c3640 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -27,8 +27,8 @@ CFLAGS_prepend = "-I${S} "
 CXXFLAGS_prepend = "-I${S} "
 
 do_configure_prepend () {
-    if [ ! -e acinclude.m4 ]; then
-        cat aclocal.m4 > acinclude.m4
+    if [ ! -e ${S}/acinclude.m4 ]; then
+        cat ${S}/aclocal.m4 > ${S}/acinclude.m4
     fi
     sed -i -e's,^V_RPATH_OPT=.*$,V_RPATH_OPT=,' ${S}/pcap-config.in
 }
-- 
1.7.10.4



