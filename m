Return-Path: <iwamatsu@nigauri.org>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4196560EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 05:45:55 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id g10so9306239pdj.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 22:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=uKmrn40df/Y1p2HY3OpnrroTTpoKoPvejN8oc87pLDE=;
	b=XukcI70FiXkFS2P/vuKfQPthlZMMyWPuGYa3dELo+JAEB3fkwo1usNZ/dQoo387Bcj
	fgcj4tj56g9zN7Evg511qiRe90Uf+YQuD3PkY9zKzlltk7WcCUYHYD6TJCWyFIxYhgMs
	xx3iP3O1/wu6yIRI4VFYD1f1PkcHpODcpwP8qrlyHrPs8RPO2m92IIsX9EYISOGQrivQ
	v1d+xz0Uas7GcGcUOtTiUV7fRq8j9mqTtU/3OTYJ/nfLXcwzU8iIHO04A4Q8e+QJOzGA
	mhnlOymW7mNmvwcsakqd5dnzF0ANftRhk9AyhpGFmnPWpbWv2IrjVt1F6RKURSDIiLci
	3NrA==
X-Gm-Message-State: ALoCoQkrEpdULXqLxwT8hb028Qomwtt569b/sxyI4RWnLtLmgoyzgtMYjwHAsVwjHkvVg2NOFQqB
X-Received: by 10.68.223.131 with SMTP id qu3mr6100476pbc.4.1379655956917;
	Thu, 19 Sep 2013 22:45:56 -0700 (PDT)
Received: from xps-iwamatsu.renesas.com (49.14.32.202.bf.2iij.net.
	[202.32.14.49]) by mx.google.com with ESMTPSA id
	ye1sm16451304pab.19.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 22:45:55 -0700 (PDT)
Sender: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 14:45:46 +0900
Message-Id: <1379655946-22508-1-git-send-email-nobuhiro.iwamatsu.yj@renesas.com>
X-Mailer: git-send-email 1.8.4.rc3
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
Subject: [PATCH][RFC] kernel.bbclass: unset LDFLAGS when run devshell in kernel recipe
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
X-List-Received-Date: Fri, 20 Sep 2013 05:45:56 -0000

When user runs devshell in kernel recipe and compiles kernel,
this will fail by unrecognized option of LD.

----
$ make
...
arm-poky-linux-gnueabi-ld: unrecognized option '-Wl,-O1'
arm-poky-linux-gnueabi-ld: use the --help option for usage information
----

This set to empty LDFLAGS when user runs the devshell, and solve this problem.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
---
 meta/classes/kernel.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 8cf66ce..0bf39e6 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -145,6 +145,11 @@ do_bundle_initramfs () {
 	fi
 }
 do_bundle_initramfs[nostamp] = "1"
+
+python do_devshell_prepend () {
+    os.environ["LDFLAGS"] = ''
+}
+
 addtask bundle_initramfs after do_compile
 
 kernel_do_compile() {
-- 
1.7.9.5


