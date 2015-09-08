Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id C49A760053
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:02 +0000 (UTC)
Received: by qgx61 with SMTP id 61so96623551qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=taUfF7LSyNeQemUu7xUDHbkvQaEU6LjqFK79wFd8bbA=;
	b=xJmae9g7dAv6LOMoEoQajcY7/hu3v2TjG4qoaU9//I/YAsMf7ryQvTUWkJB9/tnKKm
	T5fEPRbAPqaWWGqmM1t84itdyMnGg5baASc5nVsFegDU8gLURxuWuOc2Rlceujab7GIo
	eJgsoAnDTvnrt8zPZtjbsEW2rD8evACqyYQkyqnz5oKfdKF7BGdr0UBrh7gzizeOypgh
	77wsI0h6HxMahJ6qa4EZxTTNWd/SA4jdVotMOXpJbV6Hx6Vry+49FMHqTN4B08cebsT3
	Aav3w/4xV/ITdZJr088zz5XXIIpzng630Q2PU9fcHFzEf4zb/Jj9KVq95KLBug0GGC2G
	dG4w==
X-Received: by 10.140.233.7 with SMTP id e7mr41502474qhc.79.1441753682687;
	Tue, 08 Sep 2015 16:08:02 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:41 +0000
Message-Id: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 01/16] irda-utils: Weak Define the build TARGETS
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:03 -0000

This will help one to disable the targets via bbappends if needed
e.g. musl can not compile irdaping since it uses includes
net/if_packet.h, which (on GLIBC) only defines struct sockaddr_pkt but
not in other libc e.g. musl that makes irdaping specific to glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
index bd60b9f..8ac3b18 100644
--- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
+++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
@@ -32,15 +32,18 @@ EXTRA_OEMAKE = "\
 INITSCRIPT_NAME = "irattach"
 INITSCRIPT_PARAMS = "defaults 20"
 
+TARGETS ??= "irattach irdaping"
 do_compile () {
-	oe_runmake -C irattach
-	oe_runmake -C irdaping
+	for t in ${TARGETS}; do
+		oe_runmake -C $t
+	done
 }
 
 do_install () {
 	install -d ${D}${sbindir}
-	oe_runmake -C irattach ROOT="${D}" install
-	oe_runmake -C irdaping ROOT="${D}" install
+	for t in ${TARGETS}; do
+		oe_runmake -C $t ROOT="${D}" install
+	done
 
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
-- 
2.5.1


