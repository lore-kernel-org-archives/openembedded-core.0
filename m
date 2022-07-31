Return-Path: <lenriquez389@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BE2C00140
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 12:39:21 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.12833.1659271151563788290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 05:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mpkdU+ud;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: lenriquez389@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id v3so10022196wrp.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jul 2022 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+DcCTsjcoPKjctFa45hObilxef1+F0CwQ5evmIDKQAI=;
        b=mpkdU+udcHkK0DgmvyhgxGwq9QE4Lxw5A5HqHJd/Z6e1MQutkxBtSryPsWkouvI/jt
         Pmf4NlJ62gy0yWg82uueKlhqf6l22HH2OrASZvcTETMOmy9/1vxXK5hdZOvnXmYc+xFj
         hvp24Wjml9hcbYOOEgES4QWv628JyG7Wq68wP+Oyb00tf5wzH6c3FbrtxhKQrsuGFWqf
         kVHTEm6n6NqGRcWiJOJjOHxOXxodNtD8joQYFu0EqrZZ6xxHg/+0ON8DR+WvhQ8iuBZj
         LkXYzRl9WF/9sBPQBq0NuwrOUW8dGfluhx0z6azSeGX7j2DJ4Z4zQ2Yy5nzD0Nl08XDK
         pEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+DcCTsjcoPKjctFa45hObilxef1+F0CwQ5evmIDKQAI=;
        b=XQ6AetVtFwbpSiBfImDswZlPtK8mK7OUsNaz9vY9hD74s0iZKxAj4Z8xSmwPN9XnHl
         KGXb5Zv/YGkajH1S0pyO8Dk0maL9tqplRxyGK3qOPXpZMlRe2Sm16mXyQzf0kO4bIfvw
         /3+H6WqQz5W/ksyBD65eaVrN79/Az47Ex+HBYXoRrgLBm7rAONihdfWwAcxgTotnMLia
         A9yBnvPTjmHTWTeMI6tPUomWaNW2WKrQ0C4I+TQ2DzIDSgDSjO3jj+G3IHYYnqgoM7jj
         0I+cE44pEqfIF3O9jxrd0nf3gsuPfY0XaTRbulClnGn+9DQkue93Ka8RV1omJRBfer9x
         1sBg==
X-Gm-Message-State: ACgBeo3rqzx4SUXlwAZiXcctb4DkaELYgC/4eWDdTHkbptGE+7l0joWg
	q36C+IA1hYWO4shZoE5VmBcHCTX1Av0=
X-Google-Smtp-Source: 
 AA6agR7TBJUvvpwFqeUxH4KqzTPx21YEG72NkCp/DVNmkRcbO3FEA5yaErUrbsPuZ9RgDz1rbfTDTQ==
X-Received: by 2002:a05:6000:2c8:b0:21d:b356:5f21 with SMTP id
 o8-20020a05600002c800b0021db3565f21mr7643421wry.515.1659271149694;
        Sun, 31 Jul 2022 05:39:09 -0700 (PDT)
Received: from Asus.numericable.fr (174.18.86.79.rev.sfr.net. [79.86.18.174])
        by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b0021e297d6850sm8607151wrs.110.2022.07.31.05.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 05:39:09 -0700 (PDT)
From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
X-Google-Original-From: LUIS ENRIQUEZ <luis.enriquez@se.com>
To: openembedded-core@lists.openembedded.org
Cc: LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: [PATCH] kernel-fitimage.bbclass: add padding algorithm property in
 config nodes
Date: Sun, 31 Jul 2022 14:37:58 +0200
Message-Id: <20220731123757.21186-1-luis.enriquez@se.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Jul 2022 12:39:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168687

Hello,

This patch could be cherry-picked into kirkstone, please?

Thanks ;)

Luis

