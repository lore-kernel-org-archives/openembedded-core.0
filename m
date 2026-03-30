Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E848CFB3CF5
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 09:58:58 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47440.1774864733454682600
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 02:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=ilOZFROI;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.208.66, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-66c19d2bdecso7425a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1774864732; x=1775469532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=ilOZFROIju1fFphvnyILFgqecwyvA6K+wu7Pmu8ACmCY6zxZSYETUyJkoRr0g6rXmN
         01p3BM1WWhpGAsL0G/JVb+FpwnGOu5smT+Hindvx80psVfmQMG1BntiMrTF7CZ9BDobG
         xEnwye/Ij3eo/Vlh8fmryga4i/ux9vd2RCS8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864732; x=1775469532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88i2vswGLCwDgX7a0DwZxyHIiq+AG31CjA2c2S6sE0Y=;
        b=L/DQpU6ag8YTLikw7fQAke9OzqZOFsRrPsGSN2glVnpMopBPjG7jSHyzpb2eMZeDau
         rbo3HF3sVbm+YJFqoFwxoPKysmKrWtdS2EUydCSrwAB+TmA1oH1DjxsIvF6NcxYoyvDx
         zUpp70oNlwu4pK0wL3+twH+urRdVSSfTMjXrgqp2RBJPBzlGtp7Uaerc7EPo+AcvS3rp
         sYaW1LVFLGbskuUiaejX8LDdw8RhkG/bLTSTMgzQ6sm9rUSuPFMMcf3t2kDfAGQMWMma
         rQrhazr+8tVx1t2PMhyeTySX79hVstvcVH8Xyf2N2DYGVJT6ftdKUBDBzD7SwRChNL9l
         YLXw==
X-Gm-Message-State: AOJu0YyRilJcEq3G5OCM+hiBspfLvF6J7IsfQCNvhkwW/gvCLjw+PWt0
	awsVcBmj6PBIixfT/0/aAe5aXRtLVCPhu9ykModiWd8cvOWtfMiK3UTC29oqfeeeYAQ8O9FZHEc
	DE4cwm+rWzw==
X-Gm-Gg: ATEYQzy4840IRXCuC5C0oENd8Qv5mYNU7ahvJyns4hUO3hfMBYF+/bpQzBPmEQ6UHMk
	IKoI7h1Lqn2pVWZ1PMPu2iGFxZ4CGmMRmFTMzlekt1XQMtJORczVqTdqUDZSyqwdVxkjh1Ghz5L
	ftyUWMqPJhLVGsijqMXR3GTbIYt2BuJaun1b1QekJhf5oFve1i3q3Kj2cLpWzNKvCuk4CELCECt
	CblioDrHwE9mOAMAEecwDEP1WoIhmWxUsutGNE18NnmJc/v0sTIJpPP9UN7ekhxTqahpT2DDakM
	NgWKAFa//j+zALIbWfGkBpvn2csMgIdrTa6aLP5HvSL4lsuXfCRvX9Qj7Jxas+gp9Hvq3rIAXoC
	5buXGBul2zxEviBMD+9ktAswkbYBn+ULnA1BcasZW4nIa9ZTQwwl1wsQxkA11i+hbX7QQfO279G
	L4Qw8zzfI+qE+vhB9yFxyXeemNLcPUS015Z/jacRiiqswZmPbTF+wzv6Pn/leO8VsxuGdaINdyS
	5uAiqDpGitGNppthSUYfMnTpD0CQOkrcduQBj3SPlymgYngxLEsCzgpRvdCca1JXQ==
X-Received: by 2002:a17:906:c28d:b0:b9b:9dfb:f01d with SMTP id a640c23a62f3a-b9b9dfbf8abmr108387866b.5.1774864731722;
        Mon, 30 Mar 2026 02:58:51 -0700 (PDT)
Received: from adam.arnhem.chello.nl (2001-1c00-8183-9900-1333-c39e-a751-6a95.cable.dynamic.v6.ziggo.nl. [2001:1c00:8183:9900:1333:c39e:a751:6a95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23f0dsm272839366b.11.2026.03.30.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:58:51 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v7 1/6] signing-keys.bb: Fix DISTRO_CODENAME truncation
Date: Mon, 30 Mar 2026 11:58:44 +0200
Message-ID: <20260330095849.119621-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 09:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234214

If DISTRO_CODENAME is not set in the environment, bash quietly
drops the string resulting in a key such as PACKAGEFEED-GPG-KEY-defaultsetup-

However, when python calls self.d.getVar('DISTRO_CODENAME'), the resulting
string is 'None', leading to a configuration file pointing to a key such
as PACKAGEFEED-GPG-KEY-defaultsetup-None

Add a default value in signing-keys.bb to set DISTRO_CODENAME to None if
DISTRO_CODENAME is not set.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-core/meta/signing-keys.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 94f4032911..c7713ed4a6 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -45,6 +45,10 @@ addtask get_public_keys before do_install
 do_get_public_keys[depends] += "gnupg-native:do_populate_sysroot"
 
 do_install () {
+    # Python evalutes an empty DISTRO_CODENAME to "None" which would cause mismatched files
+    # as the update config file would show GPG-KEY-${DISTRO}-None but the filename is
+    # installed as GPG-KEY-${DISTRO}-
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${D}${sysconfdir}/pki/rpm-gpg/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
@@ -57,6 +61,7 @@ do_install () {
 }
 
 do_deploy () {
+    DISTRO_CODENAME="${DISTRO_CODENAME:-None}"
     if [ -f "${B}/rpm-key" ]; then
         install -D -m 0644 "${B}/rpm-key" "${DEPLOYDIR}/RPM-GPG-KEY-${DISTRO}-${DISTRO_CODENAME}"
     fi
-- 
2.53.0


