Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE87C48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:04:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.14575.1708005895843201138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 06:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vhtu4a0T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41202eae372so7247895e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 06:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1708005894; x=1708610694; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+zWNfvm5PGGQLX7Q41q93h3vpy6UZsEIjxwedJv3H2k=;
        b=Vhtu4a0TLoxwTYJq1lUGyzbIJyE8Xx7J9IGLEG39MDussfwv8i7xFTGifVeSwi2CVX
         2bUBQqUba7MO2NFQbVCFuVeUUCpWVDqQ6tv0hD8/pRitFB1PAPxbYy/f+3rpSnY/x+/E
         q5YiaqzdedpTsfc2YW3qH3EjPt06jlUMwXois=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708005894; x=1708610694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zWNfvm5PGGQLX7Q41q93h3vpy6UZsEIjxwedJv3H2k=;
        b=TCQs+3KSM3pdKjMJx1Ee8+t5xE5Dz3coczdpPZfBySjcMRlirKortfTrjGOr8L4Hh/
         INTYjy3EsMhSHkX/D+z2eixxnnbPFyrlYH0HDnenZgYsyUKKBIBpvMRHV58UrhIRQ6Mv
         E1dBly+4XtSYsB3cgAq45f+/5qP0I3Mx1NoOve5GsobtXIP4mhe/BYs5LAJK2i37TZE3
         B6R9tb5DfBDU+d7lr+6HDXux6RGMc8MX8U24Pn3fv7+bh/SWzFCyjwTPhxCEggeuYGm9
         gZEAMEjqQPM/s429mv6wFJIOFhqUAtLXN7cRdS0vWTvXUNaWXqeLrGzXde9/F6ry77zj
         2k+Q==
X-Gm-Message-State: AOJu0YxDtrOHg75pKLHyjRcyArrjB+QbxJ6KBKlhha5PaMMSS/flBEd8
	Icnf6gH5AbE0OuPnx7jCrpDMsqCAO33FXBJ/oZGJ2Q98Dm6ExVijkMLJz0cNZhCyUEVisx9/Ixc
	S
X-Google-Smtp-Source: AGHT+IGUY7gT78q0yUmMlaZU878FNiH97STd/HcKVMWkTC9jYjwuaWb7IWw3yuGKQCXyo2/X3fHjEQ==
X-Received: by 2002:a05:600c:3c8a:b0:410:c69f:4db7 with SMTP id bg10-20020a05600c3c8a00b00410c69f4db7mr1301968wmb.20.1708005893753;
        Thu, 15 Feb 2024 06:04:53 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:506:d04:fb88:63ff])
        by smtp.gmail.com with ESMTPSA id bx9-20020a5d5b09000000b0033cdedb3e84sm2017296wrb.18.2024.02.15.06.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 06:04:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] openssh: Add a work around for ICE on mips
Date: Thu, 15 Feb 2024 14:04:52 +0000
Message-Id: <20240215140452.2321-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195515

Unfortunately the new openssh version has an ICE on mips. This looks similar to:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104817
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104820

Given how long these have been open, workaround the issue by disabling the compiler
hardening options on mips.

It is likely better to do this than have the open CVEs for everyone
as we can't upgrade.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6366cefdf96..fcd96f707f8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -81,6 +81,9 @@ EXTRA_OECONF = "'LOGIN_PROGRAM=${base_bindir}/login' \
 # musl doesn't implement wtmp/utmp and logwtmp
 EXTRA_OECONF:append:libc-musl = " --disable-wtmp --disable-lastlog"
 
+# Work around ICE on mips starting in 9.6p1
+EXTRA_OECONF:append:mips = " --without-hardening"
+
 # Since we do not depend on libbsd, we do not want configure to use it
 # just because it finds libutil.h.  But, specifying --disable-libutil
 # causes compile errors, so...
-- 
2.40.1


