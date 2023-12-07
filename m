Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D94AC10DCE
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 22:33:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.105801.1701988425403367842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 14:33:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=d8NdHF2F;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3316a4bc37dso1484752f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701988423; x=1702593223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spWD4BDqmUjag16tMTWy1r8gSDhX1T0vgqcCv2H9Gfs=;
        b=d8NdHF2FOFDqCKGFuE9jecBCFM9CviZvaxHnpqP9Djdpsq8CXeO6vRXYWCWPVHSF1/
         TRJsFba65wWsrfBD8NFef505i7iMYTos6t2I+yL3sCc8N0aHkWzx8cioWGar+PtwT2bN
         rd6TYdSt5amOAgY+Q93Fj5vMtUm91LU89MaXe7fIWmbqXKWW3Xt5UJgGZlaRvIQQVYA0
         ZxZhqr8h3kvWYvu6a1IEufjTZMdgq3U3veGtq5QVE9AuzdcTfEn1z6o3Lcm0eoaJ+Ffr
         4VXoVWHuWJGNqkfF8HukkV8enTems35wk3T571Zprg/SK3n7hZDIG2ZSmVyh7cAVk+tA
         zEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701988423; x=1702593223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spWD4BDqmUjag16tMTWy1r8gSDhX1T0vgqcCv2H9Gfs=;
        b=AeFvM4/OabEZLZ/6odKJWbQdbdjapIZJUdZfRof81qgxj1iurd+VQjyXwKMhD0Qhco
         ByLdvy7is/WHdFLFNayDGwafBwQEfwZuCESqQfIJYhEYHaWI3zOBoU9/K9yJhIt/+hlD
         4JMImkOwB2nXCy3dEe/AMEoaPij/aC9RjETv9TMyW22c34PT2tNRyUJqiCOVFwpD+2aC
         6yOLAGrwmwqrmjo9IKYh3+PUFEs2ziVaYCrMXmH041Sc/vAO0Tyneb64eYCUjBgb6h4u
         fAl0NAIJzZ4bI71EnjzT4RMopfiXtOY61FOSd8/vnCfl0c4b/7wWKhFo0yijb1yzKr2c
         ELzg==
X-Gm-Message-State: AOJu0YxINz4uA3EnlU8FLmXPO41wt0/wISnNsd859HH8uFbLLoXaA4IF
	NP5t6Xiuh4Qo3XITr/LTL6bqR6LzrREHYpBkvEM=
X-Google-Smtp-Source: AGHT+IGrbhxzTQI1CrbFX9BdCvooTNKV7wlFghjG/sNq5m9ujb6gJJo4dBhogeL98lTK9lLZKR/RDQ==
X-Received: by 2002:adf:ec4d:0:b0:333:3d27:626a with SMTP id w13-20020adfec4d000000b003333d27626amr1947188wrn.1.1701988422734;
        Thu, 07 Dec 2023 14:33:42 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id k17-20020adfe8d1000000b00332fa6cc8acsm622601wrn.87.2023.12.07.14.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 14:33:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Yoann Congal <yoann.congal@smile.fr>,
	Chris Wyse <chris.wyse@wysechoice.net>
Subject: [kirkstone][PATCH] externalsrc: Ensure SRCREV is processed before accessing SRC_URI
Date: Thu,  7 Dec 2023 23:32:58 +0100
Message-Id: <20231207223258.3273718-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 22:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191978

Call bb.fetch.get_srcrev() before accessing SRC_URI. Without this new
bb.fetch.get_srcrev() call, SRC_URI might be accessed before SRCREV had
a chance to be processed.

In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=62afa02d01794376efab75623f42e7e08af08526
However, this commit is not suited for backport since it is quite invasive.
The part of the commit that fix the bug is:
    --- a/meta/classes/externalsrc.bbclass
    +++ b/meta/classes/externalsrc.bbclass
    @@ -63,6 +63,7 @@ python () {
             else:
                 d.setVar('B', '${WORKDIR}/${BPN}-${PV}')

    +        bb.fetch.get_hashvalue(d)
             local_srcuri = []
             fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
             for url in fetch.urls:

NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
equivalent to bb.fetch.get_srcrev().

Fixes [YOCTO #14918]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
---
Richard, Steve: This is the commit we discussed at today's bug triage.
---
 meta/classes/externalsrc.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 97d7379d9f..eb6afca4ab 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -62,6 +62,9 @@ python () {
         else:
             d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
+        # Ensure SRCREV has been processed before accessing SRC_URI
+        bb.fetch.get_srcrev(d)
+
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
         for url in fetch.urls:
-- 
2.30.2


