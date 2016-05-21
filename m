Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90CA3606D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 11:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBTLfU004268 for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:29:21 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JWxrmvAK_MyX
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:29:21 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4LBTGE2004265
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 May 2016 12:29:17 +0100
Message-ID: <1463830156.4578.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 May 2016 12:29:16 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] meta: Update to modern exception syntax
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
X-List-Received-Date: Sat, 21 May 2016 11:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update older exception syntax to modern one required by python 3.
Compatible with python 2.7.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c3c2669..4be0a7e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -661,7 +661,7 @@ python do_cleanall() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.clean()
-    except bb.fetch2.BBFetchException, e:
+    except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }
 do_cleanall[nostamp] = "1"
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
index 5bcfd0b..7bc584a 100644
--- a/meta/classes/utility-tasks.bbclass
+++ b/meta/classes/utility-tasks.bbclass
@@ -46,7 +46,7 @@ python do_checkuri() {
     try:
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.checkstatus()
-    except bb.fetch2.BBFetchException, e:
+    except bb.fetch2.BBFetchException as e:
         raise bb.build.FuncFailed(e)
 }
 
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
index e495721..23a9067 100644
--- a/meta/lib/oe/data.py
+++ b/meta/lib/oe/data.py
@@ -13,5 +13,5 @@ def typed_value(key, d):
 
     try:
         return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
-    except (TypeError, ValueError), exc:
+    except (TypeError, ValueError) as exc:
         bb.msg.fatal("Data", "%s: %s" % (key, str(exc)))
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index b0cbcb1..9e5a0c9 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -9,7 +9,7 @@ def prserv_make_conn(d, check = False):
             if not conn.ping():
                 raise Exception('service not available')
         d.setVar("__PRSERV_CONN",conn)
-    except Exception, exc:
+    except Exception as exc:
         bb.fatal("Connecting to PR service %s:%s failed: %s" % (host_params[0], host_params[1], str(exc)))
 
     return conn
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index d1dfbfb..32d6179 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -264,7 +264,7 @@ class ThreadedWorker(Thread):
 
             try:
                 func(self, *args, **kargs)
-            except Exception, e:
+            except Exception as e:
                 print(e)
             finally:
                 self.tasks.task_done()
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 4bede34..695402f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -114,7 +114,7 @@ class QemuRunner:
         try:
             threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
-        except socket.error, msg:
+        except socket.error as msg:
             logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
@@ -192,7 +192,7 @@ class QemuRunner:
                     else:
                         self.ip = ips[0]
                         self.server_ip = ips[1]
-                except IndexError, ValueError:
+                except (IndexError, ValueError):
                     logger.info("Couldn't get ip from qemu process arguments! Here is the qemu command line used:\n%s\nand output from runqemu:\n%s" % (cmdline, self.getOutput(output)))
                     self._dump_host()
                     self.stop()
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index e3d8c66..d6ce096 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -50,7 +50,7 @@ class QemuTinyRunner(QemuRunner):
                 self.server_socket.connect(self.socketfile)
                 bb.note("Created listening socket for qemu serial console.")
                 tries = 0
-            except socket.error, msg:
+            except socket.error as msg:
                 self.server_socket.close()
                 bb.fatal("Failed to create listening socket.")
                 tries -= 1



