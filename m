Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id D9C4A60767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:59:23 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id g203so183433276iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 03:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Z/h7YOpqNxM1yRCtYgYrcWjS3k7qqohvJHIV4ddGSH8=;
	b=aXleo9p1WkQZvpXI73n0PCizAt6rBIIlEdhO+WWi3RLURY4gMeMbU3AsYQOn2yQyWm
	+VwWlTIUeU6V+eLcuoS0qsih93L6u0l5/FWBXzlaitrbHdJuV3eDj4JZRmKHuhA91TMG
	qy+0XWrWJpPvN/GiKKOs6YJ/0e0SulOHdMOflM0uxhR9TAL6jR+RBO1m8YC/6XT3vYoT
	gcXEy5jkaxSp3l6v76ZAZX/+BIQbrpvWN7c/hpL3xDdN8ctWgqPx1qoyghw+HMkwDN8k
	4mGlbWKI2Kf3XwOK1LSx4EyH3RxBzT4gmQjrK0nw1PhX7XllWuXqSMKMd7wy3NvNuRXz
	j9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z/h7YOpqNxM1yRCtYgYrcWjS3k7qqohvJHIV4ddGSH8=;
	b=bZq3+STwxHreX+JygyN2iUy4Xy0tWzHkbiWbUlysF9vuqnc6tQ0CuJ8hlbv+mR/gXB
	cTVpeBjJ86qZakanYJVBiEnWb2uFHbLGDzetSf7B4G9lFhOaJcI0sm2odrTw58PgH/MV
	Wg+baEZXs+6i1pG2CHn6flvWucKslqDy6HRrq2kK9Wix633OmzCzdYKHSTZ+D2swU+Ya
	hm1VfhaDSe4cJhbPVfJ8EHfuLSZkiDo/S8Kw5QLfgs+oT3s3N45pCqrAudIxO4ZlQJ3q
	K2bpfNAk/gfMgABuhiJAU9M44GnEw+Zg9S+DooFRflKfo6l1gEdPqGaa+cJqpmAd+wAP
	G0Fg==
X-Gm-Message-State: AG10YOTLiACJ3h8R2AsyI4c+Im2NUlU/x2QwvfwkDsiA672mp8/+flwkb5V4qVDqAJkfZd6V
X-Received: by 10.107.135.20 with SMTP id j20mr22188058iod.56.1456747164021;
	Mon, 29 Feb 2016 03:59:24 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A575EB.dip0.t-ipconnect.de.
	[87.165.117.235]) by smtp.gmail.com with ESMTPSA id
	y190sm10734651iod.14.2016.02.29.03.59.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 03:59:23 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 12:59:09 +0100
Message-Id: <1456747149-13508-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] combo-layer: handle empty commits during "init --history"
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
X-List-Received-Date: Mon, 29 Feb 2016 11:59:24 -0000

When importing the components during the "combo-layer init" with full
history and relocation into a destination directory, components with
empty commits were not handled because the "mv" command was invoked
with just one parameter.

Replacing that with a find/xargs pair avoids the problem and should
also fix the handling of filenames with special characters (in
particular spaces).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index f028098..09a53a2 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -380,7 +380,7 @@ tail -c +18 $tmpname | head -c -4
                             if not parent:
                                 parent = '.'
                             # May run outside of the current directory, so do not assume that .git exists.
-                            filter_branch.extend(['--tree-filter', 'mkdir -p .git/tmptree && mv $(ls -1 -a | grep -v -e ^.git$ -e ^.$ -e ^..$) .git/tmptree && mkdir -p %s && mv .git/tmptree %s' % (parent, dest_dir)])
+                            filter_branch.extend(['--tree-filter', 'mkdir -p .git/tmptree && find . -mindepth 1 -maxdepth 1 ! -name .git -print0 | xargs -0 -I SOURCE mv SOURCE .git/tmptree && mkdir -p %s && mv .git/tmptree %s' % (parent, dest_dir)])
                         filter_branch.append('HEAD')
                         runcmd(filter_branch)
                         runcmd('git update-ref -d refs/original/refs/heads/%s' % name)
-- 
2.1.4


