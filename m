Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.22444.1617396408115422522
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k3E4NoqF;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id r12so8856191ejr.5
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kcwuBOzFQ/LYtlWLBlkkz4ExrlnAT9wlhUEQPLS7agU=;
        b=k3E4NoqF8pQ3je7KFE5p1NNcoEyasdApOruJxEPzbkMYwgrViE9sBVlIKzzfdnLTTC
         RKc+Dwgcq3gvlij+7v1zN7Mb8OwCH6qQx8RIS6fszoXMavcQnfeNSez9NSjFtrAz9lCX
         W2o4wvebIHznCoS28+aYnMjV/omG9uoRAcKjAVYHfKUY8c/Q/0dxxsRZc8kTEmc7DReD
         cmzL+v8PJyItOXOl9chzTBUAlEvD/6ljUXDZqEnkMs5bUUx31Al8w+DOZD/tQ0HFPV1n
         2pTMfDYz8zXwFDu83FOkB4SHYGSwHSrBiW4LMWtD2Fo2FnTQB1Ql28pWPXGKJlsDPxel
         7d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kcwuBOzFQ/LYtlWLBlkkz4ExrlnAT9wlhUEQPLS7agU=;
        b=fWCghxOr04a9QNJJit2cdVlugXUKG9fukBSLxQ2FxL+RBsDjSRxJDUSw5AMrlDy3Wk
         W31zrwpCk9hN3mEtintfYOmAMSXfV5bH1ltzmkfMNyS7tN7m+qDOaVBqG5R6dyvyGVAz
         fyWgi/D1z9udwcA3eTWqEDQxGAKJAMPaKroM3qRiPU6imvgXr6CN3xjbGSBFA06Vcwd4
         uzvCeyzys6sX4nPBeDMjiVX6VYgKEkrAUFYVTM3GErd/vw2AlkhxNJ/R4tKZKqTJn55D
         CzAhzO+MdCia+Dm1vYkni7Bey0jbWLMQekm7P7H5TlhCgqiayDN6RlD1v2bsarBqIHNE
         t98g==
X-Gm-Message-State: AOAM532Arc1tGV6DNK+V01VIHpeoJbA+TxZfeN2RCMZvxNnjbzZs6Tzu
	vtzKcBwmdkmjtyArLqiegMObaxlXCo4=
X-Google-Smtp-Source: ABdhPJxDmIIRjENlghTnI/MMo1k1Lo6pfRBXoOPcZ9MIfC/s8pTH+7n5fqvINUOC9NmwAR56aTjXtQ==
X-Received: by 2002:a17:906:3f88:: with SMTP id b8mr16270812ejj.36.1617396406779;
        Fri, 02 Apr 2021 13:46:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 5/6] mesa: gallium option requires libdrm
Date: Fri,  2 Apr 2021 22:46:26 +0200
Message-Id: <20210402204627.207068-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402204627.207068-1-alex.kanavin@gmail.com>
References: <20210402204627.207068-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously it was pulled in via dri option, and there was
no configuration where gallium was enabled and dri was not.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 862e4fa9b8..d7f34739de 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -149,7 +149,7 @@ GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
 GALLIUMDRIVERS_append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers=''"
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
                                elfutils"
 PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
-- 
2.29.2

