Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD8875CF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 18:33:19 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id us13so6248523pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 11:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sH5jddc0Ao1rBdmIaW5iuoA793aQVfYh+jIoX6moYkY=;
	b=hHGXdEkRXhNfjkxI1H9c7gbT61/ANUVQXrvnbHlNz92pRhxjof1Oc3NmnWJgVtsgXV
	+W3cLdq9UFP3rpPvPxaRr3UZ8/EsBehLlUUhJ60faexnnno1RJtpWAWFVlppSWn5BSK7
	Vqm/IXrFh5RBCyzWhNqFLYlAcHJx9HK8JLPBllgPV1EQ86qezicf6Bawcax7bzxZ4jcQ
	faPyO3DHUil79FWFUJmaVgBZHBjpRu/pfMwMDNocLQ/xLoNdfH8NbW8XLFDthUiWirYB
	WpMRSPDqYdlHNPbo8E4QA0L8RRgMqS5ARgqX9AcvWOM5EAxTPHriEVihO3cycNTLyEOO
	LCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sH5jddc0Ao1rBdmIaW5iuoA793aQVfYh+jIoX6moYkY=;
	b=YiJT8UHY5cJaGY25/jivz9mLChk4jUr5CewDDf430Z6pjmSSqmPSYvKnB/4kEgWG3I
	WABJEOmsk5kAIDAe1uC3hUKelnJ+6/h+5byJ4wCkTO4grlF4dCM5ReeQc2zhxJ6zGDas
	anpSD/JUopYjL5d6mrvTxDjNf7jt3hVyh8bTr88WZJmPzx8Kb5EHX7ltYjaSXjql8KML
	haKvRZqv4Sx3Q4z45U2C/vsGIXvf3g4FA5cQQl+wkQQ7/boViTAiM6nI7lFjxvz4+wql
	qbFOdfPPpo+At0GLxOQgXaNF6UDw2mhJPtKAeVbqgadzu0GIC1uMRs6scLkqKnmqI/gw
	0ZkQ==
X-Gm-Message-State: ALyK8tILDcEn1UDoE+46t8QpcXofujgaooukzWha/zllTgvbPLDGkUWbx5WtaHdALoecwg==
X-Received: by 10.66.171.173 with SMTP id av13mr3764785pac.117.1466188400024; 
	Fri, 17 Jun 2016 11:33:20 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	o193sm50225721pfo.12.2016.06.17.11.33.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 11:33:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jun 2016 11:33:12 -0700
Message-Id: <1466188392-3753-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] binutils: configure with --enable-deterministic-archives
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
X-List-Received-Date: Fri, 17 Jun 2016 18:33:21 -0000

Causes ar to use zero for timestamps and uids/gids by default when
creating static archives, which helps make builds deterministic.

  https://bugzilla.redhat.com/show_bug.cgi?id=1124342
  https://wiki.debian.org/ReproducibleBuilds/TimestampsInStaticLibraries

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 43e2aa2..70589ec 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -72,6 +72,7 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
+                --enable-deterministic-archives \
                 --enable-plugins \
                 ${LDGOLD} \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
-- 
1.9.1


