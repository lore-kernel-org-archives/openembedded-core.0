Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CF4C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:01:41 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.7790.1749812497532245073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AW4a0Q46;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234d366e5f2so26014825ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749812496; x=1750417296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2FrCtPIL0OoUzfpDWXgRgRpNmn1Xn3SlpXwLB0b1kZw=;
        b=AW4a0Q46QAktotGO8KBZgVnergXDNcU21u9FvXoQ38uNfTOskDEpQ7+jHEfcGRCnHf
         d8bF6502QlxXQXetgGeXsWyD2XdTLpuYveUVKanEiwannMkNTMXOKduNuWKoLvPCkLd9
         lgnHbi4U4CxHeereJSMarlum7fgRQ/RqYkzR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749812496; x=1750417296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FrCtPIL0OoUzfpDWXgRgRpNmn1Xn3SlpXwLB0b1kZw=;
        b=eC5p1Zlv2MAwKjJ08mgaD67Jp5Ul+2IzCFhx7FEHs0grlp+SAo9Z4kr/y4Gs0sVqfH
         kd4PDMLAqA6xcKWlJQPc8L8CEzxY/VGlRRKT5B9+5XStnXuXuZ88ZnMSRk//YvrBFdCl
         1ibEtdHx2/VxAsh/MFAgMrMt3Fs0dWaogyrLgO4Fk6yxNXEDwMbC54GHBS1qyDfwGE5L
         GX/SQIiF/7Nqtwjwl2xtoNOvUzD5KvhTQwYFJxFMvAPWCFTIQJLE1EPhx63ibUCCG7y0
         lkozzo0JXeGn4bzTsBYshBXE3+Cgvm0W1S+jh1gw280B3HvOF0TuoqdWn21B5shbikFj
         ySYw==
X-Gm-Message-State: AOJu0YwfyoeuDOFUtRBNL85otfJ0dbikZd1UuG79YH6JrEjJrx/df+DP
	gqxANeA6imG+7AP2oO9I4QYT7keqBQLCV0/DioiwMsPgOjMoOa4JKSOdef6aIk/avR4x81dUJM8
	k6MtQ
X-Gm-Gg: ASbGncvv14Ig+crRULXAQuLPF5qtPe+dj+StLbM8OCsNQd80LC4W/nGgd+XipEjVCcF
	NP47YZ6bUXeevyr4sQj3YApKW381hGYaqAv3CxYM41/b+fH4w4VjLbMQi20jxvtxxGREnDQcJx7
	Jj/xLrHmgbRT74HU61w8aSyUaQB/ZlfJCFULvBfOdlxoJOZ4UJxZDsSF/5zf57d4rbMYA87WX+M
	BLFIu2G8QSsxlGTDCxsb/Sx7IG0UPiaxDquahWos8E14jlCCx5gRgiq5UTk9+PMlFckqr3AqIL0
	iF7KuL8VP8qmGdeDV4wBE4AMN5vdTDdFCzoCRv4TqgTe9hBSQy5zVwvVg3eOMZI5uAFPMe/ogg=
	=
X-Google-Smtp-Source: AGHT+IEK8jCdEsNeed301p0ZSQZeYVDb7YivpQ5nXMWo6wk8k2ip5OiQ/zpSJx1SAaVo5C4xJnfv/A==
X-Received: by 2002:a17:902:e810:b0:235:e1d6:4e29 with SMTP id d9443c01a7336-2365dc2fc80mr37935385ad.36.1749812496344;
        Fri, 13 Jun 2025 04:01:36 -0700 (PDT)
Received: from localhost.localdomain ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365ded130esm11674545ad.231.2025.06.13.04.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:01:35 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] python3-requests: upgrade 2.32.3 -> 2.32.4
Date: Fri, 13 Jun 2025 16:31:26 +0530
Message-Id: <20250613110126.187329-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218588

From: Vijay Anusuri <vanusuri@mvista.com>

changelog
https://github.com/psf/requests/releases/tag/v2.32.4

Includes security fix CVE-2024-47081

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-requests_2.32.3.bb => python3-requests_2.32.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-requests_2.32.3.bb
rename to meta/recipes-devtools/python/python3-requests_2.32.4.bb
index 4f0638b50c..0a015ab5d1 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
+SRC_URI[sha256sum] = "27d0316682c8a29834d3264820024b62a36942083d52caf2f14c0591336d3422"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


