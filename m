Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3051B6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 19:11:39 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id l9so2310616oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+opH4jAHRodJdezEHAGZVOpIHH/2Mdxs+uxvBeNkOIQ=;
	b=u6LShfsmTPOd7+9kjcE5xsqhVFIsIe0talW4L/jh35ddfYz5Zt3eCbdM8e29Jfvx36
	LvH0i2Botfdnwg7zIdXVl/GJA5cS+Vqp7fOA14O7HeobogGbSpsqfmKUcQiaUAUs7S8S
	cLxwAsHCLa7sYAg8qoq8DK2ulbOUYKLLKKy0iz5tNom2cFX/drfD5Q+h/0Gfym0xQAEE
	SEpbof7fdZZDuN4WigOU/pc3pF9hJd1HV9jx/9QWrXEQmZB7Ko+VhEZLpHOOJw5lj4KQ
	d/lbc1Hj3QI/SPGCZx3KZbRFH7+riYlO+y3RdOOP29mB1mp+GD1m6iAjav7xLledmYj4
	goTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+opH4jAHRodJdezEHAGZVOpIHH/2Mdxs+uxvBeNkOIQ=;
	b=TtQFPMTl2RMbJW4eY0O66oyNCqVbP+jP7BQIEtIoD7/5AwT3gJH3GTZMF8zwhIXj5D
	FzRF1nvTuBp/klGIRPma8noW0ekgeerlzIE6wAt4fxPR+xyrHhy2WaTiMdwK4m6NQNXK
	IXt6QjqNbmbONcA6AabJIAQ+2WdQmhQ8P3RJ4S5xvIYplL25mxyHpCmnbGExhzwR0KZB
	32dNdvubPwi//1gyM3Hq6msz4C5GJwNU5ZQ+XIsNqj6VM4wzm15HG1XIFX2UqU0N8vx/
	kCSWv1pqw6Wq+lgPdApkM4XibW1uZ/7SZ8LwvBuNTmM/pdtRIo7PwFMe6Y6jjYKoOKOo
	gW0w==
X-Gm-Message-State: ALyK8tIuiz1cU5RFX5LvIGDDFtm+9tuAAHZn7gFW3nKaLVDXawfu8JiUl++TWAraM1EfpQ==
X-Received: by 10.157.16.35 with SMTP id h32mr2505800ote.147.1468350700063;
	Tue, 12 Jul 2016 12:11:40 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	o126sm742805oia.15.2016.07.12.12.11.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Jul 2016 12:11:39 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 14:10:54 -0500
Message-Id: <1468350654-14702-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH] useradd-staticids: use map() instead of imap()
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
X-List-Received-Date: Tue, 12 Jul 2016 19:11:40 -0000

In Python3 the itertools module's imap function has been migrated to the
globalname space as map(). Calling itertools.imap() will fail because it
no longer exists.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/useradd-staticids.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
index b6e498c..149245b 100644
--- a/meta/classes/useradd-staticids.bbclass
+++ b/meta/classes/useradd-staticids.bbclass
@@ -43,7 +43,7 @@ def update_useradd_static_config(d):
                         if fields[0] not in id_table:
                             id_table[fields[0]] = fields
                         else:
-                            id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
+                            id_table[fields[0]] = list(map(lambda x, y: x or y, fields, id_table[fields[0]]))
             except IOError as e:
                 if e.errno == errno.ENOENT:
                     pass
-- 
2.8.0


