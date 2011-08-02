Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jE-0005dl-Qp
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:21:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720GdrV020017
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:39 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:42 -0500
Message-ID: <d97dcf096a3a72a2a087b2dbbcdd74c853f7e940.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/5] update-alternatives: Add alternatives as a runtime provide
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 00:21:01 -0000
Content-Type: text/plain

The following allows RPM to generate the SDK image, however without it
we get a failure because the system has nothing that provides /bin/sh.

Unfortunately the patch causes failures with ipk and deb packages because
they can not have filenames within their RPROVIDES.  I'm looking for some
type of a resolution to the issue, the only thing I can think of is to
add a way to manually add a FILERPROVIDE for the items.  This will require
changes to the way FILERPROVIDE is currently generated... but I'm not sure
how we can automatically generate the FILERPROVIDE values without the use of
python...

Any suggestions?

-----

Add the automatic alternatives as runtime provides.

This was discovered when programers were requiring "/bin/sh" and there
was nothing within the system providing "/bin/sh", however bash had an
alternative for /bin/sh that would satisfy this dependency.

NOTE: THIS BREAKS IPK AND DEB PACKAGE GENERATION!  IT SHOULD NOT BE
MERGED!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/update-alternatives.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index ba81221..4cd680e 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -40,6 +40,8 @@
 ALTERNATIVE_PRIORITY = "10"
 ALTERNATIVE_LINK = "${bindir}/${ALTERNATIVE_NAME}"
 
+RPROVIDES_${PN} += "${@(d.getVar('ALTERNATIVE_LINK', True) or '') + ' ' + (d.getVar('ALTERNATIVE_LINKS', True) or '')}"
+
 update_alternatives_postinst() {
 update-alternatives --install ${ALTERNATIVE_LINK} ${ALTERNATIVE_NAME} ${ALTERNATIVE_PATH} ${ALTERNATIVE_PRIORITY}
 }
-- 
1.7.3.4



