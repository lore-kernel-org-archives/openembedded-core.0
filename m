Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: oKt80pldHzMmbNOOXiifxwt8ZVXx3IvEkITlpd9fhT16smc//O9nOCLCyHH8v8mhAAVyF/rYb2
 AW4hBo4Z6IqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719986"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719986"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:26 -0800
IronPort-SDR: qivQRnLgmaDtuGRODotTQQ4WCJnLHWguqeLdoPEqvZG+6eemZaPbi409qcrPD+R9fBeG6hoeLy
 ROIR2DCJZgvQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802964"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/19] openssh: whitelist CVE-2014-9278
Date: Tue, 17 Nov 2020 23:35:57 +0800
Message-Id: <b43201dd7459c2e408889fd8a81a52719308b5fe.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Steve Sakoman <steve@sakoman.com>

The OpenSSH server, as used in Fedora and Red Hat Enterprise
Linux 7 and when running in a Kerberos environment, allows remote
authenticated users to log in as another user when they are listed
in the .k5users file of that user, which might bypass intended
authentication requirements that would force a local login.

Whitelist the CVE since this issue is Redhat specific.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 309132e50d23b1e3f15ef8db1a101166b35f7ca4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/openssh/openssh_8.3p1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
index e007328704..2aa1df20bd 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.3p1.bb
@@ -27,6 +27,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] = "f2befbe0472fe7eb75d23340eb17531cb6b3aac24075e2066b41f814e12387b2"
 
+# This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
+# and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
+CVE_CHECK_WHITELIST += "CVE-2014-9278"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.28.0

