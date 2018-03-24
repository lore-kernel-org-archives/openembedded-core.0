Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id EFFBD788AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 04:55:20 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 68so5512111pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 21:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KW6c9U+D4mod/4zbI45v3Km2z0nwSw+qAd7UmdbVtFQ=;
	b=Igrq3W8vg4xHH5coFg1WSaeQQ2kCGFrG5bV/nj3jyh8/Gj9Gktl1KOLxcAQ1SxpsFe
	uB1oDBjWIRpLrBfx4lotGVg3llq1FmFnN5F5d8H2Tkt6rd7q6LGJLyCnihgatYobQDwe
	/0ts6ik0EXNmIiSeKWX+ily1erGZkAAdQ0YzC1xLqexOjFlYdd8Q5P6TPxUO/PQlcHxX
	QQdOhNdhiPo3PphI+4ZZcdngxCvRDgHbP6yrDZmLYwppHQ6Ycg/HkxN/I+XCNdMVetu2
	u5mtsFCvcDvGn/RfTpf/043hGLVUwHOr8xdduJ6gSMigkgBJpYk541fQ7CKwvwU2tXVi
	j1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KW6c9U+D4mod/4zbI45v3Km2z0nwSw+qAd7UmdbVtFQ=;
	b=i/8n0yQekMMKkWz4y6CqdUT6txykZCA7dOdWz5I+5E1ty/LAQEekmEhnGVAWssC0Og
	6tdJhQVECWxywsW3kEMEoceKq9ImmT2mfAuKegfI2G5FMcUEuzG/CIYqPX8o1iNd8Xtk
	8zVSbdqknr5g99TNZv04ttMktxoMxcvyL/YIaE527oIszepFB10GSu+JDRlYtwYgXZEP
	KbHMRVpiLyOJ7l2OPFjKS0cDOmOke2KyQgG/tbOa9KaQJYsi2Uw3mOths0nGxCxWN4xz
	pIeLr+qUkVfRcl2UCOJkU/eYfHFImITVEVUkA2jrz9wKg+SC1s4Lk8rbT4PcRY63Yx/Y
	uKWQ==
X-Gm-Message-State: AElRT7FnUr6vmPLx7dQyK8XQHLj2ru3Cironc1oSdwZCf6wwo9XCklCm
	iPjmIsKwuit/C/guhk7Vx7oDkg==
X-Google-Smtp-Source: AG47ELvaYjxCwyJIqgAFAhxrPC4HkWocZFYyuFnQtq5ibN5E0KvCLBXQW2VeQNpZvO5B6D14i4bu8g==
X-Received: by 10.98.54.65 with SMTP id d62mr23612795pfa.52.1521867321713;
	Fri, 23 Mar 2018 21:55:21 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	t66sm20685699pgc.0.2018.03.23.21.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Mar 2018 21:55:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 21:55:13 -0700
Message-Id: <1521867314-1511-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] sanity.bbclass: quote path passed to stat in get_filesystem_id()
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
X-List-Received-Date: Sat, 24 Mar 2018 04:55:21 -0000

Although get_filesystem_id() is a private API and never gets passed
a path containing spaces or other special characters, etc, quote the
path anyway for consistency.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 6716985..e0e57ce 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -336,7 +336,7 @@ def check_path_length(filepath, pathname, limit):
     return ""
 
 def get_filesystem_id(path):
-    status, result = oe.utils.getstatusoutput("stat -f -c '%s' %s" % ("%t", path))
+    status, result = oe.utils.getstatusoutput("stat -f -c '%s' '%s'" % ("%t", path))
     if status == 0:
         return result
     else:
-- 
1.9.1


