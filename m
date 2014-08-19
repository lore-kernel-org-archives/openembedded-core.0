Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2A2A265F1E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 10:04:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7JA4kb1016708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Aug 2014 03:04:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 03:04:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 18:04:42 +0800
Message-ID: <398026f7666fb8fdeb09a17e8b728f591f3e5dd1.1408442536.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408442536.git.hongxu.jia@windriver.com>
References: <cover.1408442536.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] bind: refer ubuntu/redhat to add bind user/group
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
X-List-Received-Date: Tue, 19 Aug 2014 10:04:48 -0000
Content-Type: text/plain

We refer what ubuntu/redhat did, gave bind a user/group

Here is the example in ubuntu 14.04:

$ ps -eo user,group,cmd | grep "named"
...
bind     bind     /usr/sbin/named -u bind
...

$vim bind9_1%3a9.9.5.dfsg-3_amd64.deb/postinst
...
    # lets give them a bind user/group in all cases.
    getent group bind >/dev/null 2>&1 || addgroup --system bind
    getent passwd bind >/dev/null 2>&1 ||
    adduser --system --home /var/cache/bind --no-create-home \
        --disabled-password --ingroup bind bind
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/bind/bind/bind9    |  2 ++
 meta/recipes-connectivity/bind/bind_9.9.5.bb | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind9

diff --git a/meta/recipes-connectivity/bind/bind/bind9 b/meta/recipes-connectivity/bind/bind/bind9
new file mode 100644
index 0000000..968679f
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind9
@@ -0,0 +1,2 @@
+# startup options for the server
+OPTIONS="-u bind"
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index de10eb8..ebd38ef 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://dont-test-on-host.patch \
            file://generate-rndc-key.sh \
            file://named.service \
+           file://bind9 \
            file://init.d-add-support-for-read-only-rootfs.patch \
 	   "
 
@@ -30,7 +31,11 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
                "
-inherit autotools-brokensep update-rc.d systemd
+inherit autotools-brokensep update-rc.d systemd useradd
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
+                       --user-group bind"
 
 INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
@@ -67,6 +72,9 @@ do_install_append() {
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
 	       ${D}${systemd_unitdir}/system/named.service
+
+	install -d ${D}${sysconfdir}/default
+	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
 }
 
 CONFFILES_${PN} = " \
-- 
1.9.1


