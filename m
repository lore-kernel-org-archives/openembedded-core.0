Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC4FC982DA
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 16:31:39 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15344.1789835491649765250
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 09:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SFhud3M8;
 spf=pass (domain: konsulko.com, ip: 74.125.227.140, mailfrom: tim.orling@konsulko.com)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1560690a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 09:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789835491; x=1790440291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a2Sn0sceeMUjLXqb2ppMIZMKv7MS/44acMNgKJ28x4=;
        b=SFhud3M8VNBGvepqq+NzIxW+251GSyZudy5RvXv2erhgj9Fv+AN5KbWyVCsvN6cVnV
         GDyzLVWv4Yv+DWkG2oTmVPKMNouM3z98cmUw2YT1MpBQ1hJrvlhqia6vQ3ic/cH2BPPe
         8SGZHY1VlEXNWHqU5Sp/d+ZEAbrodeuO6YRdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835491; x=1790440291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3a2Sn0sceeMUjLXqb2ppMIZMKv7MS/44acMNgKJ28x4=;
        b=WU+SijSgBNso3M4cmBJs0CtV1vo87o5NTgj2R+l/Lv7tqeZxvL9mr+Kubdm9QeL2sV
         /Q9y62fED+sBeZeUMzWgbFs9lzeEAoaZ05TcCBhMY3S7fEjAm9RXhy1/3O+kp37W2WK6
         1xX808Bf5OMX/LvSAKt5b7v0nLRVoaWGyHc6EhVqMSdLnvylynWyB+jSlY9aJ1cCThiA
         4UJV6U1p+VYWn+h6BXGs1kCUELl+EZa+GnrmZoby6Z6wxJJDa+dEvt/ahPIZkTKIjP9V
         1FlrlTwz33ScoLN6bYpewVpm3duX73S24W6ouiQOOQOZ1LmDD6cOxtHFt0p/9FnO22ud
         dNFA==
X-Gm-Message-State: AFuF++kMFUpQb8A3yQseJLphf4IWU0cH0Xjpvq03j6xKTr73xEWwWGOx
	xbgcEJ46TnsYsTkuWxvROgEze1j/yX1l/vNESew0Y3JXh16/itCu683L4zIxrFQGMV0erX61oci
	mVki9
X-Gm-Gg: AYBFou0LlIcyrwCTNEvkjN5eV662r5wDc0o1ZwD7QFUEvQA3at+2nLU/Dopz9B+Gi6E
	m9fuAOPFvdukwQ1HrfnYpyN2LHP+MkNsmav8MN/bgvtpPDXyiaMv2UKvyaBgb4B4iBXnK3NVxVm
	tJLud9rZm0NQOfvQcqcfPCyKwHzUW8PtP85iSufpgTdN+OoH0yde+YAxv1f8D8zKEhhLPmpvkMZ
	bES7soisc2HLLIFJcjWQRK+MhWVAHhK0wOqSjWOf8uS14eX2EMvuB2U5AZwtgVoDYRMkC4Y4rKE
	yep819ZwcApIvVpBXpdDp8kXx6JBezoVVuiF0iASi1wyKAmba048En9o5R48YbAIfROxGQC3MzR
	fkpzMdxTsWCKvfZ55uB9XVjjgGbB8Cnlxs+QQq1+TxryAoUAU9sLcruy9aw7PvseMYpmRtnE7d2
	IaAnbnm8Ufao6AJsZbduKFoIXpRkfTsNqCfKd98hS1Ib5bgrRmB2JTFFgOmvVh8WAWkcwU0A5N0
	+DHQ/mPhHkqblb34V9n66EOcf3C
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-39e6c68ca2emr4009805a91.61.1789835490932;
        Sat, 19 Sep 2026 09:31:30 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cae997csm5194525a91.11.2026.09.19.09.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:31:30 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sat, 19 Sep 2026 09:31:22 -0700
Message-ID: <20260919163122.3864493-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919162323.3862788-2-tim.orling@konsulko.com>
References: <20260919162323.3862788-2-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 16:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246241

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/atk/at-spi2-core_2.60.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
index 1e7a16d747..77f0dddb0c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
@@ -23,6 +23,8 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection python3-dir
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-- 
2.47.3


