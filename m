Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id CC0727FFB9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 17:24:24 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so2795585wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gzk2ONCF8mrRyaXbd9VE6Z8ogOfcpPZ2MWys0Y8DS7U=;
	b=qxpKhxnu0pWtU9qS3BI1XFNI4UfobLv6JEjgkKa/FuLnIxAdZrME5SsxoSNhEUXWH7
	a5jEXIRyq8FrNwuY+N4NrWr5cnrYmdJs/k3sE7c4uRpSiBW1Au+JPy9p7papl4Ekqq1T
	EKi6i5FEKNc80MGGcdk1Y4t0RoEefLqfOnhhYn1/eHk6yJnlycM6aoujrzlsU6119kKL
	wmtiaFhAt7rZtq74iKyIeg3h0LnoL7O0F5ihbLjekKFfpBakzO+vhTWZdGmpwdBQL3Gg
	rBGKrfYJXJe0yTpNqZ1+iDucDUrwr+X7023M2i8LfAf8hK5sQt6QsCJ1Fkj1MJfohsFq
	dqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gzk2ONCF8mrRyaXbd9VE6Z8ogOfcpPZ2MWys0Y8DS7U=;
	b=ZDDW7N5Tl95u16/2Mj/yjUid8rbKj2QujLNEoZ2tvkNWwlPa3oobTpEQnS/YxHJl8/
	NDAKjM0DU8DOKGDqwb9pAAgnsr0eazJWGFlB2P/kO9ITkciHkPXRmMzli1G4MccmJ2Dw
	QAMw8T+GhsoM/40t8+wx08RkaSyErvAkHL7IwkgDlq1JTRn0SSd3Bv+4U1zFMI9AZRh6
	J/Wkn1HMK8tZXXBWdFkE9SfcE4kG9HNYt7TAgZH00pkucoL6jmZ8Zkj9lCOMRt4V/Fpg
	YrGpxCyVMWg2SDZLrhmlTX9HP1u6iE6cNDcH+saIVrejlJsw06MRTzSxQMYs9RCw2kvY
	SWuw==
X-Gm-Message-State: APjAAAXsW2LQmZQebbQWRvQNhe+xfOwFWfuZTfqDtW7P/JVabMew/e59
	nKmEq4BUn1/WAWRHapNtOhPy6Otw2AE=
X-Google-Smtp-Source: APXvYqylMr9ckS5xdmjUB6qD+2IY6iiQHd8eFTiFPXwsMbWTQSxuBXIYsD2hWtHPWwMhypkeYBAaYA==
X-Received: by 2002:a05:600c:2c08:: with SMTP id
	q8mr5382954wmg.45.1578677065206; 
	Fri, 10 Jan 2020 09:24:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t131sm3031855wmb.13.2020.01.10.09.24.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 09:24:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 17:24:21 +0000
Message-Id: <20200110172421.2534-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] perl: improve reproducibility
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
X-List-Received-Date: Fri, 10 Jan 2020 17:24:25 -0000
Content-Transfer-Encoding: 8bit

Occasionally the reproducibility selftest fails because perl-pod differs,
specifically that the perltoc.pod file was sometimes missing modules.

Debugging revealed that there are missing dependencies so there is a build race:
building perltoc.pod from an clean build tree results in no modules being listed
at all.

A bug has been filed at https://github.com/arsv/perl-cross/issues/86 to solve
this properly, but for now we can just delete perltoc.pod after make has
finished and re-generate it.

[ YOCTO #13726 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 66707e7f9d8..03e7f206f91 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -112,6 +112,14 @@ print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, timezone.utc).strftime('%a %b %
 
 do_compile() {
     oe_runmake
+    # This isn't generated reliably so delete and re-generate.
+    # https://github.com/arsv/perl-cross/issues/86
+
+    if [ -e pod/perltoc.pod ]; then
+        bbnote Rebuilding perltoc.pod
+        rm -f pod/perltoc.pod
+        oe_runmake pod/perltoc.pod
+    fi
 }
 
 do_install() {
-- 
2.20.1


