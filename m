Return-Path: <contact@schnwalter.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23768CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:51:08 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web10.9393.1761652260715557744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm1 header.b=dv246WeM;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=sieKr48+;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.147, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id DD065EC04A4;
	Tue, 28 Oct 2025 07:50:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 28 Oct 2025 07:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1761652259; x=1761738659; bh=aO0J/IQej/ea1CV+rM5xm
	fUWTSvot6BdpPsvDQ2EryU=; b=dv246WeMJfYawIQswNsBpF9mbrxk7x5PMuEyZ
	3PtCIu7moIq2uupUtc1rgHTSSLUcgOBv7SMulkby8ct3XuSf9djjuMeFONYj8S+W
	AmE9R01bXLp+lTmGDAPqIzR4jITwUXmzwSelSPoxyoWyaINuxwpxMiZ/5Kfe5K98
	uHPGppGutxsjS8rX4hj3qwysivc9f/1qsCy3H2g24Nb3SNMguDxScUjqLo0tHFKg
	IfTvoldU4LkVJpKETNLaDEtCBFuUIrD7uOxN5uJvE8/r0wFUFAmU44MJEDO2jdC3
	M2lbTGFzf+vs7jsce5ipFcDZ+7RGwCHKtWPVq4qQ+p2Ytdx1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1761652259; x=1761738659; bh=aO0J/IQej/ea1CV+rM5xmfUWTSvot6BdpPs
	vDQ2EryU=; b=sieKr48+UDjZg6G72WsmxI/vioq24xsB468XuO8DkZMHYfWhFZw
	GyMy8f1F9qx7fUlck9MRqvE44gJWaIbJ8KF1SXeGmY7NrCyeec6ASvY6tmxncyyn
	haGrj4J7JoUsqeNVVFPkrrkFvqU2hgwM00SVMmY9dwTphvyBMsg40CZ5ZD6hK3Jo
	pHvj4kS49JY01ShowzgDgWs/rrT8P7sRnGQ7k38Xc6jg8M+9T4W6IEJOZScUooB0
	T+TQugNhMap+rjzVWlgJBvlZ8n2qwhRl321Vz+HDi311qLdK349c+PUybglfPecx
	M5+5bt28dzwWrNKmxAfJ7mcm9z/VwU+A3gQ==
X-ME-Sender: <xms:I64AacJeByYTt93Qnm9P9VteU10t0gw8vWgIwolxcXgF_YfLBo0Vgw>
    <xme:I64AaTG5vQ0GQ4z-akDDAYv3nDfnnxuWQfa02r7RgrnR3HWiSkDA_ENEGViKicgEx
    X3macANbAgRNDBnNAgTv8BjZvubKudZnZGvgpPkTF6HaOGFBuNz>
X-ME-Received: <xmr:I64AaSVLeAFBKG8Fomaink-6MN2BSXCsW4joj0Z438bEHk4ltrUTkQOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduiedtjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtredttd
    enucfhrhhomhephggrlhhtvghrucghvghrnhgvrhcuufevjffpgffkfffgtfcuoegtohhn
    thgrtghtsehstghhnhifrghlthgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgkeejhf
    euffdvkeduheegudeuffeuvdfggfekffffgedvgfekgeevieevueffueenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhnthgrtghtsehstg
    hhnhifrghlthgvrhdrvghupdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhoph
    gvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:I64Aaei9THhgTUbW1YLigFQVtx6G8NMSThzIb0UvakC33J-OTHxxIg>
    <xmx:I64AaTRBUA7aG3JxqbvBy2rQ7ccBSzOyNJyDWHbqvquMjspYKZtm6w>
    <xmx:I64AaRFoWygX6anybuKbISn28U2t_7fX_uOZvq9bqfP3dlwAaKz0dQ>
    <xmx:I64AabmeFQspf_NNpkQz1otRyNTnC965SisLJRglL7mkDi6_9fbR2g>
    <xmx:I64AabuwBJhSWCcwXHuA2-Yru9Kle0SPhhhYk-cf0jHg9l1NhOFtmRZw>
Feedback-ID: i455149b6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Tue,
 28 Oct 2025 07:50:59 -0400 (EDT)
From: Walter Werner SCHNEIDER <contact@schnwalter.eu>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] features_check: warn about nodistro in message
Date: Tue, 28 Oct 2025 13:48:50 +0200
Message-ID: <20251028115035.966245-1-contact@schnwalter.eu>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 11:51:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225396

When a required distro feature is missing and DISTRO is set to nodistro,
provide a clear hint to the user. This helps newcomers starting projects
without a DISTRO configured who attempt to build images like
core-image-weston that depend on specific distro features.

Signed-off-by: Walter Werner SCHNEIDER <contact@schnwalter.eu>
---

This is related to my other patch that adds features_check to
core-image-weston. It improves the message a bit, so that newcomers
don't start adding DISTRO_FEATURES instead of setting a proper DISTRO
for their project.

 meta/classes-recipe/features_check.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/features_check.bbclass b/meta/classes-recipe/features_check.bbclass
index 1e0eaa4eed..4b0dcc9b97 100644
--- a/meta/classes-recipe/features_check.bbclass
+++ b/meta/classes-recipe/features_check.bbclass
@@ -42,8 +42,12 @@ python () {
         if required_features:
             missing = set.difference(required_features, features)
             if missing:
-                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES)"
-                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind))
+                details = ''
+                if kind == 'DISTRO' and d.getVar('DISTRO') == 'nodistro':
+                    details = '; Did you forget to set DISTRO?'
+                raise bb.parse.SkipRecipe("missing required %s feature%s '%s' (not in %s_FEATURES%s)"
+                    % (kind.lower(), 's' if len(missing) > 1 else '', ' '.join(missing), kind, details))
+
 
         conflict_features = set((d.getVar('CONFLICT_' + kind + '_FEATURES') or '').split())
         if conflict_features:

