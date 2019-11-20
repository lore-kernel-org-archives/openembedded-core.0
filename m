Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1FD67F88D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:38:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n1so1075427wra.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FEfRxk3DNrwGL2wE9+gdvnS6999lgemv6Ym4VYE3Fr0=;
	b=ofPe9cvAJfDhsRFLlqwhCTnJR40UKk9zZn7CxWxmIzo/URiqvoS7dO2JmOeVsYzvgw
	k0JcinpEBgQmKmzUjTChLfAiSISKjBqIVuQxa3E6kAHl97Dcm4l+kCBFEx+/KrUAMe1d
	Zim35B5YctGFPyQPgEv779TqJnrzXZ4vkA9AT2Ah7d/6zVPXr6vCqrW8eWmFFdAPbAgA
	o9ZM/M5rrKziG+FVod/S31fJIojCvRPCP+45hQH084+srFNEJS5e7jbIS4MJJXAp1KEo
	IfhmFeuqkBlSMQCmAbGo+mmdAvXdRth+Px5bP58mZbjUyGHhAunIO/JY89gfY70DKgbd
	9mdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FEfRxk3DNrwGL2wE9+gdvnS6999lgemv6Ym4VYE3Fr0=;
	b=dWH+Ap2pgAz+qUrDlLKbq243NMPOyEpJDueR4sVEzzHYHeA1AT7wgUi9qJAjAET5Oz
	Xx1RPSQCR3y3ghZQ298iDTBQ0CsbOmWzP+FTdFtxB6Btm1PEiUqiXbzb0ap5WviA73Q5
	BpPoGxXPOc7ssv1X2Qchi52MdrzhVMG4gxRdgG6gEmnmW7Jdz33uTvPrGvN8BTh/EROs
	you2Myy+5PRw0QFb2m7UqBkk8Bjmyk33G55LwpYiv6gIpjOI4GXq7G6M74R4OtWEmSon
	zeJETwu02PkJGK5aTFpyZwZ83aZZiIyVoRezL8l419WZkew69idnqmdsxsu0hMZMCXQF
	2Iow==
X-Gm-Message-State: APjAAAXGOHU0DmqgFOvknaw9CxTyhhIMIp1Lrtjdm0/3kJFypDi0qKQx
	78OYUce/tWA6kJzEesnwXyq/glaeCrU=
X-Google-Smtp-Source: APXvYqyJRE6I29SLZJ+C6vVgiwKO+rxS+gZJdx2yszZStVI4563+SBNzPWwdplt6I3hsFAj8qyBYTw==
X-Received: by 2002:adf:db8e:: with SMTP id u14mr492060wri.274.1574275105311; 
	Wed, 20 Nov 2019 10:38:25 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p25sm143652wma.20.2019.11.20.10.38.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 10:38:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 18:38:13 +0000
Message-Id: <20191120183813.9390-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120183813.9390-1-ross.burton@intel.com>
References: <20191120183813.9390-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] grub: don't autoreconf twice
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
X-List-Received-Date: Wed, 20 Nov 2019 18:38:25 -0000
Content-Transfer-Encoding: 8bit

do_configure() essentially calls autogen.sh to generate some sources and then
autoreconf, but autogen.sh also calls autoreconf.

Pass a magic variable so that autogen.sh doesn't autoreconf for us.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7138e4df872..b3291cb4b80 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -60,8 +60,9 @@ BUILD_LDFLAGS = ""
 export PYTHON = "python3"
 
 do_configure_prepend() {
-	( cd ${S}
-	${S}/autogen.sh )
+	cd ${S}
+	FROM_BOOTSTRAP=1 ${S}/autogen.sh
+	cd ${B}
 }
 
 RDEPENDS_${PN}_class-native = ""
-- 
2.20.1


