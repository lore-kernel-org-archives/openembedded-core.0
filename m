Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T2PIq-0001bG-Mm
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 18:21:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HG9fmU025908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:09:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 17 Aug 2012 09:09:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 11:25:40 -0500
Message-ID: <8ec9fdfcc490a8777c7f1a88a262ba52f5efea4e.1345220525.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1345220525.git.mark.hatle@windriver.com>
References: <cover.1345220525.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] package_rpm.bbclass: Fix attemptonly install failures
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
X-List-Received-Date: Fri, 17 Aug 2012 16:21:41 -0000
Content-Type: text/plain

During an attemptonly install, if you try to install two packages that
conflict with each other, a message is generated:

 error: Failed dependencies:
     dropbear conflicts with openssh-6.0p1-r4.ppc603e
     dropbear conflicts with openssh-sshd-6.0p1-r4.ppc603e

This is placed onto stderr (vs stdout), which was not being redirected.
This allowed the log-check code to find the magic key of "Failed" causing
the package installation process to fail.  Instead the proper behavior is to
simply ignore the error and proceed with the install.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b58ae85..4b18cc6 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -340,7 +340,7 @@ package_install_internal_rpm () {
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
 				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" || true
+			$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
 		done
 	fi
 
-- 
1.7.3.4



