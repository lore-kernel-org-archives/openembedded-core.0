Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PtczI-0007Ip-7o
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Feb 2011 10:32:24 +0100
Received: by wwe15 with SMTP id 15so3169325wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Feb 2011 01:31:00 -0800 (PST)
Received: by 10.216.179.207 with SMTP id h57mr3797919wem.20.1298799026105;
	Sun, 27 Feb 2011 01:30:26 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id s50sm1284834weh.22.2011.02.27.01.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Feb 2011 01:30:25 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Feb 2011 10:30:00 +0100
Message-Id: <438b29bb8458d657556e6e685b5908c18e884106.1298798633.git.koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <cover.1298798633.git.koen@dominion.thruhere.net>
References: <cover.1298798633.git.koen@dominion.thruhere.net>
Subject: [PATCH 46/50] Fixing my bad license parsing: license.bbclass
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
X-List-Received-Date: Sun, 27 Feb 2011 09:32:24 -0000

From: Beth Flanagan <elizabeth.flanagan@intel.com>

Fix to my bad license parsing. Also added the MIT generic license
files.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass         |    7 ++++---
 meta/files/common-licenses/MIT       |    6 ++++++
 meta/files/common-licenses/MIT-style |    1 +
 3 files changed, 11 insertions(+), 3 deletions(-)
 create mode 100644 meta/files/common-licenses/MIT
 create mode 120000 meta/files/common-licenses/MIT-style

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4e3cd1c..9c4ccb3 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -66,9 +66,10 @@ python do_populate_lic() {
     # I'm sure someone has written a logic parser for these fields, but if so, I don't know where it is. 
     # So what I do is just link to every license mentioned in the license field.
     
-    for license_type in (' '.join(license_types.replace('&', ' ').replace('+', ' ').replace('|', ' ')
-                         .replace('(', ' ').replace(')', ' ').replace(';', ' ').replace(',', ' ').split())):
-        if os.path.isfile(os.path.join(generic_directory, license_type)):
+    for license_type in ((license_types.replace('+', '').replace('|', '&')
+                          .replace('(', '').replace(')', '').replace(';', '')
+                          .replace(',', '').replace(" ", "").split("&"))):
+if os.path.isfile(os.path.join(generic_directory, license_type)):
             gen_lic_dest = os.path.join(bb.data.getVar('LICENSE_DIRECTORY', d, True), "common-licenses")
             try:
                 bb.mkdirhier(gen_lic_dest)
diff --git a/meta/files/common-licenses/MIT b/meta/files/common-licenses/MIT
new file mode 100644
index 0000000..d136d5e
--- /dev/null
+++ b/meta/files/common-licenses/MIT
@@ -0,0 +1,6 @@
+The MIT License
+
+Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
+THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
diff --git a/meta/files/common-licenses/MIT-style b/meta/files/common-licenses/MIT-style
new file mode 120000
index 0000000..8ab70c0
--- /dev/null
+++ b/meta/files/common-licenses/MIT-style
@@ -0,0 +1 @@
+MIT
\ No newline at end of file
-- 
1.6.6.1



