Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA809E77173
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 10:51:52 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.8019.1733395902695076734
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 02:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMa5W65B;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa578d10d50so113427766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 02:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733395901; x=1734000701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RrDTdYIVE7RdqTornwHM5MxsnJ14vXwRUIi9aLakm0=;
        b=AMa5W65B9G+C9aizMYq+l4CYMp//EKVJ+81IxFHmJN45tiM9ic4wXpRoMrWH9wx8+f
         irX4IE0v55chUnPsZwGH/HjKahQUvVnkeKxVWE572heShOcFpbEKotitN7CDb0bLoL0E
         D9bi2CLGBr2L5dCd2KaDa42Wy575g5oZpEoAc4NjzU/Wms9+y9mWsbviPnlKBEbh+V0J
         IzTZd7kl99sKDJ4u0AfspRAIx5LjUFxhRzhDq4+Q8N1RIwMK8oXNm4msNnYkkr6QRgr8
         oMQPWE5a02GMnYi3ASajcZLn4qY2ptiZghILNjZAEOTMmYSd7hXzj1opceUXCbyV9oLW
         iv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395901; x=1734000701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RrDTdYIVE7RdqTornwHM5MxsnJ14vXwRUIi9aLakm0=;
        b=sXKPe9ltJyQCO7M3zW7JbjEEVAHx+m5+jk+JKAMVGse20mQAVJwGuHpTbG4MnGBc9s
         OOgn8dZ3iA84s/U+jtaqonyT/np4uWoE7G01iRZ2SpMKsKMv57gyYuvanIR+2zNHpWxZ
         nQEyjhR4zY1jQRquZnghYv6do2TYctQR/2EHdx3a30XA7KxC78sF5RrTrkyQW2z/HP4E
         3C3/Y//0hfsuBthNVFtIrAfXAjdUGsbw+xliPtCcswulWfVBXncdaveMrY6u3dAiVE49
         fOPzr471WjkPZeTLX43W/C+7lJyQ7qLaKk6j1/sJelkDnBwKjPCUOngVDMqepBXWxkIa
         zwIQ==
X-Gm-Message-State: AOJu0YzgM1Ou0rlDWjjy5nvBwsOJYAApGFUNrE/hfKyLCP3ibHsJdlnp
	+dWNv0mzMG/x2725u29pWL9eoNpj4WfIzwYKhkfW4kmdUHUyPPtcSbs5Iw==
X-Gm-Gg: ASbGncvbwakNlqR+6e3A4e/zOAGaR7STk1NGXF1BzfycXSwa7/G43V9rnKGjSJt6eE5
	uLR9UUCA0Iq1/Kq/c1Fs/63vXjd23BLh/299ocpAkzlPevYTzs9Xr788xXZ53RoeAIeMMt3fX2o
	VrEYE06/DnmFWA1ABT1uMIIQLtM0rB+iB2uZznnTM91nzIlXxBF65MPMw6fe/+cxqMw7R+LenEK
	yzJgjemYoiIWeTxBrDuy0LmhaLaaXzyGZroEGdAlY1PBEVt0Q==
X-Google-Smtp-Source: AGHT+IH4QdGmRd08DHcZYseyh79VscJFPOAmyscb6pqdqncFmaYrr7C8kKRaxN/EeJ6TdMLvxhizrw==
X-Received: by 2002:a17:907:b98:b0:aa6:1678:fdc with SMTP id a640c23a62f3a-aa616781260mr418742366b.58.1733395900642;
        Thu, 05 Dec 2024 02:51:40 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:640:1648:443e:4a0f:4e27:f8ac])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62608ca50sm74543866b.141.2024.12.05.02.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:51:40 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [PATCH] scripts/install-buildtools: preserve formatting in the help message
Date: Thu,  5 Dec 2024 11:51:37 +0100
Message-ID: <20241205105137.9639-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 10:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208376

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Use the RawTextHelpFormatter formatter to preserve formatting in the
argpars help message.

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 6387287ade..4618d6a3ac 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -127,7 +127,8 @@ def main():
 
     parser = argparse.ArgumentParser(
         description="Buildtools installation helper",
-        add_help=False)
+        add_help=False,
+        formatter_class=argparse.RawTextHelpFormatter)
     parser.add_argument('-u', '--url',
                         help='URL from where to fetch buildtools SDK installer, not '
                              'including filename (optional)\n'
-- 
2.25.1


