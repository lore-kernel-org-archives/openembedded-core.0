Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E71CCA47D
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:53:13 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.1560.1654188745315419437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VCDjF6A9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so5290907pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lP9rkWvZXViotoFH1BfM7nfN78fq74sAaMpkwaY1iPk=;
        b=VCDjF6A91h1i/mFfIJoZF1BuCdII6A6Tfgjgi2qIe0Qq0NjQ/hNObBS7PeFyLtW0mQ
         dXWhRBHu//V0GAwIthCb2PzZdmbhjCbSrlhS9UJ3F127kIKIgV5cFBxSHu4s1zdyTuQ5
         HZ5Ou7/9neA1ezVyboUniKc+NH92iHP2CZsJty0qGi1XQwxY66/WbjeComPJnOVY5a0T
         vCHCIA5ndUNze04RYXd8gZKTZgaePtSbzxEp1t+VmfB6w3eBwfFNQc44ZggptpG8b+kR
         WJNvoP3lXK8Km0fu0GSDa4EYdS5Escf2Ka/1T4mJQWZkxr87ClpJFYp66FnV40NCRoHJ
         nIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lP9rkWvZXViotoFH1BfM7nfN78fq74sAaMpkwaY1iPk=;
        b=En5vsZDPja/v6ERhrSwTXF++Vwb5soFYRFdqIaIglLtukJ+sbFBqxQGpkSsE1XU6En
         KrktKQPNhdEhufsPOfGlx65OI4rIbWNVGvTyEfC8XqJuUKOqokyoigPPmLVabOBbAgoX
         eHscnaPF8Zi/qmFigUQ3EY5lZGKTPXUmSbsqV8ZWcmfVxe4W05SVLjR1Pja+Tmm5VBCd
         lua1AvyH6UNOMqioTgBkirwy3VkWbjqV+fZB3pzIt6Tn8tphMMJtO0t1Kj+/i/32Ap0N
         1vGS5+VHTR0RGBjBarO/ygiUvLXfI7W9Ru/7A9jw69dEvZIYRfEXziUJa0L45bCjYBIU
         9Wpg==
X-Gm-Message-State: AOAM531aXUQ/JNZYwnEdrJ5EU2GOqOResOjJVhstDfnIyWzmH+KYmsFB
	ujeu+Dfc0ACOPlAXS5GW+QB6/4NeUL6cAQY7
X-Google-Smtp-Source: 
 ABdhPJwfhi0RCYQHT95Xi3Xfrv+m94kBYoTAwL+ETtybHlgg54Y21aDF+ZpMgHXYy6DKO0uQHTImbA==
X-Received: by 2002:a17:902:7048:b0:161:debe:c3f7 with SMTP id
 h8-20020a170902704800b00161debec3f7mr5590557plt.121.1654188784422;
        Thu, 02 Jun 2022 09:53:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.53.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:53:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/26] rust-common: Ensure sstate signatures have
 correct dependencues for do_rust_gen_targets
Date: Thu,  2 Jun 2022 06:51:54 -1000
Message-Id: 
 <84e891d812874311b4afa20fd7d3dc4c457009f6.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:53:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166499

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

The do_rust_gen_targets task was not rerunning when the configuration variables it
uses were changed. Add the missing variable dependencies to fix this.

[RP: Split to separate patch and add commit message]
Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 65ce2d129154d4540cb8ec960971bcf6aa5a9480)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 310aecef22..29b17cb955 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -360,6 +360,8 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     with open(wd + sys + '.json', 'w') as f:
         json.dump(tspec, f, indent=4)
 
+do_rust_gen_targets[vardeps] += "DATA_LAYOUT LLVM_TARGET TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
+
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     build_arch = d.getVar('BUILD_ARCH')
-- 
2.25.1


