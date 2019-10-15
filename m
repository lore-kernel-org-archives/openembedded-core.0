Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id E2DDB6004D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 01:33:55 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 23so11095554pgk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 18:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3u6gfIo9/MI1R5Jrj+5pkxbujsIlLxfgcqzmHz+P0D4=;
	b=Q9v3Hv53JU3iKdw/BLWE/LgrGETD7KZEzXDu4Rr2WAFG3TaZpsgll2FIm9bPTsi5jt
	jecvwIGEONeZIdLrO4r+dDBB5IZ6ZPFOzi5praD/HWid1FQsiM/xNXGOfrnDOo4buam9
	mNf2zmpTElwepujIWHIJztWMvzYBuW3Pcdxxt/ru+0ls2feOffTbjX17CZChdn3me1Xm
	awSpxNfEwhF+GXj09YCIc5XwqTo2FGdt4t41vy3InkucYwqEtg6Txfsm4chbjb8Rk1ZH
	NwsqxI7ARvqsCfi++prK0nmSRXls9/wCsEFnDgd7YqSnLVyona/hjLg10oEDclf4lEet
	zMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3u6gfIo9/MI1R5Jrj+5pkxbujsIlLxfgcqzmHz+P0D4=;
	b=dTgoHoLV/mEu2i42vhr86qMvJt/jM981hNSI2WsFhrdTDUDqmJFazEFOC6A6u6weAw
	MITJ9egsbUX0v5sLYwvYiaSddd3XaFnbTePrTEDLQNiqLWwbOt3cMbJn6y3W6qa5S/3z
	djoJYK1ZwoxPiDtgPqOU19jFh9GD7aVCnn+Fg6N5QGar8hnpwGfXMrzbtZRuZfy9hgZP
	fKZNoXSGtdo/hvFmPbJAvqKd/T7y1xhBbzhghk3lHTDPw5Fjf8C3F9/K94OB7IqrAJg+
	n4ax/MqYZh4zziwm4p4EBB0mnwWhE8bmfw2+5czYEaDj+JG8ITwuyd6qZXEJRVxNzFb1
	AKrw==
X-Gm-Message-State: APjAAAVHJ2/j5mk0/JSf64qIFP4sqJyo8YYmR91IfnaB5l7uW6ss9Wxy
	hCmUt1Qd1DJpaxBnaPj05xXiNMRZ
X-Google-Smtp-Source: APXvYqzlyRyd4/JXvkggtukFo0Kjea2Zs8gzXkZKjGwLTV6+chcLyuIDH40HcWkOk50vnBSO0IF2+Q==
X-Received: by 2002:a65:5503:: with SMTP id f3mr36104195pgr.351.1571103236892; 
	Mon, 14 Oct 2019 18:33:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:1c7e:9ce6:b4cb:b655])
	by smtp.gmail.com with ESMTPSA id
	b20sm22710629pff.158.2019.10.14.18.33.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Oct 2019 18:33:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2019 18:33:45 -0700
Message-Id: <85da4ccfff2103815eb3cd9a0b0f1af122b05567.1571103112.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571103112.git.akuster808@gmail.com>
References: <cover.1571103112.git.akuster808@gmail.com>
Subject: [thud 4/7] kernel-devsrc: check for localversion files in the kernel source tree
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
X-List-Received-Date: Tue, 15 Oct 2019 01:33:57 -0000

From: c-thaler <christian.thaler@tes-dst.com>

localversion files are ignored. This might lead to a bad version magic when
building out-of-tree modules via SDK.
(Backport from master https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-kernel/linux/kernel-devsrc.bb?id=59fcee90de0cbb5b6b8333ab2b0e36214b174e52)

Signed-off-by: Christian Thaler <christian.thaler@tes-dst.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 361ad21..ec5cf09 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -62,6 +62,12 @@ do_install() {
 	cd ${S}
 	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
 	cp --parents $(find  -type f -name "Build" -o -name "Build.include") $kerneldir/build
+
+	# Copy localversion file if any to keep correct version magic after
+	# modules_prepare.
+	if [ -f *localversion* ]; then
+	    cp *localversion* $kerneldir/build
+	fi
     )
 
     # then drop all but the needed Makefiles/Kconfig files
@@ -213,6 +219,9 @@ do_install() {
 
         # required to build scripts/selinux/genheaders/genheaders
         cp -a --parents security/selinux/include/* $kerneldir/build/
+
+	# copy any localversion files
+	cp -a localversion* $kerneldir/build/ 2>/dev/null || :
     )
 
     # Make sure the Makefile and version.h have a matching timestamp so that
-- 
2.7.4


