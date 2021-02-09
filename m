Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.12468.1612885988361102987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Eda1r7TRoagALgUJ40Z04qehelcN8gbDOTzD4Zua+OgmOsMCUvntpCYaaBV3Yfm71ap7AyXcV7
 kH5qjXj0ponw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266736016"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="266736016"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:13 -0800
IronPort-SDR: Xp+vmPHXq0b8MbBbGBlBzuj9MKQpzR347ckEBDnGNCAouPx8/n19muv0v+2Ynl20lzuJje5Wwg
 G2aHjfc6fN+g==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215571"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 25/35] systemd: change /bin/nologin to /sbin/nologin
Date: Tue,  9 Feb 2021 23:52:10 +0800
Message-Id: <8aa2cd230dfdf8c719c2ec267a5f68f6b8965291.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Our nologin path is /sbin/nologin instead of /bin/nologin.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd7f55e960e759d946d8b619b0a306e610f66356)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/systemd/systemd_246.9.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_246.9.bb b/meta/recipes-core/systemd/systemd_246.9.bb
index 9215adf8dc..2f460e9bee 100644
--- a/meta/recipes-core/systemd/systemd_246.9.bb
+++ b/meta/recipes-core/systemd/systemd_246.9.bb
@@ -357,15 +357,15 @@ USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
                     ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM_${PN} = "-r systemd-journal"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /bin/nologin systemd-network;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /sbin/nologin systemd-coredump;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--system -d / -M --shell /sbin/nologin systemd-network;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
-USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
-USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
-USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /bin/nologin systemd-journal-gateway"
-USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /bin/nologin systemd-journal-remote"
-USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /bin/nologin systemd-journal-upload"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /sbin/nologin systemd-resolve;', '', d)}"
+USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /sbin/nologin systemd-timesync;', '', d)}"
+USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /sbin/nologin systemd-bus-proxy"
+USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /sbin/nologin systemd-journal-gateway"
+USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /sbin/nologin systemd-journal-remote"
+USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /sbin/nologin systemd-journal-upload"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
-- 
2.29.2

