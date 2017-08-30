Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87D96719AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 07:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U74QTH029245
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:04:26 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 Aug 2017 00:04:25 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <li.wang@windriver.com>
Date: Wed, 30 Aug 2017 15:05:16 +0800
Message-ID: <1504076716-17661-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] lsof: remove host information from version.h
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
X-List-Received-Date: Wed, 30 Aug 2017 07:04:25 -0000
Content-Type: text/plain

From: Li Wang <li.wang@windriver.com>

lsof -v would show some information for host.
Clean up these from version.h.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../lsof/files/lsof-remove-host-information.patch  | 76 ++++++++++++++++++++++
 meta/recipes-extended/lsof/lsof_4.89.bb            |  4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/lsof/files/lsof-remove-host-information.patch

diff --git a/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
new file mode 100644
index 0000000..b7d2323
--- /dev/null
+++ b/meta/recipes-extended/lsof/files/lsof-remove-host-information.patch
@@ -0,0 +1,76 @@
+Remove host information from version.h
+
+make lsof not include host information
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ dialects/linux/Makefile |   50 +++++++++--------------------------------------
+ 1 file changed, 9 insertions(+), 41 deletions(-)
+
+diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
+index 2bea108..792142b 100644
+--- a/dialects/linux/Makefile
++++ b/dialects/linux/Makefile
+@@ -76,48 +76,16 @@ version.h:	FRC
+ 	@echo Constructing version.h
+ 	@rm -f version.h
+ 	@echo '#define	LSOF_BLDCMT	"${LSOF_BLDCMT}"' > version.h;
+-	@echo '#define	LSOF_CC		"${CC}"' >> version.h
+-	@echo '#define	LSOF_CCV	"${CCV}"' >> version.h
+-	@echo '#define	LSOF_CCDATE	"'`date`'"' >> version.h
+-	@echo '#define	LSOF_CCFLAGS	"'`echo ${CFLAGS} | sed 's/\\\\(/\\(/g' | sed 's/\\\\)/\\)/g' | sed 's/"/\\\\"/g'`'"' >> version.h
++	@echo '#define	LSOF_CC		""' >> version.h
++	@echo '#define	LSOF_CCV	""' >> version.h
++	@echo '#define	LSOF_CCDATE	""' >> version.h
++	@echo '#define	LSOF_CCFLAGS	""' >> version.h
+ 	@echo '#define	LSOF_CINFO	"${CINFO}"' >> version.h
+-	@if [ "X${LSOF_HOST}" = "X" ]; then \
+-	  echo '#define	LSOF_HOST	"'`uname -n`'"' >> version.h; \
+-	else \
+-	  if [ "${LSOF_HOST}" = "none" ]; then \
+-	    echo '#define	LSOF_HOST	""' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_HOST	"${LSOF_HOST}"' >> version.h; \
+-	  fi \
+-	fi
+-	@echo '#define	LSOF_LDFLAGS	"${CFGL}"' >> version.h
+-	@if [ "X${LSOF_LOGNAME}" = "X" ]; then \
+-	  echo '#define	LSOF_LOGNAME	"${LOGNAME}"' >> version.h; \
+-	else \
+-	  if [ "${LSOF_LOGNAME}" = "none" ]; then \
+-	    echo '#define	LSOF_LOGNAME	""' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_LOGNAME	"${LSOF_LOGNAME}"' >> version.h; \
+-	  fi; \
+-	fi
+-	@if [ "X${LSOF_SYSINFO}" = "X" ]; then \
+-	    echo '#define	LSOF_SYSINFO	"'`uname -a`'"' >> version.h; \
+-	else \
+-	  if [ "${LSOF_SYSINFO}" = "none" ]; then \
+-	    echo '#define	LSOF_SYSINFO	""' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_SYSINFO	"${LSOF_SYSINFO}"' >> version.h; \
+-	  fi \
+-	fi
+-	@if [ "X${LSOF_USER}" = "X" ]; then \
+-	  echo '#define	LSOF_USER	"${USER}"' >> version.h; \
+-	else \
+-	  if [ "${LSOF_USER}" = "none" ]; then \
+-	    echo '#define	LSOF_USER	""' >> version.h; \
+-	  else \
+-	    echo '#define	LSOF_USER	"${LSOF_USER}"' >> version.h; \
+-	  fi \
+-	fi
++	@echo '#define	LSOF_HOST	""' >> version.h;
++	@echo '#define	LSOF_LDFLAGS	""' >> version.h
++	@echo '#define	LSOF_LOGNAME	""' >> version.h;
++	@echo '#define	LSOF_SYSINFO	""' >> version.h;
++	@echo '#define	LSOF_USER	""' >> version.h;
+ 	@sed '/VN/s/.ds VN \(.*\)/#define	LSOF_VERSION	"\1"/' < version >> version.h
+ 
+ FRC:
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
index 29245b1..14546db 100644
--- a/meta/recipes-extended/lsof/lsof_4.89.bb
+++ b/meta/recipes-extended/lsof/lsof_4.89.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
 # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
 # the most commonly used alternative.
 
-SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2"
+SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
+           file://lsof-remove-host-information.patch \
+          "
 
 SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
 SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
-- 
2.7.4


