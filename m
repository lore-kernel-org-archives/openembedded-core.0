Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EA1CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 12:01:57 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13805.1762430516475487203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 04:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=sf0yqJnv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=AHVpjaJm;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.151, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 8D9BEEC01CA;
	Thu,  6 Nov 2025 07:01:55 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 06 Nov 2025 07:01:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:message-id:mime-version
	:reply-to:subject:subject:to:to; s=fm1; t=1762430515; x=
	1762516915; bh=SoV/UBAcjWPBXH/NsnX/wEFHk3QNPdasjLgy0HIyOVI=; b=s
	f0yqJnvBWu4797hV0USjfVpqBeNSbvGlo6pb3VTDfwTEP6gQa93/iwlGQUcmiIsJ
	SxZe3YzWkbANvdOucz2TZwH/rdVkI4TRNxNafbsmK5uMtneu6JcSOFmhLeo5t/tW
	l66Fm2g9G8wqUvpsCu08XADzM4zG0VDRW3cPjLcmWisN95XBSh0i1lJDHt3fKWPp
	Tma+P0H6eHx3jF50jOGn7j0P6l99OeK3IcnXipt5tHcoFXwKiE2UQkDfqLjqIUjY
	EdaG32cMxN8ANGXNNn7d+D/2kptp/K6Lu7Y5LsTEm8UWjvBMe1y5qoHMH5pjuSzH
	sxObIcqBMi3UBJ0ZOplZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1762430515; x=1762516915; bh=SoV/UBAcjWPBXH/NsnX/wEFHk3QN
	PdasjLgy0HIyOVI=; b=AHVpjaJmM5UPT1SrMnQbhQ/e7lK5mDASSI4aV3wu40jv
	avkdaGd9fvbLJ1+B6umKxhDB9l+eJLGgdsLvz1ZHd3x3VDNbLOeg3FIoQ4/JtFED
	7Y6MH7qPxwEMPpKdeG0vTh6fS4Ca1yfaTDaUg5JLrCcGvq0yuzejNbv57AWGcwe4
	MQ+Hg0M2nnTMjGfCPWakP0LMDjXMs+0ft3qGKF4jEzFWnB0n90a7Yp/q6wbGU7Zt
	v+qZFEepn6/R5V1rsyLKFM9o4+9nfj/g9fqqp+memA1izZhxBNDMF5S7ntLCkkNp
	7qx1liiMcPjXa+izZkkUNTXXKUQdPQ+La6g+xCUyRQ==
X-ME-Sender: <xms:M44MaUCMC8_sBoowvoK_q8ZWXeT7vplVY_zDj-OWeG6x1THOUv3Wtw>
    <xme:M44MacjWfyuYKdnevGBV9CvKikflSMWU5l-RzMUFpiSSz5cw3W24aFXy3BA59S9R4
    f4srCg3jmYXRDsr5O2ZYBpZKXqZu7pOggyA1mRZJSvlApdjerJDaUo>
X-ME-Received: <xmr:M44MaVMZDwX-zHtT0H8HyPudEuZfmzXGxO54NkGwRhJknbJjOJsweDmS9fTRGFo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeijeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegt
    ohhnthgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefftd
    eifeeljeefjeeuvedvuefhkedtieeggedtudfhfeefffdvjeeiuedvjeehgfenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdpnhgs
    pghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghonhhtrg
    gtthesshgthhhnfigrlhhtvghrrdgvuhdprhgtphhtthhopehophgvnhgvmhgsvgguuggv
    ugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:M44MaV6jjDJURrpbIXWOB7OwxXiuvSkPZzK2p0RHejlVX3PY7ItTeA>
    <xmx:M44Mab2AFum-JzCmFo38PCUE1IT0o6LEt4Nkesz5XrEtiy4JOJBOtA>
    <xmx:M44MaeaJEqglzaLSczZVTKIZ_XEiUWy2KjW1r_Uh0MdpH1rHsxAHIw>
    <xmx:M44MabANZqce56dU0E61zGZzjF1rqPz_8_4UEJ0ffiOQ6QXXhR6jog>
    <xmx:M44MaYnrdKi1q9nz1n2Kj23w0d8Ss38nb0G3oGqLkXXh3yR_i7oOC9Sc>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 07:01:54 -0500 (EST)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
Date: Thu, 06 Nov 2025 14:01:20 +0200
Subject: [PATCH v3] features_check: improve error message for missing
 required DISTRO_FEATURES
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-v3-features_check-improve-error-v3-1-a81ca99e55d6@schnwalter.eu>
X-B4-Tracking: v=1; b=H4sIAA+ODGkC/0XNTQ7CIBBA4as0rJ2Gn2KoK+9hjCE4FaKFZqBo0
 vTuEjcuv817G8tIATM7dRsjrCGHFBvUoWPO2/hACPdmJrnUQvAjVAUT2rIS5pvz6J4Q5oVSRUC
 iRKC5MtbogdtxYK2yEE7h8ztcrs0TpRmKJ7T/LpejUHoQYy+kMQoEuBSLdeWcnY9v+ypIPa5s3
 7+h8dkPsAAAAA==
X-Change-ID: 20251106-v3-features_check-improve-error-5038a8540a94
To: openembedded-core@lists.openembedded.org
Cc: Walter Werner SCHNEIDER <contact@schnwalter.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762430514; l=2463;
 i=contact@schnwalter.eu; s=20251106; h=from:subject:message-id;
 bh=a/UvrBOgBfv8zIPSu3z47cbsSur6UUq66q7BvzbmVlA=;
 b=9CqrOpHlymKR+TzX0XCT87Hxqro6CHpInstEXVGshcfxaHa6GDkFcp7MZnHlAvCMF90Eqq26t
 nLHIAbECZz3CIenI7PYwe5PRXsC487WeMZ6jGsIzypzHyV17dIGMn5T
X-Developer-Key: i=contact@schnwalter.eu; a=ed25519;
 pk=OoafUGtB7zQJLYhKA7ALCjqddXAaem/uP/eb3GGNkTI=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225977

The original message for REQUIRED_DISTRO_FEATURES entries that were
missing from DISTRO_FEATURES was:

ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: missing required distro feature 'wayland'
(not in DISTRO_FEATURES)

For newcomers, this is error message doesn't provide enough information to
identify the root cause, which could be: using the wrong DISTRO. This patch
changes the error message to include the distro name:

ERROR: Nothing PROVIDES 'core-image-weston'
core-image-weston was skipped: using DISTRO 'nodistro', which is missing
required DISTRO_FEATURES: 'wayland'

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---
v2 -> v3: Change only the error for DISTRO and update commit description.
v1 -> v2: Changed the error message.

Link to v2: https://lore.kernel.org/openembedded-core/20251029135419.12883-1-contact@schnwalter.eu/
---
 meta/classes-recipe/features_check.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 1e0eaa4eedb50fbfb09f8a1c56631db3782db6c2..46d8243cb6b34f44a03345f7e34948444a3ca7c2 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -42,8 +42,12 @@ python () {
         if required_features:
             missing = set.difference(required_features, features)
             if missing:
-                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
-                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
+                if kind == 'DISTRO':
+                    raise bb.parse.SkipRecipe("using %s '%s', which is missing required %s_FEATURES: '%s'"
+                        % (kind, d.getVar(kind), kind, ' '.join(missing)))
+                else:
+                    raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
+                        % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
 
         conflict_features = set((d.getVar('CONFLICT_' + kind + '_FEATURES') or '').split())
         if conflict_features:

---
base-commit: 8ce0359c4eade11b445bc227c42f7f1212a2d9c3
change-id: 20251106-v3-features_check-improve-error-5038a8540a94

Best regards,
-- 
Walter Werner SCHNEIDER <contact@schnwalter.eu>


