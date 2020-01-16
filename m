Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0357D7F98C
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:21:03 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s21so8449637plr.7
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AKyNacUS+XgkRG9XiFnuUehBY1DxencWsg633JhesCg=;
	b=KwDyg1oOngiOg5/OjzSO2tcSxZVoYh3SANw5wYUQRuzO0z5BGwjKAEd942ZWqNh9tc
	Mym1Lg0W/WGHe1rd+fncEQpngWwz7rctgpM3IsoNwFTYO1qjAyg+IFGi8tEWqp0V5E3U
	pPbugDYorraI6Pqo6y/kcGUFAhqR2LtDJJTknHut9bbzf+gcd/xQKwBjoLVofsucwXi3
	n7Qocx6wJVV/OTu5t+kMY/d3pyvEYIHS09J6oCiEfhhlPhEUmPZ0ped9mOBBkq2KqmIx
	NWjjbPa5ZRXl+pRCHGBMV7ttnaSHMljtk2EI40VyORGz1AhLZ/ZFio5popeQSzl0tyo3
	JVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AKyNacUS+XgkRG9XiFnuUehBY1DxencWsg633JhesCg=;
	b=RbAoaI6KkpJhLDA4FYB2zEmN+10kQnt1/toLuQuRXHVZSWU29dd9vK0JSSSRa/Oj5B
	KQxd0EbQEE5l/xr8AGIEtkhFcoPp6C17KXuiMbwrfUnidm/8Pbn0cE2/3RhgX0it+gAj
	4+Th4ps8+k8PWxQolZqJT2euxQoP2zYCDGOsRE6CcOK62N5IPXDeRQIShBBFlS/q2t3k
	2BbOFZd1jvnYGI7NpNY2Me/FV/canJfm22Urh4EB8iKrI7PKJCmuhDcF/ABXGlqEHx3w
	LCv+SX2vvnIf+rEttjwTKwyidzR0B/IpNdykS9saFcprjuMr0A/Ys1INemMvoRcl0rN+
	iTzA==
X-Gm-Message-State: APjAAAVka7fLR9zh2XxMpXxauOaFaXYapl9GlVGCmjT2V8MmmAUk7f0b
	pu9pxfKRlzNJP4UzC86xKJOeKs93
X-Google-Smtp-Source: APXvYqzO9ORIjRJzKTjE+DwrY/HRUlnAjM0NWTRx86m+x5ZxmbOog3ivoC6rJtu7jgYAubBGn5Dtyw==
X-Received: by 2002:a17:902:7896:: with SMTP id
	q22mr4471430pll.57.1579188064995; 
	Thu, 16 Jan 2020 07:21:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.21.04
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:21:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:30 -0800
Message-Id: <fd16e1bb582d3135411e2e3dad46731114d2b955.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 21/32] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Thu, 16 Jan 2020 15:21:04 -0000

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


