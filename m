Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsArJ-0003fN-EA
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 12:27:15 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Jan 2013 03:12:02 -0800
Received: by mail-wg0-f69.google.com with SMTP id es5so16346050wgb.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 03:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=EDfgKpEvbC7FjJ1qSwDdR5GBfzsws6Z0kppfkbsQ0o8=;
	b=DDe2UJbVbLMYBGlIY/mt49uP9d+TyWV9FcVsu1KfHisszasdMmGKdgcMG6w+e4jF9W
	WNZDhaSkyGyRWGUJlhRk7k4AEIR0yZuabPDduCxk+L2ceCpPOgtf+BPW594zrGAOFiwy
	+RaMru3T8smzEJg8b7FKdCKLUafOeBbIdl4c0xAhWm63Gjqt7NLkpiheAskyKWh/kcMb
	t00d6b51Xe6FUArOG3kcIDtiPafIpGfx4sbSNMwq4l+Gp1+OeEZ4xaeeKCKYZYiw5fWJ
	s07crMUojPohyERXpZXAcLjHtrV2Mr6MblbGlbtrNmoauYAc/Q7Y5KhLv/4h1H8Kc01p
	ZnCA==
X-Received: by 10.180.19.99 with SMTP id d3mr8651499wie.4.1357557120668;
	Mon, 07 Jan 2013 03:12:00 -0800 (PST)
X-Received: by 10.180.19.99 with SMTP id d3mr8651488wie.4.1357557120569;
	Mon, 07 Jan 2013 03:12:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id l5sm12993779wia.10.2013.01.07.03.11.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 03:11:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 11:09:58 +0000
Message-Id: <1357557002-22183-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
References: <1357557002-22183-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQm0fpY3yZRsj6HxnFEawrI88R9vyN0k0UeKbcGMQ33B9TesS1Fu/JgFmiUHq1/JNnbVkm63uDjLahJizL2W8dFsKenzAEQC5AKNWmHua92dt55mgO3StKk/OAaPDpnPd6e3N0WI0aW0MneEQLzaYgRhN4ShQDU53ZbIBFat4qqxKjT7B4s9IuC4GBF2TWCMvSKQrOsQ
Subject: [PATCH 3/7] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Mon, 07 Jan 2013 11:27:20 -0000
X-List-Received-Date: Mon, 07 Jan 2013 11:27:20 -0000
X-List-Received-Date: Mon, 07 Jan 2013 11:27:20 -0000

From: Constantin Musca <constantinx.musca@intel.com>

We need to fix the "hosts: files dns mdns4" nsswitch.conf line
because for a .local lookup it does a DNS lookup first which will fail.
The recommended solution is:
hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4

[YOCTO #2502]

(From OE-Core rev: dbb350b90417962f2da4c1064ab0174badeb0f26)

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index a1f2f9a..f7356e4 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -24,13 +24,13 @@ DEBIANNAME_${PN} = "libnss-mdns"
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 
 pkg_postinst_${PN} () {
-if ! grep -q '^hosts:.*\<mdns4\>' $D/etc/nsswitch.conf; then
-	sed -e 's/^hosts:.*/& mdns4/' -i $D/etc/nsswitch.conf
-fi
+	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns4\5/' \
+		-i $D/etc/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
-if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
-	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
-fi
+	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
+		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
+		-i /etc/nsswitch.conf
 }
-- 
1.7.10.4



