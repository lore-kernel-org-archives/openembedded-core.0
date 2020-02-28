Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 67A0D619A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:51:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id dw13so1861894pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0OlWlFIDGr7rSTWvL3ju7RZ669UueBm0NHWqDyvcPPY=;
	b=FxtarFQIM5sNyhyivh94n88Gug1+YR6lm37MsGrCL0NSW6v/HY0B3a4FMcxPquemxg
	ioywCEomryaQA9qSTLWGKQRRHOy5v5ejRF0PJnZsJ+nOuRrymYBreat4/6YXrL6M6LL+
	8q9ucDEMIKNS4TPrd3kPWJ8LyL+EVbrzWDqMaTOeH7pX1dEm9g36bV9pEcRyjlBTJwYw
	UqXDYytmlqPLVJQOZqv/tV5DAS+cpkugOoOKyEJTBq+tk6+Y1esBX2Uz9fE7T2hAzqhP
	ZVqkMNQFWI1o7BATpVRCFsCnM+Qry+2Vq+5Y/nBCrttW/41heaZ5DuMELBP92e1AgkXJ
	14xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=0OlWlFIDGr7rSTWvL3ju7RZ669UueBm0NHWqDyvcPPY=;
	b=LXcpkIW76jLVolA7iaJ+Bjuy2Stmd1wNAJtQ+S69J1eUUuR96zQlte1yKDl0Qgznyr
	Aw1kbrBLBsyZcsaCMrmMuHKa/1gXx2HHkEqq6nUTU+0iY3R5t1aWqCRGri43PV14fQ6O
	+KHarJixRdESByEUux+snZpTVBaz5qjEoCHD3xV1lIPmlPm5ym+YYz0Fr0DUxA/kbBCF
	8K5/RP+gytNhMXc2IRYK2g2MP688SEnJp5L39W3k+3cwufBw7u2S8Ckgbwy3RCYgwzNR
	YOXmf9fEQd8vYzHBe2o/D1DC1pvWApaTb+yJ4GDs1k0jK/B/wnkerhVMPjsMwmKXbgOq
	7eqA==
X-Gm-Message-State: APjAAAVWnSqe/fZxYd661WMmTus0yypeXqgjdV967OeAwJ0HyNXKy8Ku
	+FjCrjHA57zm9gEJbog4Z3Z2nr1k
X-Google-Smtp-Source: APXvYqwsdHOyPZYv+dHAHgtPDKS3Z3ZKXCLEX7bynuZk0j4AJRWg8e65RWUceY/azN6LaJTDsvUUpg==
X-Received: by 2002:a17:902:6ac7:: with SMTP id
	i7mr6035211plt.66.1582930313329; 
	Fri, 28 Feb 2020 14:51:53 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	13sm11954092pfj.68.2020.02.28.14.51.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:51:52 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 1EDB32A053D; Fri, 28 Feb 2020 14:51:52 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:51:51 -0800
Message-Id: <20200228225151.28015-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] mesa: add fix for arm6
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
X-List-Received-Date: Fri, 28 Feb 2020 22:51:52 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

We have had similar problems with missing atomics on arm6 that arm5
has.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 87f167c507..54d7ea8961 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -161,6 +161,7 @@ EXTRA_OEMESON_append = " -Dasm=false"
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
 CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
+CFLAGS_append_armv6 = " -DMISSING_64BIT_ATOMICS"
 
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
-- 
2.20.1


