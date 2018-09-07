Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id C6C61797AD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 11:40:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t25-v6so14291507wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 04:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5XUzxqS6PDTIarqxVApmHB/fFt3NtZZTpuvt+sMgWq4=;
	b=fP5dmLsYc/siUHyeiUkLmHXJeR9rBmQKQA1PaXIpEPXFUsTbKni3NwuEV58iSvjTrV
	ie4CKmJJRwCmVOoPjyM+I2FxWq5VigiF6TVuWgj8xwFFztyB6oSNlkInbjJj8VL8VGbs
	BP0kiYgjmrfMTubRag/WzdHc4CKlzIqwkRj5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5XUzxqS6PDTIarqxVApmHB/fFt3NtZZTpuvt+sMgWq4=;
	b=KvQXFSIvedV6gKvkeFi/THzn96ChLmsM3gHwuI2Ls7heObjHpvNCSNxA3HoXBdmSW1
	Db32pRq3RRV/yBI3UJZY8YrysP8q9loHGl+xvTVpgj3NH4EKTBcvFb51wWYDkWaeHD4Q
	tcUTcnx3bk1ZV/EJLE6t059KnsADj1jIcbEynVVXga7bn4wsBzRz1pqzJqeWmrXlV97M
	eG5a16jCdz7YjO/RmovAPZywDqy2P+WUbmmmLTbyHIj+CzOWl5kKBvaKpbOdWnhmwtB8
	Im7DCzQYl6tAJJ4LG5zwBFhuQMLr6OEguTGQarD1iEjhK11OxykcG+7Xge8zfeS0zbw/
	J1jw==
X-Gm-Message-State: APzg51BYTNCyJFsj72PL0grBgtepM8h2fmBl6+2z06UmL3MifPzxmQQg
	+AIJjvyjY3AEIIjPGvEoh1/9usw6qCo=
X-Google-Smtp-Source: ANB0VdYdZe5OuUhiApn3rKDumIn0HDgscs6jQI1IjJscC7kQe6DP6qu/oNXMY4lFBIF7D2wDCdfFZw==
X-Received: by 2002:a1c:b213:: with SMTP id
	b19-v6mr4829290wmf.141.1536320442235; 
	Fri, 07 Sep 2018 04:40:42 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g7-v6sm6642694wrw.30.2018.09.07.04.40.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 04:40:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2018 12:40:35 +0100
Message-Id: <20180907114036.16685-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180907114036.16685-1-richard.purdie@linuxfoundation.org>
References: <20180907114036.16685-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] staging: Fix broken debug code
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
X-List-Received-Date: Fri, 07 Sep 2018 11:40:42 -0000

The code currently only prints a single depchain due to overwriting data
instead of appending. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index a1e4cf70900..84e13bab592 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -301,7 +301,7 @@ python extend_recipe_sysroot() {
         data = ""
         for dep in deptree:
             deps = "    " + "\n    ".join(deptree[dep][3]) + "\n"
-            data = "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
+            data = data + "%s:\n  %s\n  %s\n%s  %s\n  %s\n" % (deptree[dep][0], deptree[dep][1], deptree[dep][2], deps, deptree[dep][4], deptree[dep][5])
         return data
 
     #bb.note("Full dep tree is:\n%s" % print_dep_tree(taskdepdata))
-- 
2.17.1


