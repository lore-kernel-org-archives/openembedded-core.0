Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C717D2F353
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:24 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65686.1768327095307735159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FQS5JOt4;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8888a1c50e8so96871246d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327094; x=1768931894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuEbOjDj3tIaG7oW2FI8ZA4dvVXfxvhgDhaKzZH0YZA=;
        b=FQS5JOt4kpTFPuM7gflsH6c0UzjEhH/EIn+DHWG6gyjsDzEZ7NXT3D6nmw+OkXnpdL
         +0C3ojq/qPQkeFPVyM8ud+KL6N3gYUkv4J/OUBwPG95V+8zeRplhEbtBlvcvPbTawfru
         2Y1LhK7TB5b2/m8YZEIPf2WsDVIP0FKA1drgYQx4Hlfyi8Pg8f20YEiY/S9B8chBGkrY
         ctjFLOcBCo/bQtqvhZgYTf4UqeBzor41fi6RILX3KofFCaEIYItsqnrlrtxWh1cp8TLP
         vWAv9FLCDkzVzp4MhDmxLEzrreGGi5p5LQab2DwsBJcSWoAtfBeXoGOCAZMbzTJG4Z9F
         VHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327094; x=1768931894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xuEbOjDj3tIaG7oW2FI8ZA4dvVXfxvhgDhaKzZH0YZA=;
        b=PQSER11ao9KssDnm/wvFbmy7RImb20PG068wHzH9Xr76GUd/2oHqd2OxoM8mKKvnk+
         3YLkoxe1kCwMXdBex8E7fLGacI2s/JSrfmnn0QH9Z5najQDc4/jLEY1ldHE9HWiAPHnR
         GichkvefhqKKijrw8GiB7zxQKOSSY2//AvA0ceh521WsERPUHTUnmmCRlzcj+Oyyhd7o
         imokVPAi9KoP+9pGFXuLxCq/hOTZc8I0maFthJ4+QZoYHRVAVlIaWvNA21pcnVv66SwV
         pm+ct7qxnURGgSbJM3BPdZHkDXRlgHTcl5277ZSSwwsEWqNO9M7eqzG4MaHiudxCGIRW
         z0nA==
X-Gm-Message-State: AOJu0YwNbdYvOkqGCk9hvKLjN9rwjUeAfYqxP83v/kERbfT0nFLYHuBm
	CtII6kcCQUzw2X7W0SEFdyUDgkVU+0RpmTpzeByPOlOIXqh0sCRfz7HHnSMdB1v1k052YPBMq3Q
	d/6ToWdU=
X-Gm-Gg: AY/fxX5UmzWIZTvZwrfuPminjFe44gPp1rAR/Au0qrK9crLXjSuqdA5HPE5cTFcIfT/
	nJ94Cvo2WZ401UQIwDnIto7CXJ3tyYzAH6VwnnUIa49d7jzyT8pfjIO8j5NDBHP8VUR8FMDCYuY
	Wg+RJnGJENRi+65KRpoYmDl70hWHL/3Mq5eH/FYxksdw+u63rDxm6851rnMW4TyXc9dSmxHK2Gb
	e5P2GzT4TFtFOjbu46pGgqZWfZSr+I/L4I6YgOKzuiNtZpNmGEcbJz2fzKMYvL8xNhT5vpsN0bp
	ARklmv+v/X6Qcm/Pb5T4itzdNQoMGrPHK2Ky2Wyxijuaj48ox8ke0VOp4J0Y+oB0fCxXrHAlU5C
	iYSIUYc0XS2AjOI5DR8m3vpV4IOcaeyFO3C2+vur3bgMZJJQQ64RhoXASXEWZvsgbe5TKWCdT2/
	Clv2OFvep7Tw59TOE=
X-Google-Smtp-Source: AGHT+IH6w+vnabj7FdNjvM2SDHFvq0katZ9AGMh1LYRUtKzmuqbhmjKctHz6QpzkmtOl4QLu/Xi+Zw==
X-Received: by 2002:a05:6214:2608:b0:880:471f:2ecc with SMTP id 6a1803df08f44-890841ae647mr354453146d6.29.1768327093545;
        Tue, 13 Jan 2026 09:58:13 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907727c6besm159889926d6.54.2026.01.13.09.58.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:12 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/7 v4] python3: add _ast_unparse to core
Date: Tue, 13 Jan 2026 12:57:57 -0500
Message-ID: <20260113175758.1409859-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229286

Without this, we will see import errors for modules that use
annotationlib like so:

|../../python3.14/annotationlib.py:487: in __repr__\n'
|    return ast.unparse(self.__ast_node__)\n'
|           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
|../../python3.14/ast.py:622: in unparse\n'
|    from _ast_unparse import Unparser as _Unparser\n'
|E   ModuleNotFoundError: No module named '_ast_unparse'\n"

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 691fb22202..ff84f2d305 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -188,6 +188,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/UserString.py",
             "${libdir}/python${PYTHON_MAJMIN}/__future__.py",
             "${libdir}/python${PYTHON_MAJMIN}/_abcoll.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_ast_unparse.py",
             "${libdir}/python${PYTHON_MAJMIN}/_bootlocale.py",
             "${libdir}/python${PYTHON_MAJMIN}/_collections_abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/_colorize.py",
-- 
2.52.0


