Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1518B794EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 06:26:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f1-v6so1149456wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 23:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=eyE3R14Ysy5gGUsdYPa23nTaa2rBwMyTNh8CvGnbqSo=;
	b=MCh/EzzjsvlsYTMXhIzjrJhuoc4izNE1I0n+0h+uUtfmSjI3mPui7xagVL14/ePDKE
	qEDpOpfNOib/2GgMuw2eG/EgPrkBzTqg2A+iW4y7+iKzTx/XrPzZBLXxSHl12b7ry0dm
	5QxJpv7GlbPGvBeoLFNEzhWXqd/bzdX7RSS5ZkqHztnZaDRxM15EGt+1twWx/Wc8Houq
	5ByWMPPiNmO8CzQ1vQGMzhxI5n+b0cxjT484ASaz1JdPDaqTni0SX3YepURnCmynSH5o
	zzrm5kqXt//vXIICne4GNPWKJcJ5dqOILwpPIThIODrF0sELI7WpPxuw86GTnBBZU1AD
	vycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eyE3R14Ysy5gGUsdYPa23nTaa2rBwMyTNh8CvGnbqSo=;
	b=hoOIvoR17yV/m4B73lq3gZHeW8yaxenZJQAYW0UECFMB/Nu6BpM141JqWkjXQ7SLtI
	l2sVpnmCVpFxeZulw36NNDw4hP5Ld6Hc4iAbnSlL6ZmUSYyE+keA2PEX4aumWuC8WNXY
	dYAsP2rIM6uk8Oa7K2gaCR6Dqg5AmKLx7lDVSgWvYBOHLuLCPbuuuI+b6xgjQT7y7wqm
	LyCaRioiN20dWvdWgAL528QoMuA5gmPP4uaLOrIR4s5THmj2/SIcsbCnQNUPBvqKouyw
	PTKWpsfFXIwMZ1Luz/FLnljmoySjuiHI4kE6/Ha6xGz+fMrqlla4lbh7RRzBo8SfJ0kq
	agfQ==
X-Gm-Message-State: AGRZ1gJIWp9kGGU8aOs3H8MOqsGv+wNuSooASlt81Hwi9zsq4J2FK3dc
	pjazuB4RfOfMNGDaei/2BiDUVwZMT5Q=
X-Google-Smtp-Source: AJdET5f+48jWbRy96ExnN7CTUpn00QxX/xmCqI2V4j9Oekl21TFriRqEOcDmcvu6x+LjJu6uEbmSpA==
X-Received: by 2002:a1c:2c87:: with SMTP id
	s129-v6mr358333wms.127.1540448796561; 
	Wed, 24 Oct 2018 23:26:36 -0700 (PDT)
Received: from localhost.localdomain ([109.144.208.247])
	by smtp.gmail.com with ESMTPSA id
	a13-v6sm4460998wrs.73.2018.10.24.23.26.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Oct 2018 23:26:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Thu, 25 Oct 2018 07:26:34 +0100
Message-Id: <1540448794-12553-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testimage.bbclass: define ptest suite variable
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
X-List-Received-Date: Thu, 25 Oct 2018 06:26:36 -0000

From: Armin Kuster <akuster@mvista.com>

Ptest has dependencies on other tests so contain them in a
variable. This allows layers to not worry about maintaining the depends
themselves.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/classes/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2642a72..2d6976f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,6 +49,7 @@ SYSTEMDSUITE = "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 MINTESTSUITE = "ping"
 NETTESTSUITE = "${MINTESTSUITE} ssh df date scp oe_syslog ${SYSTEMDSUITE}"
 DEVTESTSUITE = "gcc kernelmodule ldd"
+PTESTTESTSUITE = "${MINTESTSUITE} ssh scp ptest"
 
 DEFAULT_TEST_SUITES = "${MINTESTSUITE} auto"
 DEFAULT_TEST_SUITES_pn-core-image-minimal = "${MINTESTSUITE}"
-- 
2.7.4


