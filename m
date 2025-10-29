Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF57CCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 13:54:48 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web11.6575.1761746083124628328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 06:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=XvmrqVu1;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=i+5PH+CH;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.147, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5468EEC091F;
	Wed, 29 Oct 2025 09:54:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 29 Oct 2025 09:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1761746082; x=1761832482; bh=VAAAPjuRP3qE0tc+4niAR
	bPSdAt6UoJh6I5uU/NrBjg=; b=XvmrqVu1oLA/92S6I74Yh7nuC5TTzaRtPzZc7
	1IKXBhArcxrI6GH7FJXgyVO9hSIkvzf4HzeJKCKUQ1QrMMtv/MMMxggDzu51sFh+
	69bMRCLg/wwMvtdb0RD6M1Qk+TQ0q9+HvxpZOHkcbp2FkfM2dVSC2x/N5T3MC0le
	rn+69youLaBClwSSGOg+atuph7yJVtRPFIZvXINa4wSaRQrxkx22rXgkIaKsiBF5
	fob27ifJ1iWgB0hBE07tG1MOObT6YXCFlMhC6pTYvCYjAuywKJ2HcuXTrY+LuKQX
	L8goxECGRCEGiSXqPB24YkE2Htnm4Utv6gc+DTkLhExxXVtCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761746082; x=1761832482; bh=VAAAPjuRP3qE0tc+4niARbPSdAt6UoJh6I5
	uU/NrBjg=; b=i+5PH+CHqFaAswqMNVHNmD8X7RBtFqiotYzsaHYHVM08UyKysbS
	ie4WOpZZzmo+dz9U9P7Co5tRoxoJemzAzlRH7ZNIUXM3OWN+UizXwqtqchCPibJM
	QHXhbjeQ4LU5WmH4dPelaebeUlvbXZfS1FJmZxEZxLy3qjBMhXrfPZqAG2b9JgyD
	r0tLqs/vJpdqlbsm6M9RKMPmctcRcI3Sm7geumMxOgjPQTz8sRh2W9WUvEpQk02m
	p+u3euIphMAEM96eLtmQyskSHQVpTGMxqRa2jcasYFxGcExzu8pd/s/zDFMhMBvx
	cLGZdKflHArVPa9mb1VxHH1hWQuCkdMVCsA==
X-ME-Sender: <xms:oRwCaebVxo6HFBJ1lp4XbZshvle8_5WZV4Tp_L8ngj97LlQGBXWicQ>
    <xme:oRwCaYXLfbkc51xH6lidPf28FvymHFM4YGhCN1ktCMvjMgf-t1jGveKaD81wjBeE_
    rlznIUpydNy-j80t59ctlJlQ9gbX56CtlGBIsHcj57VEz6NMuV5Jw>
X-ME-Received: <xmr:oRwCaemQJ3D0zA8IL-VVTfhr32aiAP-x_xyF1bMIgZjY3U1qPlemc6JO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduieefledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttd
    enucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgkeejhf
    euffdvkeduheegudeuffeuvdfggfekffffgedvgfekgeevieevueffueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstg
    hhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhoph
    gvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:oRwCaVyKS1rVCB7Fhy-ShuIJTP76QdWOcXF4kInk8Bfd5gc5WW1snA>
    <xmx:oRwCaZiGbUZau0Y_QxXQisC0QqmWNqE8MjlxZpgOAmD_SO7n12uhXw>
    <xmx:oRwCaaXLWQkXuhUdacSQXL7_He52N4P5n-ua1oGrAavCnWzbw5Nmaw>
    <xmx:oRwCab38TIk7oIzzG4GO9mup379Qzsr0R_3lU3mDQXiwO2u5gcksqw>
    <xmx:ohwCabKsadCmDgPJXBatNeIKdjrDY7HdCfHSmoup0t13SXYAFz5Io_2G>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 29 Oct 2025 09:54:41 -0400 (EDT)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] features_check: warn about nodistro in message
Date: Wed, 29 Oct 2025 15:48:38 +0200
Message-ID: <20251029135419.12883-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 13:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225456

When a required distro feature is missing and DISTRO is set to nodistro,
provide a clear hint to the user. This helps newcomers starting projects
without a DISTRO configured who attempt to build images like
core-image-weston that depend on specific distro features.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
v1 -> v2: Changed the error message.

As pointed out by others, the message might not be technically correct,
but I think it's good enough for new users, experienced users will know
that they can either update the DISTRO_FEATURES or use a different
DISTRO, new users will start asking question why they have "nodistro"
and wether or not that has something to do with the missing
DISTRO_FEATURES. This is how the error message used to look like:

ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: missing required distro feature 'wayland'
(not in DISTRO_FEATURES)

And now it looks like this:

ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: using DISTRO 'nodistro', which is missing
required DISTRO_FEATURES: 'wayland'



 meta/classes-recipe/features_check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 1e0eaa4eed..36ed4fa4be 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -42,8 +42,13 @@ python () {
         if required_features:
             missing = set.difference(required_features, features)
             if missing:
-                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
-                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
+                if kind == 'DISTRO':
+                    raise bb.parse.SkipRecipe("using %s '%s', which is missing required %s_FEATURES: '%s'"
+                        % (kind, d.getVar(kind), kind, ' '.join(missing)))
+                else:
+                    raise bb.parse.SkipRecipe("missing required %s_FEATURES: '%s'"
+                        % (kind, ' '.join(missing)))
+
 
         conflict_features = set((d.getVar('CONFLICT_' + kind + '_FEATURES') or '').split())
         if conflict_features:

