Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.7540.1585126287461850099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 01:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=W5zjBIOL;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1416; q=dns/txt; s=axis-central1;
  t=1585126287; x=1616662287;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f7kNHwSTmXkG7aRRK0QqZIxqQNf7Buznf+1v630D0QQ=;
  b=W5zjBIOLq+kApPOAFAqusfn/Y2D+PzD+l/Jk0OAzdYsIHkAbGgRjqd0q
   yqFl7x8rkd3jw3yqnPqa/boENE/29Imc/S1L2ltqiu1894w+ltf2C7q7V
   9FRmio7ZTpQkwJvv6nGeGcAI8t6cM9wdq82qexFd6NoalD+bdU02i9bJR
   930Ty/rMsRR+Q2m0Cddu5pnaVgAzf31ouX7hx5QUdCuwv+x6cfXf3VSVs
   ZXNeSSD9/rLLBphuhIRnfZh1xu3EFGXIHyD5vKeEDR8wZYIE6xwl2uGKN
   2PSpYUxi7M0SdF6z5kbQYQV2j+k0qQ3aNO7VlZhm62Q8pCMD2ZropUvJg
   Q==;
IronPort-SDR: 0PJYO6yJDDfECH6ealyJ/CzkhMKldM/x50ZhYz0qpgQX1JGuwY8mlIAyDVcg0s6LmO0uupGa9A
 9T9cuSYHMrkTpp9WIBYhnd4ybZBAduADbL0xwoZNKg08xMRntV/kAtiwxtLVS/qTlssmYyxj6n
 PTIbNoQTv0NfucMOrYfDuviyscRkgkM7Tm5Q+S0PfsBg1gFjcj6sNzrakaSEP0MBgjG4Q5TAWF
 GWo1CPRl3r1QwIoS5gcMxNht/NWjvFUwRrgv+mj2ha4G7zeN6i2YDVlAbttrHb51gQj6pWMKWS
 1aA=
X-IronPort-AV: E=Sophos;i="5.72,303,1580770800"; 
   d="scan'208";a="6717968"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildstats-plot.sh: Show spaces and underscores correctly in titles/keys
Date: Wed, 25 Mar 2020 09:51:14 +0100
Message-ID: <20200325085114.15148-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Spaces were previously converted to dashes, and underscores caused the
next character in the title/key to be printed using subscript due to the
enhanced string support in gnuplot.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/bb-perf/buildstats-plot.sh
index 80fd30960c..45c27d0b97 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -120,7 +120,7 @@ OUTBUILDSTATS="$PWD/buildstats.log"
 $CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" $RECIPE $ACCUMULATE -H > $OUTBUILDSTATS
 
 # Get headers
-HEADERS=$(cat $OUTBUILDSTATS | sed -n -e '1s/ /-/g' -e '1s/:/ /gp')
+HEADERS=$(cat $OUTBUILDSTATS | sed -n -e 's/\(.*\)/"\1"/' -e '1s/ /\\\\\\\\ /g' -e 's/_/\\\\\\\\_/g' -e '1s/:/" "/gp')
 
 echo -e "set boxwidth 0.9 relative"
 echo -e "set style data histograms"
@@ -129,7 +129,7 @@ echo -e "set xtics rotate by 45 right"
 
 # Get output data
 if [ -z "$SUM" ]; then
-    cat $OUTBUILDSTATS | sed -e '1d' | sort -k3 -n -r | head -$N > $OUTDATA_FILE
+    cat $OUTBUILDSTATS | sed -e '1d' -e 's/_/\\\\_/g' | sort -k3 -n -r | head -$N > $OUTDATA_FILE
     # include task at recipe column
     sed -i -e "1i\
 ${HEADERS}" $OUTDATA_FILE
-- 
2.21.1

