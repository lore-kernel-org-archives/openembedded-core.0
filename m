Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id AB1737FC0D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:50:46 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k1so6114160pgg.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=m6WXuYliFc4NAHX2pyjpHeXX0Z/MRv1j6x95jeDeZpA=;
	b=gRjC1nKdRAlHj73gON4UkbXErDXPIqJL+ummzwaZPmSCZR6xloZA0ytLKq6n9KZGXv
	HzMLS8Q11xzxVY9JfM1GeGkRGhXnU95cwM9U5yghbFklvXfQEpVFza8YAypcTpnRfk+C
	vRym+ZGTG2fk5mQX2bjB74OPpJ58dIbfw53b8OmAz9tNMDj7K1kawUXiUsBia0TFQwxY
	RAYw2rnNx/V3Zw+3RaLTb80LC+hEO457zg3/l/e7FOIU2nGQYKgsgwh0XG+Z9Dep0Jss
	i2klR7c+WT8lEBkNz9wa4kOtjQ63zL2b8+HAtMkiXTrpgWrRAInJhUcTyVRatOKwnD0t
	kLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=m6WXuYliFc4NAHX2pyjpHeXX0Z/MRv1j6x95jeDeZpA=;
	b=qe0608AQ7s07Wrjkyl9dLnf4Ck3R2vqBWLw8vQVUst7slq9zda3Kb3U8n7z2PUlYch
	wjOhDuHCaFk7DqcNOn+EHJKJm9HhE+drSphKxSFblrzr1YDw0RozWAZ2+pz3gg2UHjm4
	c2yi4HMvauZ4c0xF588w9lsnUJfQsGZav3mR/TQ+rSIVeWe6fVxIAljf1JK/p46iN87S
	oieBD7GRUFOIVYyjLEh9baHh5y7pewImK2l0nFmzVj0shQsqSWyaMf5LMk7/ojCoJBff
	UKgeINaFXuiosXiau2YQYSb6ZaPXImvE7zzjMAQOYHuo5C/TcitZy4M/IthaU46UfivM
	k+KA==
X-Gm-Message-State: APjAAAX3A8APSFMJ+J8bf8jwlU4dwVy783zGoHXFZsOc/uHW0GI+WxqH
	pPinshCoyM0mohm2Qbv5MC7Z0GrX
X-Google-Smtp-Source: APXvYqz0hLB7nYbDR4G20daFWeChqjAQ5xdgvtq5GhCnSY1qlX89y3jdp5FRPM29G9W3ruHEVWcA5g==
X-Received: by 2002:a65:46c1:: with SMTP id n1mr29562432pgr.257.1574639447592; 
	Sun, 24 Nov 2019 15:50:47 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.50.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:50:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:09 -0800
Message-Id: <12300501f410c3d1e3c48f1c568ce4098cd3ef5a.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 04/35] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Sun, 24 Nov 2019 23:50:46 -0000

From: Ross Burton <ross.burton@intel.com>

We already fetch the yearly CVE metadata and check that for updates before
downloading the full data, but we can speed up CVE checking further by only
checking the CVE metadata once an hour.

(From OE-Core rev: 50d898fd360c58fe85460517d965f62b7654771a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 2c427a5..19875a4 100644
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
2.7.4


