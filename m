Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TDPyO-000078-Mc
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 03:18:04 +0200
Received: by ggmq1 with SMTP id q1so1492853ggm.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2012 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=8Viq55MKV5sHHPG50C1xfJVVKICg92E420VnEOzOqKc=;
	b=VzcQUrGT/m9C7ymQRTv07dbRpFjfOyvbevHukZrtP+N7IllUi5g7OisVcWqYALRqtv
	NT5tbXn9EspRvUVEnMTC8Z8DrojesEdicVWbplBMPmIDuhhKeO3E7d5tjJCaikNlddsx
	n+BWQQiBbgy5atagNwRyRIsCqAHdjerJ5eX3pPGsTwVkfoTke7ck7Ga/cZZW6T9EkQnw
	WpuVPhuRYg3s8wy3/g8ymziGFy+VxC2TgFQTvjgrOjf9x9+CmKHEmc1W//FFf8B/zvPV
	GCmNWd3nDVLBEI5+C029k71xcLwGCd3eBVg0SA6gvbolffufeGWu1TQ1GVwHx+rZqgzQ
	sjLQ==
Received: by 10.236.141.42 with SMTP id f30mr9959640yhj.120.1347843926224;
	Sun, 16 Sep 2012 18:05:26 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id o25sm12182800yhm.14.2012.09.16.18.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 16 Sep 2012 18:05:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Sep 2012 22:05:15 -0300
Message-Id: <1347843915-8277-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [for-denzil][PATCH] dhcp: remove dependency of dev/staticdev packages on main package
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
X-List-Received-Date: Mon, 17 Sep 2012 01:18:04 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

The main package is empty and is not produced, which leaves the dev
and staticdev packages broken. Remove the dependencies (added in
bitbake.conf by default) to fix this.

(From OE-Core rev: 5380c65e819d82f783cb75aa21db7c73bb445189)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/dhcp/dhcp.inc         |    2 ++
 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 8ead016..3159f93 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -56,6 +56,8 @@ do_install_append () {
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
 
 FILES_${PN} = ""
+RDEPENDS_${PN}-dev = ""
+RDEPENDS_${PN}-staticdev = ""
 
 FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
 RRECOMMENDS_dhcp-server = "dhcp-server-config"
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
index 24b50ba..67af3e2 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
@@ -1,6 +1,6 @@
 require dhcp.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://fixincludes.patch \
             file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
-- 
1.7.2.5



