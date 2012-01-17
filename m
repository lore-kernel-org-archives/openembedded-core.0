Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RnBJY-0002S6-UI
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 16:51:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0HFhY4v028190
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 07:43:34 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Jan 2012 07:43:34 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 09:47:49 -0600
Message-ID: <c7289878f3f3fbcc7da909a962903b7e39ecbbee.1326815198.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1326815198.git.mark.hatle@windriver.com>
References: <cover.1326815198.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] package_rpm.bbclass: Add support for filenames with spaces
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
X-List-Received-Date: Tue, 17 Jan 2012 15:51:13 -0000
Content-Type: text/plain

Files with spaces must be fully quoted in an RPM spec file.  It was
easier to quote all file paths, then to do it selectively.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2d92efe..bac9de5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -543,12 +543,12 @@ python write_specfile () {
 			path = rootpath.replace(walkpath, "")
 			for dir in dirs:
 				# All packages own the directories their files are in...
-				target.append("%dir " + path + "/" + dir)
+				target.append('%dir "' + path + '/' + dir + '"')
 			for file in files:
-				if conffiles.count(path + "/" + file):
-					target.append("%config " + path + "/" + file)
+				if conffiles.count(path + '/' + file):
+					target.append('%config "' + path + '/' + file + '"')
 				else:
-					target.append(path + "/" + file)
+					target.append('"' + path + '/' + file + '"')
 
 	# Prevent the prerm/postrm scripts from being run during an upgrade
 	def wrap_uninstall(scriptvar):
-- 
1.7.3.4



