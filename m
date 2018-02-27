Return-Path: <matt@madison.systems>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 752F87870D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 12:37:00 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id y26so7452341pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 04:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pdBLBmzuZkE7M8nTg3LTdg5aeKHasLfYCvgbnn02NVc=;
	b=tqHJ1+guJ0mdPEmhWgP4qqcsnJsnmuwspkY+zH7jX3FkPjTDCQh+J1p5S0B/UOvfFd
	+xIpTugE8uuQDEQ1y0zd0pjZu3CfE5MrgXKZ1kuVeMPzgpesPHI6ddziC6hMhqIyR4rI
	jnv1Lc+VXCsiS7Q3QZVeoDZt/MCy47X7ZJ0f7V+pYETbD1jZyzQatGgkwkRxQM0IJ3Tq
	JXzh2xKdaC92fR410TdoWmYVlZT4Js7tH+ibg05pIJRVUpVDz5vJJg2jZ/ZJpAgp844M
	cVbSc76wLbLmUomBCTptHnzx3SW5PfEZJUes0LPaVezJGAmNTPu9u+sLYCZrec+HJkkr
	yYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pdBLBmzuZkE7M8nTg3LTdg5aeKHasLfYCvgbnn02NVc=;
	b=fzEkcl/wZEfnBoqqXt9ZTuk/0nZQX33oRH/R3dmG0JBggFsb2KZX25ROTn24nWAL/b
	jR4sscV20ocQi3bvi7ijBLwql/iThgYE94A/okddh0m0o57T3QlkIK733Jnzeed2Gpty
	l9fL4m+mJeQYBfRjcOu86aP4kXwV0Ihm/ch9SRIKF4qw7cPhdp+m98UwHidCUByCMJy8
	YuC63w1EZo/NUR/VUATCTjjsDTz+il9aaIiOi2kBHtXgd3zYhXe52U1Qhv7ez7IQoT8w
	aVZUFvOfVWyzHW6itCsiTtqtGIYAn+mVhr9TqxgJUnWA4CyXuwuG5ZFjt/3yQIdaV8Fw
	03kA==
X-Gm-Message-State: APf1xPC0MU+Wy+N06neVycn/c5z+x36Qv7+PsJSivBS9EDo5/pB0fgH5
	aoYY6/auj+ERGXzYHD1zqnIrSQps
X-Google-Smtp-Source: AH8x225dqpMEvXy8JGd6VUmbHj8l/eqZpp2NzC1HTTb3kaz+Nu8PHxiQTTr3vbiZmLSn9UwrPLGJFA==
X-Received: by 10.99.148.17 with SMTP id m17mr11179283pge.367.1519735021302;
	Tue, 27 Feb 2018 04:37:01 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	o82sm1596760pfj.163.2018.02.27.04.36.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 04:37:00 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Feb 2018 04:36:31 -0800
Message-Id: <20180227123634.2812-6-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Subject: [PATCH v2 5/8] go.bbclass: don't stage test data with sources
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
X-List-Received-Date: Tue, 27 Feb 2018 12:37:00 -0000

Any directory in a Go package's source tree called
'testdata' contains test data, and isn't necessary
for building.

Some packages include ELF files and other binaries
as test data, and staging them in the sysroot and
-dev package leads to unnecessary QA warnings.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a20d2dc0a7..cd3d9d5bfb 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -108,7 +108,7 @@ do_compile_ptest_base[dirs] =+ "${GOTMPDIR}"
 
 go_do_install() {
 	install -d ${D}${libdir}/go/src/${GO_IMPORT}
-	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' . | \
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs --exclude '*.test' --exclude 'testdata' . | \
 		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
 	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
-- 
2.14.1


