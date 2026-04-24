Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628E6FF8841
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32599.1777064223947734487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z6i/RhRq;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b150559bso65819985e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064222; x=1777669022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+LEaC04R+J5uv8Bat0Fcy3xS9C1eOdCCef0eXV8Ygg=;
        b=z6i/RhRqU/Ot1alJicN3nNuINx0rvWoKkJIR/GSga99o0odRof6DY8GlBhJrcXvcrc
         hm/cIiLUaJeqm94N46Jili0iYnR91djBA7VAbot4V94gClNoC7oG8mHRAfB5cWS8drDL
         iBWw3UQanr5QaOpEhxHaD/0dVkeiJluMLm9JA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064222; x=1777669022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+LEaC04R+J5uv8Bat0Fcy3xS9C1eOdCCef0eXV8Ygg=;
        b=b0TFZuF+enJXnntgHic7mfucHFy66k9Y1SxMEbOcyL0jbqz5rAq/LrFxF/JtXMGJmM
         Yek3yyywSe3NJCtmTORfRFUVoLHU6ckUfXei610VUHtyocjWZwbhQKco8ilpLvn093K2
         gjTpoPYTmMYcrJ0f9sLABr/I4yD5CaAF2gZAN6hhQpCYqQ0dLURU5jS3b5r9fJAgJQly
         E4+F1UqT2pE5O7/rtgyk4k1zrIdFxTEeOu9FZiJsO1mCcMaT8k96kplKRdVZoM+vKerJ
         9xbxSuvOtLW6SA/+YKUWYKJUbTkwqvfZeEB31lcSjeGpoUQBOnsjoUtG/irDyH/iyobq
         GFZA==
X-Gm-Message-State: AOJu0YzYeCWMcQGmwEdr/fA+IwfZCHstCc32EVsffdMMbzXKHF7yeLpD
	ExlNHc8Ook48zI2slQ21nNUs6H++iJaT7OlnkQfKbyzxHWiQ/wc/sV1AbVHzBAAYDiIcL9YLzP8
	BXiEa6YciV+go
X-Gm-Gg: AeBDievHniJ5XAKAIceM6Lik6chCcbAnu4X0N9bKjKp+BgVS/bn9JEahXTSzWrvppQQ
	Dlv6Yv7oVd21HNgXJc6jTZoi/5aFX6DpdMgNiBxhTzB7JqhNN68Z5Iz1RRVLX/WousVdvxIo11e
	+otfcy1+Jd4Jegwo1l7vrxKsifmhSeCRpfl+HfZtnLiY7QO2iIh2khiqA3mIqLCgoNh1o61kJi5
	XR1blPF7lsCs0e6kQQgO08qs2yFdzBBRzYGTTIlIvtwmyWX3POp1ZKJxa55p0KM13ptAOTgPZtu
	+MG1WMojES5D/MUMHG5IytyGHgMTOPJawR2Kl9tfE2CFX89ZyUW4cGSSSUqRNP8rGxN6QuTV+0k
	F4csX0aPXFTUcx+Xf4fERuhk+BSndd3DkXGmisnw8GjS8+Ba4SXlAJbCkOchLECT9tx5Vn2mJn+
	4Ng6hbc0HUijUT/1+RdO9PYebvmj6HOrraYXVJ2WfC9fdwAPRy6UOURd0UaG2j75EfyXk/87U40
	4EVDpUxT7uJUB9B1F2Rlh32cFfwuSBwWxOSqQ==
X-Received: by 2002:a05:600c:8b28:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48a5c230e78mr181789775e9.19.1777064222081;
        Fri, 24 Apr 2026 13:57:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 43/66] scripts: Default to https git protocol for YP/OE repos
Date: Fri, 24 Apr 2026 22:55:42 +0200
Message-ID: <b9de796f797844b035e50e22c4f939fc90e176f8.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235915

From: Yoann Congal <yoann.congal@smile.fr>

Following up on commit 139102a73d41 ("recipes: Default to https git protocol where possible"),
> The recommendation from server maintainers is that the https protocol
> is both faster and more reliable than the dedicated git protocol at this point.
> Switch to it where possible.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74dd04549624b1d3ba6d4febe51fa9ba1c86944c)
---
 scripts/combo-layer.conf.example | 4 ++--
 scripts/contrib/patchtest.sh     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 90e2b58723b..4ae3db45ab1 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -14,7 +14,7 @@ signoff = False
 
 # mandatory options
 # git upstream uri
-src_uri = git://git.openembedded.org/bitbake
+src_uri = https://git.openembedded.org/bitbake
 
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
@@ -76,7 +76,7 @@ last_revision =
 # that matches the original commit.
 
 [oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
+src_uri = https://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
diff --git a/scripts/contrib/patchtest.sh b/scripts/contrib/patchtest.sh
index b1e1ea334b9..550b6a88f3c 100755
--- a/scripts/contrib/patchtest.sh
+++ b/scripts/contrib/patchtest.sh
@@ -75,8 +75,8 @@ source $PTENV/bin/activate
 cd $PTENV
 
 # clone or pull
-clone git://git.yoctoproject.org/patchtest $PT
-clone git://git.yoctoproject.org/patchtest-oe $PTOE
+clone https://git.yoctoproject.org/patchtest $PT
+clone https://git.yoctoproject.org/patchtest-oe $PTOE
 
 # install requirements
 pip install -r $PT/requirements.txt --quiet

