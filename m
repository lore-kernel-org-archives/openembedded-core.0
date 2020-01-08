Return-Path: <Yanfei.Xu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24BCD7FC86
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 07:33:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0087XRpx016833
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jan 2020 23:33:28 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Tue, 7 Jan 2020 23:33:27 -0800
From: <yanfei.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jan 2020 15:33:26 +0800
Message-ID: <1578468806-411330-1-git-send-email-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sysklogd: add a delay before klogd connect syslogd
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
X-List-Received-Date: Wed, 08 Jan 2020 07:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Yanfei Xu <yanfei.xu@windriver.com>

klogd and syslogd's type has been changed from "forking" to "simple"
in service file used by systemd. It causes klogd will boot on the
heels of syslogd in a very short time and result in a empty kern.log.

Adding a delay before klogd connecting syslogd can solve this.
--------------------------
steps to reproduce:
    Bitbake core-image-minimal  with configuration as follow：
    MACHINE ??= "genericx86-64"
    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
    VIRTUAL-RUNTIME_base-utils-syslog = "sysklogd"

After your system booting successfully, you will find /var/log/kern.log
is empty.
-------------------------

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 774d23b..ff8188d 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -21,7 +21,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
            "
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --without-logger"
+EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --with-klogd-delay=1 --without-logger"
 
 do_install_append () {
        install -d ${D}${sysconfdir}
-- 
2.7.4


