Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7FCA77C37F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 07:51:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so12743253wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4pK/+r5OX2pg+IBKZpmkyLIdGu3ZQQJm4GcSdccG578=;
	b=puQmg4Y0rz2okH4tywgvOOwaImdTnXo4yF/Vd6PFtw9gnUB8PgTo1zqzit2PmNNoKw
	jkMQTzY6jzignQ3B68d3x7sZmrbBJJRkIkm/TdkwecJ+UtWqEE71f21xFbgiyKU/qjid
	pNUQaJ9uR4a25igUKvm9SzI7/1cuDw3xT5Jkuvp++CQ5V9GhcUhAbAGBn+1xKxTGC43Z
	ukWm+2zw7sXOi/PbkaRJgOx1JUqJJq3bjaE4cN/u/xiIcQQyw3nEScUoFWYrUmNDNC6T
	CwRcYISK+243Hzzrj8sy/lHOQSO2TPGpLgZ2Lu0XCpnyHFhzLkuKz2KMztgpaI5tP1pc
	8dvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4pK/+r5OX2pg+IBKZpmkyLIdGu3ZQQJm4GcSdccG578=;
	b=scmcczYiVlmoP4BoAtG+/rVUKWr8Fud5SJ4yoSYnbTK2rwDz/j8GktvBw6TebEPJTb
	h4jg8icwzGnANaXa9H/YLMuQTH9O0ozgwIIoRQ8gCY3o5to4nZwPLzpRuXTCQ7rJTOhD
	BmgfBXk7sxU0MbvRzXAp9TJ+R8QleyXjLVtJyICZhZfkCiGIriUAWW/in41uE99pqaaF
	ciowPSXSUh2L06ZosJN29gWKZ9nOSDqEjJ70gf1ptD71kVCyrXXSJh8CrMWhjUGlzsOX
	PPHUJ0qou8imqGHD31z2LPw+imGvZbVA8jlkYZPUg9hEO6Bv+Wa8e+cTNBYoQqSEiqRY
	yxRA==
X-Gm-Message-State: APjAAAUSjmb3aqSzs0kf+ZWybAmOeN8gZsgqjUie33rnD/fZoliAfyTS
	9kFw+uIjL/RwWCtZ/B1aM4sQbnJ9
X-Google-Smtp-Source: APXvYqwm3ubzcg6xHwgo1pDjOrN4fQoSWexYZjhOOUj3eOAXqqqHESzgWMyUs65Q9crm1wx4udADuQ==
X-Received: by 2002:a5d:4909:: with SMTP id x9mr14052167wrq.226.1560844287991; 
	Tue, 18 Jun 2019 00:51:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	34sm13114314wre.32.2019.06.18.00.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 18 Jun 2019 00:51:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 07:51:31 +0000
Message-Id: <20190618075131.26099-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] buildhistory: show time spent writting buildhistory
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
X-List-Received-Date: Tue, 18 Jun 2019 07:51:27 -0000

* especially when pushing longer history to slow remote git server or when
  it timeouts during the push, it's useful to see where the time was actually
  spent

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 34709f3f88..e4e1897318 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -841,11 +841,15 @@ python buildhistory_eventhandler() {
             if e.data.getVar("BUILDHISTORY_COMMIT") == "1":
                 bb.note("Writing buildhistory")
                 bb.build.exec_func("buildhistory_write_sigs", d)
+                import time
+                start=time.time()
                 localdata = bb.data.createCopy(e.data)
                 localdata.setVar('BUILDHISTORY_BUILD_FAILURES', str(e._failures))
                 interrupted = getattr(e, '_interrupted', 0)
                 localdata.setVar('BUILDHISTORY_BUILD_INTERRUPTED', str(interrupted))
                 bb.build.exec_func("buildhistory_commit", localdata)
+                stop=time.time()
+                bb.note("Writing buildhistory took: %s seconds" % round(stop-start))
             else:
                 bb.note("No commit since BUILDHISTORY_COMMIT != '1'")
 }
-- 
2.17.1


