Return-Path: <FredericOuellet@eaton.com>
Received: from simtcimsva03.etn.com (mail.eaton.com [192.104.67.6])
	by mail.openembedded.org (Postfix) with ESMTP id 9C1CF7D416
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 19:59:29 +0000 (UTC)
Received: from simtcimsva03.etn.com (simtcimsva03.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ADC8A40E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:59:30 -0400 (EDT)
Received: from simtcimsva03.etn.com (simtcimsva03.etn.com [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DF1BA40D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:59:30 -0400 (EDT)
Received: from LOUTCSGWY02.napa.ad.etn.com (loutcsgwy02.napa.ad.etn.com
	[151.110.126.85]) by simtcimsva03.etn.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 15:59:30 -0400 (EDT)
Received: from CASROWHP6063516-VML1.eaton.ad.etn.com (10.106.181.101) by
	LOUTCSGWY02.napa.ad.etn.com (151.110.126.205) with Microsoft SMTP
	Server id 14.3.408.0; Thu, 25 Jul 2019 15:58:53 -0400
From: Frederic Ouellet <fredericouellet@eaton.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jul 2019 15:58:50 -0400
Message-ID: <1564084730-6835-1-git-send-email-fredericouellet@eaton.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: 96b59d02-bc1a-4a40-8c96-611cac62bce9
X-TM-SNTS-SMTP: 91DD6C725BD76837B19719449E3BD5AEE4B95020933BE27F9785745CCA93C6032002:8
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1817-8.5.0.1020-24798.001
X-TM-AS-Result: No--4.957-10.0-31-10
X-imss-scan-details: No--4.957-10.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1817-8.5.1020-24798.001
X-TMASE-Result: 10--4.957000-10.000000
X-TMASE-MatchedRID: ISENigBxYLutIop/D9Co1We0F1HB9i2hQ3aTH+07oV13pEVETu8p8TlD
	cJcynv4cRI7hcYaWyYsZ3apdb7QrAgMj3UjQ3RjvA9lly13c/gEg/CIfleX9DxCOwdkP3NVeRX3
	4c0TChl934YnoKLi80Q9neHJxPRoyQ9x1CLc+xtqeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8ifEz
	J5hPndGc1w9OPNYmHheB2AA7n457z7b0R9m6+HmVEVsPzbIDUmOqgSu2zdlGMApQw51ZI1q2mIs
	z+EQVIPRI6kmmyVnZwDaD1orEGAlEHvcRnPtcEI6nVdQb+HYw6J5Z1XsV8oBBfLf3gRQ/M9Vlxr
	1FJij9s=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
Subject: [PATCH v2] systemd: Add partial support of drop-in configuration files to systemd-systemctl-native
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
X-List-Received-Date: Thu, 25 Jul 2019 19:59:29 -0000
Content-Type: text/plain

Support for serive-name.service.d/ folders containing .conf files
It don't support all the partial folder names

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


