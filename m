Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C35DC636D7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:11:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.13.1676236293221386631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Feb 2023 13:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vlJ7lhSj;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id o8so9257243pls.11
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 13:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/sGelX9T76pETlTtV/LscdR5ex0mRl+Zx4kOYJT9sQ=;
        b=vlJ7lhSjCz/ksIeR0uqWfTdADb8zorwnbvD7VtGsoLpF9qt3nxnvZYmg3G/cnMM+/J
         s1sfM9/LL38hgqpmnDYt4BcZ40xdAhQlaSe1EZCSf/0BqxTfzVhd7i8EoMTCqfKGyxVp
         AKox2FV9e51Zw7q6eKXdwsWJyfESLEmZnuNWYvuZYxkNvpjlM2sjTtHfhRi5fuhHQlr7
         66YS3eAuflJd+NCSD0HqQyLeKLhpbUYSyE+mkYk3alRYg4IMZ5j+84txzQ1z+sNfsD8v
         qVgbpWwhbZWVnDyPARhSOD8mF+5QaiTekBLGLEl5DIrWPA7bxL/xSwZLtantsh+bxn5K
         eaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/sGelX9T76pETlTtV/LscdR5ex0mRl+Zx4kOYJT9sQ=;
        b=JEAjnOu98cVTeBlyXgKLyMM2D0oDfqbCzRgYMBlEmv8bN804Pn8MhOgLQck+cciZ1r
         +dW8VhNqq2naV+Ae+k4GqBZE43cj7Iq18DfUhTrO9+5HLAHrW85eiJFaDaDdWbzt3HfD
         bhPTTdhb+yLRZ9EtVey1MdW+Kgroqrs5aWcylEBUvgWiDv7pEdja6cz+NWNcZkbVGf7q
         WwEzwte+RSGdRGnGT0HoASVOh7he8iRgX57Ne45HqBuezF9sXjHgm00npHNgPbXrCC84
         2AjDDQlGl/ckSgV/N0IGt5rNDZR9aoiB0+CZjei6yI4zsDX61OLO6emtiWSqut8auKlS
         lg0A==
X-Gm-Message-State: AO0yUKXzrvXK1QthQkm8XF4ggncMz/EAjx7TPs2HFSUrDBP2Z/NyrqJ8
	c+d+LjkA1wlw1tTFw/gQWWcSxTX77Kdt5ZBBJH0=
X-Google-Smtp-Source: AK7set9cLCejLXk28IvaESg1jWejA52CKrQo48YMCRdXxYqe7yBIDB9ILHjtRAoqT717bc7xev0rdQ==
X-Received: by 2002:a17:902:f243:b0:19a:7e03:c4fd with SMTP id j3-20020a170902f24300b0019a7e03c4fdmr5468127plc.0.1676236292197;
        Sun, 12 Feb 2023 13:11:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902b71700b001933b4b1a49sm5675482pls.183.2023.02.12.13.11.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:11:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/27] testimage: Fix error message to reflect new syntax
Date: Sun, 12 Feb 2023 11:10:38 -1000
Message-Id: <03eced200a69ee64cb0efdca164e0d287314beac.1676236110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676236110.git.steve@sakoman.com>
References: <cover.1676236110.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Feb 2023 21:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177065

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec73d19d78e8f30ff9b817490c23bcdf8ea47c86)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 8ffaeab284..34173ce68d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -240,7 +240,7 @@ def testimage_main(d):
         with open(tdname, "r") as f:
             td = json.load(f)
     except FileNotFoundError as err:
-        bb.fatal('File %s not found (%s).\nHave you built the image with INHERIT += "testimage" in the conf/local.conf?' % (tdname, err))
+        bb.fatal('File %s not found (%s).\nHave you built the image with IMAGE_CLASSES += "testimage" in the conf/local.conf?' % (tdname, err))
 
     # Some variables need to be updates (mostly paths) with the
     # ones of the current environment because some tests require them.
-- 
2.34.1


