Return-Path: <adraszik@digisoft.tv>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9E5827623B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 12:48:57 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so63475728wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 05:48:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=9nN9dA+kEl2DcJhTefau8zVGZzBE7rrIhmCDi802dw8=;
	b=DMAl9WsxrKNd+InkEj/xIiq5LvwsJ4aAee3ZbeOhHxNL1sFDtQk19lLJBgrVCe8OFW
	6FvTEo478weh8sV4iwtv/GRft3fnzIjRy+anCcGUV56nxcK6T5tdmgNwQEOF2t1oxed0
	yl+A8ZbK4W2UQFbPERwsztEhnNIFuLUXrbAThSTZXcXO55f75z0Z8k/QD76UhDmi8gWC
	8R7EiSSNoO5LC/xqHQf+AcYpuFO4fy3sODto4zK1D6/YTSq6gImfFL29WZtLaE1rtnU5
	8Cun2OfwtOBCiwLZGa0z0BxmlFjs/jrimNWA+JgzxC5ZwPpRRNBWGpCRW/3WhrRT3a7u
	hZ+w==
X-Gm-Message-State: ALoCoQnevMiMjIPozCbV/8H5LbBSVZ8iqmBsqomKvEV6nhXIBvQdPfGpI48pxR2ERg57mKL3k+ca
X-Received: by 10.194.23.225 with SMTP id p1mr28394090wjf.155.1437742137326;
	Fri, 24 Jul 2015 05:48:57 -0700 (PDT)
Received: from bri0771.fritz.box (31-187-15-27.dynamic.upc.ie. [31.187.15.27])
	by smtp.gmail.com with ESMTPSA id
	x5sm3374677wif.21.2015.07.24.05.48.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jul 2015 05:48:56 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@digisoft.tv>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jul 2015 13:48:48 +0100
Message-Id: <1437742128-23260-6-git-send-email-adraszik@digisoft.tv>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
References: <1437742128-23260-1-git-send-email-adraszik@digisoft.tv>
MIME-Version: 1.0
Subject: [PATCH 5/5] opkg-utils: use ${bindir} instead of hardcoding /usr/bin
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
X-List-Received-Date: Fri, 24 Jul 2015 12:48:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2f66632..5f518d2 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -28,6 +28,10 @@ do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
 }
 
+do_install_append_class-target() {
+	sed -i ${D}${bindir}/update-alternatives -e 's,/usr/bin,${bindir},g; s,/usr/lib,${libdir},g'
+}
+
 PACKAGES =+ "update-alternatives-opkg"
 FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
 RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"
-- 
2.1.4


