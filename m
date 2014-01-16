Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id AF6A46C9B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 17:59:40 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id m15so3547013wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QaiO0qseug647fXqgqlaK6y5ARa2kWx+7n12aqdnpsY=;
	b=Q8g9K4gLSeOxOTNixbc4HqbKTcCri58gz4EZEMEIUFACwlGkyBH68qn1Or/NF1+Nx1
	kR19J/UG7PG5Bk7qPihPvIS8coJFJmbBjOWoVgLsT7JOP3ASI3cRkAiWvNXiShE0DrWZ
	ZariQ1kRmJqxZvEmWdprfnFDyK/OPtxF0/KAlyWUZLp5PtbGfuqLtYIB8AnIkl3iM5e3
	Tl910qpdbvoHNKDUl2S4eepGR4Ekru3W6FbRq/qd3gVDDqztSMUPTV6DRHARfrFtSMqI
	tCpndWQWm2r1vf0NkdzURsrRjveDVWSeaw8UJ9hUGNZdIk/qW1OZXzrbmIsnYgd2Xam4
	1rtg==
X-Received: by 10.180.206.41 with SMTP id ll9mr9183192wic.7.1389895181285;
	Thu, 16 Jan 2014 09:59:41 -0800 (PST)
Received: from netbook.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ua8sm6926729wjc.4.2014.01.16.09.59.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jan 2014 09:59:40 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 17:59:24 +0000
Message-Id: <1389895166-2459-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
References: <1389895166-2459-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH v2 1/3] opkg-utils: Upgrade to latest git HEAD
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
X-List-Received-Date: Thu, 16 Jan 2014 17:59:41 -0000

The latest version of opkg-utils PROVIDES virtual/update-alternatives via a
script copied from opkg, packaged as update-alternatives-opkg.

The nativesdk class is added to the recipe to ensure that
nativesdk-update-alternatives-opkg is built.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 714fc51..eb54a81 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "http://code.google.com/p/opkg/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
+PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "757a1664a440c60e8126443bf984e4bdf374c327"
+SRCREV = "fd4a3a4c20ada47b19e89849ddb6ff87904f01d2"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
@@ -21,7 +22,11 @@ do_install() {
 # Avoid circular dependencies from package_ipk.bbclass
 PACKAGES_class-native = ""
 
+PACKAGES =+ "update-alternatives-opkg"
+FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
+
 RDEPENDS_${PN} = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 RDEPENDS_${PN}_class-native = ""
+RPROVIDES_update-alternatives-opkg = "update-alternatives"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.5.2


