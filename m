Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Tfw57-0008KE-TD
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 18:15:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB4H0UQT026352
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Dec 2012 09:00:30 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 4 Dec 2012 09:00:30 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2012 11:14:51 -0600
Message-ID: <0902d41db63ca4eed506d919a41752e1a28072cf.1354641032.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354641032.git.mark.hatle@windriver.com>
References: <cover.1354641032.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 19/22] package_deb: Dependencies with a ( or ) in them are invalid in debs
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
X-List-Received-Date: Tue, 04 Dec 2012 17:15:12 -0000
Content-Type: text/plain

Replace ( or ) with __.  This allows RPM style dependencies to be satisfied
in deb style packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_deb.bbclass |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index d273cb0..eed9b8a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -335,12 +335,22 @@ python do_package_deb () {
         mapping_rename_hook(localdata)
 
         def debian_cmp_remap(var):
+            # dpkg does not allow for '(' or ')' in a dependency name
+            # replace these instances with '__' and '__'
+            #
             # In debian '>' and '<' do not mean what it appears they mean
             #   '<' = less or equal
             #   '>' = greater or equal
             # adjust these to the '<<' and '>>' equivalents
             #
             for dep in var:
+                if '(' in dep:
+                    newdep = dep.replace('(', '__')
+                    newdep = newdep.replace(')', '__')
+                    if newdep != dep:
+                        var[newdep] = var[dep]
+                        del var[dep]
+            for dep in var:
                 for i, v in enumerate(var[dep]):
                     if (v or "").startswith("< "):
                         var[dep][i] = var[dep][i].replace("< ", "<< ")
-- 
1.7.3.4



