Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id B84C7732AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:41:45 +0000 (UTC)
Received: by wesq59 with SMTP id q59so20327889wes.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 09:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rYKP+rjGRyumgsBw/aLD9kk9fJHH7ni6fc/mEiFzcQ0=;
	b=hDF7yJQlITn9dzPh/3G8fiOqModmso5sD3DVojvPmVOV76tiILlRTqIYQKJ3yKrGBT
	yYCHo1CEB5mRUKpiSp/dF+HOG5MrYXKJAZEvY30kkcfUCbj60ey96Rm6ehhERv1hmygo
	yxJJ88eotD453R0nCshScDVVdd3A/75k5KXaMa1qj5sn0J46dec6rM5LO+8a/EWUsCA6
	CiefVfFO2lKRVG2XV9t0GNIkF69+0Yw/iK1V624fWBtndvVqIpXfLGb1A5EWCSay3Izo
	O5e9VhyVAOOPeWz+22lSJ3J2qQ0j3tz2i2+iHzp7HTj7CU2pjojFpbQNH3tAXbN6y8QX
	5EUQ==
X-Gm-Message-State: ALoCoQkzoLb9IohvWLR7gObnCALFPMEoDPA27IYypxFqh7GsJxnM5l+iKrz7EW6uZd9LL1JpDVU4
X-Received: by 10.194.187.236 with SMTP id fv12mr24690901wjc.131.1424713305778;
	Mon, 23 Feb 2015 09:41:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	dx11sm53615735wjb.23.2015.02.23.09.41.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 09:41:43 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:39:24 +0000
Message-Id: <1424713164-14602-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] base-files: clean up and clarify hostname logic
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
X-List-Received-Date: Mon, 23 Feb 2015 17:41:47 -0000

Change the hostname logic the default value is ${MACHINE}, and explain how to
change it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6157ff3..f2d254e 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -59,10 +59,13 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
              ${sysconfdir}/default"
 
+# By default the hostname is the machine name. If the hostname is unset then a
+# /etc/hostname file isn't written, suitable for environments with dynamic
+# hostnames.
 #
-# set standard hostname, might be a candidate for a DISTRO variable? :M:
-#
-hostname = "openembedded"
+# The hostname can be changed outside of this recipe by using
+# hostname_pn-base-files = "my-host-name".
+hostname = "${MACHINE}"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
@@ -111,15 +114,11 @@ do_install () {
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
-	if [ "${hostname}" != "" ]; then
-		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
-			echo ${MACHINE} > ${D}${sysconfdir}/hostname
-		else
-			echo ${hostname} > ${D}${sysconfdir}/hostname
-		fi
+	if [ "${hostname}" ]; then
+		echo ${hostname} > ${D}${sysconfdir}/hostname
 	fi
 
-	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
         if [ -n "${DISTRO_NAME}" ]; then
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
-- 
1.7.10.4


