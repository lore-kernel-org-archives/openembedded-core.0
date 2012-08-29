Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T6kNV-0000ir-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 17:40:25 +0200
Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 29 Aug 2012 08:28:10 -0700
Received: by wibhm2 with SMTP id hm2so5638722wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 08:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=pAOk6XmqaV5mXEpYe0zWUqTU84CDWkZBLMnMWbv7fp4=;
	b=oO9YIximtI1P63BRAmXNiXvesQZHUDCaEWpqYf/5XCzL0Cxu9CsGSV03u7yijQO6fq
	EkU+IVpifbVIU9R6D1jTf/wxP8/zbW1Rgy33lAagJobmW9F5hmCk6w9ZBO7k5cyVZ1Cv
	t3LRgJOe4HIUrBSLmL0TWXl2CEn5hnQip5HGYyfpkxQ5X7C9V1xdwXwLuPeA5WscdR66
	QmeUHwd4rbs0b0oJL1Yge4gVgUTEcOroJHIc4gmjPthzwezuYnU8A+3ys9Pt30CnRjgD
	LtW/bFeUDD9Is5c71Zg04SLrNdoZsrh7EF2o1gwWRDYiX7hKA2tTnQ/G139ikFX4jeDs
	euBQ==
Received: by 10.216.139.196 with SMTP id c46mr1113473wej.220.1346254088612;
	Wed, 29 Aug 2012 08:28:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id do5sm4472063wib.10.2012.08.29.08.28.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 08:28:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 16:27:27 +0100
Message-Id: <1346254047-12292-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkpfm3BJU2TdmPVacayqsRV+dUKP7jxvkRUuEXjapkd+o/WmXRGOH97kQ3wtiPIE5mSKP+H
Subject: [PATCH] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 15:40:25 -0000

Lots of code (such a GLib) expects this to exist and link to the current
timezone data.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/tzdata/tzdata_2012d.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
index 31e1266..49ad2de 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r1"
+PR = "r2"
 
 inherit allarch
 
@@ -49,6 +49,7 @@ do_install () {
         # Install default timezone
         install -d ${D}${sysconfdir}
         echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+        cp -pP ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
 
         chown -R root:root ${D}
 }
-- 
1.7.10



