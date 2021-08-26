Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.34264.1629998931186528216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mNG34mWb;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629998933;
  x=1661534933;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=x5P3TDebFpWWgUt9XLOehpFvnpzvbgTRqXZLDfT+UNk=;
  b=mNG34mWbu1CynXl6iy5TViRabuvV6qfZkhfE3R/y/g2KSG6r3GWodTyP
   ZvWiftjOOuTbJP0GwF/l3pH3gVF7P2IvljaSK85qwCUR9W+GzaLD+Mfvw
   GUPO3BatLpniYQuUU1FwxazWKekxIZO/IXlVbgq3MvKr4EHrs+fz1E9F2
   gL9VhY9rt2ZHnE0CMH4dp3Qdu9/Tt6jEfze0J0V/uqtTzukD2D0okRVbw
   PNxjS3hmYqDjlqH9hYeO4TObGLk6DkkinAuxR41xCpUqajQSwMUFn221x
   e+hJEdRXBIlz35h6Lryq1jz5DBrVV0qqo+BfjFs/u7s/neFL956Ja3z3E
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] buildhistory-collect-srcrevs: Adapt to the new variable override syntax
Date: Thu, 26 Aug 2021 19:28:44 +0200
Message-ID: <20210826172844.32608-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20210826172844.32608-1-pkj@axis.com>
References: <20210826172844.32608-1-pkj@axis.com>
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/buildhistory-collect-srcrevs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/buildhistory-collect-srcrevs b/scripts/buildhistory-collect-srcrevs
index bca01a922b..6c919299a6 100755
--- a/scripts/buildhistory-collect-srcrevs
+++ b/scripts/buildhistory-collect-srcrevs
@@ -53,7 +53,7 @@ def main():
         sys.exit(1)
 
     if options.forcevariable:
-        forcevariable = '_forcevariable'
+        forcevariable = ':forcevariable'
     else:
         forcevariable = ''
 
@@ -78,14 +78,14 @@ def main():
                             value = splitval[1].strip('" \t\n\r')
                         if line.startswith('# SRCREV = '):
                             orig_srcrev = value
-                        elif line.startswith('# SRCREV_'):
+                        elif line.startswith('# SRCREV:'):
                             splitval = line.split('=')
-                            name = splitval[0].split('_')[1].strip()
+                            name = splitval[0].split(':')[1].strip()
                             orig_srcrevs[name] = value
                         elif line.startswith('SRCREV ='):
                             srcrev = value
-                        elif line.startswith('SRCREV_'):
-                            name = splitval[0].split('_')[1].strip()
+                        elif line.startswith('SRCREV:'):
+                            name = splitval[0].split(':')[1].strip()
                             srcrevs[name] = value
                 if srcrev and (options.reportall or srcrev != orig_srcrev):
                     all_srcrevs[curdir].append((pn, None, srcrev))
@@ -99,7 +99,7 @@ def main():
             print('# %s' % curdir)
             for pn, name, srcrev in srcrevs:
                 if name:
-                    print('SRCREV_%s_pn-%s%s = "%s"' % (name, pn, forcevariable, srcrev))
+                    print('SRCREV:%s:pn-%s%s = "%s"' % (name, pn, forcevariable, srcrev))
                 else:
                     print('SRCREV:pn-%s%s = "%s"' % (pn, forcevariable, srcrev))
 
