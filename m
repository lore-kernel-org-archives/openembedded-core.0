Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E98F6DF9D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 22:58:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB5MwLa5018125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 14:58:21 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 14:58:20 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:57:42 -0600
Message-ID: <889b44c99d3e271d502bedf8372c9def09133053.1386283669.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <cover.1386283669.git.mark.hatle@windriver.com>
References: <cover.1386283669.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 3/7][dora] Fix conflict between procps and base-files
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
X-List-Received-Date: Thu, 05 Dec 2013 22:58:21 -0000
Content-Type: text/plain

From: "Junxian.Xiao" <Junxian.Xiao@windriver.com>

-- Sent for YP compliance --

These two packages both install /etc/sysctl.conf, but we should
make sure we will install this file in base-files package.

Signed-off-by: Junxian.Xiao <Junxian.Xiao@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/procps/procps_3.2.8.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index e4b82e0..03b2b64 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -23,6 +23,10 @@ EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -I${STAGING_INCDIR}" \
                 install="install -D" \
                 ldconfig=echo'
 
+ALTERNATIVE_${PN} += "sysctlconf"
+ALTERNATIVE_LINK_NAME[sysctlconf] = "${sysconfdir}/sysctl.conf"
+ALTERNATIVE_PRIORITY[sysctlconf] = "110"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/sysctl.conf ${D}${sysconfdir}/sysctl.conf
-- 
1.8.1.2.545.g2f19ada


