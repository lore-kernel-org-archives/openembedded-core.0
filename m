Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1S0ZuX-0001fg-Vb
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 15:44:46 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElxoW002926 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:59 GMT
X-Quarantine-ID: <xkwxTtvzHJkk>
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER, Duplicate header field: "In-Reply-To"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xkwxTtvzHJkk
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:59 +0000 (GMT)
Received: from ted (ted.config [192.168.1.68]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	q1NElvBm002915
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 14:47:58 GMT
Received: from richard by ted with local (Exim 4.76)
	(envelope-from <richard@dan.rpsys.net>) id 1S0Ysu-000513-1h
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 13:39:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 13:38:21 +0000
Message-Id: <4661025c2743fe020018d7b97fd6759c571c2733.1330004039.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
References: <5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/16] package.bbclass: Remove empty directories created as part of srcdebug handling
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
X-List-Received-Date: Thu, 23 Feb 2012 14:44:46 -0000

We can create directories like /usr/src/debug as part of the debug file
manipulations. If these are going to end up empty, remove them to avoid QA
warnings like:

WARNING: For recipe task-core-x11, the following files/directories were installed but not shipped in any package:
WARNING:   /usr
WARNING:   /usr/src
WARNING:   /usr/src/debug
WARNING: For recipe task-core-console, the following files/directories were installed but not shipped in any package:
WARNING:   /usr
WARNING:   /usr/src
WARNING:   /usr/src/debug

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f6d6e1a..b579e50 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -251,7 +251,13 @@ def splitfile2(debugsrcdir, d):
     sourcefile = bb.data.expand("${WORKDIR}/debugsources.list", d)
 
     if debugsrcdir:
-       bb.mkdirhier("%s%s" % (dvar, debugsrcdir))
+       nosuchdir = []
+       basepath = dvar
+       for p in debugsrcdir.split("/"):
+           basepath = basepath + "/" + p
+           if not os.path.exists(basepath):
+               nosuchdir.append(basepath)
+       bb.mkdirhier(basepath)
 
        processdebugsrc =  "LC_ALL=C ; sort -z -u '%s' | egrep -v -z '(<internal>|<built-in>)$' | "
        # We need to ignore files that are not actually ours
@@ -268,6 +274,11 @@ def splitfile2(debugsrcdir, d):
               #bb.note("rmdir -p %s" % dir)
               os.system("rmdir -p %s 2>/dev/null" % dir)
 
+       # Also remove debugsrcdir if its empty
+       for p in nosuchdir[::-1]:
+           if not os.listdir(p):
+               os.rmdir(p)
+
 def runstrip(file, elftype, d):
     # Function to strip a single file, called from split_and_strip_files below
     # A working 'file' (one which works on the target architecture)
-- 
1.7.5.4



