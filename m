Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A5DC636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:51 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.103.1675289802614480658
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RMvSm+f1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id o13so146224pjg.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szH7wZq9ztvfbjwo9oqEexUTsBMxjI9+AMdFSduCbtk=;
        b=RMvSm+f1m28PyHxUpk8OGy5Rc7WrNrvP52IYtM8tEKFR64RJVgtorCYPKp8yieo2aU
         qXaa9+AfuKI5TdccYthasu2qpo21ZpACVIJGo3FZ6BOy46Rr4ddFHOXwwHmF2SHb91/W
         630ZU7LJTw9uzjTa2qWP4fZgrQqGNUKVJgLWvp0Djb8i1noW/IrPoZM9YbnA5jSm9vTa
         nEyuT1Fst97DO0KjC46sd8hyMEDWNu+Wa/G8pSj2amz2YaJgWBvmKwI2qAhUycr8NRq/
         a8e5rNJ4Zr4iVjtKzgDrxGe4sFwQRLEWnaA5FAFxJZEhxuNGA++d6Htc/h6b9/iKWdb2
         MCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szH7wZq9ztvfbjwo9oqEexUTsBMxjI9+AMdFSduCbtk=;
        b=qDvHd+GWsCzq440MEbugVTunXKEVGuNS6CQV5+21aIY+3wM/kyQPFMslG/XsgaGhe1
         zqVT6xhCVIiJ1ThNewYTfeBtiMbbOJ2qxqK0Wgx888E3qZgM5pnsWWNoOOKOLGDRdhs4
         ehK++7KdtdptKtNZb4AgQXIAav4QwAjBHqocvWQeqDk0PR2E1q280ZSAQoWoCcKBEBkS
         eFDNj5BiCEy1Wn0t0VtSBD6kjwHO6a3mj0lrnUtBdabdNDYJMZexCzozZx3LEQmbJBEe
         L9fl/7A7Lv6rrLZdok/xN6jsLNGJJV/eyesagp8/C6t5BSRx0DqbLBkxF/MP2YtHfOBa
         RZRA==
X-Gm-Message-State: AO0yUKVlQp7vGtQrqMCF0ywXVRiA45jN8QeOmfLCV8O3Eh5NIWTLDlYm
	E3up4QdtbzbjvRx193qGAZx2nT1JkPKSCxSRbeU=
X-Google-Smtp-Source: AK7set8+mq7O5OzfsTKok6rdUcQScU3z77m0LDwmDy6Vx6K5Wq5pkUs6jNftfNiS6U81kUzovox0Vw==
X-Received: by 2002:a05:6a20:3c8b:b0:bc:866e:7986 with SMTP id b11-20020a056a203c8b00b000bc866e7986mr5549248pzj.15.1675289801568;
        Wed, 01 Feb 2023 14:16:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] native: Drop special variable handling
Date: Wed,  1 Feb 2023 12:16:06 -1000
Message-Id: <47a2634831f907d83ec40ad010351c923ef67f0d.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176672

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Back when it was merged in https://git.yoctoproject.org/poky/commit/?id=c4257ed8b1040a5a0e9a95846d81961741239116
it appeared special handling in setVar was necessary. Likely due to
other fixes and improvements it no longer appears to be. The results of
"bitbake world -g" before and after this change are identical for oe-core
and meta-openembedded. Therefore drop the "parsing=True" special parameter to
setVar() meaning overrides can now be cleared.

This means that something like:

DEPENDS:append = " bash"

now functions as expected, adding bash to the target recipe and bash-native to
the native BBCLASSEXTENDED version.

Without this change, it would add bash to the native version as well as
bash-native which is clearly incorrect.

[YOCTO #15010]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99a5105f7b5303cd36077b5910c662a865c1782c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/native.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index fc7422c5d7..4de96cd59b 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -153,7 +153,7 @@ python native_virtclass_handler () {
                 newdeps.append(dep.replace(pn, bpn) + "-native")
             else:
                 newdeps.append(dep)
-        d.setVar(varname, " ".join(newdeps), parsing=True)
+        d.setVar(varname, " ".join(newdeps))
 
     map_dependencies("DEPENDS", e.data, selfref=False)
     for pkg in e.data.getVar("PACKAGES", False).split():
-- 
2.25.1


