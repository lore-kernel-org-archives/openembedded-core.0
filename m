Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pD8y15k7cGEA3LdD5j8pIlhASidCNKzqt1SOk+LOodkJzGYmoj5fLpZdVH59F4kFzrXSQ1UI1e
 NX8QeS5D7zaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446349"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:21 -0800
IronPort-SDR: LicnrkTqY1cpZaxXDNj3bWifdlr8OIao1mhlalTArbHcV58RgWSEreTrbi2wIbonui/2bQZBp6
 XRFbZabz80mw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413612"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/20] systemd.bbclass: improve error message when a service unit specified in SYSTEMD_SERVICE is not found
Date: Fri, 22 Jan 2021 00:21:49 +0800
Message-Id: <f4fd434292d3f2d7e4a3dd97ae55ad5714357d9f.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Laplante <mostthingsweb@gmail.com>

The previous message was fairly useless without diving into the bbclass.

Signed-off-by: Chris Laplante <mostthingsweb@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef6117b148be65536e89409a83cbfd22049c652e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/systemd.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 9e8a82c9f1..a4bff732b9 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -174,7 +174,8 @@ python systemd_populate_packages() {
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-                    bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
+                    bb.fatal("Didn't find service unit '{0}', specified in SYSTEMD_SERVICE_{1}. {2}".format(
+                        service, pkg_systemd, "Also looked for service unit '{0}'.".format(base) if base is not None else ""))
 
     def systemd_create_presets(pkg, action):
         presetf = oe.path.join(d.getVar("PKGD"), d.getVar("systemd_unitdir"), "system-preset/98-%s.preset" % pkg)
-- 
2.29.2

