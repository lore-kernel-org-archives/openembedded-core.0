Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7764572D36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 14:46:30 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so17579887wid.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 06:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=sublKsnX+3cmMf9oKX+gAa+0ID5twZKxeUum1WgcfY8=;
	b=V8nUlBGR/u4DnmTY64EkdIRdM79XSi/mSqs0aprgdXL+julQovMgfseEX5cQ4fzjRT
	Rrcrvc7LvwtJ6ZxPfuw11ud7jjrqZxoJ3xJWaUeTVx8LfU7P0AelJpXNFuGG0TTRNR8q
	QcVqjEQw8eRCnvpNkKH9eu2EhKYtlz961qz0mQO/T4G1sJarOhXeoLZboqi3Ua1h3B8O
	8FFx6GmL//K6/8GxBnqi+/m04IVG8vydateT1+cyUeh1l4mvmMMavqFtN93bg9Tmj7yh
	5j4kO8falT7QBjKkEBXTpS4JTo7p1q1rNW0n9ScW8A++IEqtyb0jhXg5hwy4pjG5/krj
	TAew==
X-Gm-Message-State: ALoCoQkOeydgD/yz/UlSjq/YK4KvgIAVQFdA0g/T+exXaFFPv3qn1pZXtOveuTy18twZeHHg1NnP
X-Received: by 10.180.10.131 with SMTP id i3mr21826756wib.54.1424702791082;
	Mon, 23 Feb 2015 06:46:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id m4sm55881874wjb.25.2015.02.23.06.46.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 06:46:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 14:44:11 +0000
Message-Id: <1424702651-9454-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] base-files: clean up and clarify hostname logic
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
X-List-Received-Date: Mon, 23 Feb 2015 14:46:34 -0000

Change the hostname logic so that the magic value to use MACHINE as hostname is
clearly a machine value ("machinename" instead of "openembedded"), and add a
comment explaining how to set the hostname from outside the recipe and what
happens if it's unset.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |   15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 6157ff3..dd20330 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -59,10 +59,13 @@ conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
              ${sysconfdir}/default"
 
+# The default hostname.  If set to the magic value "machinename" then the value
+# of MACHINE is used.  If the hostname is unset then a /etc/hostname file isn't
+# written, suitable for environments with dynamic hostnames.
 #
-# set standard hostname, might be a candidate for a DISTRO variable? :M:
-#
-hostname = "openembedded"
+# This can be changed outside of this recipe by using
+# hostname_pn-base-files = "my-host-name".
+hostname = "machinename"
 
 BASEFILESISSUEINSTALL ?= "do_install_basefilesissue"
 
@@ -111,15 +114,15 @@ do_install () {
 
 DISTRO_VERSION[vardepsexclude] += "DATE"
 do_install_basefilesissue () {
-	if [ "${hostname}" != "" ]; then
-		if [ -n "${MACHINE}" -a "${hostname}" = "openembedded" ]; then
+	if [ "${hostname}" ]; then
+		if [ "${hostname}" = "machinename" ]; then
 			echo ${MACHINE} > ${D}${sysconfdir}/hostname
 		else
 			echo ${hostname} > ${D}${sysconfdir}/hostname
 		fi
 	fi
 
-	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
+	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
         if [ -n "${DISTRO_NAME}" ]; then
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
 		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
-- 
1.7.10.4


