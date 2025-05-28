Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003E1C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 12:56:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.14931.1748437015884685544
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 05:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nbZJ4ZzO;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54e98f73850so5525383e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748437014; x=1749041814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObSV+vaSymzdEYKlvZ+RNFbNGQec6EggxJkiuNZQr8k=;
        b=nbZJ4ZzO636oSIQOypjwGNoraXTgulkTu9MCAVrbFsv0NF43kuXIvMkkwcoXI3oHJi
         HoCa8kW4v5nsQ3BBqL69SKzTZEdSHXBXCEtyZmfLTzL+ed2w2XNVcByX5Xg1KfX++3f/
         086R06lq1rQzlACkz1FVMGNQxwKQzPlFU8pASeX9R5M/wkKoYhZyHFnUW8lKl04rfrVL
         77YRDymKId361iW6BmEXSc77W0Y6LmY2eUJWap/6N7GJtFhRBNnLf84MI2KHoe12SZWB
         gGQG1ggcrsWwxdqHP4z8kjh6gaFlV6aLwFG9WhuqKDlQavSTUGIydVDBS7cmYmhp51dK
         TcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437014; x=1749041814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObSV+vaSymzdEYKlvZ+RNFbNGQec6EggxJkiuNZQr8k=;
        b=qw+vfzaXXG/4+S/H5uTbVtJjLWJP0PhFMhytjWlkpdYv6Mxp0bY6/AZfZFi4A0Dfj3
         TJXs7GRvBmaSbHHf5gX3hKf69g8X3Uto6D1hdk36prJaiOkQeDyr59CcKtJnNr5tk+1v
         89QRuKTEoDi6efScgnoZQJCP2FHKvxBCc/gjDOfysntdE8cPYlMbUphOy2WXLF5oJqCO
         THt8YBmdWqeX6d2TsNNGK+SDOgjY8alxj8rkB4835GXJsu1HApIghkhe0kokvaaGMmib
         Y4qC3yBETlku1i9YY0Xc7ZG+jl2l6EvMsjued484O85+Wtzt7B4APlgQ6Y9tb+HwO4YS
         xZnw==
X-Gm-Message-State: AOJu0YzogSpGomDTUrV+WKfAt4hALik9V98Ay9JcpSwyWkhqinN8eDYy
	wvEtBbXqR7ftdx1JEIIaLWrFzx4zd0D270wqgMy9N0g2oTMQ6y4kQ4QMJht56ChdO8HOephzXpr
	om/a6ReQ=
X-Gm-Gg: ASbGncspI7/TLjV1zKfTxGYM9uIn9WRbIy9GLeuEanqx9pworZJ2nwcX3P3k/bV4THD
	d1QdG78EypqMg81+o5CFODUSsKZImMM3P2xErRz7tAcSjAj9WWRuT6DtQvOAXymy5edqbqBXj5h
	GcTczrIJGE+C7OzW1wGLNdeD1qxg0Ck31K9hfh8ZhKMQaBnfPvLUzFX9Ckdz7KtY/nSe64B88In
	9WMEJfAfSHV3FTqsnj3XD9dYJS7UxAbPQcZvuPFYuaqtALFsHJD7VtS9DdzApWq/PGmuaFfud0l
	NREtjZ2ajddsQTaxQCQK2QVR4L4kppRjUGBzBVt4yP5pIk/UfwInXAFDvq3Zj9m9rTCBNPTsi8S
	HacXgilrPPFSzolK6uKvORIm8xWZWysvk3kf+m/s=
X-Google-Smtp-Source: AGHT+IH4jEyZy4YgZLs/8aVqwdT+juTyBGnJWDql/ojZMsGxUiAMzLetV7c1B7CtXHiq38N4iKsHRA==
X-Received: by 2002:a05:6512:ad2:b0:553:3322:49a6 with SMTP id 2adb3069b0e04-55333224a8bmr439187e87.25.1748437013809;
        Wed, 28 May 2025 05:56:53 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a504sm267869e87.146.2025.05.28.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:56:53 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v5 1/4] wic bootimg-efi.py: fail build if no binaries installed
Date: Wed, 28 May 2025 15:56:32 +0300
Message-ID: <20250528125635.684302-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217344

With systemd-boot, some builds included correct EFI
bootloader binaries and some not. Thus some builds
booted and some not. Check that some boot binary
was installed so that build fails if none were installed.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

v5: separated from modular kernel changes, changed from shell "ls" command to
    python glob

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 96c710bf77..e0ee2f7127 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -367,6 +367,13 @@ class BootimgEFIPlugin(SourcePlugin):
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
+
+            # must have installed at least one EFI bootloader
+            out = glob(os.path.join(hdddir, 'EFI', 'BOOT', 'boot*.efi'))
+            logger.debug("Installed systemd-boot files:\n%s" % out)
+            if not out:
+                raise WicError("No EFI loaders installed to ESP partition. Check that grub-efi, systemd-boot or similar is installed.")
+
         except KeyError:
             raise WicError("bootimg-efi requires a loader, none specified")
 
-- 
2.43.0


