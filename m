Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1456072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:24:41 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id s5so21181071qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2znZ27FAHnvEzvu4ECtGP0bElfErB8T/apgydcI9Ttw=;
	b=BetuZAdBNJuKY+qFYOnABLaDMDxbDBety+qcLeaGRvof/51U91uPnUlQbAdZRZOZFo
	B0mtk6mRzoSYJVVsVuQOQOcpYC2yBrDP2ToTJJa4jehjOS18oYqER3W6RcfhZrtyGLjk
	C9hPg/ekChJ3LHGZg/l+tUsaNVnfeSPGmhDLOGdyFQ8mHyWWJ4cuz24hXk/4FtOsIERj
	3g5YF5yUwc1W6ANa01GAaSnthrwpw/YHR+avOo3cjiKWw7J23CtHc0yiXTcmpreza38U
	GOt+A2euiz9I3RnTW7tRto4Wo2DSTzo+aZnm2Br65IUGx5nYs5M76R9pp8Sxy2d4I/Kv
	bPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2znZ27FAHnvEzvu4ECtGP0bElfErB8T/apgydcI9Ttw=;
	b=j/oyZ2l3tLCyRt3hQm9FJTDwZLeZoKnTRAjux3XLYqdUdsAawinT3/Mwre1HGebRfo
	ZKy7h+1avaEuf7AhR292sqVY7BT/kofko3z+QVzxlKgZalVoED+4u0VSTLmv899Clei6
	BjaktDtQZneUGvaExOyoPC0Hkw8biMiaWGXuXvIcHK68NLx0VG9XCbZT+Ksh6Frzwwfq
	W8yLB6qS5UIcnvOuao+r7paUOXRMKGatbrD171JOtxBq4xODSfta8RfcKwYk7j+69WcQ
	vuR+LDw1C6vwVWhlhQ35WW5YFoBmrBgUZdy4GLgpgikuI7WNN8IeAroPsrBp1db1EmIg
	Ig+w==
X-Gm-Message-State: AD7BkJJ4Tkzdm4CvqGfsZKOWJL/SXQ3YiKMIR65L/R3RjaIQyR25Jzi3+hwCKa6JA7m1HA==
X-Received: by 10.55.41.19 with SMTP id p19mr11131910qkh.86.1458833082576;
	Thu, 24 Mar 2016 08:24:42 -0700 (PDT)
Received: from dvm-wcdcc-khem-002.novalocal (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	m124sm3431098qhm.32.2016.03.24.08.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 08:24:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 15:24:35 +0000
Message-Id: <1458833075-543-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] nss: Explicitly link with libssp on musl/ppc
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
X-List-Received-Date: Thu, 24 Mar 2016 15:24:44 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/nss/nss_3.21.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.21.bb
index d2e2411..9f2626b 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -41,6 +41,7 @@ TD = "${S}/tentative-dist"
 TDS = "${S}/tentative-dist-staging"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
+SECURITY_LDFLAGS_append_powerpc = " -lssp_nonshared -lssp"
 
 do_configure_prepend_libc-musl () {
     sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
-- 
1.8.3.1


