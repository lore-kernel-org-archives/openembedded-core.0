Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id E2073773CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:59:30 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id vy10so9448154pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WmvqrC70OFGQ2dep3XFVssonfNuQ0A15M3swZEb8WbE=;
	b=f0Zpw0gQTGTOJlJNo7VkSZ2fdNuMcqPC1cYOxkhbLp11OEJsf9aF/SoDGByjrYkFbu
	0b6LEJNVF9UQFltjxiOJJNXsarkBvYppxYw4TdVWKpyZHQEJijMNeOkV+mew7lw9Pdyp
	dT9rVChg4wwhbIIAJEXdseWEkcHF5KEb9ECZnmkZi8oj1wt7awyKUdgKGRxEL7+BBKW+
	F3N5DqVcVieL7GpsKZx2i3zlstN/IxR1QhyNWQKWQnJS93D3EZ4pTV6qzy50OJe4He29
	N2OptIGXb8Oox8Gw/7QvNwq8I2saAPpI4WA5dMeUgX/AOP7NZdJi/7ZAVjXj2CPCC/Xu
	uCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=WmvqrC70OFGQ2dep3XFVssonfNuQ0A15M3swZEb8WbE=;
	b=UpYWpkkh8jb6a1dfbJM66Tjdp0Q4/OPVxtRbQYOFB9saJigzfbuIuH5AHjZ1tcaZZY
	O9B3JMoo5p4WVxDAxbPUB0lxGJT/N8AcuMVXxMUIbfybOPb4uWGz5IQR6BdNXPHtGuzF
	sjDXnpcagFY44P4MBhvnlQTiyLBt4+ME++bRNLk0NnzvW0gmhEJybOBUfisRnOxBfCgR
	kBy65wgSROyhGhES1Ys9ufAhHNlWlgOwGckF3oSUYKR0ebLhty0HgPOHrVcLaMoyO62t
	BgmEkkUgOSzdckbI75rWm97yLhom3YASvb7wNbWYip+pgQw9dGlFR57a9wYaoXrfbkrA
	9jNA==
X-Gm-Message-State: AE9vXwMiMVAzSC4TbgV9zTI1+tKP7wjDyUY7+Lqy1LxjAixvjbDrwKh4QRCwUj43NvH2UA==
X-Received: by 10.67.23.70 with SMTP id hy6mr43134916pad.75.1473083971874;
	Mon, 05 Sep 2016 06:59:31 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	u1sm33982460pfu.12.2016.09.05.06.59.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:59:31 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:59:10 +0100
Message-Id: <dc7a6ed9ea99d08af5f2a5945caffb3b6e0fd12c.1473083836.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/4] runqemu: use glob rather than calling out to ls
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
X-List-Received-Date: Mon, 05 Sep 2016 13:59:31 -0000

Use the Python glob module to find files matching a pattern, rather
than calling out to ls and parsing the output.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 72c6352..1599848 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -528,11 +528,10 @@ class BaseConfig(object):
                 self.qemuboot = "%s/%s-%s.qemuboot.conf" % (deploy_dir_image,
                         self.rootfs, machine)
             else:
-                cmd = 'ls -t %s/*.qemuboot.conf' %  deploy_dir_image
-                logger.info('Running %s...' % cmd)
-                qbs = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+                import glob
+                qbs = glob.glob('%s/*.qemuboot.conf' %  deploy_dir_image)
                 if qbs:
-                    self.qemuboot = qbs.split()[0]
+                    self.qemuboot = qbs.split[0]
 
         if not os.path.exists(self.qemuboot):
             raise Exception("Failed to find <image>.qemuboot.conf!")
-- 
2.7.4


