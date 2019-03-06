Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A59D7CD9A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 18:41:55 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n19so6925177wmi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 10:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YrUL4mV/sAzpjceCfR5jgMW6jZSvfvFDF59U/dFDL5w=;
	b=LkcfK5+KP/mh5VCV/MOocjvXb6VvISARkuNdqx3N5pKPfe+vKdutNqphGKPWuzJsVn
	l66b+PjoHtVHHGACjSkHWSlOmyDUNgVpM+FsA9m1gpiSqeSvnEe93zi0xoaj5mjBF6E2
	NoplcXPb0D9levNBO59nVvdqqCLCCPenPJLu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YrUL4mV/sAzpjceCfR5jgMW6jZSvfvFDF59U/dFDL5w=;
	b=Nq93KXmEQ11/a/UvgKcUyQUPIp9eZt7YHdv+Q1KFwr2fdjxNKx1TtRT0wjChiYn0Fd
	TM6kdJSZH96RM09AsE1iy8NhGhAgz//i7hxIdLCPLCZbGTb4RWlxbAgnp1VMKTztR43l
	wS0N2G8lc7RUPgEb4jWMI8BXUL45TwsHcnlT8UNw0et2sWsEfbV8JIcdfEkbcS3Ddqvo
	4Yj3qYczT3ZE+N6skhKYRr9rgaSWY5oFzig1R44iyRUwg4kphsa0CroedWnMGflaOXNg
	gcvlix8JMyzq7MIlsyutLebrKkq7CFcCXmQjMs6ojzWgx2FFKxmwHAnUBjED4gH2AboJ
	U79Q==
X-Gm-Message-State: APjAAAXGHiDCkizpsj3AsfqTkyGlYiiWsvHruoT0AqPX9mb+LWwZ2s8u
	QbNA96lesDstMC/bWFPFDWaJFSaOG1o=
X-Google-Smtp-Source: APXvYqzYYm0tw2ZNDCZjRwsC3kKyh5nsc7m15eoLZTRoK7dbQXftgXNRHqpt5iN6mJ+DTSDGYKrneg==
X-Received: by 2002:a1c:9694:: with SMTP id y142mr3183375wmd.98.1551897715444; 
	Wed, 06 Mar 2019 10:41:55 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p12sm3448558wrt.4.2019.03.06.10.41.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 10:41:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 18:41:54 +0000
Message-Id: <20190306184154.11337-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] scripts: Add oe-pylint
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
X-List-Received-Date: Wed, 06 Mar 2019 18:41:55 -0000
Content-Transfer-Encoding: 8bit

Add an oe-pylint wrapper around pylint3 to run static analysis on our python
codebase. For now display errors and exclude common warnings which are not
applicable to our codebase.

The aim is to start generating this report on the autobuilder and to
improve our score over time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/oe-pylint | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100755 scripts/oe-pylint

diff --git a/scripts/oe-pylint b/scripts/oe-pylint
new file mode 100755
index 00000000000..74ff4b884de
--- /dev/null
+++ b/scripts/oe-pylint
@@ -0,0 +1,11 @@
+#!/bin/bash
+#
+# Run the pylint3 against our common python module spaces and print a report of potential issues
+#
+this_dir=$(dirname $(readlink -f $0))
+ERRORS="-E"
+IGNORELIST="$ERRORS -d logging-too-many-args -d missing-docstring -d line-too-long -d invalid-name"
+PYTHONPATH=$this_dir/../bitbake/lib/ pylint3 $IGNORELIST bb
+PYTHONPATH=$this_dir/../bitbake/lib/:$this_dir/../meta/lib pylint3 $IGNORELIST -d undefined-variable oe
+PYTHONPATH=$this_dir/../bitbake/lib/:$this_dir/../meta/lib pylint3  $IGNORELIST oeqa
+PYTHONPATH=$this_dir/../bitbake/lib/:$this_dir/../meta/lib:$this_dir/lib pylint3 $IGNORELIST -d undefined-variable argparse_oe buildstats  devtool recipetool scriptpath testcasemgmt build_perf checklayer resulttool  scriptutils wic
\ No newline at end of file
-- 
2.20.1


