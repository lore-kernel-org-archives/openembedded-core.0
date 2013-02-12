Received: from mail-pa0-f50.google.com ([209.85.220.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U5BNo-00030T-63
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 09:38:38 +0100
Received: by mail-pa0-f50.google.com with SMTP id fa11so3583521pad.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 00:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=suZ8eVBuJX0wfmCwlo8/lffsKACyH1zR/cKXhOJGWV4=;
	b=e0YGPqqc1EJXQ+ZBKAMC67thKqY0sIEZdkQp1cEwNtsMQ8i2XDLf8UMnUKCQC1Syh/
	FoQIRfboD+DXkBo8KYOROHZd9qGvqYjRplN69aXkjUMlswNvfoygjxMJC+FvUz7DQNfH
	2hEhgs2g9SK/A0/tlzkQyRNutY5U74762aEZl4kmSGchFWnCUEFQH+pew2aRy2hiP4YT
	tLi8Ipq6+0vLQwPDhiqORXu84zNcBxiYnKRFmb0wfbhTAbzNCZKuUj8ASywCNZJYmHjI
	nZO4rmCnrWKZSxDIY+q2tUfZ2rxshmT3p8n+axJ/qs8OcPMqEOxdvxM0tjBL2ccDCAUa
	Ja3A==
X-Received: by 10.66.9.2 with SMTP id v2mr49718236paa.18.1360657352336;
	Tue, 12 Feb 2013 00:22:32 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id e6sm73092106paw.16.2013.02.12.00.22.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 00:22:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 00:22:17 -0800
Message-Id: <1360657337-7154-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] systemd: Add systemd package to PACKAGE var
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
X-List-Received-Date: Tue, 12 Feb 2013 08:38:39 -0000

If someone defines SYSTEMD_PACKAGES to be different
then ${PN} then we need to make sure that they get
added to PACKAGES variable

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/systemd.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 32cc5c2..672f304 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -46,6 +46,12 @@ def systemd_populate_packages(d):
             val = (d.getVar(var, True) or "").strip()
         return val
 
+    # prepend systemd-packages not already included
+    def systemd_create_package(pkg_systemd):
+        packages = d.getVar('PACKAGES', True)
+        if not pkg_systemd in packages:
+            d.appendVar('PACKAGES', " " + pkg_systemd)
+
 
     # Add a runtime dependency on systemd to pkg
     def systemd_add_rdepends(pkg):
@@ -144,6 +150,7 @@ def systemd_populate_packages(d):
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D", True)):
         for pkg in d.getVar('SYSTEMD_PACKAGES', True).split():
+            systemd_create_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
                 systemd_generate_package_scripts(pkg)
                 systemd_add_rdepends(pkg)
-- 
1.7.9.5



