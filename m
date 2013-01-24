Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TyUGX-0000rD-Bm
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 22:23:31 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so5800788pad.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 13:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=OAobZKEic4ZhMNCb73wDpA19KyNqh2KF/LCb2e8lDFw=;
	b=OTVohVYw7Oo+MnU2vEEdQZ+jwAQx9yU6C0+DK2Vr2IcuC7rf0TtT0Yq7wW+IzVbf1l
	idj6MfSSWfYr4cevk/uTvpjdnt3BAWlQO9aGbsupquQ7U05bhqytnCZLVnnuT8fImRwG
	SFYlLzeScMR6z+29iRCrNmarzWqUAIk6yDPc4ftmlXixtoks6NYlKJSoC/4MaK1csNy0
	Hbm8pxU3kR9rsTp/FhnQLoxGmIv1CAyhB8oC3av0wPiVo4gOSDVJMstFxlqliR7uRN9d
	nKobgya+rbqoEk5335uQ8lXftyjWiLIC0fXM0X7i+fTDRSGtBT8dpDSoSV6ro5Bxb0eI
	8KnQ==
X-Received: by 10.68.241.65 with SMTP id wg1mr8582026pbc.141.1359061666971;
	Thu, 24 Jan 2013 13:07:46 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id vn2sm15484022pbc.31.2013.01.24.13.07.45
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 13:07:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 13:07:22 -0800
Message-Id: <2ba0f6007c1a72e2ee249a47610003031f6c1079.1359061155.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359061155.git.raj.khem@gmail.com>
References: <cover.1359061155.git.raj.khem@gmail.com>
Subject: [PATCH 01/11] libpcap: Add missing libusb dependency
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
X-List-Received-Date: Thu, 24 Jan 2013 21:23:32 -0000

libpcap notices libusb in its configure if its sysrooted
and ignores it if its not. But this causes problems since
there is no explicit dependency on libusb. Rebuild from shared
state sometimes fails when libusb has not been yet populated
in sysroot and libpcap has. And do_configure of consumers of libpcap e.g. tcpdump
are probing for features on libpcap. All the tests fail since
none of link steps succeed and it sees as if libpcap does
not have required features and configure of tcpdump bails out.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 882c62c..0f71227 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -8,7 +8,7 @@ SECTION = "libs/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
                     file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
-DEPENDS = "flex-native bison-native libnl"
+DEPENDS = "flex-native bison-native libnl libusb"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
-- 
1.7.9.5



