Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116CCC79FAB
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2592.1788641127211499975
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kUSyIbAm;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e397f74so2721378f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641125; x=1789245925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0y3cfvENInITWUxZ2xGPwa2XH8s9cBLy5S0TdjeRqsA=;
        b=kUSyIbAmR2vOaMWsUfJrWs6ABV+JVL8t/Vrt3DHE66Y1KoESXwe/0O5kByQDhTPTbm
         6WIDvRWf03lNFzyLk+4QLgQIHnigWE0BDSwqEhrG8cndnAC8t4rKnmiFquPI5fmBsZMO
         U6EpFuPzdArthTMqPZxMCIObRBBg9j81kVBU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641125; x=1789245925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0y3cfvENInITWUxZ2xGPwa2XH8s9cBLy5S0TdjeRqsA=;
        b=Y87MVtHXUa3m2SeBHAStHT6287VsbrE1RUjKMUGOObdGm/UgeBcaRsBQd0MI2m9r/b
         rFBg1w/YzmO6f8lYLrdv2ka91tMFAe2VvzMxNRPJbhWza6eVpMW0y1RZFegEFC2IF/sX
         mb6Cd/2Zs2bGKOYDyGz2TbDXrNtWb8Kkf21PoiBC8SwzXPd5KOkJ6vlFfIFFOVKQ4yEo
         /G4CXdVqsOskciPKG5mMUu9JD+s48hHoxx5rtfYSm5Aw6iYvesyr5PNmPEkQKfwy+LOQ
         3H+ysTlTewQf+vNCQQWqFarIevQYYCBw59BmKfhwXvAOWggOFNm1w+VgtNclW0teIqER
         vmZQ==
X-Gm-Message-State: AFuF++kK/R409ILiEBAQJyAH/E0aL3g5TrpRzXFHX+5auADsDhVKnDZs
	IlGQwgiJklZmLtMWlFzpBaIBBPRTA9TymsVtTyrUR6OjwRbxcEghFclMxy28Ko8AI6fzh8tvlxk
	AKJPLoGw=
X-Gm-Gg: AYBFou164U3K5OJaD7LdyoLxr3fl19ikUKkSca8Yzjj/i74VCRYnleyWBzbuCx1Vrts
	s1kwFgGD+PEgA6V22+lY4fOA+4SjVK7u6JN1zOAGadWYSat2CuZZlqwRXZGFdGjohgOch4HFMLG
	dNcqY0S09uw2R0oFCHqjhHHWzFlAVlGTl/oTT0lScjTnZbCJoN14blWhzUV01BaLdXax38oo4uk
	o+QH+PRERlZGhx2/xlXAey27f72ihqtg7K38B/L950Mn/6/3hIjmv02D4BATE20DuVvN7TSAaaR
	UC3UfgXfGS5zg0VDmm3K6zV/aq9N1WoOEVC9+XSdoo5EPq0gUPqlW2sUNjUtxBqFxpBAh9D0kfS
	4bN81PioIYjnxC5nkN72ryc4v2x2KF4KPMgpgYUBLZM+iuKGh7h5b9pCJ6D7RhilEq10qQMMKxn
	IrC6lQqM0qVVMFqEcY4HR0DTKK25yK/ITy0dRRpcC1AwlP0mBaPf2T7upYHqXA48zaKxCmX6zly
	tMucvHZrs1FfwBUGzij8mp6+jPfekgYD6cwMvy3apSlgpZaeLqJheJCmgSHoYdREg==
X-Received: by 2002:a05:6000:4106:b0:485:8a07:3f0b with SMTP id ffacd0b85a97d-4858a074201mr13903253f8f.0.1788641125359;
        Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/40] volatile-binds: order systemd-timesyncd after /var/lib
Date: Sat,  5 Sep 2026 22:44:27 +0200
Message-ID: <6a4192ca81c40c4b0a9d74e586b6a97934c37917.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245178

From: Esa Jaaskela <esa.jaaskela@suomi24.fi>

systemd-timesyncd stores its clock file under /var/lib/systemd/timesync,
so it can fail to save state if it starts before the volatile /var/lib
is mounted. Add it to the Before= and WantedBy= entries already used for
systemd-random-seed.service.

(cherry picked from commit 1b8d8c25e46f1df7079545f4297496426fd9d371)

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index 857bcc93ff1..613e750c17c 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -57,10 +57,11 @@ ${@d.getVar('VOLATILE_BINDS').replace("\\n", "\n")}
 END
 
     if [ -e "$var_lib_servicefile" ]; then
-        # As the seed is stored under /var/lib, ensure that this service runs
-        # after the volatile /var/lib is mounted.
-        sed -i -e "/^Before=/s/\$/ systemd-random-seed.service/" \
-               -e "/^WantedBy=/s/\$/ systemd-random-seed.service/" \
+        # The random seed and the timesyncd clock file are stored under
+        # /var/lib, so ensure that those services run after the volatile
+        # /var/lib is mounted.
+        sed -i -e "/^Before=/s/\$/ systemd-random-seed.service systemd-timesyncd.service/" \
+               -e "/^WantedBy=/s/\$/ systemd-random-seed.service systemd-timesyncd.service/" \
                "$var_lib_servicefile"
     fi
 }

