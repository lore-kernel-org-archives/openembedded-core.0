Return-Path: <prvs=493fea461=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id C65D778332
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 12:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1648; q=dns/txt;
	s=ironport1; t=1511439862; x=1542975862;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Cnj8QJJShcjsdmRlmClpJ7iDB9Sxe31O105EyHOEwSg=;
	b=BXc9dCrhQ2k3M00EJ6q6g786xztVZbH15sa7GRhICe6oL1CQfoVgycnk
	7GWUw4F/f66SFc42KmUFRRfGQdGDVO3+uhlMzOhlJeiZETvcu6mDgBAZm
	GYN+RUB2H/3W1tHb1zkmFpceIfI42Z+EFWLwKp/7Qrgh0SZFWMeCnwYvT E=;
X-IronPort-AV: E=Sophos;i="5.44,441,1505772000"; 
   d="scan'208";a="2859571"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 13:24:20 +0100
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 23 Nov 2017 13:24:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Nov 2017 13:24:10 +0100
Message-ID: <20171123122410.9253-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Subject: [PATCH] systemd: allow dots in arguments to template units
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Nov 2017 12:24:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When installing systemd template units with an argument, the current code
removes characters between the '@' and the '.' from service names in
SYSTEMD_SERVICE_${PN}, e.g.:

  getty@tty1.service -> getty@.service

This fails for services with dots in the argument (which is perfectly
legal in systemd), since the code searches only until the first dot.
E.g.:

  vlan@eth0.1.service -> vlan@1.service

This is obviously wrong, and fails in systemd_populate_packages(), where
it fails to find the unit file.

Fix this by reworking the removal of the argument part of the service
name, so that parts before '@' and after teh last '.' are used as base
name.

Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
---
 meta/classes/systemd.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index c4b4bb9b70..1b134322fb 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -154,8 +154,10 @@ python systemd_populate_packages() {
                 # Deal with adding, for example, 'ifplugd@eth0.service' from
                 # 'ifplugd@.service'
                 base = None
-                if service.find('@') != -1:
-                    base = re.sub('@[^.]+.', '@.', service)
+                at = service.find('@')
+                if at != -1:
+                    ext = service.rfind('.')
+                    base = service[:at] + '@' + service[ext:]
 
                 for path in searchpaths:
                     if os.path.exists(oe.path.join(d.getVar("D"), path, service)):
-- 
2.15.0


