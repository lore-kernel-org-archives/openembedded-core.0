Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1092CC79FAA
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:03 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34909.1788788153187247167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=y1F3DCzI;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482f9309813so3166045f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788151; x=1789392951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TJ7ADLpE+vBXDdfqWOstwBnQtZFDBYhdHhqn2Lu2cTM=;
        b=y1F3DCzI2dNBJ9Pax4RnAzZmFgoXz45h++uqtfIAOGMNzIC62+dJTqmWpNB4AySUja
         ixhAcg/3mh56vMglCXkDJR6wYS6PS6H6jFfcVof8VWWnmGu4i54xdmpa5hfNH2dR5clY
         2QftBmBQCoBWhD6EnGtHtZawUl26LhmfqMJV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788151; x=1789392951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TJ7ADLpE+vBXDdfqWOstwBnQtZFDBYhdHhqn2Lu2cTM=;
        b=rtW485gHL8ECWfJ++VgZSX9gLOpESBcCjmHMwSg6dISDBFcGKTeKEHFubiprAZCKNw
         flAW1CZs0DEnIp3LvGZ0U/P0LWxLqDslVgG0kj1Zzx36L9YcwBq1mNgo/OhCkIr10wIZ
         /9gmpwLGRubq9I8dFYqLE1K8hbV8kziICjf+255xHAemKJW1uUfelKumlRGH/+OvSxZq
         CJYfKwKg4kyb6tgUor+arVAeXmtwQebAK+aPaCDB4olrt5Hq8nPBlM3matenHjtqFJWp
         eXhVC3Vdhegq1ZkgG7zhAXMcokfKdp9Nlq1cGx6eW1H2g4f2WBq4Y+Et1wwUZs0RBl3z
         jtuQ==
X-Gm-Message-State: AFuF++k7t0z82S7M5kwHzCdjnLjmco0tUfYajzqby0DhHPZjh6Jv4OmG
	foSxZNISI/gPqUpLYgKnK4yrgI1AuHGtZZpfEmEYO+UAQmLqCoNEy6CJEyXgEnR/5hRNY0cJwRF
	/1yH/vkw=
X-Gm-Gg: AYBFou2zY3V0grvcaX7EYIcFQcmQJOKp7CrIwj7le/ztQR96tlCrYoKSXRUq63uhRhF
	kT9hm85UYr3LfVEQCqW9JFBhxjIZfW2GXB1yo2GIMMaUWboRWZlOlfqKFMqS5hEYSWF4TF0fD0g
	C2Dh6A007X0atd19QEP+DVoeMEb5IFBuMzcOZwN6j8YfoDogMNEMzke81iWIXpapDjvXvydwu2z
	V571p8eY2oRi7O+8SnGQsMvprayB8M/GwTJb5wbojB3H65QldZ/NUhyfUuJNjnyhWr406fQqpPX
	8rumhCiglzJmMhHh3OQfOqIDZTfH9JCMEvQky2WF4DZxHgP5dRZ3vDRZgEn/OZNCGyiNgvSuH67
	z+LAgyqYGxf1ouPcJzZTaJBA/UDaYZKQNf1eUI4yWbNdxvZKghWXrYl/xHDf6RBgFOMLWgT05a5
	BoophWDWz+Vf4/8of1MoJZRXSrF834fWO5WGcu7Hct8L2FqmS4f8ew1tlRyHU6FnokUpY1UXFxj
	hhQjWASenchy8pkuDK0SHeVUsLwF9Zq3MxfUpX+1K2NWWDKradkn6mt1BO1DZhjQg==
X-Received: by 2002:a5d:5d83:0:b0:485:8c16:5eec with SMTP id ffacd0b85a97d-4858c166045mr19547967f8f.38.1788788151372;
        Mon, 07 Sep 2026 06:35:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.35.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:35:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/35] apt: mark CVE-2011-3374 as not-applicable-config
Date: Mon,  7 Sep 2026 15:34:57 +0200
Message-ID: <fea209d2e34efbd3bc3dc5af0f6df61f6a8a4353.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245259

From: Anil Dongare <adongare@cisco.com>

Details: https://security-tracker.debian.org/tracker/CVE-2011-3374

The vulnerability is a design-level flaw in the legacy apt-key utility regarding
the global trust model of GPG keys.

This is marked as not-applicable-config because apt-key net-update is
disabled by default, and Debian vendor configuration does not define the
archive keyring URI required to use that path. Ignore this CVE in this
recipe due to this configuration.

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: made commit title more precise.
net-update is disabled by default here:
  https://salsa.debian.org/apt-team/apt/-/blob/2.6.1/cmdline/apt-key.in?ref_type=tags#L179
]
---
 meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.1.bb
index 12915660b0f..8b48de3498b 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
@@ -38,6 +38,9 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
 
+# Not applicable: Debian vendor configuration does not enable apt-key net-update.
+CVE_STATUS[CVE-2011-3374] = "not-applicable-config: apt-key net-update is disabled by default and Debian vendor configuration has no archive keyring URI"
+
 inherit cmake perlnative bash-completion useradd
 
 # User is added to allow apt to drop privs, will runtime warn without

