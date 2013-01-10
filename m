Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TtE4n-0006bW-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 10:05:34 +0100
Received: by mail-ee0-f46.google.com with SMTP id e49so137470eek.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 00:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zJjMaon2yLJCMoT0K6r8jXOifGhS/4V3FHviutUHObo=;
	b=IhpDiDZozhtP8DiQ01lC4Qqd5QGPOlmN0Iq+oM5iKsHPlxqvRheS7ImppLu95b3bKT
	r6nvK3xx+3aE1W3lTJoEt9SVxJ658TJBIAoa7rhcAeSE+bTiR92+o1kpplqZI5t4i6wn
	Ss0NCGeDWSeh745hwuql/LZxafxLlG8ax0OWupBY4ffIdtJHPtRgNiqcoyEZ/gdOa7Y6
	11GNJJGHaPe0Vhb5lcxgOALzit+4Sy9Jjfy4E5GATOl5AM1U3PrVHyRSiJ9onetdUTz+
	+QvL2yc0LyOO7FgTee62Ra5Y83BxMKfEageRyLpNodSH0BE9BL070vPNdlnaIxjcBCIc
	dx5Q==
X-Received: by 10.14.221.9 with SMTP id q9mr192030106eep.3.1357807816658;
	Thu, 10 Jan 2013 00:50:16 -0800 (PST)
Received: from dhcp-10-54-86-82.cisco.com (64-103-25-233.cisco.com.
	[64.103.25.233])
	by mx.google.com with ESMTPS id 44sm1908196eek.0.2013.01.10.00.50.15
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 00:50:15 -0800 (PST)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 09:50:04 +0100
Message-Id: <1357807806-31720-3-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.10.2 (Apple Git-33)
In-Reply-To: <1357807806-31720-1-git-send-email-martiert@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
Subject: [PATCH 3/5] quilt: Don't use BUILD_ROOT on darwin.
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
X-List-Received-Date: Thu, 10 Jan 2013 09:05:39 -0000

---
 meta/recipes-devtools/quilt/quilt-0.60.inc |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt-0.60.inc b/meta/recipes-devtools/quilt/quilt-0.60.inc
index e0a2e51..5fe201f 100644
--- a/meta/recipes-devtools/quilt/quilt-0.60.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.60.inc
@@ -25,9 +25,12 @@ FILES_guards-doc = "${mandir}/man1/guards.1"
 
 RDEPENDS_${PN} = "bash"
 
+EXTRA_OE_MAKE_ARGS_darwin ?= ""
+EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
+
 # quilt ignores DESTDIR
 do_install () {
-	oe_runmake 'BUILD_ROOT=${D}' install
+	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
 	# cleanup unpackaged files
 	rm -rf ${D}/${datadir}/emacs
 }
-- 
1.7.10.2 (Apple Git-33)



