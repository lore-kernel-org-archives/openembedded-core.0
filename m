Return-Path: <FredericOuellet@eaton.com>
Received: from simtcimsva02.etn.com (mail2.eaton.com [192.104.67.3])
	by mail.openembedded.org (Postfix) with ESMTP id 1CFB06BC7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 21:52:53 +0000 (UTC)
Received: from simtcimsva02.etn.com (simtcimsva02.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB4CE11A0E5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 17:52:54 -0400 (EDT)
Received: from simtcimsva02.etn.com (simtcimsva02.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF28A11A06E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 17:52:54 -0400 (EDT)
Received: from LOUTCSGWY04.napa.ad.etn.com (loutcsgwy04.napa.ad.etn.com
	[151.110.126.21]) by simtcimsva02.etn.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 17:52:54 -0400 (EDT)
Received: from CASROWHP6063516-VML1.eaton.ad.etn.com (10.106.181.101) by
	LOUTCSGWY04.napa.ad.etn.com (151.110.126.205) with Microsoft SMTP
	Server id 14.3.408.0; Fri, 26 Jul 2019 17:52:31 -0400
From: Frederic Ouellet <fredericouellet@eaton.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2019 17:52:24 -0400
Message-ID: <1564177944-10600-1-git-send-email-fredericouellet@eaton.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-TM-SNTS-SMTP: AD208AB32DBEA4F05408FB792CB4CBEF7BF3DFE0F05CC56691EF929278873EAD2002:8
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1817-8.5.0.1020-24804.000
X-TM-AS-Result: No--5.593-10.0-31-10
X-imss-scan-details: No--5.593-10.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1817-8.5.1020-24804.000
X-TMASE-Result: 10--5.592500-10.000000
X-TMASE-MatchedRID: uc5cNCUKFYqtIop/D9Co1aMY62qeQBkL+LljbN4c70MQ6IKhv9EC6Feh
	ickTy3ziVL7YbuOsNC8hCBJ5VoC96ZWbeF6SCfG1PwKTD1v8YV5MkOX0UoduuazG9MIKeG/GC7w
	CgDJ8bdGf7qMlTsJfYov9sGOtq3aSaTkWqXcVpruQgeuUY0WN7H0tCKdnhB589yM15V5aWpj6C0
	ePs7A07U9hWalM11QaY94wEzcvXiwMmk1KSMJPVrs3QbBEhFeaZTeRyDWnzHFWXGvUUmKP2w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
Subject: [PATCH v3] systemd: Add partial support of drop-in configuration files to systemd-systemctl-native
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
X-List-Received-Date: Fri, 26 Jul 2019 21:52:54 -0000
Content-Type: text/plain

Support for <service name>.d/ folders containing .conf files
It doesn't support all the partial folder names

See https://www.freedesktop.org/software/systemd/man/systemd.unit.html

Signed-off-by: Frederic Ouellet <fredericouellet@eaton.com>
---
 meta/recipes-core/systemd/systemd-systemctl/systemctl | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/meta/recipes-core/systemd/systemd-systemctl/systemctl
index 8d7b3ba..8837f54 100755
--- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
+++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
@@ -28,6 +28,10 @@ class SystemdFile():
     def __init__(self, root, path):
         self.sections = dict()
         self._parse(root, path)
+        dirname = os.path.basename(path.name) + ".d"
+        for location in locations:
+            for path2 in sorted((root / location / "system" / dirname).glob("*.conf")):                
+                self._parse(root, path2)
 
     def _parse(self, root, path):
         """Parse a systemd syntax configuration file
@@ -56,8 +60,11 @@ class SystemdFile():
                 line = line.rstrip("\n")
                 m = section_re.match(line)
                 if m:
-                    section = dict()
-                    self.sections[m.group('section')] = section
+                    if m.group('section') not in self.sections:
+                        section = dict()
+                        self.sections[m.group('section')] = section
+                    else:
+                        section = self.sections[m.group('section')]
                     continue
 
                 while line.endswith("\\"):
-- 
2.7.4


