Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DB30672FB0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 18:07:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id i13so3109615qtc.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 11:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Bb1exhBRlGeWoVGpLW2ZFGtmZdVPywsrHtT7VdQDw/g=;
	b=HSSJ5EkGOpVLeeLEN4W/DrFUt67aukaeEiaRvS+6XWYJZclX1eJR3TBRjlNoJl50wA
	nLzpDM+gwPQ6W3kMDGArNhMsbLHZm+7h7O611h1UaBuQmtgbAoWLjuOg2kCnKALtPxo9
	pY4GLPxITOUCizTDnrdU0V26WYFWgN7e8cWWoLFfP3GSzVZ1IeryT5z27F6sZeawby/Z
	CvNSisqh89B3MMrsy5QFUHftZNcG4deVAMr5tSlpfo+8luOBoIsM4xuCXCJpwKpab4QA
	bKYCmVwF8zdFFPvqLyjiyHiBqQFKVuSLxDpUALptMsrUUAaFZ4aZLQ20vMWOFeg8FR5e
	6/qw==
X-Gm-Message-State: AMCzsaXYNvWKocCoUhRlixQulm8/gw1LMIdivRCcd/jFnnlLFfhexuHz
	dp/l/MXQamfWOmTARZ0TMOTVDA==
X-Google-Smtp-Source: AOwi7QAmLtwV1jqLCC0bev2hfDT2eZ3bYdu1ehgkc8V3+oBvqR82ZfVBLg7dQPDlyCMhLFd63+Qwqw==
X-Received: by 10.200.19.193 with SMTP id i1mr2750375qtj.131.1506794834487;
	Sat, 30 Sep 2017 11:07:14 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	p64sm4335400qkb.47.2017.09.30.11.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Sep 2017 11:07:12 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Sat, 30 Sep 2017 15:07:04 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Sep 2017 15:06:55 -0300
Message-Id: <20170930180655.25134-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20170930180655.25134-1-otavio@ossystems.com.br>
References: <20170930180655.25134-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] lib/oe/package_manager.py (rpm): Allow use of non-signed feeds
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
X-List-Received-Date: Sat, 30 Sep 2017 18:07:14 -0000

When we wish to use the package feed for local development, it does
not uses GPG signed feeds by default but dnf does. We need to
configure the GPG signature check out so it works out of box.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/lib/oe/package_manager.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1501291657..51870c0609 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -551,7 +551,7 @@ class RpmPM(PackageManager):
         if self.d.getVar('PACKAGE_FEED_SIGN') == '1':
             gpg_opts += 'gpgkey=file://%s/pki/packagefeed-gpg/PACKAGEFEED-GPG-KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'), self.d.getVar('DISTRO_CODENAME'))
         else:
-            gpg_opts = ''
+            gpg_opts = 'gpgcheck=0\n'
 
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
-- 
2.14.2


