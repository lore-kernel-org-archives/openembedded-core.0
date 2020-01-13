Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 720FD7FCA5
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:51 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id b137so4865519pga.6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AKyNacUS+XgkRG9XiFnuUehBY1DxencWsg633JhesCg=;
	b=o52hF/jZDWs3CL6DIabP4Sb9wTgOU1Lk+IGIXphyMCAkSKr/dx2zA3b7/3+k6ggGHL
	fW5DV7LYf8xaVO9Kx4/ntjM8dWhCj2Y9z1qDmSaaaWvnFGRcvDn2txE2VTphPqi8to4U
	ZzMcsKI8U0dEcAxuAv7ivv3qEn5rfzqvKGNdXwuxTzS6klaVSMJ4zZuxKIm/0exjIxci
	6qEvu/XKJsxeMI631qzImIFSsFUBTl3zWsWSa2JOW0ASJ/ox/a9C67UPVbtOJmoveid2
	9t39wbbw+RMaCnklmyCkKiL4n+GPqz+tZrH0blJBUkInCgDbqrRaW01BzDWcPf+xGsXQ
	QQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AKyNacUS+XgkRG9XiFnuUehBY1DxencWsg633JhesCg=;
	b=NJZYHIh4aT91FrUrVVBajy6e4F8Zx1NCIi7ZPO8Agz8AYSPRWrmEMx+QPtWGOZ0OJk
	LhrlzJSzvJZhZbXaVxyD6Ef1EiZYlyx6PyD+5TSfSepPnUwvQX9dj/wP8nJd5/Q+AHvZ
	jQk4Pm1o0oyoEhXnAmakJB6dT39gg0Z7aOHkZi/KT62K2X7873W/Sj7ti89eNS2NcFLs
	umoqHHMzGJapKtoegMlY/xBHY5Nm3QsmqBr1k1pDr44zj4e8idib2NZ5o0xjYfxLIFk8
	t0azmb/oJCmWMOaNt2jRUYukf9/i9A5xrtWlz+4q0b8AZ776wAojxu+6CpN6h1Bmwxuy
	GNcw==
X-Gm-Message-State: APjAAAVJsW13RRj62wUlr8zDdwfSOir2IJW6rsebDWBbXzrVm6//jlwC
	tHdP4PjcACblZ8Hy7FoGtyMrWHGL
X-Google-Smtp-Source: APXvYqy2ewF06I3W7AdRbOiuhPFnqhO6puorV4L+3l6qFifAUWLqhJvYuafYtHJnQE+0gx7myPH1vw==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr21023745pgv.55.1578929452275;
	Mon, 13 Jan 2020 07:30:52 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:16 -0800
Message-Id: <fd16e1bb582d3135411e2e3dad46731114d2b955.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 17/28] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Mon, 13 Jan 2020 15:30:51 -0000

From: Ross Burton <ross.burton@intel.com>

We already fetch the yearly CVE metadata and check that for updates before
downloading the full data, but we can speed up CVE checking further by only
checking the CVE metadata once an hour.

(From OE-Core rev: 50d898fd360c58fe85460517d965f62b7654771a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2c427a5884..19875a49b1 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -31,8 +31,16 @@ python do_populate_cve_db() {
     db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
     db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
-    proxy = d.getVar("https_proxy")
 
+    # Don't refresh the database more than once an hour
+    try:
+        import time
+        if time.time() - os.path.getmtime(db_file) < (60*60):
+            return
+    except OSError:
+        pass
+
+    proxy = d.getVar("https_proxy")
     if proxy:
         # instantiate an opener but do not install it as the global
         # opener unless if we're really sure it's applicable for all
-- 
2.17.1


