Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R4SPj-00005p-V9
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 09:00:44 +0200
Received: by bke11 with SMTP id 11so4460771bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=dCirUkXU/DxznhaqtGsV8UPl7pNa0AEEAM6FT9GDuwM=;
	b=JmImTiL7mqTrbesz06jpI3lFSJjktvYfc+VS3DTFTr6sFazLUox+1KF/+4S8CZPo3Z
	hYUN+hwdjzZNfet05MLwZ3hCLUDYfGHLRU1ymlrdVkx2mOnnZlhjkyDK1nxN8aarElPZ
	Fci3L33Hl27SNWDbm1e3RJOZ7+OOXmAztwnWM=
Received: by 10.204.10.87 with SMTP id o23mr1330507bko.144.1316156128765;
	Thu, 15 Sep 2011 23:55:28 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id m18sm5371047bkt.12.2011.09.15.23.55.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:55:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:55:17 +0400
Message-Id: <1316156117-22147-3-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
References: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 3/3] bugzilla.bbclass: add a class to report build problems to bugzilla
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
X-List-Received-Date: Fri, 16 Sep 2011 07:00:44 -0000

Add a class to report build errors to bugzilla. Idea largely based on
sepukku.bbclass, however it's rewritten nearly fully to use XML-RPC
interface of bugzilla. Tested with bugzilla 4.0, other version might
require some sort of adaptation.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/bugzilla.bbclass |  186 +++++++++++++++++++++++++++++++++++++++++
 1 files changed, 186 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/bugzilla.bbclass

diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
new file mode 100644
index 0000000..801bd66
--- /dev/null
+++ b/meta/classes/bugzilla.bbclass
@@ -0,0 +1,186 @@
+#
+# Small event handler to automatically open URLs and file
+# bug reports at a bugzilla of your choiche
+# it uses XML-RPC interface, so you must have it enabled
+#
+# Before using you must define BUGZILLA_USER, BUGZILLA_PASS credentials,
+# BUGZILLA_XMLRPC - uri of xmlrpc.cgi,
+# BUGZILLA_PRODUCT, BUGZILLA_COMPONENT - a place in BTS for build bugs
+# BUGZILLA_VERSION - version against which to report new bugs
+#
+
+def bugzilla_find_bug_report(debug_file, server, args, bugname):
+    args['summary'] = bugname
+    bugs = server.Bug.search(args)
+    if len(bugs['bugs']) == 0:
+        print >> debug_file, "Bugs not found"
+        return (False,None)
+    else: # silently pick the first result
+        print >> debug_file, "Result of bug search is "
+        print >> debug_file, bugs
+        status = bugs['bugs'][0]['status']
+        id = bugs['bugs'][0]['id']
+        return (not status in ["CLOSED", "RESOLVED", "VERIFIED"],id)
+
+def bugzilla_file_bug(debug_file, server, args, name, text, version):
+    args['summary'] = name
+    args['comment'] = text
+    args['version'] = version
+    args['op_sys'] = 'Linux'
+    args['platform'] = 'Other'
+    args['severity'] = 'normal'
+    args['priority'] = 'Normal'
+    try:
+        return server.Bug.create(args)['id']
+    except Exception, e:
+        print >> debug_file, repr(e)
+        return None
+
+def bugzilla_reopen_bug(debug_file, server, args, bug_number):
+    args['ids'] = [bug_number]
+    args['status'] = "CONFIRMED"
+    try:
+        server.Bug.update(args)
+        return True
+    except Exception, e:
+        print >> debug_file, repr(e)
+        return False
+
+def bugzilla_create_attachment(debug_file, server, args, bug_number, text, file_name, log, logdescription):
+    args['ids'] = [bug_number]
+    args['file_name'] = file_name
+    args['summary'] = logdescription
+    args['content_type'] = "text/plain"
+    args['data'] = log
+    args['comment'] = text
+    try:
+        server.Bug.add_attachment(args)
+        return True
+    except Exception, e:
+        print >> debug_file, repr(e)
+        return False
+
+def bugzilla_add_comment(debug_file, server, args, bug_number, text):
+    args['id'] = bug_number
+    args['comment'] = text
+    try:
+        server.Bug.add_comment(args)
+        return True
+    except Exception, e:
+        print >> debug_file, repr(e)
+        return False
+
+addhandler bugzilla_eventhandler
+python bugzilla_eventhandler() {
+    import bb, os, glob
+    import xmlrpclib, httplib
+
+    class ProxiedTransport(xmlrpclib.Transport):
+        def __init__(self, proxy, use_datetime = 0):
+            xmlrpclib.Transport.__init__(self, use_datetime)
+            self.proxy = proxy
+            self.user = None
+            self.password = None
+
+        def set_user(self, user):
+            self.user = user
+
+        def set_password(self, password):
+            self.password = password
+
+        def make_connection(self, host):
+            self.realhost = host
+            return httplib.HTTP(self.proxy)
+
+        def send_request(self, connection, handler, request_body):
+            connection.putrequest("POST", 'http://%s%s' % (self.realhost, handler))
+            if self.user != None:
+                if self.password != None:
+                    auth = "%s:%s" % (self.user, self.password)
+                else:
+                    auth = self.user
+                connection.putheader("Proxy-authorization", "Basic " + base64.encodestring(auth))
+
+    event = e
+    data = e.data
+    name = bb.event.getName(event)
+    if name == "MsgNote":
+       # avoid recursion
+       return
+
+    if name == "TaskFailed":
+        xmlrpc  = bb.data.getVar("BUGZILLA_XMLRPC", data, True)
+        user    = bb.data.getVar("BUGZILLA_USER",  data, True)
+        passw   = bb.data.getVar("BUGZILLA_PASS",  data, True)
+        product = bb.data.getVar("BUGZILLA_PRODUCT", data, True)
+        compon  = bb.data.getVar("BUGZILLA_COMPONENT", data, True)
+        version = bb.data.getVar("BUGZILLA_VERSION", data, True)
+
+        proxy   = bb.data.getVar('http_proxy', data, True )
+        if (proxy):
+            import urllib2
+            s, u, p, hostport = urllib2._parse_proxy(proxy)
+            transport = ProxiedTransport(hostport)
+        else:
+            transport = None
+
+        server = xmlrpclib.ServerProxy(xmlrpc, transport=transport, verbose=0)
+        args = {
+            'Bugzilla_login': user,
+            'Bugzilla_password': passw,
+            'product': product,
+            'component': compon}
+
+        # evil hack to figure out what is going on
+        debug_file = open(os.path.join(bb.data.getVar("TMPDIR", data, True),"..","bugzilla-log"),"a")
+
+        file = None
+        bugname = "%(package)s-%(pv)s-autobuild" % { "package" : bb.data.getVar("PN", data, True),
+                                                           "pv"      : bb.data.getVar("PV", data, True),
+                                                           }
+        log_file = glob.glob("%s/log.%s.*" % (bb.data.getVar('T', event.data, True), event.task))
+        text     = "The %s step in %s failed at %s for machine %s" % (e.task, bb.data.getVar("PN", data, True), bb.data.getVar('DATETIME', data, True), bb.data.getVar( 'MACHINE', data, True ) )
+        if len(log_file) != 0:
+            print >> debug_file, "Adding log file %s" % log_file[0]
+            file = open(log_file[0], 'r')
+            log = file.read()
+            file.close();
+        else:
+            print >> debug_file, "No log file found for the glob"
+            log = None
+
+        (bug_open, bug_number) = bugzilla_find_bug_report(debug_file, server, args.copy(), bugname)
+        print >> debug_file, "Bug is open: %s and bug number: %s" % (bug_open, bug_number)
+
+        # The bug is present and still open, attach an error log
+        if not bug_number:
+            bug_number = bugzilla_file_bug(debug_file, server, args.copy(), bugname, text, version)
+            if not bug_number:
+                print >> debug_file, "Couldn't acquire a new bug_numer, filing a bugreport failed"
+            else:
+                print >> debug_file, "The new bug_number: '%s'" % bug_number
+        elif not bug_open:
+            if not bugzilla_reopen_bug(debug_file, server, args.copy(), bug_number):
+                print >> debug_file, "Failed to reopen the bug #%s" % bug_number
+            else:
+                print >> debug_file, "Reopened the bug #%s" % bug_number
+
+        if bug_number and log:
+            print >> debug_file, "The bug is known as '%s'" % bug_number
+            desc = "Build log for machine %s" % (bb.data.getVar('MACHINE', data, True))
+            if not bugzilla_create_attachment(debug_file, server, args.copy(), bug_number, text, log_file[0], log, desc):
+                 print >> debug_file, "Failed to attach the build log for bug #%s" % bug_number
+            else:
+                 print >> debug_file, "Created an attachment for '%s' '%s' '%s'" % (product, compon, bug_number)
+        else:
+            print >> debug_file, "Not trying to create an attachment for bug #%s" % bug_number
+            if not bugzilla_add_comment(debug_file, server, args.copy(), bug_number, text, ):
+                 print >> debug_file, "Failed to create a comment the build log for bug #%s" % bug_number
+            else:
+                 print >> debug_file, "Created an attachment for '%s' '%s' '%s'" % (product, compon, bug_number)
+
+        # store bug number for oestats-client
+        if bug_number:
+            bb.data.setVar('OESTATS_BUG_NUMBER', bug_number, data)
+}
+
-- 
1.7.2.5



