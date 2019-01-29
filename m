Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail.openembedded.org (Postfix) with ESMTP id 218F16B50A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 07:24:46 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id a8so13835352lfk.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 23:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oWr/IIwvV3dspxexSlQKXcn8iM7YocFO1P/0rAOWyts=;
	b=szKrayWPO7qDzCLJoBX7BCV2lE8fc4ICnS8hUytNOSxxvx5ec7nrQ9YwGuBrYJKhEG
	pXCchGoCEykDAMUR4YMRsqXlPLNzrulT7/ECOim4caecaIfR+5nelXALJrxebAsxZ2on
	zrmnevf35XrBrr0dI5HwYOkuycPUhZ40pu65Y+KWuTNS88MyDG86dUITXVEo1pkU3BsQ
	p0ATnkiUKJ2/wfclhErqNYMuDxNa6/5HpgLdKpvT+vN+STHwKvGL22orh+9z3E937/Vu
	+e24yvVZ0sJbcAkCYNbiP85a+kwniVgwSgPBQvsNChfjY4OojXNggATV2xeGMFAWyhD0
	1zCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oWr/IIwvV3dspxexSlQKXcn8iM7YocFO1P/0rAOWyts=;
	b=SduGJfusQpR5gwVh1GSZcW8NMxrUFinO30Yr2RHJLDvgtGj/sNib0JrYkSRa2ESka/
	3POB9T49ZlIYUIvk0ZNGCb9I7Zg3KWTYHDuLj4+hw2l2wTLzTN9Q4TWMgPCNsDdt52/Q
	TfIG0pSaYwnVxjQnlhxYXqs3uz0pE+d0kJhmuoXiQjBwDacSV1kBQn578BFS2BP72+FE
	b4+mxDxn7yc5sVplprZBXRPZdb4QkebMP8q/ExGYLGF8UOL86Sh0cxEHNok9KnOM7bII
	IOW/E+Zm0sKVD/5VCLPyvmSmIEPoeohZERtog0SFhGtNtng0JnBZJr10gukkWo2ZcYtI
	Gijw==
X-Gm-Message-State: AJcUukdURDQaYdYLgIqvbQMmYdvjBIap+vgp77j7vRgYQt2FqWZ2AitJ
	jjC4Y+Sy/8f0JIWTfGw9/o/RRtnGEE8=
X-Google-Smtp-Source: ALg8bN4fEbMKD6FhT1lZC9Ptbo3BvAltSfAa2nDKiFdkl1tUR7eo7adD0kGek2jJQRYg2b1KjV3L5g==
X-Received: by 2002:a19:4e59:: with SMTP id c86mr20252955lfb.132.1548746686342;
	Mon, 28 Jan 2019 23:24:46 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	u26-v6sm3356434lji.22.2019.01.28.23.24.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 23:24:45 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 08:24:39 +0100
Message-Id: <20190129072442.32343-1-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/4] glibc: systemd and sysvinit are not mutually exclusive
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
X-List-Received-Date: Tue, 29 Jan 2019 07:24:47 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/recipes-core/glibc/glibc-package.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a98ae1a29c..329732f48c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -107,7 +107,9 @@ do_install_append () {
 		install -d ${D}${sysconfdir}/tmpfiles.d
 		echo "d /run/nscd 755 root root -" \
 			> ${D}${sysconfdir}/tmpfiles.d/nscd.conf
-	else
+	fi
+
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		install -d ${D}${sysconfdir}/default/volatiles
 		echo "d root root 0755 /var/run/nscd none" \
 			> ${D}${sysconfdir}/default/volatiles/98_nscd
-- 
2.19.1


