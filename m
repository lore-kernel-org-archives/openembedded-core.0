Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TLyqG-0003tG-BI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 18:09:04 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so756321pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=LkyBY4z/OouoBe4or8rj0IFTReXEz2wIjzJdjeXe3FY=;
	b=BsqDsv1Nnt3RgPXrGCKJG4M3ldNmSqVE0HB1dMBANfN6HBpbLlIX9k5Dh7oHctCZhe
	DknvTX55mvoNAYgzvNa9yOTiDkqH0U4RViPQnPUzln1b9GC8IhUU+SMpwNqMjjR68CUc
	hwYhzJRy9DoMqg8S+bRemrB87R1l8Rpp6Wa4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=LkyBY4z/OouoBe4or8rj0IFTReXEz2wIjzJdjeXe3FY=;
	b=a6O1Mjd/yJL5OQwun+zTH4WjhSVDYsr5VBrVlulBLD7eO80GzfpfsMPpmK8uyXwlEy
	oTMsuzq+f627uv9OnF89cbO3gRxagTYUK+I4ttViquf06toWdRcjmg1poKV++xwm82Ih
	ErOJiRckdanGycUTdo0w/8RitQaTZEJkHPflpdgUlF+1aFMZ90vcmEEXCehjb/AfoR9p
	6qaiM4F6amhLMLuTx9Xqqy9HHUk2halGwViYus3ESxIGc6wJ9jHmy3cMm4FNVN0HLjnR
	IerVo0sgyn36sS3YN2OAxyX+Eg7+eoa5noOHy0iYd22doSm22/Fo15enkt//S+o6QWg7
	KPoA==
Received: by 10.66.87.73 with SMTP id v9mr63196959paz.1.1349884554624;
	Wed, 10 Oct 2012 08:55:54 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id pj10sm1205055pbb.46.2012.10.10.08.55.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 08:55:53 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2012 08:55:45 -0700
Message-Id: <1349884545-12719-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmzP7pggeX5rQH76OIQR2O2aHpHBIcsVlDrbGgYBFLS7xac6/AKx8Jg08UChqQDkw52JzPM
Subject: [PATCH] eglibc: force make to use /bin/bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 16:09:04 -0000

The eglibc core build still has a number of issues with /bin/dash.
Recently found is both sysdeps/unix/make-syscalls.sh and it's output,
which make calls via SHELL do not play well with /bin/dash. By force
make to use /bin/bash via SHELL setting it works correctly.

Currenly known issues are: make-syscalls.sh line with a bad substitution,
which can be corrected by:
     vdso_symver="$(printf '%s\n' ${vdso_symver} | sed 's/\./_/')"

Following that there is an issue with emiting a '\n' through a second
echo and then to the compiler. There maybe more issues beyond that.

[YOCTO #3080]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc.inc     |    5 +++++
 meta/recipes-core/eglibc/eglibc_2.16.bb |    2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index cae955d..e1ec6b2 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -51,6 +51,11 @@ EXTRA_OEMAKE[vardepsexclude] += "EGLIBCPARALLELISM"
 EXTRA_OEMAKE += "${EGLIBCPARALLELISM}"
 PARALLEL_MAKE = ""
 
+# eglibc make-syscalls.sh has a number of issues with /bin/dash and
+# it's output which make calls via the SHELL also has issues, so 
+# ensure make uses /bin/bash
+EXTRA_OEMAKE += "SHELL=/bin/bash"
+
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
 	sed -e "s#@BASH@#/bin/sh#" -i ${S}/elf/ldd.bash.in
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 32b0364..78bf9be 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r14"
+PR = "r15"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9.5



