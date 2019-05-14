Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3A57DF1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:15 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id t22so7931042pgi.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pqzBDB8EIdl+QR2aI4wXoQ4jx1yTLn0qW5g2/Ikz6Ak=;
	b=Yr+w/J1Vf6+ONDI1jHeKl5YYvyqfM5A8vaz+ViI4ePS26S0UPRJgNf6QL3UFPUmp0A
	xDDz7VN+vfOkqD0egiDNFRq9aCBM1+Yqd4JutGetBnDZmEHm2B+hdcvPZtenzlMm4aqv
	G5vbclvguVEKeW75xhg3E65D51molfjRBmFT66NAvXKB7EE2NA6UWNbkJCyBs2+FWuCC
	GjX6vX9JuB87oW+Q649u02q4YWPCYOqZu7qFvIE3Tk5IBKykJIciKqTaeJ1Z1oBf/hYB
	aclOYgdgEhmyY2ZY4jpwRAWiQE5ohvh1pshPWxMqMcpSwFuk+EjGgYa2ae8T59hEQ+YN
	wWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pqzBDB8EIdl+QR2aI4wXoQ4jx1yTLn0qW5g2/Ikz6Ak=;
	b=KkN3pIVK28nY3Pif65pccfOdVxEKqkgDEKLBaRLFQ+pBCMEEAcBXcJ7x7194CT2B7h
	X5lgVFNHeg/kihqn9Ye0DZU5Xd2j0nwIr3N8sE02J6ahTVe6zvvuf7yVNMi2G5Zn75gW
	JKMXq7aQyLEPoIC6vnntzG79YRZhVTl+frDfPeJ9wg98zt9nIuabtemn5hztMDA6fq5U
	HCE2CCcMRfyfv8J9U6xL4Pi3jWL4BOb0CRCzcQKWxRlR4jZ5V6rsDdQ7kLFmnxO+YXKx
	OjgQKf7qK2GEJfWpW3mgQNiV0lWqgiOIoWIooJ1Df+cJU3ERPD5oepFRn4lSvVG7iE6J
	D3hA==
X-Gm-Message-State: APjAAAVjERQzD+aufrOk4BUj5HgY2UBZOsLAGCRAd0GWcDcAAo2u44cc
	UtAVHHprKkA7GCLWxq591BATkEKy
X-Google-Smtp-Source: APXvYqyi6FD6XbjJ5QNX0mSj0pNYU/05fiW2d3APomiNB2Tmui+hieNR5ZjxX4QlmlwYB0/vxs8pDg==
X-Received: by 2002:a63:c94a:: with SMTP id y10mr35599013pgg.168.1557809656301;
	Mon, 13 May 2019 21:54:16 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:50 -0700
Message-Id: <bbce28b31e2d575fec0ffe8c94d6ffcb76849810.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/23] cml1.bbclass: fix undefined behavior
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
X-List-Received-Date: Tue, 14 May 2019 04:54:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>

Whenever cml1 do_configure is used with a defconfig, oldconfig waits for
input. This silently fails on recent kconfig projects with:
"Error in reading or end of file."
We cannot use a more up to date kconfig target such as olddefconfig,
because busybox does not support it.

Signed-off-by: Stefan Müller-Klieser <s.mueller-klieser@phytec.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 98d24ce..c7f6723 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -1,7 +1,7 @@
 cml1_do_configure() {
 	set -e
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-	oe_runmake oldconfig
+	yes '' | oe_runmake oldconfig
 }
 
 EXPORT_FUNCTIONS do_configure
-- 
2.7.4


