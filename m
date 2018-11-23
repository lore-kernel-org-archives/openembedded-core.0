Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1AE6C697
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:06:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wANA5tCj027949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Nov 2018 02:06:21 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:06:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 18:23:00 +0800
Message-ID: <5f432c00006fc98fa8e522d4b337bf2809306855.1542968556.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542968556.git.liezhi.yang@windriver.com>
References: <cover.1542968556.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bugzilla.bbclass: Remove it since obsoleted
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
X-List-Received-Date: Fri, 23 Nov 2018 10:06:41 -0000
Content-Type: text/plain

It is a still python2 bbclass, so it has been broken since bitbake changed to
python3 which was 2 years ago. No one reported/fixed it for python3 in recent 2
years. So we can assume that no one uses it anymore.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/bugzilla.bbclass | 187 ------------------------------------------
 1 file changed, 187 deletions(-)
 delete mode 100644 meta/classes/bugzilla.bbclass

diff --git a/meta/classes/bugzilla.bbclass b/meta/classes/bugzilla.bbclass
deleted file mode 100644
index 8909c27..0000000
--- a/meta/classes/bugzilla.bbclass
+++ /dev/null
@@ -1,187 +0,0 @@
-#
-# Small event handler to automatically open URLs and file
-# bug reports at a bugzilla of your choiche
-# it uses XML-RPC interface, so you must have it enabled
-#
-# Before using you must define BUGZILLA_USER, BUGZILLA_PASS credentials,
-# BUGZILLA_XMLRPC - uri of xmlrpc.cgi,
-# BUGZILLA_PRODUCT, BUGZILLA_COMPONENT - a place in BTS for build bugs
-# BUGZILLA_VERSION - version against which to report new bugs
-#
-
-def bugzilla_find_bug_report(debug_file, server, args, bugname):
-    args['summary'] = bugname
-    bugs = server.Bug.search(args)
-    if len(bugs['bugs']) == 0:
-        print >> debug_file, "Bugs not found"
-        return (False,None)
-    else: # silently pick the first result
-        print >> debug_file, "Result of bug search is "
-        print >> debug_file, bugs
-        status = bugs['bugs'][0]['status']
-        id = bugs['bugs'][0]['id']
-        return (not status in ["CLOSED", "RESOLVED", "VERIFIED"],id)
-
-def bugzilla_file_bug(debug_file, server, args, name, text, version):
-    args['summary'] = name
-    args['comment'] = text
-    args['version'] = version
-    args['op_sys'] = 'Linux'
-    args['platform'] = 'Other'
-    args['severity'] = 'normal'
-    args['priority'] = 'Normal'
-    try:
-        return server.Bug.create(args)['id']
-    except Exception, e:
-        print >> debug_file, repr(e)
-        return None
-
-def bugzilla_reopen_bug(debug_file, server, args, bug_number):
-    args['ids'] = [bug_number]
-    args['status'] = "CONFIRMED"
-    try:
-        server.Bug.update(args)
-        return True
-    except Exception, e:
-        print >> debug_file, repr(e)
-        return False
-
-def bugzilla_create_attachment(debug_file, server, args, bug_number, text, file_name, log, logdescription):
-    args['ids'] = [bug_number]
-    args['file_name'] = file_name
-    args['summary'] = logdescription
-    args['content_type'] = "text/plain"
-    args['data'] = log
-    args['comment'] = text
-    try:
-        server.Bug.add_attachment(args)
-        return True
-    except Exception, e:
-        print >> debug_file, repr(e)
-        return False
-
-def bugzilla_add_comment(debug_file, server, args, bug_number, text):
-    args['id'] = bug_number
-    args['comment'] = text
-    try:
-        server.Bug.add_comment(args)
-        return True
-    except Exception, e:
-        print >> debug_file, repr(e)
-        return False
-
-addhandler bugzilla_eventhandler
-bugzilla_eventhandler[eventmask] = "bb.event.MsgNote bb.build.TaskFailed"
-python bugzilla_eventhandler() {
-    import glob
-    import xmlrpclib, httplib
-
-    class ProxiedTransport(xmlrpclib.Transport):
-        def __init__(self, proxy, use_datetime = 0):
-            xmlrpclib.Transport.__init__(self, use_datetime)
-            self.proxy = proxy
-            self.user = None
-            self.password = None
-
-        def set_user(self, user):
-            self.user = user
-
-        def set_password(self, password):
-            self.password = password
-
-        def make_connection(self, host):
-            self.realhost = host
-            return httplib.HTTP(self.proxy)
-
-        def send_request(self, connection, handler, request_body):
-            connection.putrequest("POST", 'http://%s%s' % (self.realhost, handler))
-            if self.user != None:
-                if self.password != None:
-                    auth = "%s:%s" % (self.user, self.password)
-                else:
-                    auth = self.user
-                connection.putheader("Proxy-authorization", "Basic " + base64.encodestring(auth))
-
-    event = e
-    data = e.data
-    name = bb.event.getName(event)
-    if name == "MsgNote":
-        # avoid recursion
-        return
-
-    if name == "TaskFailed":
-        xmlrpc  = data.getVar("BUGZILLA_XMLRPC")
-        user    = data.getVar("BUGZILLA_USER")
-        passw   = data.getVar("BUGZILLA_PASS")
-        product = data.getVar("BUGZILLA_PRODUCT")
-        compon  = data.getVar("BUGZILLA_COMPONENT")
-        version = data.getVar("BUGZILLA_VERSION")
-
-        proxy   = data.getVar('http_proxy')
-        if (proxy):
-            import urllib2
-            s, u, p, hostport = urllib2._parse_proxy(proxy)
-            transport = ProxiedTransport(hostport)
-        else:
-            transport = None
-
-        server = xmlrpclib.ServerProxy(xmlrpc, transport=transport, verbose=0)
-        args = {
-            'Bugzilla_login': user,
-            'Bugzilla_password': passw,
-            'product': product,
-            'component': compon}
-
-        # evil hack to figure out what is going on
-        debug_file = open(os.path.join(data.getVar("TMPDIR"),"..","bugzilla-log"),"a")
-
-        file = None
-        bugname = "%(package)s-%(pv)s-autobuild" % { "package" : data.getVar("PN"),
-                                                           "pv"      : data.getVar("PV"),
-                                                           }
-        log_file = glob.glob("%s/log.%s.*" % (event.data.getVar('T'), event.task))
-        text     = "The %s step in %s failed at %s for machine %s" % (e.task, data.getVar("PN"), data.getVar('DATETIME'), data.getVar('MACHINE') )
-        if len(log_file) != 0:
-            print >> debug_file, "Adding log file %s" % log_file[0]
-            file = open(log_file[0], 'r')
-            log = file.read()
-            file.close();
-        else:
-            print >> debug_file, "No log file found for the glob"
-            log = None
-
-        (bug_open, bug_number) = bugzilla_find_bug_report(debug_file, server, args.copy(), bugname)
-        print >> debug_file, "Bug is open: %s and bug number: %s" % (bug_open, bug_number)
-
-        # The bug is present and still open, attach an error log
-        if not bug_number:
-            bug_number = bugzilla_file_bug(debug_file, server, args.copy(), bugname, text, version)
-            if not bug_number:
-                print >> debug_file, "Couldn't acquire a new bug_numer, filing a bugreport failed"
-            else:
-                print >> debug_file, "The new bug_number: '%s'" % bug_number
-        elif not bug_open:
-            if not bugzilla_reopen_bug(debug_file, server, args.copy(), bug_number):
-                print >> debug_file, "Failed to reopen the bug #%s" % bug_number
-            else:
-                print >> debug_file, "Reopened the bug #%s" % bug_number
-
-        if bug_number and log:
-            print >> debug_file, "The bug is known as '%s'" % bug_number
-            desc = "Build log for machine %s" % (data.getVar('MACHINE'))
-            if not bugzilla_create_attachment(debug_file, server, args.copy(), bug_number, text, log_file[0], log, desc):
-                 print >> debug_file, "Failed to attach the build log for bug #%s" % bug_number
-            else:
-                 print >> debug_file, "Created an attachment for '%s' '%s' '%s'" % (product, compon, bug_number)
-        else:
-            print >> debug_file, "Not trying to create an attachment for bug #%s" % bug_number
-            if not bugzilla_add_comment(debug_file, server, args.copy(), bug_number, text, ):
-                 print >> debug_file, "Failed to create a comment the build log for bug #%s" % bug_number
-            else:
-                 print >> debug_file, "Created an attachment for '%s' '%s' '%s'" % (product, compon, bug_number)
-
-        # store bug number for oestats-client
-        if bug_number:
-            data.setVar('OESTATS_BUG_NUMBER', bug_number)
-}
-
-- 
2.7.4


