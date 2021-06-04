Received: from mailrelay4-2.pub.mailoutpod1-cph3.one.com (mailrelay4-2.pub.mailoutpod1-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.web11.5922.1622797344935985786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=20191106 header.b=BipmXvU+;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.3, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=20191106;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=0JSaR9ZHmx17udznxJYpAPzw1uxuumaOBZT4Jv61HC0=;
	b=BipmXvU+S5VaCB58mMV3WuH0/1NemKz+2aheXhP4FkJy421Rr74eENazoacMnb8PNzlhCa9nHaknt
	 9n/nsITtxXCZujA73yzczRV8GnmwES04VshKSW/yUZXCmLh5QUVoE2eUnEdpxLKiCZGpUqrlCpl9re
	 JE1CiH5zXDZEe9pPwX9Hk8El+W5P2EHXoRR9tWfJd9Mv0bZiCFSP0/UVFni9GiyKHE6dPntzW/pqSM
	 FfBWTAjX8B0buHB7WepIntxfHBILmFqCV+uQeHsJwoTm0eEzDdJXzlDLDvRSoZqMx3NyALFnQH+Ts5
	 JKXpMVWswELPIdplp3CTtGYkXhvs3iw==
X-HalOne-Cookie: 431bdafe74d5fa046725e7808843f44c95834462
X-HalOne-ID: 90423831-c513-11eb-a907-d0431ea8bb10
Received: from localhost.localdomain (h-79-136-99-68.na.cust.bahnhof.se [79.136.99.68])
	by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 90423831-c513-11eb-a907-d0431ea8bb10;
	Fri, 04 Jun 2021 09:02:21 +0000 (UTC)
From: "Peter Bergin" <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH] libavtp: add recipe to be able to use aaf config for alsa-plugins
Date: Fri,  4 Jun 2021 11:02:16 +0200
Message-Id: <20210604090216.553285-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to enable configuration option aaf (AVTP Audio Format)
used for AVB the library libavtp is a dependency but no recipe for
this library was present. aaf support for alsa-plugins was
introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 meta/recipes-multimedia/libavtp/libavtp_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-multimedia/libavtp/libavtp_git.bb

diff --git a/meta/recipes-multimedia/libavtp/libavtp_git.bb b/meta/recipes-multimedia/libavtp/libavtp_git.bb
new file mode 100644
index 0000000000..2ead7912e5
--- /dev/null
+++ b/meta/recipes-multimedia/libavtp/libavtp_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
+               specified in IEEE 1722-2016 spec."
+HOMEPAGE = "https://github.com/Avnu/libavtp"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
+
+PROVIDES = "avtp"
+
+SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master"
+SRCREV = "43a1f61565313166254ab92a39b53a005ac99ee2"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dtests=disabled"
-- 
2.25.1

