Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC0FC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:55:33 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.15108.1634673333057086247
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FvU+bbBp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so716755pjc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ZslrpLVlXnrtfANyz1p4q5dKVeERAY7+rk7tDpOg5w8=;
        b=FvU+bbBp4h8SYwbqSy68v+MxH1EwRpHBQFUV7qVyaJx1qfgV9O5rpu7FB9YPwEzDT0
         5tyDMkFgOtgNXOtoG+SOb4BrGruTHiJ1naVePHJgmAkTaG24DvzMUAzNQxl4468iKyEO
         QVoP/CszxHsbxUI3xfP8tWfNfRLHQoXtlcXgT76S03gaF5c0MQFnGVE9cPoXRWCchvbT
         ADHDHMu0fwoxZW6nUk2F8cObSUfeEMwnJWFbOJgyCiPhDl8yEa2b1UECwBDvOYzAsUY5
         M1RM9qjGE9dBz36wAEjJUOlvoh5GMVtOnHZMpWmP3Kf60FVNY0Cbljv7OY8a2q+86VCT
         +VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZslrpLVlXnrtfANyz1p4q5dKVeERAY7+rk7tDpOg5w8=;
        b=1b5XTbFAWeabmhunTzrdKzVf8e0gShzS+d4z15/bgVawL2/BcjlAECeAzum2o1t/cT
         s5dKUPgxC3mD2lLmDP+Q3B3DY9r+GPCNmPqeikiP7WSdEB6LUQURcXNoJAc71S/D8i91
         pcB1Fwz2SO2+ao7RxCs653BMAriF8YHK15T797krQXIV5VajKXPuByh4LwQNY/0c9bwa
         3t6tiyeXvJWQMLg0lIWf7//Tq+8szGeROc/AdnBtYW8D0uMvSOF4NBY6UJgD7K7WorKm
         HBO1tF/5xdcus3O08Z+UFrgU0JcilGqUt+Xp+Mcje8uu+7vzViQXeLZ/v1UDsoTOblQH
         /NvQ==
X-Gm-Message-State: AOAM532iIsO/1TEpvUx0vgGwswIQ5+WDNkHdFhS9MIicnh7rSQ2NI5nA
	J5IJVhAXUHUj/wofwldKIN5HFUPBlxxpns50j5U=
X-Google-Smtp-Source: 
 ABdhPJy9+3C8ashYBa0VtUUYYP7QX0G/0EOujR2fMWEYVcgTrlRD2N6vCQJ3aGy5/R3qiPIRrUVJUQ==
X-Received: by 2002:a17:902:64d6:b0:13e:a59e:332c with SMTP id
 y22-20020a17090264d600b0013ea59e332cmr34633532pli.30.1634673332163;
        Tue, 19 Oct 2021 12:55:32 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.55.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:55:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/38] libnewt: Use python3targetconfig to fix
 reproducibility issue
Date: Tue, 19 Oct 2021 09:53:47 -1000
Message-Id: 
 <8fc9963d70247d243c8fc5597d68d88a1757f2fd.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:55:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157241

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're seeing pthread being linked sometimes and not others leading to
non-reproducible target binaries. The reason is mixing the native python
config with the target one. We should use the target one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3fe5101b335384ef83e96ccc58687fd631164075)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/newt/libnewt_0.52.21.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/newt/libnewt_0.52.21.bb b/meta/recipes-extended/newt/libnewt_0.52.21.bb
index 88b4cf4a03..3d35a17c92 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.21.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.21.bb
@@ -29,7 +29,7 @@ SRC_URI[sha256sum] = "265eb46b55d7eaeb887fca7a1d51fe115658882dfe148164b6c49fccac
 
 S = "${WORKDIR}/newt-${PV}"
 
-inherit autotools-brokensep python3native python3-dir
+inherit autotools-brokensep python3native python3-dir python3targetconfig
 
 EXTRA_OECONF = "--without-tcl --with-python"
 
-- 
2.25.1


