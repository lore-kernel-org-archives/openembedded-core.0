Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 184E060B69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:51:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q4so1799211pls.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 14:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ZajCVPQIleKOacF9oG5my3xUZzwd7UhSi8z0fy0Vve4=;
	b=fo3POgcHlb1nteRXZGOVo68DF0e4w11eVfHwaIlA1c0spUz14RFbrTyjSnf1NvnAWV
	WznplJQu3G/prsxitXBNxleLm806RdYXlLLA2jksYa8t1IjB1HNyS9ZV9My1Yuxo435v
	dkyNkdBV63LHlN4fW/1/xTAau8lWpdFmbnoLBvKWJDikM9Ys+FfdJBNGb2JXNgoaB7/R
	VLmh73hOQlMVQUMGi3dSfN8YNGWZp9C+jmHNpuPBSzBPZLGQJmYX8OnQSO9qWWYOxVzO
	QySU9X8yvsUO+2Sc4mPYlors+trsPrnIgYzs3mteZ+j9d53qrY83nB94dOToQlmloxF5
	3Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ZajCVPQIleKOacF9oG5my3xUZzwd7UhSi8z0fy0Vve4=;
	b=iGDJ2ocaX+VttkHqjOagYXdKKO5kHa9V7t5Tp9eSxjPJLvohpBnXmmXlvjR/v3S/CD
	vn2faP7yUscfeukQ4rlWpxrvdJfudQLnEYeK+XEJ7rrgamLvGbcJhEZ8IOKmD/IxpZYW
	kN/Odsq8SLqVqVO21MN/sfJNmmm8NaXfGvJQpXufVfQ3AGvoIIR64DvIUQf1TmPFl/Y2
	u0dnTVzq89I0m129j7Z1x2NFh+lWfx7C6OXpeOMKUrVeoRhZOPUbGmwvahACAHz02C6X
	MuMh8jZ4wU5+Hzf9vgyRfwB5laUEShOGGHPUnlDG+pdNN/6TbeZYAVBkf8pBK6vhfqlC
	xUAg==
X-Gm-Message-State: APjAAAUCiHrW9u9mi0bLFzHBlT2PTCs9Iow+AzpvvJn9wIhrS3nbrvZT
	BCHtM6LNVHsxIMvQ3x01PCJLlFUz
X-Google-Smtp-Source: APXvYqx6qL155nRpVP+mC2xD7p2CRx8fzW6e37CE7uEV5yH33v5a/o32827tJKD2f8da6eRii+IJFA==
X-Received: by 2002:a17:902:6b84:: with SMTP id
	p4mr5903081plk.15.1582930284619; 
	Fri, 28 Feb 2020 14:51:24 -0800 (PST)
Received: from workhorse.localdomain
	([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
	by smtp.gmail.com with ESMTPSA id
	m128sm12577001pfm.183.2020.02.28.14.51.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 14:51:23 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 970432A053D; Fri, 28 Feb 2020 14:51:17 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 14:51:16 -0800
Message-Id: <20200228225116.27918-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libxcrypt: add native to BBCLASSEXTEND
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
X-List-Received-Date: Fri, 28 Feb 2020 22:51:24 -0000
Content-Transfer-Encoding: 8bit

buildtools-extended does not provide libcrypt, and some native
applications require it, like clang. While it would likely make sense to
include nativesdk-libxcrypt in the buildtools it would also likely make
sense to remove the dependancy on the host libcrypt for those
applications that need it.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/libxcrypt/libxcrypt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 416205cd5c..e59a096573 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -32,4 +32,4 @@ CFLAGS += "-fcommon"
 API = "--disable-obsolete-api"
 EXTRA_OECONF += "${API}"
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


