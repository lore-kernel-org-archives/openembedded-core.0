Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id E3B6F7FDA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 16:00:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y206so5828652pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 08:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6A2GdUKIpJUnY1JrZ0fhucnm89CqvsL5MZei6drO4Sg=;
	b=bX1CmdYFB5ZpS/FGUzp5qRgonsDT4ozsq4ps1xSP+NX1CjJpDHMd8narQkHH6MWxd6
	CJMldEyWCIGEk5U30c+aTfHzVGOl/FGZS2SZhvtT4ei/v201fiGCPV+h4GPiusbfmE1r
	ACKJugTxdk3cW6ZCwCbvGtlga43kbWah+xwGqNAcT86siWlG67zxCQBHvzfp6SW4yg48
	Ohq8BsQZtmEylhG5UuxM0AlwtoDaL1IZkB1b6ohx+oloB7H+/hbp4VjN9X7UIAYOS/n3
	6adVWOlO5HaCcSv193rPNLp6UTrrNXgbsCU7yc64KZGGKfuN52B8KT105ErtfVZ6vG1J
	nPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6A2GdUKIpJUnY1JrZ0fhucnm89CqvsL5MZei6drO4Sg=;
	b=O8/Y/nfiOWRoVgvPxfINnYu8dj3jUjPeOhVfOJ2LzT1sg15uH44X7xnmflot06wl2/
	mmTWWNSrnZXS71XCL6NdM7kT0WuSBsC5TyxIE4j7US/2UOM11q4ycXcd90Ibd6/igoW0
	6C5sLqbLGRU/xKGjJsrR/GIwWHhpXzs8S3pp1ptemHY2hlU6ZGk3i5AxnelPlSfkFQEh
	K/bz/sUVX6rAnh25LcpJFgBlPQGDi/FjSMDbClZnIJoBKjU9RWSzG/LC/knF8AOcvDKW
	fJ0/ylByJiqQowt1jg6u4O32hFeQ8S1yDqOZRXRXOm04InY7YzokUvw6GopXpvonCpCJ
	OT2A==
X-Gm-Message-State: APjAAAX98YKTsGL+4j4Id7IWpiuzIbyN8a1HBQe2unwLoaeZJD/5Fze+
	TQzQ7HC8xgCrQg9wMP0tGnhH7MP2hYU=
X-Google-Smtp-Source: APXvYqyJKtRWFRHHHY3hX6rny+mjSc4kxmjP+N0+/uI37YuKF1HkgsmuCl5EP4Cgzm0shjG1Bz2Zxw==
X-Received: by 2002:a63:d442:: with SMTP id i2mr19646641pgj.349.1576512021851; 
	Mon, 16 Dec 2019 08:00:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e5c5:31c9:a010:f145])
	by smtp.gmail.com with ESMTPSA id
	g6sm19568697pjl.25.2019.12.16.08.00.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Dec 2019 08:00:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Dec 2019 08:00:00 -0800
Message-Id: <091a35cfbd2f3e82a7783ba9c8fd5586433ba59f.1576511913.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1576511913.git.akuster808@gmail.com>
References: <cover.1576511913.git.akuster808@gmail.com>
Subject: [thud 10/18] cve-update-db-native: don't refresh more than once an hour
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
X-List-Received-Date: Mon, 16 Dec 2019 16:00:21 -0000

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


