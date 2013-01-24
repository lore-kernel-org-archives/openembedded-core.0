Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TyWov-0002nr-OR
	for Openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 01:07:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0ONpSuh014347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 15:51:28 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 24 Jan 2013 15:51:27 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 17:51:25 -0600
Message-ID: <48f475bcf23a8d458fbeb46a96c43f7f09754a34.1359071327.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1359071327.git.peter.seebach@windriver.com>
References: <cover.1359071327.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package.bbclass: Consistency between packaging and unpackaged check
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
X-List-Received-Date: Fri, 25 Jan 2013 00:07:02 -0000
Content-Type: text/plain

A path name in FILES_package which has no leading slash can
work for the packaging code, causing the file to get installed
correctly as part of a package; however, the check for installed
but unpackaged files checks against the "./" path, resulting
in a spurious diagnostic.  Solution: We're already prepending a
period to every absolute path.  If a path has gotten past that,
and doesn't start with "./", it's presumably a relative path,
and adding "./" to it will make it match.

The test case is to create a file in the root directory,
and include the file's name with no leading slash in a FILES_*.
Without this, the file should actually get packaged, but
generate an installed-but-unpackaged warning anyway.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8e07168..ee18488 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -980,6 +980,8 @@ python populate_packages () {
                 file.replace("//", "/")
             if os.path.isabs(file):
                 file = '.' + file
+            if not file.startswith("./")
+                file = './' + file
             if not os.path.islink(file):
                 if os.path.isdir(file):
                     newfiles =  [ os.path.join(file,x) for x in os.listdir(file) ]
-- 
1.7.0.4



