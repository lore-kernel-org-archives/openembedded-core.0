Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM2Y6-0007qp-4C
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 20:29:46 +0200
Received: by pvc30 with SMTP id 30so2284353pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 11:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=Rj6x86Gza2N3gnDsFihUUfIEAKHCRFNneFOJHrzxfbk=;
	b=dgGxtixClDc/f6fVD1AefhV5dehoR2yIPgOMDE2WY1/7t0Q3XN3c7uvPxLW/FmKA7n
	RV5U82BPOgb34JtRPvKi7uKeXeWXgP9LWBO1KR99CSfc2DJAGI1IWrhVmlra5yBrMs3J
	+T+6cCwKl0EWcTKQBq1nLhflBL2mLVFGE4rbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Ww4wt9jiA/sdR06DoffUhknFGuaaf3mHWEo9Gc9Xb03WKN2jLQ9l0n/jkyAq5KwDFe
	s/2DwJQir2UOBbbItTT7M8wxcIB3BHOta2VXJX8lbNscJtNMAi++oU4oyh+fUfCzBDt3
	nx7ZSEY0jh1d30t9CrG4r/ME959iAKSDm3NgE=
Received: by 10.68.39.74 with SMTP id n10mr2135388pbk.242.1305570412943;
	Mon, 16 May 2011 11:26:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id l9sm3446433pbc.14.2011.05.16.11.26.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 11:26:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2011 11:26:44 -0700
Message-Id: <59af7ac39a70fc410f15e8c0b0c7aa3678401d02.1305570339.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1305570339.git.raj.khem@gmail.com>
References: <cover.1305570339.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] base.bbclass: Fix PR increment bug when PR number is a single digit
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
X-List-Received-Date: Mon, 16 May 2011 18:29:46 -0000

PRINC which should add to base PR value has a problem when
the PR is single digit e.g. r0 - r9. Current algorithm
needed atleasts 2 digits to successfully populate end and begin
markers.

We reimplement the incrementing algorithm using regular expressions
which addressed the above mentioned problem and
simplifies the logic a bit and gets rid of loops and conditionals

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/base.bbclass |   19 ++++++-------------
 1 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d9ed15f..23095ec 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -233,25 +233,18 @@ do_build () {
 }
 
 python () {
-    import exceptions, string
+    import exceptions, string, re
 
     # If PRINC is set, try and increase the PR value by the amount specified
     princ = bb.data.getVar('PRINC', d, True)
     if princ:
         pr = bb.data.getVar('PR', d, True)
-        start = -1
-        end = -1
-        for i in range(len(pr)):
-            if pr[i] in string.digits:
-                if start == -1:
-                    start = i
-                else:
-                    end = i
-        if start == -1 or end == -1:
+        pr_prefix = re.search("\D+",pr)
+        prval = re.search("\d+",pr)
+        if pr_prefix is None or prval is None:
             bb.error("Unable to analyse format of PR variable: %s" % pr)
-        prval = pr[start:end+1]
-        prval = int(prval) + int(princ)
-        pr = pr[0:start] + str(prval) + pr[end:len(pr)-1]
+        nval = int(prval.group(0)) + int(princ)
+        pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
         bb.data.setVar('PR', pr, d)
 
     pn = bb.data.getVar('PN', d, 1)
-- 
1.7.4.1



