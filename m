Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web08.1943.1608233275146668495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 11:27:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=lY0g1pc2;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id 58D7719433ED
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 17 Dec 2020 14:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=UiOcb4fVTRg0l8jIs
	Ki4TNQtD7HO9Pg8PVsGa/mi3TU=; b=lY0g1pc2kktKLNQ3dKrR1nCOsXtHNsiUE
	K+txvv7plFsYX8BhgJ9w3DQlYHJ0P7fp9yAlscoF3/O5HKR/TCN4aErxAOO41cwJ
	br7RZx5CwR/Mcz+dy/fTOFk6oe2xzMXx2rdF7by6GgCFtjsjeeNWlka9yzegA1jY
	XcpAEPZdIg7eXcNPndoy+PtcYg7KjWgCr5KqE/dE0nUcvrIVbq+A7s1tJ0jDrhur
	eqEy0fwo6LSX3J/rJqvoDI5aBRGF+uz5ENllxZ99hWIHfERHkO7GElmWi1Zc/87Z
	KYXRoKtvnYfE+ePLiqpgOzCZ7EIGxJk6V+RsejVAGo0HD/jdr7yDw==
X-ME-Sender: <xms:ObHbX3LOK0Lf3wvaPmz6s6P1NAyRS8sa_rQcukGkKadbdJO0pH7FNw>
    <xme:ObHbX7JuL_1ZqLG3jZ-IEO_CZuzEfyBERTlb1OP1kLE7al-glLDditWD4u12ALxY2
    CEGgF1OqwqnEdc7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdr
    fhhiqeenucggtffrrghtthgvrhhnpefhhfehheeiieffgeeuvedvkeduledtgeevffelgf
    elfeduffefgfejteeiteeiieenucfkphepudekkedruddviedrkeelrdehvdenucfuphgr
    mhfkphfpvghtfihorhhkpedukeekrdduvdeirdekledrhedvnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:ObHbX_tlHsp6dE4LB3RQVhf5qXj_-22JJGzahGMkngEnTR2tGtXgbQ>
    <xmx:ObHbXwZa2FAE-6NlHigu8DCriq2PC6eXAe6Qlmv1f4BioxCLbKXhgA>
    <xmx:ObHbX-Z8yzoWr6cScbLMUTYCFNDYLkIL1PSkbFbHLQSct9lfCCG3Uw>
    <xmx:OrHbX3nVqO0Pi_eMftEiG2OhIFVdINzOz94QXIgQmZbPODgIF_-T2A>
Received: from localhost.localdomain (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 758BC1080064
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:27:53 -0500 (EST)
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] pulseaudio: Autotools to Meson
Date: Thu, 17 Dec 2020 21:27:34 +0200
Message-Id: <20201217192738.14311-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PulseAudio project plans to drop Autotools support in 15.0, so let's
switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
some old cruft that sounds like it has something to do Libtool, so it's
perhaps relevant for the goal of dropping Autotools. The next two
patches disable features that aren't available with Meson. The last
patch does the build system switch.

Tanu Kaskinen (4):
  pulseaudio: Remove OE_LT_RPATH_ALLOW
  pulseaudio: disable EsounD support
  pulseaudio: disable GConf support
  pulseaudio: switch build system from Autotools to Meson

 .../pulseaudio/pulseaudio.inc                 | 69 ++++++++-----------
 ...-option-for-enabling-disabling-Valgr.patch | 67 ++++++++++++++++++
 .../pulseaudio/pulseaudio_14.0.bb             |  1 +
 3 files changed, 97 insertions(+), 40 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch

-- 
2.20.1

