Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web12.26507.1588524408592436704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: frazer.clews@codethink.co.uk)
Received: from host86-177-45-246.range86-177.btcentralplus.com ([86.177.45.246] helo=localhost.co.uk)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1jVHlN-0003ir-0J; Sun, 03 May 2020 17:46:45 +0100
From: "Frazer Clews" <frazer.clews@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Frazer Clews <frazer.clews@codethink.co.uk>
Subject: [PATCH] lib/toaster: fixup codebase so pydocstyle can parse
Date: Sun,  3 May 2020 17:46:14 +0100
Message-Id: <20200503164614.24261-1-frazer.clews@codethink.co.uk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frazer Clews <frazer.clews@codethink.co.uk>

fixed literal comparison in lsupdates so the
integer isn't treated as a singleton, also fix
indentation in perf

Signed-off-by: Frazer Clews <frazer.clews@codethink.co.uk>
---
 .../orm/management/commands/lsupdates.py      |  2 +-
 .../toastermain/management/commands/perf.py   | 68 +++++++++----------
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/lib/toaster/orm/management/commands/lsupdates.py b/lib/toaster/orm/management/commands/lsupdates.py
index a4dbcaa7..2fbd7be3 100644
--- a/lib/toaster/orm/management/commands/lsupdates.py
+++ b/lib/toaster/orm/management/commands/lsupdates.py
@@ -68,7 +68,7 @@ class Command(BaseCommand):
                          (what,
                           pec))
         sys.stdout.flush()
-        if int(pec) is 100:
+        if int(pec) == 100:
             sys.stdout.write("\n")
             sys.stdout.flush()
 
diff --git a/lib/toaster/toastermain/management/commands/perf.py b/lib/toaster/toastermain/management/commands/perf.py
index 7d629fb3..5c41c5b2 100644
--- a/lib/toaster/toastermain/management/commands/perf.py
+++ b/lib/toaster/toastermain/management/commands/perf.py
@@ -17,46 +17,46 @@ class Command(BaseCommand):
     help    = "Test the response time for all toaster urls"
 
     def handle(self, *args, **options):
-	root_urlconf = __import__(settings.ROOT_URLCONF)
-	patterns = root_urlconf.urls.urlpatterns
-	global full_url
-	for pat in patterns:
-	    if pat.__class__.__name__ == 'RegexURLResolver':
-		url_root_res = str(pat).split('^')[1].replace('>', '')
-		if 'gui' in url_root_res:
-		    for url_patt in pat.url_patterns:
-			full_url = self.get_full_url(url_patt, url_root_res)
-			info = self.url_info(full_url)
-			status_code = info[0]
-			load_time = info[1]
-			print('Trying \'' + full_url + '\', ' + str(status_code) + ', ' + str(load_time))
+        root_urlconf = __import__(settings.ROOT_URLCONF)
+        patterns = root_urlconf.urls.urlpatterns
+        global full_url
+        for pat in patterns:
+            if pat.__class__.__name__ == 'RegexURLResolver':
+                url_root_res = str(pat).split('^')[1].replace('>', '')
+            if 'gui' in url_root_res:
+                for url_patt in pat.url_patterns:
+                    full_url = self.get_full_url(url_patt, url_root_res)
+                    info = self.url_info(full_url)
+                    status_code = info[0]
+                    load_time = info[1]
+                    print('Trying \'' + full_url + '\', ' + str(status_code) + ', ' + str(load_time))
 
     def get_full_url(self, url_patt, url_root_res):
-	full_url = str(url_patt).split('^')[1].replace('$>', '').replace('(?P<file_path>(?:/[', '/bin/busybox').replace('.*', '')
-	full_url = str(url_root_res + full_url)
-	full_url = re.sub('\(\?P<.*?>\\\d\+\)', '1', full_url)
-	full_url = 'http://localhost:8000/' + full_url
-	return full_url
+        full_url = str(url_patt).split('^')[1].replace('$>', '').replace('(?P<file_path>(?:/[', '/bin/busybox').replace('.*', '')
+        full_url = str(url_root_res + full_url)
+        full_url = re.sub('\(\?P<.*?>\\\d\+\)', '1', full_url)
+        full_url = 'http://localhost:8000/' + full_url
+        return full_url
 
     def url_info(self, full_url):
-	client = Client()
-	info = []
-	try:
-	    resp = client.get(full_url, follow = True)
-	except Exception as e_status_code:
+        client = Client()
+        info = []
+        try:
+            resp = client.get(full_url, follow = True)
+        except Exception as e_status_code:
             self.error('Url: %s, error: %s' % (full_url, e_status_code))
             resp = type('object', (), {'status_code':0, 'content': str(e_status_code)})
-	status_code = resp.status_code
-	info.append(status_code)
-	try:
-	    req = requests.get(full_url)
-	except Exception as e_load_time:
+        status_code = resp.status_code
+        info.append(status_code)
+        try:
+            req = requests.get(full_url)
+        except Exception as e_load_time:
             self.error('Url: %s, error: %s' % (full_url, e_load_time))
-	load_time = req.elapsed
-	info.append(load_time)
-	return info
+        load_time = req.elapsed
+        info.append(load_time)
+        return info
 
     def error(self, *args):
-	for arg in args:
-	    print(arg, end=' ', file=sys.stderr)
-	print(file=sys.stderr)
+        for arg in args:
+            print(arg, end=' ', file=sys.stderr)
+        print(file=sys.stderr)
-- 
2.26.2

