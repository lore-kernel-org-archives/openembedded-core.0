Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 92B6C60EEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 03:34:29 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l13so4220714qcy.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 20:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=5/qaEKkR3qd6S+xWykshM4Xj4hLaR7gS8Z5zuUSv1qE=;
	b=nuk3gD/ppXm6qs/oQ2naYUJFhTk7UUvy+v7b1felVhjjCLXJP0v+3tTwIfIuE8Isgf
	d9933jyuuHeF74XM1GwrGgY8UOU8Bi9Sfw2lPi29GW3ctPBXhcrHdcbT8SFCUd/z4Jcu
	DOEUxtS55LUTkEcHxMMeBCyJTIq71kBWlL4sdAUf33ANSCr6vCcxTmYKjSSKo4TwVPXr
	KHEJltJH/fkqSQtfPyYFcFyAUeDKMCkWegEa6+JhGa6MuA8Jpx/gXjlgK5qa1IdFJGYY
	xruVzd/LwNoa5T77gJ9EhvJYZR2Wvihly7STvjxmm/zxGpMN0fN8Idj80h/7ZrU9GOWD
	5XNw==
X-Received: by 10.224.171.196 with SMTP id i4mr11388177qaz.38.1379475271178;
	Tue, 17 Sep 2013 20:34:31 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.209.11])
	by mx.google.com with ESMTPSA id u8sm60772376qef.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 20:34:30 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 00:34:18 -0300
Message-Id: <1379475258-21205-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Organization: O.S. Systems Software LTDA.
Cc: Anders Darander <anders@chargestorm.se>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot-fw-utils: Skip package if UBOOT_MACHINE is unset
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
X-List-Received-Date: Wed, 18 Sep 2013 03:34:30 -0000

The UBOOT_MACHINE variable needs to be set so the firmware utils can
know about some configuration settings which are board dependent. This
patch ensures the package is skipped in case UBOOT_MACHINE is unset
thus avoid its build in 'bitbake world' builds for incompatible
machines.

Fixes [YOCTO: #5223]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index f97df71..e711951 100644
--- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -17,6 +17,15 @@ S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTSTRIP="true"'
 
+python () {
+	if not d.getVar("UBOOT_MACHINE", True):
+		PN = d.getVar("PN", True)
+		FILE = os.path.basename(d.getVar("FILE", True))
+		bb.debug(1, "To build %s, see %s for instructions on \
+			     setting up your machine config" % (PN, FILE))
+		raise bb.parse.SkipPackage("UBOOT_MACHINE is not set in the %s machine configuration." % d.getVar("MACHINE", True))
+}
+
 do_compile () {
   oe_runmake ${UBOOT_MACHINE}
   oe_runmake env
-- 
1.8.4.rc3


