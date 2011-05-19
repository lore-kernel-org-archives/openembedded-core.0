Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QN0Rr-0005yx-8G
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 12:27:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 May 2011 03:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,236,1304319600"; 
   d="scan'208";a="4534983"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2011 03:24:21 -0700
Message-Id: <9bcdcee25414bf71adf7d109a0f9ef0c83905b99.1305800693.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Old-Date: Thu, 12 May 2011 14:33:44 +0800
Date: Thu, 19 May 2011 18:29:23 +0800
To: openembedded-core@lists.openembedded.org
From: Lianhao Lu <lianhao.lu@intel.com>
Subject: [PATCH 1/5] Added the PR service.
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
X-List-Received-Date: Thu, 19 May 2011 10:27:20 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

Added the initial implementation of the server side PR service.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 bitbake/bin/bitbake-prserv     |   53 +++++++++++
 bitbake/lib/prserv/__init__.py |   11 ++
 bitbake/lib/prserv/db.py       |  100 ++++++++++++++++++++
 bitbake/lib/prserv/serv.py     |  198 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 362 insertions(+), 0 deletions(-)
 create mode 100755 bitbake/bin/bitbake-prserv
 create mode 100644 bitbake/lib/prserv/__init__.py
 create mode 100644 bitbake/lib/prserv/db.py
 create mode 100644 bitbake/lib/prserv/serv.py

diff --git a/bitbake/bin/bitbake-prserv b/bitbake/bin/bitbake-prserv
new file mode 100755
index 0000000..14073ca
--- /dev/null
+++ b/bitbake/bin/bitbake-prserv
@@ -0,0 +1,53 @@
+#!/usr/bin/env python
+import os
+import sys,logging
+import optparse
+
+sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(__file__)),'lib'))
+
+import prserv
+import prserv.serv
+
+__version__="1.0.0"
+
+PRHOST_DEFAULT=''
+PRPORT_DEFAULT=8585
+
+def main():
+    parser = optparse.OptionParser(
+        version="Bitbake PR Service Core version %s, %%prog version %s" % (prserv.__version__, __version__),
+        usage = "%prog [options]")
+
+    parser.add_option("-f", "--file", help="database filename(default prserv.db)", action="store",
+                      dest="dbfile", type="string", default="prserv.db")
+    parser.add_option("-l", "--log", help="log filename(default prserv.log)", action="store",
+                      dest="logfile", type="string", default="prserv.log")
+    parser.add_option("--loglevel", help="logging level, i.e. CRITICAL, ERROR, WARNING, INFO, DEBUG",
+                      action = "store", type="string", dest="loglevel", default = "WARNING")
+    parser.add_option("--start", help="start daemon",
+                      action="store_true", dest="start", default="True")
+    parser.add_option("--stop", help="stop daemon",
+                      action="store_false", dest="start")
+    parser.add_option("--host", help="ip address to bind", action="store",
+                      dest="host", type="string", default=PRHOST_DEFAULT)
+    parser.add_option("--port", help="port number(default 8585)", action="store",
+                      dest="port", type="int", default=PRPORT_DEFAULT)
+
+    options, args = parser.parse_args(sys.argv)
+
+    prserv.init_logger(os.path.abspath(options.logfile),options.loglevel)
+
+    if options.start:
+        prserv.serv.start_daemon(options)
+    else:
+        prserv.serv.stop_daemon()
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
+
diff --git a/bitbake/lib/prserv/__init__.py b/bitbake/lib/prserv/__init__.py
new file mode 100644
index 0000000..2837e13
--- /dev/null
+++ b/bitbake/lib/prserv/__init__.py
@@ -0,0 +1,11 @@
+__version__ = "1.0.0"
+
+import os, time
+import sys,logging
+
+def init_logger(logfile, loglevel):
+    numeric_level = getattr(logging, loglevel.upper(), None)
+    if not isinstance(numeric_level, int):
+        raise ValueError('Invalid log level: %s' % loglevel)
+    logging.basicConfig(level=numeric_level, filename=logfile)
+
diff --git a/bitbake/lib/prserv/db.py b/bitbake/lib/prserv/db.py
new file mode 100644
index 0000000..bbee931
--- /dev/null
+++ b/bitbake/lib/prserv/db.py
@@ -0,0 +1,100 @@
+import logging
+import os.path
+import errno
+import sys
+import warnings
+import sqlite3
+
+try:
+    import sqlite3
+except ImportError:
+    from pysqlite2 import dbapi2 as sqlite3
+
+sqlversion = sqlite3.sqlite_version_info
+if sqlversion[0] < 3 or (sqlversion[0] == 3 and sqlversion[1] < 3):
+    raise Exception("sqlite3 version 3.3.0 or later is required.")
+
+class NotFoundError(StandardError):
+    pass
+
+class PRTable():
+    def __init__(self,cursor,table):
+        self.cursor = cursor
+        self.table = table
+
+        #create the table
+        self._execute("CREATE TABLE IF NOT EXISTS %s \
+                    (version TEXT NOT NULL, \
+                    checksum TEXT NOT NULL, \
+                    value INTEGER, \
+                    PRIMARY KEY (version,checksum));"
+                      % table)
+
+    def _execute(self, *query):
+        """Execute a query, waiting to acquire a lock if necessary"""
+        count = 0
+        while True:
+            try:
+                return self.cursor.execute(*query)
+            except sqlite3.OperationalError as exc:
+                if 'database is locked' in str(exc) and count < 500:
+                    count = count + 1
+                    continue
+                raise
+            except sqlite3.IntegrityError as exc:
+                print "Integrity error %s" % str(exc)
+                break
+
+    def getValue(self, version, checksum):
+        data=self._execute("SELECT value FROM %s WHERE version=? AND checksum=?;" % self.table,
+                           (version,checksum))
+        row=data.fetchone()
+        if row != None:
+            return row[0]
+        else:
+            #no value found, try to insert
+            self._execute("INSERT INTO %s VALUES (?, ?, (select ifnull(max(value)+1,0) from %s where version=?));" 
+                           % (self.table,self.table),
+                           (version,checksum,version))
+            data=self._execute("SELECT value FROM %s WHERE version=? AND checksum=?;" % self.table,
+                               (version,checksum))
+            row=data.fetchone()
+            if row != None:
+                return row[0]
+            else:
+                raise NotFoundError
+
+class PRData(object):
+    """Object representing the PR database"""
+    def __init__(self, filename):
+        self.filename=os.path.abspath(filename)
+        #build directory hierarchy
+        try:
+            os.makedirs(os.path.dirname(self.filename))
+        except OSError as e:
+            if e.errno != errno.EEXIST:
+                raise e
+        self.connection=sqlite3.connect(self.filename, timeout=5,
+                                          isolation_level=None)
+        self.cursor=self.connection.cursor()
+        self._tables={}
+
+    def __del__(self):
+        print "PRData: closing DB %s" % self.filename
+        self.connection.close()
+
+    def __getitem__(self,tblname):
+        if not isinstance(tblname, basestring):
+            raise TypeError("tblname argument must be a string, not '%s'" %
+                            type(tblname))
+        if tblname in self._tables:
+            return self._tables[tblname]
+        else:
+            tableobj = self._tables[tblname] = PRTable(self.cursor, tblname)
+            return tableobj
+
+    def __delitem__(self, tblname):
+        if tblname in self._tables:
+            del self._tables[tblname]
+        logging.info("drop table %s" % (tblname))
+        self.cursor.execute("DROP TABLE IF EXISTS %s;" % tblname) 
diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
new file mode 100644
index 0000000..ecafe4f
--- /dev/null
+++ b/bitbake/lib/prserv/serv.py
@@ -0,0 +1,198 @@
+import os,sys,logging
+import signal,time, atexit
+from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
+import xmlrpclib,sqlite3
+
+import bb.server.xmlrpc
+import prserv
+import prserv.db
+
+if sys.hexversion < 0x020600F0:
+    print("Sorry, python 2.6 or later is required.")
+    sys.exit(1)
+
+class Handler(SimpleXMLRPCRequestHandler):
+    def _dispatch(self,method,params):
+        try:
+            value=self.server.funcs[method](*params)
+        except:
+            import traceback
+            traceback.print_exc()
+            raise
+        return value
+
+class PRServer(SimpleXMLRPCServer):
+    pidfile="/tmp/PRServer.pid"
+    def __init__(self, dbfile, logfile, interface, daemon=True):
+        ''' constructor '''
+        SimpleXMLRPCServer.__init__(self, interface,
+                                    requestHandler=SimpleXMLRPCRequestHandler,
+                                    logRequests=False, allow_none=True)
+        self.dbfile=dbfile
+        self.daemon=daemon
+        self.logfile=logfile
+        self.host, self.port = self.socket.getsockname()
+        self.db=prserv.db.PRData(dbfile)
+        self.table=self.db["PRMAIN"]
+
+        self.register_function(self.getPR, "getPR")
+        self.register_function(self.quit, "quit")
+        self.register_function(self.ping, "ping")
+        self.register_introspection_functions()
+
+    def ping(self):
+        return not self.quit
+ 
+    def getPR(self, version, checksum):
+        try:
+            return self.table.getValue(version,checksum)
+        except prserv.NotFoundError:
+            logging.error("can not find value for (%s, %s)",version,checksum)
+            return None
+        except sqlite3.Error as exc:
+            logging.error(str(exc))
+            return None
+
+    def quit(self):
+        self.quit=True
+        return
+
+    def _serve_forever(self):
+        self.quit = False
+        self.timeout = 0.5
+        while not self.quit:
+            self.handle_request()
+
+        logging.info("PRServer: stopping...")
+        self.server_close()
+        return
+
+    def start(self):
+        if self.daemon is True:
+            logging.info("PRServer: starting daemon...")
+            self.daemonize()
+        else:
+            logging.info("PRServer: starting...")
+            self._serve_forever()
+
+    def delpid(self):
+        os.remove(PRServer.pidfile)
+
+    def daemonize(self):
+        """
+        See Advanced Programming in the UNIX, Sec 13.3
+        """
+        os.umask(0)
+
+        try:
+            pid = os.fork()
+            if pid > 0: 
+                sys.exit(0)
+        except OSError,e:
+            sys.stderr.write("1st fork failed: %d %s\n" % (e.errno, e.strerror))
+            sys.exit(1)
+
+        os.setsid()
+        """
+        fork again to make sure the daemon is not session leader, 
+        which prevents it from acquiring controlling terminal
+        """
+        try:
+            pid = os.fork()
+            if pid > 0: #parent
+                sys.exit(0)
+        except OSError,e:
+            sys.stderr.write("2nd fork failed: %d %s\n" % (e.errno, e.strerror))
+            sys.exit(1)
+
+        os.chdir("/")
+
+        sys.stdout.flush()
+        sys.stderr.flush()
+        si = file('/dev/null', 'r')
+        so = file(self.logfile, 'a+')
+        se = so
+        os.dup2(si.fileno(),sys.stdin.fileno())
+        os.dup2(so.fileno(),sys.stdout.fileno())
+        os.dup2(se.fileno(),sys.stderr.fileno())
+
+        # write pidfile
+        atexit.register(self.delpid)
+        pid = str(os.getpid()) 
+        pf = file(PRServer.pidfile, 'w+')
+        pf.write("%s\n" % pid)
+        pf.write("%s\n" % self.host)
+        pf.write("%s\n" % self.port)
+        pf.close()
+
+        self._serve_forever()
+
+class PRServerConnection():
+    def __init__(self, host, port):
+        self.connection = bb.server.xmlrpc._create_server(host, port)
+        self.host = host
+        self.port = port
+
+    def terminate(self):
+        # Don't wait for server indefinitely
+        import socket
+        socket.setdefaulttimeout(2)
+        try:
+            self.connection.quit()
+        except:
+            pass
+
+    def getPR(self, version, checksum):
+        return self.connection.getPR(version, checksum)
+
+    def ping(self):
+        return self.connection.ping()
+
+def start_daemon(options):
+    try:
+        pf = file(PRServer.pidfile,'r')
+        pid = int(pf.readline().strip())
+        pf.close()
+    except IOError:
+        pid = None
+
+    if pid:
+        sys.stderr.write("pidfile %s already exist. Daemon already running?\n"
+                            % PRServer.pidfile)
+        sys.exit(1)
+
+    server = PRServer(options.dbfile, interface=(options.host, options.port),
+                      logfile=os.path.abspath(options.logfile))
+    server.start()
+
+def stop_daemon():
+    try:
+        pf = file(PRServer.pidfile,'r')
+        pid = int(pf.readline().strip())
+        host = pf.readline().strip()
+        port = int(pf.readline().strip())
+        pf.close()
+    except IOError:
+        pid = None
+
+    if not pid:
+        sys.stderr.write("pidfile %s does not exist. Daemon not running?\n"
+                        % PRServer.pidfile)
+        sys.exit(1)
+
+    PRServerConnection(host,port).terminate()
+    time.sleep(0.5)
+
+    try:
+        while 1:
+            os.kill(pid,signal.SIGTERM)
+            time.sleep(0.1)
+    except OSError, err:
+        err = str(err)
+        if err.find("No such process") > 0:
+            if os.path.exists(PRServer.pidfile):
+                os.remove(PRServer.pidfile)
+        else:
+            print err
+            sys.exit(1)
+
-- 
1.7.0.4



