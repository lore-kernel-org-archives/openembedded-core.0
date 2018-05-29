Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 74F1B74D47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:29:55 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e9-v6so7895140pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C6EM1x9L+UxzjBfHI4C7NW+CelHz0Bq5yFFlDzzzUNo=;
	b=B74DBoaGzZwWDIvfvosuFZfDgJiWKPNYLYnn1IUMDoasrqp1qLG5/F2z1Xo13TuwEf
	rmQkbgaOv6n2sy2LD+VBB2+ShOnaYkvVVpaq9UV8CBMOX4whwkXhPREaLQdsYI7LD865
	mEbqRLMHLMOce+4UcZZJfVE4adrHrHVqDM/2lbfUvW1eFTF6BANelef9LCq7kCVppz95
	ZtpqiuXWxQni2cvpPr1zjmXF0Jw96laI03JIIDN8EktV2vwhBO3fdW/4TeZ63ovsSM1R
	3ilp/qL8eZaVGwY6Yysffm3T+SUKRlY/xOzoSWtVYUlJX6EzNf+E8xD0STu2iN4TSwqX
	dq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C6EM1x9L+UxzjBfHI4C7NW+CelHz0Bq5yFFlDzzzUNo=;
	b=h1xO7020+iXRfLOdDdZQrJ2B05Y0X/w15lu++godagmLJB/4TpHvp1Q6GwmK57+xem
	DlTHlgMDvL/wOOD/jWa/PLffDRFUCihX5jcNgF4YjUb5D0jh19BI0piAp8ktkEkmXzUJ
	SZVEYbR+rKhCKgfNJHu/afhwsteZ/wnunUBeAXyZ8daxKI5uetHdrZW0DMzaedkanXYY
	LtQ6BseVReTe/nP8bEuU5Sy5hfvRTXtAWmBtRVdjyloicO6dw5RBUKqB4jEMi4FeXJX1
	vpeartCfjIVLHqyHsv8q3cNfBTBOIG99fsArVzubni4xnCk3bC45v06mVCoAFv0H/mPS
	g9ag==
X-Gm-Message-State: ALKqPweEccYU8Xbhm/Qmbbl59a7hpZyfcKMYbcynM+RBHhwNrNSCIULK
	BziCb52ycwLCrJREGFixOl1V2A==
X-Google-Smtp-Source: ADUXVKJgusyp+uiCM/9denma7+dOrdLOUHOFTgysVkJhj02TC09IGmI34RQ60n/5V0XRyPMp3FeiDg==
X-Received: by 2002:a63:7b0e:: with SMTP id w14-v6mr64695pgc.165.1527629396291;
	Tue, 29 May 2018 14:29:56 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.29.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:29:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:44 -0700
Message-Id: <1527629388-3808-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 1/5] distcc: move ASNEEDED over-ride into the distcc recipe
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
X-List-Received-Date: Tue, 29 May 2018 21:29:55 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Re-apply change, which was previously merged and then reverted to
avoid conflicts with a distcc version update.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc     | 1 -
 meta/recipes-devtools/distcc/distcc_3.3.bb | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index f2e7e7b..9c23564 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
 
 TARGET_LDFLAGS += "${ASNEEDED}"
diff --git a/meta/recipes-devtools/distcc/distcc_3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.bb
index 40648e2..33a64ce 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
@@ -25,6 +25,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
+ASNEEDED = ""
+
 EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 
 USERADD_PACKAGES = "${PN}"
-- 
1.9.1


