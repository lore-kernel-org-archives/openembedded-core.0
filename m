Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 56B286E8E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 11:53:38 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 28 Feb 2014 12:53:39 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 407A32880FA;
	Fri, 28 Feb 2014 12:53:39 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Feb 2014 12:53:33 +0100
Message-ID: <1393588413-55392-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] python: Backport CVE-2013-1752 fix from upstream
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
X-List-Received-Date: Fri, 28 Feb 2014 11:53:43 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@enea.com>

This back ported patch fixes CVE-2013-1752 for smtplib

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Reviewed-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../python-2.7.3-CVE-2013-1752-smtplib-fix.patch   |  101 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |    1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
new file mode 100644
index 0000000..f34ff40
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
@@ -0,0 +1,101 @@
+Upstream-Status: Backport
+
+Reference: http://bugs.python.org/issue16042
+
+CVE-2013-1752: smtplib: Limit amount of data read by limiting the 
+call to readline().  Original patch by Christian Heimes
+
+Signed-off-by: Maxin B. John <maxin.john@enea.com>
+---
+diff -Naur Python-2.7.3-orig/Lib/smtplib.py Python-2.7.3/Lib/smtplib.py
+--- Python-2.7.3-orig/Lib/smtplib.py	2012-04-10 01:07:31.000000000 +0200
++++ Python-2.7.3/Lib/smtplib.py	2014-02-27 14:15:24.444198465 +0100
+@@ -57,6 +57,7 @@
+ SMTP_PORT = 25
+ SMTP_SSL_PORT = 465
+ CRLF = "\r\n"
++_MAXLINE = 8192 # more than 8 times larger than RFC 821, 4.5.3
+ 
+ OLDSTYLE_AUTH = re.compile(r"auth=(.*)", re.I)
+ 
+@@ -179,10 +180,14 @@
+         def __init__(self, sslobj):
+             self.sslobj = sslobj
+ 
+-        def readline(self):
++        def readline(self, size=-1):
++            if size < 0:
++                size = None
+             str = ""
+             chr = None
+             while chr != "\n":
++                if size is not None and len(str) >= size:
++                    break
+                 chr = self.sslobj.read(1)
+                 if not chr:
+                     break
+@@ -351,7 +356,7 @@
+             self.file = self.sock.makefile('rb')
+         while 1:
+             try:
+-                line = self.file.readline()
++                line = self.file.readline(_MAXLINE + 1)
+             except socket.error as e:
+                 self.close()
+                 raise SMTPServerDisconnected("Connection unexpectedly closed: "
+@@ -361,6 +366,8 @@
+                 raise SMTPServerDisconnected("Connection unexpectedly closed")
+             if self.debuglevel > 0:
+                 print>>stderr, 'reply:', repr(line)
++            if len(line) > _MAXLINE:
++                raise SMTPResponseException(500, "Line too long.")
+             resp.append(line[4:].strip())
+             code = line[:3]
+             # Check that the error code is syntactically correct.
+diff -Naur Python-2.7.3-orig/Lib/test/test_smtplib.py Python-2.7.3/Lib/test/test_smtplib.py
+--- Python-2.7.3-orig/Lib/test/test_smtplib.py	2012-04-10 01:07:32.000000000 +0200
++++ Python-2.7.3/Lib/test/test_smtplib.py	2014-02-27 14:15:24.448198293 +0100
+@@ -292,6 +292,33 @@
+                             HOST, self.port, 'localhost', 3)
+ 
+ 
++@unittest.skipUnless(threading, 'Threading required for this test.')
++class TooLongLineTests(unittest.TestCase):
++    respdata = '250 OK' + ('.' * smtplib._MAXLINE * 2) + '\n'
++
++    def setUp(self):
++        self.old_stdout = sys.stdout
++        self.output = StringIO.StringIO()
++        sys.stdout = self.output
++
++        self.evt = threading.Event()
++        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++        self.sock.settimeout(15)
++        self.port = test_support.bind_port(self.sock)
++        servargs = (self.evt, self.respdata, self.sock)
++        threading.Thread(target=server, args=servargs).start()
++        self.evt.wait()
++        self.evt.clear()
++
++    def tearDown(self):
++        self.evt.wait()
++        sys.stdout = self.old_stdout
++
++    def testLineTooLong(self):
++        self.assertRaises(smtplib.SMTPResponseException, smtplib.SMTP,
++                          HOST, self.port, 'localhost', 3)
++
++
+ sim_users = {'Mr.A@somewhere.com':'John A',
+              'Ms.B@somewhere.com':'Sally B',
+              'Mrs.C@somewhereesle.com':'Ruth C',
+@@ -511,7 +538,8 @@
+ def test_main(verbose=None):
+     test_support.run_unittest(GeneralTests, DebuggingServerTests,
+                               NonConnectingTests,
+-                              BadHELOServerTests, SMTPSimTests)
++                              BadHELOServerTests, SMTPSimTests,
++                              TooLongLineTests)
+ 
+ if __name__ == '__main__':
+     test_main()
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index ae4a1a6..aaa72e5 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -33,6 +33,7 @@ SRC_URI += "\
   file://CVE-2013-4073_py27.patch \
   file://pypirc-secure.patch \
   file://parallel-makeinst-create-bindir.patch \
+  file://python-2.7.3-CVE-2013-1752-smtplib-fix.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.10.4


