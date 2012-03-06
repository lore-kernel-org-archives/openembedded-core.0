Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1S4r8D-0007ZX-B2
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 10:56:33 +0100
Received: by eekc1 with SMTP id c1so1505200eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 01:47:57 -0800 (PST)
Received-SPF: pass (google.com: domain of s.stirtzel@googlemail.com designates
	10.213.101.1 as permitted sender) client-ip=10.213.101.1; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	s.stirtzel@googlemail.com designates 10.213.101.1 as permitted
	sender) smtp.mail=s.stirtzel@googlemail.com;
	dkim=pass header.i=s.stirtzel@googlemail.com
Received: from mr.google.com ([10.213.101.1])
	by 10.213.101.1 with SMTP id a1mr4465345ebo.76.1331027277903 (num_hops
	= 1); Tue, 06 Mar 2012 01:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FGqV9fS89S7mAQgRl5XQxkLebxIFd2Bxj6+K1ivu2k4=;
	b=SdZ33MZrfVz1N9hBD1SGTXkNsRiXyCatXU1qRxjoXdyDrzeYOk0vWjsg0PlkSMwBUY
	6081HIhkLDQYETiTyPp7aQH6fUDG2ErTvjyiesgj5OAy5kJmdwR8GTh/6DX1J0qZGSEy
	nDZrwWM+tfqrAQvv/jW90jqUopcKKGx7D+mn/zASbaDYS25TONrPYboerJx04HXfN+nA
	1ZFq9bMBZ6qmJH/i9Uc7OsmPp/jMjd2LRl6lVOzSjWwsB3sy4Ku56MoWhsVtHqDrmVjH
	1ROxA9vYUe7uNlpG0uVW+enAbh4haaSKeBPdmQGO4bhdv8znRmAUD+4dwbtlf4+Uybgf
	TxeA==
Received: by 10.213.101.1 with SMTP id a1mr3378150ebo.76.1331027277826;
	Tue, 06 Mar 2012 01:47:57 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id d54sm26490534eei.9.2012.03.06.01.47.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 01:47:57 -0800 (PST)
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 10:47:42 +0100
Message-Id: <1331027262-13318-1-git-send-email-s.stirtzel@googlemail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] mime.bbclass: Fix bracket error.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 09:56:33 -0000

This fixes the following error:

ERROR: Error executing a python function in ...:
AttributeError: 'str' object has no attribute 'append'

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "populate_packages", line 193, in <module>
ERROR:
ERROR:   File "populate_packages", line 189, in populate_packages
ERROR:
ERROR: The code that was being executed was:
ERROR:      0189:                       rdepends.append("shared-mime-info-data")
ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
ERROR:      0191:
ERROR:      0192:
ERROR:  *** 0193:populate_packages(d)
ERROR:      0194:
ERROR: (file: 'populate_packages', lineno: 193, function: <module>)
ERROR:      0185:                       postrm += d.getVar('mime_postrm', True)
ERROR:      0186:                       d.setVar('pkg_postrm_%s' % pkg, postrm)
ERROR:      0187:                       bb.note("adding shared-mime-info-data dependency to %s" % pkg)
ERROR:      0188:                       rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
ERROR:  *** 0189:                       rdepends.append("shared-mime-info-data")
ERROR:      0190:                       d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
ERROR:      0191:
ERROR:      0192:
ERROR:      0193:populate_packages(d)

Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
---
 meta/classes/mime.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
index dcdc27a..6302747 100644
--- a/meta/classes/mime.bbclass
+++ b/meta/classes/mime.bbclass
@@ -54,7 +54,7 @@ python populate_packages_append () {
 			postrm += d.getVar('mime_postrm', True)
 			d.setVar('pkg_postrm_%s' % pkg, postrm)
 			bb.note("adding shared-mime-info-data dependency to %s" % pkg)
-			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
+			rdepends = explode_deps(d.getVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False) or "" ) 
 			rdepends.append("shared-mime-info-data")
 			d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
 }
-- 
1.7.5.4



