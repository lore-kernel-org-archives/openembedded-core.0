Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id EDB2576651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 15:01:49 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id o80so199906104wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 08:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DqxvQsCt5mbJPOPvsBWjHl1c8P1TcZYR7wgqYqDo9N8=;
	b=m42KX3qZnWquYDqRvYBSHOe7epb9U/8pYZgivtXHOvNjWB5KYlFtALbiUQ7PdC7WL/
	MnEXqdXCrtMN/ZQ5oT933fh07BHkY51JsMTc/xZh7A2r8OJRqwd/HXHKarmWlsjI+L2h
	BzGbCoImk9Lf/4cvSr0g/bhMM7/ZZNAsawdcfhuRTWsjSNhFxXmJpiX72XTUaxhB42/N
	7ADp9bdvi2s8wLzfW/RlryxQ7fK/o5WNkS3LSGPaH4owapG84qu5tMDa/0HjXLbz6hcs
	Pbp6qEnSA1Wbt1XXud5Q1DCNXMyMCGnam3bHLeyHm+zk/hb8VoHd2VdOBuX9X5bt0rOB
	wIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DqxvQsCt5mbJPOPvsBWjHl1c8P1TcZYR7wgqYqDo9N8=;
	b=O/fERFRCQ/TqMTdYsI+yolAX8NSeS2Hd0TlDzA8dI7v3J9yPmqVaoZObenmCrxz1sA
	S8xN/E6rmkMrtouB3FKV6MROq5SwfWFKjdkK+TtqPTYPCO/pnOPgyz828JP3Z7y9ofPU
	fQMtUBWZ7phT0pTlX63nR6KzlM0zavWRzPQQtOCgop+cLGJHCoccReHWZtmnAtG9mGhA
	uMQVe3WPWOqnvKzpfpzQztk7bFqHWDfjlFQCcRhMtFkeZWF4YaH28NKfVpYvmT0vVtr6
	SXjlen95AYimiAhuBGVbdCbZXTw2zw76E/lrwhDR9kspv//fNcwgxWFn24dJm5yyHeIt
	R9LA==
X-Gm-Message-State: AEkooutF6SiUGEYMLZCPSOFBN0j3IIqhmX015MO0ipVmiwjojvocLZSV/LPhcH5+6pVltMZi
X-Received: by 10.28.152.5 with SMTP id a5mr19674429wme.76.1471964509304;
	Tue, 23 Aug 2016 08:01:49 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id a2sm4257907wjg.46.2016.08.23.08.01.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Aug 2016 08:01:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 16:01:26 +0100
Message-Id: <1471964486-27814-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] utils: check_app_exists: strip whitespace from binary when searching
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
X-List-Received-Date: Tue, 23 Aug 2016 15:01:51 -0000

It's possible that the binary to be searched for contains whitespace which will
cause the search to fail, so strip any whitespace before looking.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/utils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index ce639b2..59ace44 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -303,7 +303,7 @@ hardlinkdir () {
 
 
 def check_app_exists(app, d):
-    app = d.expand(app)
+    app = d.expand(app).strip()
     path = d.getVar('PATH', d, True)
     return bool(bb.utils.which(path, app))
 
-- 
2.8.1


