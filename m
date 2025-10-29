Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BA5CCF9EB
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 16:01:59 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.web11.9281.1761753712980842876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 09:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=rpOqcOGx;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=R8wfSbBV;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.159, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4E54614000BA;
	Wed, 29 Oct 2025 12:01:52 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 29 Oct 2025 12:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1761753712; x=1761840112; bh=hFZFONHlHn1Oae9Bkd44N
	a/CK5LA0OXScbgCuK5NTA4=; b=rpOqcOGxvCHvRZCGcurOSOUZeIok902zsJwQ6
	XSTGcpjEjVpONOV8OSBeE7c2jLoJP/4+Hnw3x79XoqfCsyef2PS0NUFv4IaZElOR
	j+FS62190noo8YrpWfBO3hMThiUg0/QzJF51xhwun443QL+N7M77QWw/KSE/cbMa
	udYiWgoYmg9Kc7ZUBeUZDo3pbst1DhuQLeOUYY/3x7YuZwMfO3kK03JrfG3+uSOv
	2YAicIib0oNDytHQQmLK12vkWObYLTkFBtjqMPm5jp9pOW6bKBCrXXOtXAaR35qk
	J2ifpa3lcw/RM/VtbkpYhrBKm+ulgpv4fP52MDZQHESLsYbzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761753712; x=1761840112; bh=hFZFONHlHn1Oae9Bkd44Na/CK5LA0OXScbg
	CuK5NTA4=; b=R8wfSbBV44bXaOqhtshO8ZtvLBPvX4M1VRtXXw0yCWcOS61g8nd
	dfggw2ETjPy86MaDRS2+/A4Gy15UccE04mQ3UAVdgFpMPuTVq3HaWxv4+MdiKbvZ
	v9Ti49NSbFbqmjoVJBLwrS0QJ5S4fRW92ZjriJmK5qhhdz8LHgteSelNdpkkyS+M
	jiA6e51zfQICh/4jS0v8rhhAj+a4UpU/JYS19JXAQwPa1rmaNN59Z2o6mBpmleFq
	C+WgBhEru4g5m1GtJXXaqQO2SkaAO+pMK7iVNKq7eQe1luZWzO5vXOVGsK5cF0k6
	a3vpjFFEskcaUdnNP2lYK4vW5wAqKHR+ckg==
X-ME-Sender: <xms:bzoCaUYy0_Y6sN19XZwq89V6ySQh8w9YejVZHkkikP6erJYpjHxGgw>
    <xme:bzoCaWVgP4poYVAPIlBh9loZvkU2_j95BxXTs_N1NBfdOHu0beT1NTBYmOfWNjoc1
    7aJ0jxCdNKD-LKlJJKScMvjNx23VbVNxkUdFX3lWYKtwZK8IzQQSg>
X-ME-Received: <xmr:bzoCaUk01bwV3jSQx7Tu06005Y8IBZCBOiWXWSeTy1VpVTJ8RssmbBUJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieegudehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttd
    enucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgkeejhf
    euffdvkeduheegudeuffeuvdfggfekffffgedvgfekgeevieevueffueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstg
    hhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhoph
    gvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:bzoCaTxagt2WWlo_juRLzNMhp90ajwPSL2KZnJIJnQ_Lr4z7cYUWdQ>
    <xmx:bzoCafhIB0bd2LQyOkwxX4wgGCwnDJ-OugdF3AfVue-C_p5zNL_nvQ>
    <xmx:bzoCaYXO83IpmxIEjB-gsXNTKtCV7JhhyE7BgNciJAkgG2gIfXzEbw>
    <xmx:bzoCaR129cSpUpxrw843UY69hF49FMlLRwMi2rl2s4RvICnlFycCMQ>
    <xmx:cDoCaZLSCCTk8vObGsbIO-75bBUv1EiZDBM6kgdQPxoqhnDtXkNy-0vZ>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 29 Oct 2025 12:01:51 -0400 (EDT)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-sato: Add x11 as required feature.
Date: Wed, 29 Oct 2025 18:01:10 +0200
Message-ID: <20251029160129.95965-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225458

Even though x11 is currently a default DISTRO feature, even for
nodistro, core-image-sato should require the x11 feature. Without the
x11 in DISTRO_FEATURES, bitbake fails with the following:

ERROR: Required build target 'core-image-sato' has no buildable providers.
Missing or unbuildable dependency chain was: ['core-image-sato',
'packagegroup-core-x11-base']

With this change, the error changes to something more clear to new
users of the project:

ERROR: Nothing PROVIDES 'core-image-sato'
core-image-sato was skipped: missing required distro feature 'x11'
(not in DISTRO_FEATURES)

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---

This is somewhat related to my other recent patches, they all help
improve the errors displayed in various situations that new users might
be in.


 meta/recipes-sato/images/core-image-sato.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 5ff35d772c..8702bef8e9 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -8,7 +8,9 @@ IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbe
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-2.0-utils"
 TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0-utils"

