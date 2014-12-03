Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 26F0F6DA74
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 19:38:11 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id ft15so16050199pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 11:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OwnKEHERdw7KQTzecfsiXLHUga6VDnAumWHyFQyZybs=;
	b=ioSE1q7+9ri/TlqKM0lqJyJALZRz0l0mG5DxueDWFCOAQGBqLon5uc8Jxd6oaXv8D3
	Cv0gHcZMUg/DfZqsDW/et9ylc1pbLUZyVSfHSXyW+WExb6XWSmEaNrXzYFnP+L3CH6vv
	nql4Fspn6p/1D3cjvWUXiK0SROpxvdW96wBY3vs7zS8vWqzgX0EqLPlDXiee0kOuNGsF
	BkP9VPeY6S9/iXPahQ54L2nzse054vBXMSrbkwh2B0UZmHZ0CYm6YYNC4wYRV6BnSD+H
	Db7WSAZuMuxktS3QIh7pJQcECufMbZmPxTo07FMhGOeonYsuP8r/nA84hMtu4tjv3w9h
	W1uw==
X-Received: by 10.70.19.101 with SMTP id d5mr12013031pde.10.1417635492533;
	Wed, 03 Dec 2014 11:38:12 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	wv1sm23968619pab.37.2014.12.03.11.38.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Dec 2014 11:38:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 11:38:02 -0800
Message-Id: <618a569d430e88e9a115dcf10f04384f39e28555.1417635272.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417635272.git.akuster808@gmail.com>
References: <cover.1417635272.git.akuster808@gmail.com>
In-Reply-To: <cover.1417635272.git.akuster808@gmail.com>
References: <cover.1417635272.git.akuster808@gmail.com>
Subject: [PATCH 1/1] kernel.bbclass: Create modules directory even if there is no modules installed
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
X-List-Received-Date: Wed, 03 Dec 2014 19:38:15 -0000

From: He Zhe <zhe.he@windriver.com>

During kernel_do_install it needs to make symbol link at
${D}/lib/modules/${KERNEL_VERSION}/build, but there will not be
${D}/lib/modules/${KERNEL_VERSION} if there is no modules installed for current
image, which will result in a build failure.
Add "mkdir -p ${D}/lib/modules/${KERNEL_VERSION}" here to avoid this failure
and the need of similar changes in other scripts that also expect it to exist.

(From OE-Core rev: f2f72f8ff623d24fffbb1b0ad40bc08f05ff31dd)

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f300fa3..fa06c3a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -213,6 +213,7 @@ kernel_do_install() {
 	#
 	kerneldir=${D}${KERNEL_SRC_PATH}
 	install -d $kerneldir
+	mkdir -p ${D}/lib/modules/${KERNEL_VERSION}
 	ln -sf ${KERNEL_SRC_PATH} "${D}/lib/modules/${KERNEL_VERSION}/build"
 
 	#
-- 
1.9.1


