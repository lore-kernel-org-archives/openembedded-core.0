Return-Path: <michael.g.wood@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id DD9CF605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 14:20:22 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id fb4so24698096wid.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Feb 2015 06:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z1wMOIXOI3I0p9aN+rpvJ0INU+5jvRQMK78Cti/baHs=;
	b=Wd0oQciFb8TQPsq0hTVryVozkLvpx2bR+6vyIsEImzZ/Lbhev3TxdPTJtv9gaUP1f5
	acu2APp8iaaAC/Tmn/sCGk/q2Ep6FKCTf7DSBCAanLJtr9CUe585r/lxZc/W0EYm8doW
	qtL1OHTSWwrsKjHk6vT/5lsv0rxvI7wV4PKQ+Tkb1T3aK26H6Ia2HG/9K2JiAF2f6DVC
	z+rj9P+qC4/ZPkmHane7LxD+VURzmTBgKUulAANMxX/f0ix5eTD8JG9YDXYGAfeqp5M+
	yGmlz4MWRQfnBsvwcoxYgiL00lE23aJYb342avIisCU5G8EbNQkiuoV3Zod4K8RAU6EK
	2J8Q==
X-Gm-Message-State: ALoCoQnvhcTgJPMQl2Y59ixYqO0+GvW1IvQoFU0GhGA9brctxyDkevtfxrFO5+0w3bSbiQRu6Rrz
X-Received: by 10.195.17.225 with SMTP id gh1mr54840551wjd.37.1422973217601;
	Tue, 03 Feb 2015 06:20:17 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id pr9sm26637219wjc.4.2015.02.03.06.20.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Feb 2015 06:20:16 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 14:20:12 +0000
Message-Id: <1422973212-10049-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1422619065-28018-1-git-send-email-michael.g.wood@intel.com>
References: <1422619065-28018-1-git-send-email-michael.g.wood@intel.com>
Subject: [PATCH v2] report-error: Catch un-readable log data
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
X-List-Received-Date: Tue, 03 Feb 2015 14:20:25 -0000

If a log data cannot be decoded to utf-8 or read then handle this
gracefully. This can happen if a log file contains binary or something
goes wrong with the file open process.

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 meta/classes/report-error.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 8b30422..5f155e3 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -47,9 +47,13 @@ python errorreport_handler () {
             taskdata['package'] = e.data.expand("${PF}")
             taskdata['task'] = task
             if log:
-                logFile = open(log, 'r')
-                taskdata['log'] = logFile.read()
-                logFile.close()
+                try:
+                    logFile = open(log, 'r')
+                    taskdata['log'] = logFile.read().decode('utf-8')
+                    logFile.close()
+                except:
+                    taskdata['log'] = "Unable to read log file"
+
             else:
                 taskdata['log'] = "No Log"
             jsondata = json.loads(errorreport_getdata(e))
-- 
2.1.0


