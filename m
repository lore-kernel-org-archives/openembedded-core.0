Return-Path: <floss@jetm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E274CD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 23:55:50 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63995.1778543745398545368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 16:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jetm.me header.s=fm2 header.b=t0czZPVR;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=MPiQIJIP;
 spf=pass (domain: jetm.me, ip: 202.12.124.156, mailfrom: floss@jetm.me)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 907F17A0040;
	Mon, 11 May 2026 19:55:44 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-02.internal (MEProxy); Mon, 11 May 2026 19:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetm.me; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1778543744; x=1778630144; bh=rGpFyLQI45
	qX7HLhq8pl8eQ3L4mwCZD4Q0uNnGBbB/4=; b=t0czZPVRjIuPhcYObnQesFjOfN
	uIYSijWJZ25quIPBiA3d7NeWGZhlg9llhMXgaz6qDFDU1ep/ZRU8hEywWMLLRsef
	CpisVIZUmI8HP9km4YttkFWQzCx4wRWgIfcYoObBYBVVOGPs/uC40JGz4Hazus0O
	ohdSul0WVYewtoIuiUSybYnScNkMjW/tVSWFf9/Zf8g65rDAskpO5T0ag1WOQy0i
	A8AhahDWw1OlCK9PwVVLob3l+2IWkQ+N0tLngFnIVRLY7mkPz20OAiA1/iPiTjfh
	UkvLqtvg3nNqs0jcU0Ata+imJUe8O6SuqFEbJpaWyAphH3Nw6IxPUYGV3oLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1778543744; x=1778630144; bh=rGpFyLQI45qX7HLhq8pl8eQ3L4mw
	CZD4Q0uNnGBbB/4=; b=MPiQIJIPIx2IOO6wUG+ZGkTsFjcHg/XKy8LdyRJL2cP3
	yx0A1215acwAA7AJ4VlgVvfC/WkFhucRapcG3oG1svjsVym8ycfiO1A8J+T78e8C
	BgEdsclofE28q3/yicf/OY4xZv44yIzidQafsdRglcGFjyPs6muzGvfy8XJrp0Cx
	Iye72Gy1ol6LTktFGGZfok6GVHOrU5qE3BrsRAJye85AeLWUSJJpXDsWIEtTsp31
	KzWZH+UjYu8jgp2bAH0QcHhKdKt5CBniGoYGbqLKC6gbJMP9fKGkdAV8qpYdcMNt
	oPzJAi3JXEH4tylHo8X/Zvy4qYUMqqQ/Hmps3o/43w==
X-ME-Sender: <xms:f2wCaoy-hu6hdSTtty50Q2XZBQORBAjQ5rH-544mAPlLfYyBAhAyEg>
    <xme:f2wCanG9L4uwo0OuY8UTSI2uXjW3aa97vMF9yn46jtnzFbRkc5VFt67pVlr7Vhfly
    lYmap3S_fMmaaB9zVeNkA-1Q6JGefYi-EsU-ppiYr1nrRYAdQVR7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvddtfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegouf
    hushhpvggtthffohhmrghinhculdegledmnecujfgurhepoffhfffugggtgffkvfevofes
    thejredtredtjeenucfhrhhomheplfgrvhhivghrucfvihgruceofhhlohhsshesjhgvth
    hmrdhmvgeqnecuggftrfgrthhtvghrnhepffeiueetueefudfftdfgjeelkedvhfehieet
    ffelfffhteekvdeuleekvedthfelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsg
    gstghlrghsshdrnhgvfidpghhithhhuhgsrdhiohenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehflhhoshhssehjvghtmhdrmhgvpdhnsggprh
    gtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeholhhivhhivghr
    rdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehophgvnhgvmh
    gsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:f2wCarfgbXA-FDk_DTirUat17EF5_pBc5r5nNYwAvxyNWc9-58IAiw>
    <xmx:f2wCavJgO5lRTF-dfVKCIBPGq48NDnNPWurjv2_kXY_oiG_jL7KkiA>
    <xmx:f2wCasEwQLyXAEQGIOelL1VVPHsVCS3hytMLEpQcigs7q4bdzL0fsQ>
    <xmx:f2wCapoTpsBV_2tf9m0r27U7SFHtnltqyh0u5MFEtdoS0FzTEJ8CSA>
    <xmx:gGwCarcCtyEH5CTMk1tM5s976XE6j6S9OZqPezsxXh1ZJI5vPJ7nxs0Y>
Feedback-ID: i9dde48b3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFC1D1EA006C; Mon, 11 May 2026 19:55:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
From: Javier Tia <floss@jetm.me>
Date: Mon, 11 May 2026 17:55:42 -0600
Subject: [PATCH] spdx30: default SPDX_PACKAGE_SUPPLIER to OpenEmbedded
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-spdx30-package-supplier-default-v1-1-12e0d086ccf4@jetm.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXN0QrCMAyF4VcZuTbQVFTwVcSLLM00OmZpVhmMv
 btVLz8O/GcF12LqcO5WKPo2t9fUQLsO5M7TTdFSM8QQj+FAhJ7Tsg+YWZ7cVq85j6YFkw5cxxn
 pJNQnocCRoFVy0cGW38Pl+rfX/qEyf7OwbR+JBq8ugwAAAA==
X-Change-ID: 20260511-spdx30-package-supplier-default-17c1bdc10a21
To: openembedded-core@lists.openembedded.org
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3797; i=floss@jetm.me;
 h=from:subject:message-id; bh=Uelom8E7biersk8ZXSab/6iLDc9OubxiPepcfKbo/HM=;
 b=owEB7QES/pANAwAKAbXuwwuoZ3cfAcsmYgBqAmx9Q2Z+RXsnjIPx2EHRmXq9wAESzN/E2wGr0
 CAC6xpgzbuJAbMEAAEKAB0WIQSbE7ILzw7eI0VKk8m17sMLqGd3HwUCagJsfQAKCRC17sMLqGd3
 H/2yC/9EqSy+r/EyuljQLqp4THbyj01QtqX+0XEiy2ctAnaCwaJPkOkPUmbmobuO+1LpCTFpKVq
 +PBstbn/TMyE/c7nAHnY5F1chaYEdya5Idf3eBHyuH/d+Y+AXFU/vPAyws2SHmdfQC7prdXA7BU
 WOB7FX25XFK1l2V0A3ipyi3WI6Qk5xjLihxtHppm4s7bkWkTfP9EmIhPUrEtmiXJWeH/CONLHY+
 gSt2VYzpY55obET4A/Nh8K28IitKrX1QkWGmcwRXfnLKPu3g8My6fNfHRM7vsQ1yluKdfoA/0dQ
 +lr+sN/OwLoU32IJNZTaeJjSXBxQlORwiTUQsjhQn1Wrmeoln0NaMAo3/l+yHxhG0h79uRtfxTJ
 pYgcshB/zuwUsYhDi0UOD18VjtXYJ3eDi6Sl32NQe57lm6g3KSOZd6tJsGjaLaA8Isz3nG0MAhc
 KCHLLL31F2eTl9ROd7G80QNdMu35YLY4hE7Wsk9FCuL4UgTmnUaHKfp33+el/QdBXBpSo=
X-Developer-Key: i=floss@jetm.me; a=openpgp;
 fpr=9B13B20BCF0EDE23454A93C9B5EEC30BA867771F
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 23:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236843

spdx_package.suppliedBy is only set when SPDX_PACKAGE_SUPPLIER is
explicitly configured. Default builds leave the property empty on every
software_Package Element, so SBOM consumers that require it (BSI
TR-03183-2 v2.1.0 validators among them, surfaced by shipcheck at
https://github.com/jetm/shipcheck/issues/3) treat the SBOM as missing a
normative field.

Default SPDX_PACKAGE_SUPPLIER_ref to the SPDX_AUTHORS_openembedded
agent already defined in this file. new_agent() resolves the _ref
redirect (meta/lib/oe/sbom30.py), so the existing OpenEmbedded
Organization Element gets attached as suppliedBy on every Package
without creating a duplicate Agent. Builds that already configure
SPDX_PACKAGE_SUPPLIER via _name/_type/_import/_ref keep their
behavior; the ??= only kicks in when nothing is set. The default
resolves to a fixed in-tree string, so SPDX output stays reproducible.

This follows the additive pattern used by commit c8e6953a0b
("spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM"): give
the field a sensible default value, leave overrides untouched.

Signed-off-by: Javier Tia <floss@jetm.me>
---
COVER-LETTER-BODY-FOLLOWS
shipcheck v0.0.6 (https://github.com/jetm/shipcheck) added an SPDX 3.0
validator that scores SBOMs against the BSI TR-03183-2 v2.1.0 minimum
content set. A stock poky core-image-minimal with
INHERIT += "create-spdx-3.0" scores 0/30 on the per-package field
check because suppliedBy is empty by default. Patch context and a
public issue are at https://github.com/jetm/shipcheck/issues/3.

This series gives SPDX_PACKAGE_SUPPLIER a sensible default by
reusing the SPDX_AUTHORS_openembedded agent already defined in
create-spdx-3.0.bbclass. new_agent() (meta/lib/oe/sbom30.py) already
supports _ref redirection, so the change is one line and no Python
is touched. Builds that already configure SPDX_PACKAGE_SUPPLIER via
_name/_type/_import/_ref keep their behavior.

Two adjacent BSI gaps were considered for this series and intentionally
left out:

- software_declaredLicense as a field on software_Package. The
  SPDX 3.0.1 spec
  (https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Package/)
  does not define such a property; license is modeled exclusively via
  Relationship Elements. The hasDeclaredLicense Relationship is
  already emitted per package in meta/lib/oe/spdx30_tasks.py
  (61ba0ef140 switched it from hasConcludedLicense). The shipcheck
  validator needs the relationship-traversal path, not a new field.

- Per-package verifiedUsing aggregated from contained software_File
  Hash Elements. This is a real spec property (cardinality 0..*) but
  the multi-hop aggregation is invasive enough to warrant a separate
  discussion. Tracked on the shipcheck issue above.

Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 meta/classes/create-spdx-3.0.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 56fd01fd53..1fc15ecc7d 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -123,6 +123,7 @@ SPDX_ON_BEHALF_OF[doc] = "The base variable name to describe the Agent on who's
 
 SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
     is supplying artifacts produced by the build"
+SPDX_PACKAGE_SUPPLIER_ref ??= "SPDX_AUTHORS_openembedded"
 
 SPDX_IMAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
     is supplying the image SBOM. The supplier will be set on all root elements \

---
base-commit: 3724b93538d3acbec9f48d4c524b51d166071708
change-id: 20260511-spdx30-package-supplier-default-17c1bdc10a21

Best regards,
--  
Javier Tia <floss@jetm.me>


