Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 45DF36D959
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:36:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGaoAZ004778 for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:36:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5KR4jKZgSvaB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:36:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGairJ004775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:36:46 GMT
Message-ID: <1384965401.16887.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 16:36:41 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] buildhistory/distrodata: Adapt to updated fetcher API
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
X-List-Received-Date: Wed, 20 Nov 2013 16:36:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The buildhistory code has fallback paths for older bitbakes for now. The
distrodata class is much less used and it can be assumed a recent bitbake
is used in that case rather than adding fallback code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
[Bitbake changes aren't in yet, this is to prepare for them]
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 3da03c8..ec3f0b1 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -572,7 +572,11 @@ def _get_srcrev_values(d):
     for scm in scms:
         ud = urldata[scm]
         for name in ud.names:
-            rev = ud.method.sortable_revision(scm, ud, d, name)
+            try:
+                rev = ud.method.sortable_revision(ud, d, name)
+            except TypeError:
+                # support old bitbake versions
+                rev = ud.method.sortable_revision(scm, ud, d, name)
             # Clean this up when we next bump bitbake version
             if type(rev) != str:
                 autoinc, rev = rev
diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index e481027..2c365f9 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -756,7 +756,7 @@ python do_checkpkg() {
                 svnFetcher = bb.fetch2.svn.Svn(d)
                 svnFetcher.urldata_init(ud, d)
                 try:
-                        pupver = svnFetcher.latest_revision(uri, ud, d, ud.names[0])
+                        pupver = svnFetcher.latest_revision(ud, d, ud.names[0])
                 except bb.fetch2.FetchError:
                         pstatus = "ErrSvnAccess"
                 



