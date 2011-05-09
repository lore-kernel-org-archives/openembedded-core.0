Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVQa-0005hW-M8
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:43:33 +0200
Received: by mail-pz0-f47.google.com with SMTP id 36so2591605pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=K08AoewR3gfhTGH0DsKLUdTH85p4kfhzAQuvlYLZHp8=;
	b=DEcQ/Tj/4pdrRmEasbqxpc1uwYn1bwS48iZxlKnFe4TYCzr5a76nLJ2hbrlkhDR+BK
	Pd2zISzckgg5WSbtHDjOgEmqbdej31IJehNp0XyLgvlv2nX5uJ5d8P4TTFOsTN2DDRSF
	kOIYLCcs0Bkz/3Fr2trFPCjFmOUubYIeJHlWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=UJSzRAaRp9OpbPNG7B6fL7RS7FBLnqt4nF/72gzT5vpRTtxHPohLxEsFAGXASTAfpt
	TKC6VDqusJBZzxOPRJGzHe6Z/LEXpJgVq/H0bIgXAyYhICZZa1VLWNeifZpapl5pvvN5
	c4Vs+B7ljtRHRiF0FJAWSOv8UDYohIlCVPlrM=
Received: by 10.142.149.10 with SMTP id w10mr4034718wfd.69.1304966447662;
	Mon, 09 May 2011 11:40:47 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id e4sm4265139pbj.4.2011.05.09.11.40.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:41 -0700
Message-Id: <2b56cbef70730ecbe0686cd958a1da751105058c.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304966147.git.raj.khem@gmail.com>
References: <cover.1304966147.git.raj.khem@gmail.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 4/6] liburcu_0.5.4.bb: Let it build on uclibc targets
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 May 2011 18:43:36 -0000

uclibc requires -D_GNU_SOURCE to be defined for it
to enable GNU extensions which CPU_SET/CPU_ZERO are
used by this package. So we add -D_GNU_SOURCE to
CFLAGS when compiling for uclibc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/liburcu/liburcu_0.5.4.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/liburcu/liburcu_0.5.4.bb b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
index 8e17e5d..b83d708 100644
--- a/meta/recipes-support/liburcu/liburcu_0.5.4.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.5.4.bb
@@ -15,7 +15,7 @@ SRC_URI[md5sum] = "04147d24749be75200173859839207f7"
 SRC_URI[sha256sum] = "02aedbb16c16bd034e246d5c9637a9232be559c66fc2fe4eb28948e234bd89f1"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
-
+CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
 inherit autotools
 
 # liburcu, which is only used by lttng-ust, may not build on other
-- 
1.7.4.1



