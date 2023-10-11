Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D42CD98E5
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:17 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.5193.1696982537106459953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JZqyfm5G;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.50, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57bab4e9e1aso3758018eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982536; x=1697587336; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIZVhHIKz+QCpP9yRSDz0KoUDKZkLN6GW5uUfkAaSgU=;
        b=JZqyfm5GnuHhnu00FLtzPrw+i4ftJAo67bdFCXa46IYQa+sbYd9R60hYoMIaIWwJ+9
         OdtQkt86fnrOmDWAJRALq+Rc28RbFq0rh30bajHV95+Cs6sldJYWD1e0fbC+znSEgnJN
         Nxy2fTayU7dZVxQvpb66AOjSk0Q0DY1vbyJlIq34+l3ww2/tk+zW2uzJE6gY8SvU1whI
         XQmENL+Uv/+4/fZGA5yIY8Vsp7IEjC+tsjQHqv62u9ixRsGoRPEEDQoYz85zOOYDWwV+
         zNytC84p2ROBVrBFsywqCBML1hLSKXD9aARtOl6aja3QQa4XzIuHFnnQqM97JH5cCPmP
         EeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982536; x=1697587336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIZVhHIKz+QCpP9yRSDz0KoUDKZkLN6GW5uUfkAaSgU=;
        b=Jh9nZWrCm640urRYCJMtqstk/sjSQiUKN/5gGWhbBGHYaXdt+8Rj3bqObkFYRFrODo
         cIENPboxrls6Vxl4KdNNe9IUdxRVR8p/NWu4QCUviOn9YNB+LVPdCJV3s0Pj0TUxgOfu
         NkPjusZP2xJh/wcfNg4LT9QuBt/KPz6+SXMRle0en2ID0Km661U4B3Fu9bs0JZHGleQb
         4ZcTfy2WdU2GJs8NjsJlPy8lsXETtPwfnSKu8wij5FiRlTtwfr24CZekUCId52Pok7K8
         W2f2c7+1Kx1HL+RxBuAeqO2LpjbnZYoaKVdWHKb47E9UwtNd8AG83HE6wfyVZQ9LevX/
         EKdw==
X-Gm-Message-State: AOJu0YwtKrbDtQScqSiVvZmMN7XDGUt6AMBgSc9xP2MUOzdfPTfG8nmZ
	rbtUajOuVWUCTvSzxcKuvNYrPzGn1i3jWWgJ3jQ=
X-Google-Smtp-Source: AGHT+IFWXZssUOXVHaUAbH1ej7OpFCJOrBEanQ40cboe/vSQ8McU2m33BtALhysAwGfTE8XNZneZIg==
X-Received: by 2002:a05:6358:919a:b0:143:5826:dece with SMTP id j26-20020a056358919a00b001435826decemr20501825rwa.25.1696982536081;
        Tue, 10 Oct 2023 17:02:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 17/20] oeqa selftest context.py: remove warning from missing meta-selftest
Date: Tue, 10 Oct 2023 14:01:30 -1000
Message-Id: <70d2ceea48ef6ec04675e4e6a9c48ebc5bb78f52.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188935

From: Mikko Rapeli <mikko.rapeli@linaro.org>

It's not a warning but a handled case and layer gets added
automatically. Very few build configs have this layer enabled
by default.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
(cherry picked from commit 9a2493ea83f0b30578a819de05108502aaadc7f5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 6cf1bef212..c98763735f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -296,7 +296,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 os.chdir(builddir)
 
             if not "meta-selftest" in self.tc.td["BBLAYERS"]:
-                self.tc.logger.warning("meta-selftest layer not found in BBLAYERS, adding it")
+                self.tc.logger.info("meta-selftest layer not found in BBLAYERS, adding it")
                 meta_selftestdir = os.path.join(
                     self.tc.td["BBLAYERS_FETCH_DIR"], 'meta-selftest')
                 if os.path.isdir(meta_selftestdir):
-- 
2.34.1


