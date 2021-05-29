Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.22117.1622304396124018458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S+FVm2Ya;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r10so6210638wrj.11
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tuwuBqxfbQa2SeYUYLdAfdCuziD8aS7NrwX3d1RA2Q4=;
        b=S+FVm2Yar1vs4dW9GrLPFo/8iH1IaqCYfmjBG7YDfeG/Ucg325YBZ0HVQGqwmTAJS9
         /RTVoGnFYBEzvfv39DNRnPiZeGbRt3Nvxv1PScfnAG6jXs2HmurC7Cl3t2nuxSfPX8hs
         65XvmBeeyX1LVTDngqDR7HRG7O+puR2xEsWl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tuwuBqxfbQa2SeYUYLdAfdCuziD8aS7NrwX3d1RA2Q4=;
        b=TmBEgGDQnilIFvKarCbFUaFQiJ/HUQ7V5hpEn9JyN9wkcyFunk5eq9soXqRloD+ILA
         vW+VqUi8zQkwivcvK5fmwFawuFsMicq209+Z4kzX4nGcK7HKhrK2o7DOHIhWxalWU/x7
         o3zhSDVTEZDD+x3EqPvJdGhkJPiWnlA6FymNo/quYdAAbaqo6o2LsqGW2RhK9ytvKtcN
         Z4s7HsTZkUAgm3XIlQ9sLwBgsf+Ka+/mTrzF6ISpsQYC6ExUx1o9M5xZa49SXf0tIOzb
         966edhWdTaCjkCIbfM9giYaaDkaZFtPK4+sSCZcvw33I/5y1edHL9r0Ql3qi/VY9/82p
         uCYg==
X-Gm-Message-State: AOAM533FQxrMehW2Lqe8jY+BGGbJu/6fYyBrq8XAo2SLat6FbjHWMiIp
	jWMJ0lRsnowLTOT1F3TqQ//jHNx9RC/P6Q==
X-Google-Smtp-Source: ABdhPJyfFfTX5LgVAYLrtTPFewar4/TX8sJ/4UYsIsUB7a6vs8BnccuK5ZIVmPoApU+vxbOE8bXTmQ==
X-Received: by 2002:adf:e5c8:: with SMTP id a8mr14013337wrn.155.1622304394370;
        Sat, 29 May 2021 09:06:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:34 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [hardknott] [PATCH 04/10] baremetal-image: Fix post process command rootfs_update_timestamp
Date: Sat, 29 May 2021 17:06:26 +0100
Message-Id: <20210529160632.2796977-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
References: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

When running:

execute_pre_post_process(d, d.getVar(ROOTFS_POSTPROCESS_COMMAND))

rootfs_update_timestamp is run, which assumes that rootfs/${sysconfdir}
is already created (usually done through the do_rootfs task on linux).

This causes the build to fail if ${sysconfdir} does not exist.

This may be overlooked if debug-tweaks is enabled since some other
commands are added, one of which creates the required path
(see postinst_enable_logging).

See [1] for more info:

[1] https://github.com/aehs29/meta-freertos/issues/4

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/baremetal-image.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes/baremetal-image.bbclass
index b0f5e885b5c..bc888f62234 100644
--- a/meta/classes/baremetal-image.bbclass
+++ b/meta/classes/baremetal-image.bbclass
@@ -50,6 +50,10 @@ python do_rootfs(){
         if os.path.lexists(manifest_link):
             os.remove(manifest_link)
         os.symlink(os.path.basename(manifest_name), manifest_link)
+    # A lot of postprocess commands assume the existence of rootfs/etc
+    sysconfdir = d.getVar("IMAGE_ROOTFS") + d.getVar('sysconfdir')
+    bb.utils.mkdirhier(sysconfdir)
+
     execute_pre_post_process(d, d.getVar('ROOTFS_POSTPROCESS_COMMAND'))
 }
 
-- 
2.30.2

