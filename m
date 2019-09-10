Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74E2C7D25F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 03:27:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8A3R2qv021918
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 20:27:02 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 9 Sep 2019 20:27:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2019 23:26:34 -0400
Message-ID: <20190910032634.33785-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190910032634.33785-1-kai.kang@windriver.com>
References: <20190910032634.33785-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] systemd: provides ${base_sbindir}/udevadm
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
X-List-Received-Date: Tue, 10 Sep 2019 03:27:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

In some udev rules files such as 97-hid2hci.rules from bluez5, it calls
/sbin/udevadm in a rule. eudev provides /usr/bin/udevadm and
/sbin/udevadm which is a link to /usr/bin/udevadm. But systemd only
provides /bin/udevadm. It is not convenient to update the rule file that
udevadm reside in different directories for eudev and system.

So create link file ${base_sbindir}/udevadm in systemd just the same as
eudev to fix such kind of issues.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_242.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index b368ca8a2c..4331263380 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -285,6 +285,9 @@ do_install() {
 		fi
 	fi
 
+	# create link for existing udev rules
+	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
+
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
 	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
@@ -602,6 +605,7 @@ FILES_udev += "${base_sbindir}/udevd \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
                ${base_bindir}/udevadm \
+               ${base_sbindir}/udevadm \
                ${libexecdir}/${MLPREFIX}udevadm \
                ${datadir}/bash-completion/completions/udevadm \
               "
-- 
2.20.0


