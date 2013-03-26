Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXO2-00076z-Gt
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:16 +0100
Received: by mail-wi0-f170.google.com with SMTP id hm11so1217596wib.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=zES3NosY5C8kSqVVE7LrKIK9tm1pq+XX4fn+mgJ8kiU=;
	b=V48rPT2HG8oHbQeXc80kIx7TPbOblFE29P37EbLDBdgaqHeyhDHQDAiKLh4o/wjNsN
	TXSdSqj77ed/1HDsk38zhndKHJz1BRCJ7b2bTkHBmmNNV0rjEoOVl8zJ0HcFaZoCcuTK
	9ayLLLbI2yuYYp927RN3muipM1wuXYkC2IZCbsaMc12vpvElCZUXYWS1AXwdGbrF8wE1
	gh4s5pnibUnWZNlLG96btEtbeShg7nSjHBdWNHvVGxTpMXSCWtlEVSaTjZdadjaj9D2m
	wanePxu7iUzQks9MA9K0yzogH7kIq6Fukobk+dGLWdEXe4ZM9nKk0ffHB9aYOE2UHQVW
	Qv+A==
X-Received: by 10.194.93.68 with SMTP id cs4mr26170454wjb.17.1364316794846;
	Tue, 26 Mar 2013 09:53:14 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:07 +0000
Message-Id: <026c417a1feb6ca0219088e38cd55d9e20c3f45a.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmh84LO38syqOQB8Gya6yEFsW4o7g9jNcZ5r4lUYtmao4Pdk+5lInU+eBkFDPcPCnixVs4v
Subject: [PATCH 09/24] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:19 -0000

Run the helper if the sysvinit feature is present, or if the systemd feature is
present but the systemd class hasn't been inherited.  We want to run in the
latter case as systemd has sysvinit compatibility, but we don't want to always
run so that pure systemd images don't have redundant sysvinit files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/update-rc.d.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
index 65bf022..06b91c1 100644
--- a/meta/classes/update-rc.d.bbclass
+++ b/meta/classes/update-rc.d.bbclass
@@ -75,9 +75,12 @@ python populate_packages_updatercd () {
         postrm += d.getVar('updatercd_postrm', True)
         d.setVar('pkg_postrm_%s' % pkg, postrm)
 
-    # If the systemd class has also been inherited, then don't do anything as
-    # the systemd units will override anything created by update-rc.d.
-    if not d.getVar("SYSTEMD_BBCLASS_ENABLED", True):
+    # Run if the sysvinit feature is present, or if the systemd feature is present
+    # but the systemd class hasn't been inherited.  We want to run in the latter case
+    # as systemd has sysvinit compatibility, but we don't want to always so that
+    # pure systemd images don't have redundent sysvinit files.
+    if "sysvinit" in d.getVar("DISTRO_FEATURES").split() or \
+       ("systemd" in d.getVar("DISTRO_FEATURES").split() and not d.getVar("SYSTEMD_BBCLASS_ENABLED", True)):
         pkgs = d.getVar('INITSCRIPT_PACKAGES', True)
         if pkgs == None:
             pkgs = d.getVar('UPDATERCPN', True)
-- 
1.7.10.4



