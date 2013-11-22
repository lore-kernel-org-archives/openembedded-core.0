Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 114A66A467
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:07:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMF7ipD021608 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:07:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4wGrkQctJ7xY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:07:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAMF7bwo021604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 15:07:39 GMT
Message-ID: <1385132854.16887.178.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Nov 2013 15:07:34 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] metadata_scm: Avoid crashing on new svn version layouts
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
X-List-Received-Date: Fri, 22 Nov 2013 15:07:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This avoids crashing on newer svn layouts where the entries files
don't contain three lines. If someone wants to fix this to
get the right version on newer subversion checkouts, patches
welcome but this at least stops things crashing.

[YOCTO #5363]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
index 8d3988a..ba0edf9 100644
--- a/meta/classes/metadata_scm.bbclass
+++ b/meta/classes/metadata_scm.bbclass
@@ -54,11 +54,13 @@ def base_get_metadata_monotone_revision(path, d):
     return monotone_revision
 
 def base_get_metadata_svn_revision(path, d):
+    # This only works with older subversion. For newer versions 
+    # this function will need to be fixed by someone interested
     revision = "<unknown>"
     try:
         with open("%s/.svn/entries" % path) as f:
             revision = f.readlines()[3].strip()
-    except IOError:
+    except IOError, IndexError:
         pass
     return revision
 



