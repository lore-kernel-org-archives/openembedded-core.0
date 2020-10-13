Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.851.1602610529198532607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:35:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U7IoKZVm;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id s9so263325wro.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 10:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLbT/M07HTCF8pvOqgtgiUlL936FaQo3eahYaVGznJA=;
        b=U7IoKZVmcbUTfqoVZ4erJY59HzJPpaLsugn8DkZpUl+bkrQyomTlT8G0i372HzSShL
         AGQd5JK1yzNnMmxyYozyZzufxoyN8mRFORkAosrBdwNLNoAGif3FrZRKVoPhijVQCptV
         BDcj4fBLwo3nq34LVh3N7VDnypx/zt4fGpMaAEEEvpXppuztWDgpjdV1T8bcxmjAeIGk
         jCtBuktOlOSnalxZnfRH/fXBZAsri8VI3akcqEpJcWQKc5EDJRly2ZHuiUWFbfFHlozV
         Qsec4/Nz5yK99k0z/vT/A2qrbFqrpkp+6AhmuyrV0VTm1Tjpp9UqYlY+TyKiNA2sVbAq
         EvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLbT/M07HTCF8pvOqgtgiUlL936FaQo3eahYaVGznJA=;
        b=hj1W2kn9V1/dPeQC9a0jXhsCEn7iwvKRcjJSaF0e84FofnURoHmc6IpvbzBZt+OH50
         DDZV8Z1Qcm5gEF0GHeRyt2nk321CQEl/2K9fzr8aDVcMIm2nB3rERTJA5cb1rLu9xif/
         jymsCT3ekIDidKVsqmcZT7c00E+TTnpvQGRuUYO3Gz5I1UZOyjDN02XtTkqNkpjoOS8T
         uf9peBwlRFZNMpGT9O347IEf2Kgp2pxpd0vmwN3Ai2cLlCOnu6hmRZzxPctCS2NyEVJY
         kpF9EjL/a4NzDCViwEBgwA0a3paQsKmX/kBWbSyFJMYXIOLILIVAj2V37Z292Jvf7c0N
         wj7A==
X-Gm-Message-State: AOAM532kgAk4He9qkYxAzMfC/LNPiIvFTppo6s9+RwO1hqHxJdQOFR+4
	LkSelq+xwTUna8LBwGCf7+ZxRVudL5h08A==
X-Google-Smtp-Source: ABdhPJzYQT2YancgCoFcczGWynTib057hldXstaAE2Sa4/7AJi+HPB5f+F1fvF5Gca24Jm9K42l/1A==
X-Received: by 2002:adf:9069:: with SMTP id h96mr898191wrh.358.1602610527072;
        Tue, 13 Oct 2020 10:35:27 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id w1sm297412wrp.95.2020.10.13.10.35.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 10:35:26 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] add shaderc recipe
Date: Tue, 13 Oct 2020 18:34:57 +0100
Message-Id: <20201013173502.2245733-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is for addressing an issue on 
a submited patch serie for update gstreamer from 1.16.3 to 1.18.0
https://patchwork.openembedded.org/series/26507
The issue it solves is discussed here:
https://lists.openembedded.org/g/openembedded-core/topic/77459442#143291

This fix the build of the vulkan plugin in gstreamer-plugin-bad 1.18.0
To build the vulkan gstreamer plugin there a dependency on a binary
that there is not present on OE-core. This binary is glslc.

It introduces three new receipes and one of then come from the layer
meta-oe.

* spirv-tools:
move it from meta-oe, add native build and install some extra header files.

* glslang:
is the official reference compiler front end for the OpenGL ES and
OpenGL shading languages.

* shaderc:
A collection of tools, libraries and tests for shader compilation that
provide the binary glslc need to build the vulkan plugin.

[PATCH 1/5] spirv-tools: import from meta-oe to OE core
[PATCH 2/5] spirv-tools: enable native build and install more header
[PATCH 3/5] glslang: add receipe
[PATCH 4/5] shaderc: add receipe
[PATCH 5/5] shaderc: enable only native build as the target is

