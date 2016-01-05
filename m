Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 06B13607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:04:38 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u05J4css009417; Tue, 5 Jan 2016 13:04:38 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016010513043827-1711060 ;
	Tue, 5 Jan 2016 13:04:38 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 5 Jan 2016 13:04:29 -0600
Message-Id: <1452020669-24036-1-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
References: <CAJTo0LaHTkODDiLfOYDQoFC-VBDD5h4XctAidjzRfyYGgdAfKA@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/05/2016 01:04:38 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/05/2016 01:04:38 PM,
	Serialize complete at 01/05/2016 01:04:38 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-05_08:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH v2] tzdata: Make /etc/timezone optional
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
X-List-Received-Date: Tue, 05 Jan 2016 19:04:39 -0000

Add INSTALL_TIMEZONE_FILE config variable to enable/disable installation
of ${sysconfdir}/timezone (/etc/timezone) by tzdata packages. Defaults
to "1" to maintain previous behavior.

Most libc implementations can be configured to retrieve system's
defaults timezone from /etc/localtime, and don't need a second file
(/etc/timezone) to express this configuration. Maintaining this file is
an unnecessary burden on sysadmins unless there's software using
/etc/timezone directly (I.e. outside of libc). Some distributions may
choose not to provide it.

Testing: Built tzdata under default config and verified CONFFILES_tzdata
still has both /etc/timezone and /etc/localtime and both are in the
image. Built with INSTALL_TIMEZONE_FILE = "0" and verified /etc/timezone
is removed from CONFFILES_tzdata and the image. Successfully installed
package to an x64 target.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
Reviewed-by: Brad Mouring <brad.mouring@ni.com>
Reviewed-by: Rich Tollerton <rich.tollerton@ni.com>
Reviewed-by: Ken Sharp <ken.sharp@ni.com>
Reviewed-by: Ross Burton <ross.burton@intel.com>
Natinst-ReviewBoard-ID: 121628
---
 meta/recipes-extended/tzdata/tzdata_2015g.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2015g.bb b/meta/recipes-extended/tzdata/tzdata_2015g.bb
index 5b2afa6..a6faa1d 100644
--- a/meta/recipes-extended/tzdata/tzdata_2015g.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2015g.bb
@@ -21,6 +21,7 @@ RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarcti
 S = "${WORKDIR}"
 
 DEFAULT_TIMEZONE ?= "Universal"
+INSTALL_TIMEZONE_FILE ?= "1"
 
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
          factory etcetera backward systemv \
@@ -48,7 +49,9 @@ do_install () {
         # Install default timezone
         if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
             install -d ${D}${sysconfdir}
-            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+            if [ "${INSTALL_TIMEZONE_FILE}" == "1" ]; then
+                echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+            fi
             ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
         else
             bberror "DEFAULT_TIMEZONE is set to an invalid value."
@@ -205,4 +208,5 @@ FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_${PN} += "${sysconfdir}/timezone ${sysconfdir}/localtime"
+CONFFILES_${PN} += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE', True)) else "" }"
+CONFFILES_${PN} += "${sysconfdir}/localtime"
-- 
2.6.2


