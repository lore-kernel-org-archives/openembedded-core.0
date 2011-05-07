Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QIcNU-0006sR-Q1
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 09:56:42 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so1799429pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 May 2011 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=K08AoewR3gfhTGH0DsKLUdTH85p4kfhzAQuvlYLZHp8=;
	b=LyVpqkSZic3nc7/wzWRFpKrvWPl+G8ttSGaxaIntxFFFFlarKHbTbDwxx18FJS9Ks3
	tW0wJKW/+hyM3rjEc71oM2ghmcr+nlSwYk2hGUkpQIHSw07Gl+4S62jhHgpdsahD9+Wz
	VY7JEDXCkxyamQOS8VLDLIlhAUdYQ6A0Ib7As=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=QtxauRckIj7Se1bNGvWSmGgbeufylhtIDoAF/pVAuY5o9DLhtpINaOO93TfmwCGoCC
	9UlGZqYw/0rRTUcC+3w3yjVASPT8SyexDM7yr8oUzBclZXIYqaS+wuMnWz+ePE/yrfDe
	yaUE/m7Jtao7Qse9acdbaiogBkn5k0MK7kJCw=
Received: by 10.68.51.196 with SMTP id m4mr6376751pbo.465.1304754839582;
	Sat, 07 May 2011 00:53:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k10sm2675834pbl.76.2011.05.07.00.53.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 07 May 2011 00:53:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Sat,  7 May 2011 00:53:55 -0700
Message-Id: <18cc54f29f2e7ee9278f32f0c54a8e270b1aaa47.1304754527.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
Subject: [PATCH 6/8] liburcu_0.5.4.bb: Let it build on uclibc targets
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
X-List-Received-Date: Sat, 07 May 2011 07:56:42 -0000

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



