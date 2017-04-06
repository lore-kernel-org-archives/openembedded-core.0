Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id B2E8077CEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 12:10:07 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g19so10825555wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wt73yJO1Xcds6mWH+DwG0E+LJLBq81mQWAT0ue9kz+I=;
	b=tgIbz9vmoltjnYuO77El5tSVOPy6QG8llqq8i47JFWWHrAnwTXUW1JzWT+lzI+7LGE
	sZW2Kz0RFl2IX47fzfqvyXT8UY9jap/bBa3zFRzKCe4KARZukmujC/kLWlZHyKL8IBzo
	WkgIWSEny8RS4tFcvAIUCJi38FfMewE35qfQHx4IUlQVRC793nEsICyqhFl+DXO/PjbZ
	IK2MgfEIwO8p8ZFNOnmmde9HV2c64s9sQRBvWQRHcz0EQFW592P/9x044ZsmFR1koGH6
	l0LWnWWQEE7WkrIf2fNar/63dV5772nG31VPyta3zQFlmrit+OwJN+R50lH/j9jq8Aqm
	XpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wt73yJO1Xcds6mWH+DwG0E+LJLBq81mQWAT0ue9kz+I=;
	b=tkFj7QwV7VnPAEhZqLroUePsOlzX0vmsfyrRuHAwXCj6c0XWQwH0O1rb1C5OGOMzFk
	9TR3Mg+QEh6c/Fs3okhPPfYS8KhmcNJo4OYkyZqzf8eBT/hThTODoW7BKf/KTVCRpUSP
	vXY1PUqDcxEmlJgAn2H3N7vTYGgudYrf8rtLlGoOWzX9atejg5qoZn1piCelimW2d5fm
	9198vNdw11Z8ZK/wj5Ob1IAsv8i66LZ8bemA0xAnSq0XEkezPGruE5PrtS6nUfi+OJmz
	/7r5Rcae1KZK/H893AKHvv8z4M1Q1W3qIiH7wzmrVq4nVmKMXpNBT8f+ww1PjVZq+DHo
	eHQA==
X-Gm-Message-State: AFeK/H0iIwDgfE9cOVNwo6TlbUVjI7LbcdLfhoaZmrKBCFODv0AL9sG2
	1uZ+2asbn4kmYiAE
X-Received: by 10.28.148.143 with SMTP id w137mr23581051wmd.72.1491480608692; 
	Thu, 06 Apr 2017 05:10:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.224.167]) by smtp.gmail.com with ESMTPSA id
	m7sm26221884wmi.34.2017.04.06.05.10.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Apr 2017 05:10:08 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 14:09:44 +0200
Message-Id: <1491480584-9725-5-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
References: <1491480584-9725-1-git-send-email-liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH 4/4] cross-canadian.bbclass: override TARGET_* flags
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
X-List-Received-Date: Thu, 06 Apr 2017 12:10:08 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some TARGET_* flags are being exported in bitbake.conf currently, so
they are impacting all the tasks of a cross-canadian recipe even they
are not in use at all.

This can lead a lot of churn when the cross-canadian sysroot are shared
by machines while they have defined different TARGET_* flags.

Fix it by overriding with BUILDSDK_* flags.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/cross-canadian.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 3120f46..49388d4 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -115,6 +115,11 @@ HOST_CC_ARCH = "${SDK_CC_ARCH}"
 HOST_LD_ARCH = "${SDK_LD_ARCH}"
 HOST_AS_ARCH = "${SDK_AS_ARCH}"
 
+TARGET_CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
+TARGET_CFLAGS = "${BUILDSDK_CFLAGS}"
+TARGET_CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
+TARGET_LDFLAGS = "${BUILDSDK_LDFLAGS}"
+
 #assign DPKG_ARCH
 DPKG_ARCH = "${@debian_arch_map(d.getVar('SDK_ARCH'), '')}"
 
-- 
2.7.4


