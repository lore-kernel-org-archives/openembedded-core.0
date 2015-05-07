Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 56BB9601DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 May 2015 14:34:54 +0000 (UTC)
Received: by wgic8 with SMTP id c8so19084484wgi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 07:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EGv8jkJ1X4Ji/O+iLOjB8AMknAZF/s+p2L4r1QVubes=;
	b=HFM1J+atp22huGfJsJc5Ss/8h1Z44BRKbWkAYDDhIfgdCOS7G+2X2VKJc57vEpNK+E
	oow29UHEd+Wh9T8Vq4n/4djGwKkxSPf7rRDQuIqzZFlsGEuGnFBX+7famBn0ZXCzfezo
	iO/7OkAQl0+g4+aBE8JsnojJ1QgSH59dEX8Mgr7AA2XcTsDWIrOi55jCX22HNtFFSEzQ
	SypLaTen/Y4rPHp35HL0gMRuUqnngbkBzOTXZlZ0KmGmN88pJwaX0Iz2F8LA7AWJeyI0
	DFOKVLuUwqU/7xY/HdC0Ji7D8fmh0PHiNTi1sllfkzb+A4a69pR2giYsovW1z7w3tG8u
	bMrw==
X-Gm-Message-State: ALoCoQn30awEDCrqrIjMgx6AjYJ+N1xj9vEuHT/SKo1vA1lMUMLnwWE811tqSrA7OCZx8pFL/qGL
X-Received: by 10.180.82.97 with SMTP id h1mr7369719wiy.26.1431009295468;
	Thu, 07 May 2015 07:34:55 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id ei8sm3735221wjd.32.2015.05.07.07.34.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 May 2015 07:34:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 May 2015 15:30:54 +0100
Message-Id: <1431009054-29889-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431009054-29889-1-git-send-email-ross.burton@intel.com>
References: <1431009054-29889-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] bind: disable the HTTP statistics service by default
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
X-List-Received-Date: Thu, 07 May 2015 14:34:56 -0000

Rename the "libxml2" PACKAGECONFIG to "httpstats" so that is is meaningful, and
disable it by default as a web frontend to the server statistics shouldn't be
enabled by default.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/bind/bind_9.10.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
index c5bc242..539f63e 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2.bb
@@ -33,8 +33,8 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                "
 inherit autotools-brokensep update-rc.d systemd useradd pkgconfig
 
-PACKAGECONFIG ?= "libxml2"
-PACKAGECONFIG[libxml2] = "--with-libxml2,--without-libxml2,libxml2"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[httpstats] = "--with-libxml2,--without-libxml2,libxml2"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
-- 
2.1.4


