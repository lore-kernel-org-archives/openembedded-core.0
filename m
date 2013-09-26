Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1CE96CAC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 01:56:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8Q1u7ot025958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2013 18:56:07 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 25 Sep 2013 18:56:06 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 09:56:08 +0800
Message-ID: <1380160568-1577-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] dropbear: pass SFTPSERVER_PATH explicitly
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
X-List-Received-Date: Thu, 26 Sep 2013 01:56:07 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The default value of SFTPSERVER_PATH is "/usr/libexec/sftp-server" defined in
dropbear-2013.58/option.h, but after commit 406bd38b423[bitbake.conf: change
libexecdir to ${libdir}/${BPN}], sftp-server is provided by openssh package,
and is installed into ${libdir}/openssh, so we pass it explicitly.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index be93d60..9498bf8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -40,6 +40,7 @@ BINCOMMANDS = "dbclient ssh scp"
 EXTRA_OEMAKE = 'MULTI=1 SCPPROGRESS=1 PROGRAMS="${SBINCOMMANDS} ${BINCOMMANDS}"'
 EXTRA_OECONF += "\
  ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)}"
+CFLAGS += "-DSFTPSERVER_PATH=\\"${libdir}/openssh/sftp-server\\""
 
 do_install() {
 	install -d ${D}${sysconfdir} \
-- 
1.7.10.4


