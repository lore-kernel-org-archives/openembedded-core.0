Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2704A7ECAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 15:31:45 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a21so291658oie.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 08:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xKpLvp0SsFc07HdKikF879+w6iwxbouKL9GZW+CZNpU=;
	b=N7wGwc291j6YtbfVS2u4QTpn1tHi/lJiAZGJ1Pd+Vgz7FxFP2FIM1rUfmODYndhZfe
	2nTMDYgOJNUYA2sUl4nkc125AcbZcvb18zo0neiqtjaD9vwWJEyDjs4omy4MF4aV/UUM
	uayjbn7sfP8WFPiFUloQzqo0K0EriExjEfaMKIUTir0JZoTVJwp0kAejEUVFL5S8jM6W
	nGILkaHgMZukKNQ96GKw7Npm6HH+PB1tUyodda5SSFP2124Xxd7AKCc81llM+XJKqmM9
	2ssxQ3NKsKPsl0DQOj9oMwq1FT466eaOTEr402++R/LKxfNMVhfTLaAO7C28FqZGeO0a
	qzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xKpLvp0SsFc07HdKikF879+w6iwxbouKL9GZW+CZNpU=;
	b=AvvYwOnvR6qJ6I4jSzTxaV/tosMaGRUPpu13kemiCeP3fS4qAV+mnFtXd+n2OnYTJn
	aiiK4MOCtvA1pDCxEgHxmXty/BPky1MU55q9cr0AqkkoLiLRwHplZ2jiP71fLNqc/jp7
	8a2v9QDaH+gXowkPUq/bt5n6zUFPBC+tpsOzifdgo1cNuAthFbIuS5DpQxyieqi5vsY9
	JWMoXJbCAugaLChAUMmvWz0GPTIhafxxmoefdhmYd1MBvatc4KRYy7H+1CYR8Di6gDzu
	0dWb433+/ND9QCIxia7SdbioYN5SiFgoBFbvysUvZCvu7BwtfY1uLfMd4Uhs+dyMWi2j
	L9xA==
X-Gm-Message-State: APjAAAWzNFbzBwWNN7MBmYXVhqoyI3ttNxxsN2c8GRaYrO9Y3JYGvgD4
	Y8Z3JFl3cMdceZ3buezQxJU=
X-Google-Smtp-Source: APXvYqziiCBbglf0bpGfW8t8J4+8rONc3265VmrL2FWspLBXfIpPQDZGG6QGX4u5yz9TXCFcw5pSBg==
X-Received: by 2002:a02:7c2:: with SMTP id f185mr4133016jaf.16.1565796706713; 
	Wed, 14 Aug 2019 08:31:46 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id 8sm224570ion.26.2019.08.14.08.31.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 08:31:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Aug 2019 11:31:33 -0400
Message-Id: <0319ae9101690acfe6767b3760a8bf7c8b5b86d2.1565796002.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1565796002.git.bruce.ashfield@gmail.com>
References: <cover.1565796002.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kconf_check: tweak CONFIG_ regex
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
X-List-Received-Date: Wed, 14 Aug 2019 15:31:46 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

As reported in https://bugzilla.yoctoproject.org/show_bug.cgi?id=12563,
the regex that matches valid CONFIG_ options was missing some of the
ones in net/netfilter/ipvs/Kconfig, and hence triggering invalid
option warnings.

By dropping the trailing space on the regex, we'll cover all the cases
for valid option.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index c8e736a987..8ca7193c8c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=9c30e971d435
 
 DEPENDS = "git-native"
 
-SRCREV = "7604d2d1a49d88e38d5b5854209dc1435b790893"
+SRCREV = "bb6df0ef2365689cd3df6f76a8838cddae0d9343"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
-- 
2.19.1


