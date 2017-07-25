Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 852F97830D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 10:17:29 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id c184so47772950wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZOqRsPmu7Xmao6aN8YQ0BeVtKd4eExTemqS3ogiMmKM=;
	b=NPueIvSdzUISmod+CBSrrD5rxwxKeWn5GPmZzNriCXMlEYRO/H2ONj+rEPlSfGsxpH
	htPKpVULtFQMn4x91m2gilbRSGNJxvLh+BwAH6PHxNif5Jn4P1O+kwKqWbEXEBJKXF15
	Zht8PQdaYw9UHZcoTIDWnoodNE55/XpLMwhFGRvT/606179iIEianycGVRDmvQH8XTov
	XoVc25hY3n7fUm6JU9kkBpymbXIiwZwIzGnozN5FN9YWKAurTcpQO5zcVEkNuf6aGtlc
	NcZFaj8LbvfuwD8V7GU9ugEOeZZPVfEYVM3wXgPszmNV5D/rUGZWf1V5/pKfwZNToBTs
	xEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZOqRsPmu7Xmao6aN8YQ0BeVtKd4eExTemqS3ogiMmKM=;
	b=koXMys1UfRlVhID6cw6u22KV6+2fqPqPoit84fojoPftsPETA+66XvjGF41Z5KTJSC
	gZiPtYbpatSbhSG4Ce7x/EY8MGjB5b2a7FYzYr03XAdKUOhv7dVxnnjPtAPETlYunRmm
	XAat0sNnhJJ/tRFnBmeM+fX8RJMUZ0sAHfA2ax7U2y8ytbAx5d2VdjQ73E72+4ayOqtM
	GwinYy15hFjuodt8pFYTsotyiZUTHmNBKvtMGomOTCf9NfKupPwkpllq9OwlqJNrYFxh
	uIdbPQliPwEBQjKj4D4z8z8KuXpOsqO2UuHmDfew99IbPf167o4qyRK2AAqOPZcSLkGr
	dctQ==
X-Gm-Message-State: AIVw110bZwDVH1WcnzQwNUFxZgqIum6VBns/vjRsX3j0N8Ik5cQydTXY
	IJVG726CtIvsm+lTDMU=
X-Received: by 10.28.111.200 with SMTP id c69mr6674225wmi.115.1500977850082;
	Tue, 25 Jul 2017 03:17:30 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r199sm10645623wmd.11.2017.07.25.03.17.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 03:17:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 11:17:19 +0100
Message-Id: <20170725101719.2172-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170725101719.2172-1-ross.burton@intel.com>
References: <20170725101719.2172-1-ross.burton@intel.com>
Subject: [PATCH 3/3] fetch/wget: mitigate a wget race condition when listing FTP directories
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
X-List-Received-Date: Tue, 25 Jul 2017 10:17:30 -0000

When wget is fetching a listing for a directory over FTP it writes to a
temporary file called .listing in the current directory.  If there are many such
operations happening in parallel - for example during 'bitbake world -c
checkpkg' - then up to BB_NUMBER_THREADS instances of wget will be racing to
write to, read, and delete the same file.

This results in various failures such as the file disappearing before wget has
processed it or the file changing contents, which causes checkpkg to randomly
fail.

Mitigate the race condition by creating a temporary directory to run wget in
when doing directory listings.

[ YOCTO #11828 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 bitbake/lib/bb/fetch2/wget.py | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/wget.py b/bitbake/lib/bb/fetch2/wget.py
index 208ee9bdd69..8ee9769d39b 100644
--- a/bitbake/lib/bb/fetch2/wget.py
+++ b/bitbake/lib/bb/fetch2/wget.py
@@ -90,13 +90,13 @@ class Wget(FetchMethod):
 
         self.basecmd = d.getVar("FETCHCMD_wget") or "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate"
 
-    def _runwget(self, ud, d, command, quiet):
+    def _runwget(self, ud, d, command, quiet, workdir=None):
 
         progresshandler = WgetProgressHandler(d)
 
         logger.debug(2, "Fetching %s using command '%s'" % (ud.url, command))
         bb.fetch2.check_network_access(d, command, ud.url)
-        runfetchcmd(command + ' --progress=dot -v', d, quiet, log=progresshandler)
+        runfetchcmd(command + ' --progress=dot -v', d, quiet, log=progresshandler, workdir=workdir)
 
     def download(self, ud, d):
         """Fetch urls"""
@@ -422,17 +422,16 @@ class Wget(FetchMethod):
         Run fetch checkstatus to get directory information
         """
         f = tempfile.NamedTemporaryFile()
+        with tempfile.TemporaryDirectory(prefix="wget-index-") as workdir, tempfile.NamedTemporaryFile(dir=workdir, prefix="wget-listing-") as f:
+            agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
+            fetchcmd = self.basecmd
+            fetchcmd += " -O " + f.name + " --user-agent='" + agent + "' '" + uri + "'"
+            try:
+                self._runwget(ud, d, fetchcmd, True, workdir=workdir)
+                fetchresult = f.read()
+            except bb.fetch2.BBFetchException:
+                fetchresult = ""
 
-        agent = "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/9.10 (karmic) Firefox/3.6.12"
-        fetchcmd = self.basecmd
-        fetchcmd += " -O " + f.name + " --user-agent='" + agent + "' '" + uri + "'"
-        try:
-            self._runwget(ud, d, fetchcmd, True)
-            fetchresult = f.read()
-        except bb.fetch2.BBFetchException:
-            fetchresult = ""
-
-        f.close()
         return fetchresult
 
     def _check_latest_version(self, url, package, package_regex, current_version, ud, d):
-- 
2.11.0


