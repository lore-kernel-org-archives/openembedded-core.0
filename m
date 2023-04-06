Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD96C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:56 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.162523.1680796955851529054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IpdBJYqY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so43305715pjp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796972; x=1683388972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Jyj6qhjUELm5ewXNc3ljgchk9AKgOkQbvH7vd30ARs=;
        b=IpdBJYqYS6NQ4QpEabFTHR6cb/10LzXv5IcUOsw50FV1EnJsdJ+118egi/hbngiWOV
         tmHy08UinfDEQnIOSzWn6EuGIuIUc2xawz/ZCKzqrRnmVgxiIufn3zUX8FB99Fni/YCd
         3Dkj/LRWNu1AA0s/JYSytbHQXwX8V3eJbmfqPLzx0EgApvlk4i4oe/h6Allo0lHHS40b
         ka+xn4Lw3w38EkULgrB1O/0A5Sumob/skYI+yTpFrisMPAls8msGYDhCvJlJkI9WDJhh
         dn5bq+3NkwsDmgdhpnKbp9KA39y3k/CiBBtHEsWyIuk3dV65RM3hvUtJlrhc8CGfK6NY
         l99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796972; x=1683388972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Jyj6qhjUELm5ewXNc3ljgchk9AKgOkQbvH7vd30ARs=;
        b=Tc63kZRiFJ9KkOg+ZJcjlZPBJiIvSlYnXN3n4zhoIZtm+0tRQeCH0DMnwe0wVvyXoE
         RDCRtp5F41up6scq5iuzIhHZGyhE2gYDA9NYSsx9i54wy/YEBdk0wu4430YD9r9+LW7c
         +cxKdMOOXj5+0GiLMMxaU+CNZDnrGN0E4+vlOuxYQ57po1n5pO3DD40p2zy+ofPv2i6P
         psTtTCiRETDMRZ90CRW2D6x0rpwZu5ow3EAYFMMXrmcQYs7kVFQiRWtyU03m6Gl3gEYL
         4Z3el1Mj3lZPWaqqbXjjyKgC53oN7optFVNfiRosSpXeEtnaSXXQIvP3HSsyzd0idKGN
         nnWQ==
X-Gm-Message-State: AAQBX9fGAMGw/Bg0SonFaSVuE0U9ah9J4BCzwIaPLLTUXZDoQ9RIfCN7
	f3gHOiNYA8D2J84NZMz2G5enlAG1wpoE5tZxcwY=
X-Google-Smtp-Source: AKy350b9LtD2+2/w4psaRheasovf2AYDwcCTZylhPrwCBtaoTipQwUQHPXrUbExl6yKEPD7ReGW+pA==
X-Received: by 2002:a05:6a20:b213:b0:da:144:92bf with SMTP id eh19-20020a056a20b21300b000da014492bfmr7268pzb.14.1680796972589;
        Thu, 06 Apr 2023 09:02:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 18/26] oeqa/utils/commands: fix usage of undefined EPIPE
Date: Thu,  6 Apr 2023 06:01:45 -1000
Message-Id: <d0eeb32cb0d990698287955dd7cac643bcebdafc.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179796

From: Enrico Jörns <ejo@pengutronix.de>

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1cb17e37e275794e26debed2d171c2394d8bb945)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/commands.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index f733fcdf3c..c03ba52ef2 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -21,6 +21,7 @@ from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
 import contextlib
+import errno
 # Export test doesn't require bb
 try:
     import bb
@@ -85,7 +86,7 @@ class Command(object):
             except OSError as ex:
                 # It's not an error when the command does not consume all
                 # of our data. subprocess.communicate() also ignores that.
-                if ex.errno != EPIPE:
+                if ex.errno != errno.EPIPE:
                     raise
 
         # We write in a separate thread because then we can read
-- 
2.34.1


