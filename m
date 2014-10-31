Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFF471F3A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 10:27:27 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so10682812wgg.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 02:27:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oztiNRv7iaP/fhw1IYGBNwLgzCcJUCY2ru1szJAj0KY=;
	b=I7OW4LVbg5vHcnHmNpkQjUV8NSwwWJtROaFzKiwMjcXBYpLybglmC5YWTPiEz+Jcjh
	S8xUN4iIYtgPR8rX6UCtxUcRowDfZWPylEAjcoHKJs4cZ7H9weqhnNvkg8L2EO5apYxe
	e/xa01txpTJ+R8uHUzg9rHP8Ijnc+ZCySRbEkuHfl969rmt2jmTEB9LyfUe2hvszGtEF
	TkobqcylgWh74ZOc4Vyvhh9+KovU5VCLuCrlv22yQihm3DVR2S9ph2wzeph90EPN8ADf
	QalZCC/FcgKEwezE79NPWUGhoW/D/w15PJP/dtH7jTWes5agE3FYbGFcSfiOb1ecIVXO
	HhvA==
X-Gm-Message-State: ALoCoQk7md6Ovx7fB88lPpeWtCV9ECQScjjg5Jx8qh8GyoDI/37FL1TbNi1zKm4lEKasMfflrC+E
X-Received: by 10.180.95.201 with SMTP id dm9mr14871180wib.27.1415010447791;
	Mon, 03 Nov 2014 02:27:27 -0800 (PST)
Received: from adamian-desk.corp.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id
	q10sm21665081wjq.35.2014.11.03.02.27.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Nov 2014 02:27:26 -0800 (PST)
Received: by adamian-desk.corp.intel.com (Postfix, from userid 1000)
	id 21A03560632; Fri, 31 Oct 2014 19:15:50 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 19:15:48 +0000
Message-Id: <1414782948-13922-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/1] toaster.bbclass: read elapsed time from the stats file
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
X-List-Received-Date: Mon, 03 Nov 2014 10:27:31 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

We read the elapsed time fromt the build stats file, instead
of computing it independently.

[YOCTO #6833]
[YOCTO #6685]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 95499a5..1525317 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -187,8 +187,10 @@ python toaster_collect_task_stats() {
     def _read_stats(filename):
         cpu_usage = 0
         disk_io = 0
-        startio = ''
-        endio = ''
+        startio = '0'
+        endio = '0'
+        started = '0'
+        ended = '0'
         pn = ''
         taskname = ''
         statinfo = {}
@@ -198,20 +200,28 @@ python toaster_collect_task_stats() {
                 k,v = line.strip().split(": ", 1)
                 statinfo[k] = v
 
-        try:
-            cpu_usage = statinfo["CPU usage"]
-            endio = statinfo["EndTimeIO"]
-            startio = statinfo["StartTimeIO"]
-        except KeyError:
-            pass    # we may have incomplete data here
+        if "CPU usage" in statinfo:
+            cpu_usage = str(statinfo["CPU usage"]).strip('% \n\r')
 
-        if startio and endio:
-            disk_io = int(endio.strip('\n ')) - int(startio.strip('\n '))
+        if "EndTimeIO" in statinfo:
+            endio = str(statinfo["EndTimeIO"]).strip('% \n\r')
 
-        if cpu_usage:
-            cpu_usage = float(cpu_usage.strip('% \n'))
+        if "StartTimeIO" in statinfo:
+            startio = str(statinfo["StartTimeIO"]).strip('% \n\r')
 
-        return {'cpu_usage': cpu_usage, 'disk_io': disk_io}
+        if "Started" in statinfo:
+            started = str(statinfo["Started"]).strip('% \n\r')
+
+        if "Ended" in statinfo:
+            ended = str(statinfo["Ended"]).strip('% \n\r')
+
+        disk_io = int(endio) - int(startio)
+
+        elapsed_time = float(ended) - float(started)
+
+        cpu_usage = float(cpu_usage)
+
+        return {'cpu_usage': cpu_usage, 'disk_io': disk_io, 'elapsed_time': elapsed_time}
 
 
     if isinstance(e, (bb.build.TaskSucceeded, bb.build.TaskFailed)):
-- 
1.9.1


