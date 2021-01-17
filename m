Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.24393.1610918166547675149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jan 2021 13:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.193, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from loomas.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 11BAF240003;
	Sun, 17 Jan 2021 21:16:02 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [master][gatesgarth][dunfell][PATCH] bluez: Whitelist CVE-2020-12351 and CVE-2020-12352
Date: Sun, 17 Jan 2021 13:14:45 -0800
Message-Id: <20210117211445.2341303-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the Intel security advisory [1], these CVEs are mitigated by
the following kernel commits:

eddb7732119d53400f48a02536a84c509692faa8 Bluetooth: A2MP: Fix not initializing all members
f19425641cb2572a33cb074d5e30283720bd4d22 Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
b560a208cda0297fef6ff85bbfd58a8f0a52a543 Bluetooth: MGMT: Fix not checking if BT_HS is enabled
a2ec905d1e160a33b2e210e45ad30445ef26ce0e Bluetooth: fix kernel oops in store_pending_adv_report

The latest of these commits were backported from 5.10 to the stable kernel
tree in the 5.8.16 and 5.4.72 releases. Since the kernels provied by OE-core
contain these fixes, mark them as whitelisted.

[1]: https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00435.html?wapkw=CVE-2020-12351

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 8190924562..051fdef8ce 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -3,6 +3,8 @@ require bluez5.inc
 SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
 SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
+CVE_CHECK_WHITELIST += "CVE-2020-12351 CVE-2020-12352"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-- 
2.26.2

