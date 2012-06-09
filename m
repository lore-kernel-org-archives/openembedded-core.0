Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwB-00044V-GR
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:55 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3570867pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bfRPhptHdc/ygdlVLmbGGcit9wVo7Fe5lWd0P4qM5UM=;
	b=yStR/hCix8aYMCDlw0QCVZt3dI7yzo48m8Rd38+nDjeICgSaJYsJmvZYGe82rUK4U/
	lU7QLU7wUaEzG1TMQtnForrAsci0wEHxeUV+UoSgsCcRRGAtoNXKQruz4vvdrHtYQZHH
	ZTVUq7nyT61ynkP3CG1PQ52uZg2w0zjR6gEQPxWchiMHEYRLBa5PdyyuojomsgyYk5dS
	6Stw/pSQly7vgOCZceE4uKMBazmmeugX7SEDgkRJzI/mmeOpK2AfWSpngMOGr8uJ3qRm
	YTXG8DeqW3otMG8iFBo2Pj0ca1FTWRCSXLi9RqOvcqbaxApCm2D8V9kOd9SmaHlLMZWX
	b0ow==
Received: by 10.68.221.10 with SMTP id qa10mr1549567pbc.154.1339260266315;
	Sat, 09 Jun 2012 09:44:26 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:07 -0700
Message-Id: <05b8d05bd217e313338d2566e16c0fe644ba5a52.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 09/16] rpm: pass lrt and lpthread to link step explicitly for uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:55 -0000

These need to appear in DT_NEEDED for librpmio.so
for uclibc somehow it does not get added to link
cmdline so we do it explicitly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_5.4.0.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index a8bff65..e9d2f35e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -178,6 +178,8 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
+LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
+
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
-- 
1.7.5.4



