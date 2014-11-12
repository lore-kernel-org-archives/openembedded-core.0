Return-Path: <joaohf@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id D98ED62252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 23:09:08 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f51so9601258qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=r1ffkky7d9CBZO+BsekWcja8s4XYQA9/Dx/xa6U/y/M=;
	b=AARGewp92RrrHIPbGt3Uv1LgjBc8XvuuWIF6Ghe6H7mv/jISjF3N3HT/o9uHFETrM2
	QXuqBhKiNnn779j/LkL9OpCnXuH06aVubE2JOYSNSUmOrnszcJGTGe74ZyeoSyxCc24Q
	8hfx0LjeSSC4mnqwtIvmvh6bNG4QkROAqPQRW/ZH5b483fTjxWB6DElWT9wq0+bYw+Kp
	wjckV+yu+iMBMvutH+kFe7Yk48OJQPgw6rI8hT9+3u3aHrS8RGnp4m1NC/ilQCcDQBnU
	KaCvYPNkRROJnRU5XnF+1QeGudNNppgIkHebC3nDy4QS22NZ4VWKruaH+LsmXIluWYaB
	jLyA==
X-Received: by 10.140.23.112 with SMTP id 103mr58494811qgo.73.1415833749322;
	Wed, 12 Nov 2014 15:09:09 -0800 (PST)
Received: from localhost.localdomain ([201.53.206.66])
	by mx.google.com with ESMTPSA id
	v37sm22251506qge.29.2014.11.12.15.09.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 15:09:08 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 21:08:39 -0200
Message-Id: <1415833719-6255-3-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
References: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] report-error: send report error with username and email
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
X-List-Received-Date: Wed, 12 Nov 2014 23:09:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Two variables ERR_REPORT_USER and ERR_REPORT_EMAIL were created
to instruct send-report-error to use 'user' and 'email' from command
line parameters instead of checking '~/.oe-send-error' file.

Two new positional arguments were added to send-report-error.
If 'username' (third argument) is passed, then send-error-report will
not check userfile. As 'email' (forth argument) is an optional,
it will used only if passed.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 meta/classes/report-error.bbclass |  6 +++++-
 scripts/send-error-report         | 45 ++++++++++++++++++++++++---------------
 2 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index f9e821f..253a659 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -8,6 +8,8 @@
 
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
 ERR_REPORT_SERVER ?= ""
+ERR_REPORT_USER ?= ""
+ERR_REPORT_EMAIL ?= ""
 
 def errorreport_getdata(e):
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
@@ -29,7 +31,9 @@ def errorreport_senddata(e, datafile):
     import subprocess
     server = e.data.getVar('ERR_REPORT_SERVER', True)
     if server:
-        cmd = 'send-error-report %s %s' % (datafile, server)
+        user = e.data.getVar('ERR_REPORT_USER', True)
+        email = e.data.getVar('ERR_REPORT_EMAIL', True)
+        cmd = 'send-error-report %s %s %s %s' % (datafile, server, user, email)
         subprocess.call(cmd, shell=True)
     else:
         bb.note("The errors for this build are stored in %s\nYou can send the errors to an upstream server by running:\n  send-error-report %s [server]" % (datafile, datafile))
diff --git a/scripts/send-error-report b/scripts/send-error-report
index c99d387..b5c4972 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -42,27 +42,35 @@ def handle_connection(server, data):
     return conn
 
 
-def sendData(json_file, server):
+def sendData(json_file, server, username = '', email = ''):
 
     if os.path.isfile(json_file):
 
-        home = os.path.expanduser("~")
-        userfile = os.path.join(home, ".oe-send-error")
-        if os.path.isfile(userfile):
-            with open(userfile) as g:
-                username = g.readline()
-                email = g.readline()
+        if username:
+            if len(username) > 0 and len(username) > 50:
+                print("Invalid username input, try again.")
+                return
+            if len(email) > 0 and len(email) > 50:
+                print("Invalid username input, try again.")
+                return
         else:
-            print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
-            username = raw_input("Name: ")
-            email = raw_input("E-mail (not required): ")
-            if len(username) > 0 and len(username) < 50:
-                with open(userfile, "w") as g:
-                    g.write(username + "\n")
-                    g.write(email + "\n")
+            home = os.path.expanduser("~")
+            userfile = os.path.join(home, ".oe-send-error")
+            if os.path.isfile(userfile):
+                with open(userfile) as g:
+                    username = g.readline()
+                    email = g.readline()
             else:
-                print("Invalid inputs, try again.")
-                return
+                print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
+                username = raw_input("Name: ")
+                email = raw_input("E-mail (not required): ")
+                if len(username) > 0 and len(username) < 50:
+                    with open(userfile, "w") as g:
+                        g.write(username + "\n")
+                        g.write(email + "\n")
+                else:
+                    print("Invalid inputs, try again.")
+                    return
 
         with open(json_file) as f:
             data = f.read()
@@ -103,8 +111,11 @@ if __name__ == '__main__':
         print("\nUsage: send-error-report <error_fileName> [server]")
         print("\nIf this is the first when sending a report you'll be asked for your name and optionally your email address.")
         print("They will be associated with your report.\n")
-
     elif len(sys.argv) == 3:
         sendData(sys.argv[1], sys.argv[2])
+    elif len(sys.argv) == 4:
+        sendData(sys.argv[1], sys.argv[2], sys.argv[3])
+    elif len(sys.argv) == 5:
+        sendData(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])
     else:
         sendData(sys.argv[1], "errors.yoctoproject.org")
-- 
1.9.1


