Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S4tFF-000490-4x
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 13:11:57 +0100
Received: by wera1 with SMTP id a1so3145598wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2012 04:03:21 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.135.225 as permitted sender)
	client-ip=10.216.135.225; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.135.225 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.135.225])
	by 10.216.135.225 with SMTP id u75mr5446591wei.97.1331035401778
	(num_hops = 1); Tue, 06 Mar 2012 04:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Gb0o7FQjr+Vg1jNl8fEPyXZq4zm8Tuf7Zn1YOF4GXbs=;
	b=iWTHTUoMp15FwPGffQ66dQEo4AcJI4FmAok/iCCz3cqpADN23jf8dHw7cKzQ2pvjO5
	hPInGX/JCJhbLakENpyzr7FYGi0cM9+SwI9kwKf7Yzrdf2JzdvATOzFFl9AKkedlFkQC
	APKW8YNNjEeVy6WH+q4tlYCyE60Q+k4ez5dDrgP+ne/wlFZiaNWKIGU1cTkQpq1uA6mp
	clKhY3AyCZKVZasKBqxNLwmQl+d/6EZRxtstTtu0jLAIdB0T2nYeF5OMBpG9pLzRK201
	/Kib0obaOVdIMP0Da+/WgQOHRjcFQTL0zCoGeXbfCb2cHsDAMP6cjujutfHo2mT/7i0g
	eOhw==
MIME-Version: 1.0
Received: by 10.216.135.225 with SMTP id u75mr4376146wei.97.1331035401646;
	Tue, 06 Mar 2012 04:03:21 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hv7sm8452712wib.1.2012.03.06.04.03.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 04:03:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2012 13:03:13 +0100
Message-Id: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQm8AZxkmbmfAy9xevcveyzsyGphSXQ92hSn8AdM8bsU0p7x2uFr8tPPIxpQhEJTrVjxsFjC
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] xz: split out liblzma as seperate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 12:11:57 -0000

As usual, this creates problems for upgrade paths, but splitting out the lib is worth the short term hassle

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
index bae71ec..e8f96b6 100644
--- a/meta/recipes-extended/xz/xz_5.0.3.bb
+++ b/meta/recipes-extended/xz/xz_5.0.3.bb
@@ -14,8 +14,15 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
 SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
 
-PR = "r0"
+PR = "r1"
 
 inherit autotools gettext
 
+PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
+
+FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
+FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
+FILES_liblzma-staticdev = "${libdir}/liblzma.a"
+FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
+
 BBCLASSEXTEND = "native"
-- 
1.7.2.5



