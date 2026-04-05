Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7289E9D809
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:43:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36228.1775400197049165347
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dddHeFLw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43b949bf4easo2878369f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775400195; x=1776004995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EkZx3u5NLQMBPcySLOewFKpwJ0JCsGSm4huSicDbFSs=;
        b=dddHeFLwpFHTWkpRlC6DcWW16c5m9hYi1UnEDx3BXLe+v4xzE4qZrp/644KxnvksFf
         MYPtQKyAx1LsHWyXOsoBVaNhiqoZvmH/Qb4PWvGtUEzTRfx5wB9mUZAdoI7YipyTAh4a
         +824Z4KfI31VHE7wPDc2TPUiV7xw0qgtVaLs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400195; x=1776004995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkZx3u5NLQMBPcySLOewFKpwJ0JCsGSm4huSicDbFSs=;
        b=fQ0DmeZkDaWYmAWnWEpQF9FZlQfckeBzugd3twgI585Bd/y6T/tyn8Ahl9Ku6n+TQF
         ug0QlwZf92a9+s4n9niaS0o1LNXZrIHx8x9fmO3uDJWkjP2AsJYfyE/I+PRvlmAS7sFx
         2fh2iaXI5KGaIzXoCn0Y8Fpz5MvdumPQOAVfrTfaPOGcF/LZZrDrnfxmdDVCZsyl0HPK
         BKASCtwRSIcTdTR0jQuz7wkp0asPGwmBYKJKJwr28gX2Qt0xyTE/DzweSyJnTcq8/rBp
         X685nUfvxVhrXRTkPYZbZaOcf0o1AQUEaTM+bwJH2Fm2zqf/mWIpWlhdAk2wdvP6XT8J
         uGZg==
X-Gm-Message-State: AOJu0YyXrmca0yx7XYe+TMPjSvcOeqTYmUyniWL+M5P0R1f+wsmwuO90
	fOVrn93GYBp6i5OsMDBR82q7UW2GNJldrWnS4EaOt1x8O6HUJ27Hi/o7brySr3PQ/rP6OfIMWWy
	vzUJ3
X-Gm-Gg: AeBDievgY+0HgsR7BzHH+ssckhS7X1fBsfkteDvO5+YjLQLlpqIE6CbjQbNQNo4V6l2
	v4kZtbA4xv5G7SdBnSDwyiM/UKOnm4z3nBUCm7IdBzbd9fiWkCB01AANeECvsAEp+LX42Z7q4FD
	lpYrOV0R7Tu+9gNS/iaGIwlb6V+JR6NUWC70K4/qipjNae0xhzN5SaSNeYYHe7dirqJ5g/ElUAu
	0g8YHSufNL+WuiIwmZOmuJ72rgP3aGIsGJ/hFhGADJXBR+bwlEimnvrLdet4afbApEpNMiRD2n4
	BVl2SAAO9s6E72yJDvpvIHNXj79v14ID/wAO8r5GPvAaZK3VTKj7APRHUn6a3hEqkS1Wu8mJC25
	kJMh8i1r8+i5c1YosRLk2RXL71j6OeH+p1CgZ9bsnNv4jhM5W1UqNRh22O9+feUiAL/pz1eveRm
	iYJkHPbkOhKtEYz2hGEPRwk3mfHrHnn9yxaG6YfhMBvNlVGDxDzUge
X-Received: by 2002:a05:6000:25c1:b0:43c:ffd8:e25a with SMTP id ffacd0b85a97d-43d2115ae92mr21829521f8f.5.1775400195008;
        Sun, 05 Apr 2026 07:43:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm32474083f8f.13.2026.04.05.07.43.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:43:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] meta-selftest/wic: Move to files/wic
Date: Sun,  5 Apr 2026 15:43:10 +0100
Message-ID: <20260405144311.3734472-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
References: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234633

To align with the new search paths, move the files to the new location.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/{ => files}/wic/overlayfs_etc.wks.in                | 0
 meta-selftest/{ => files}/wic/test_biosplusefi_plugin.wks         | 0
 meta-selftest/{ => files}/wic/test_efi_plugin.wks                 | 0
 .../{ => files}/wic/test_efi_plugin_plain_systemd-boot.wks        | 0
 meta-selftest/{ => files}/wic/test_empty_plugin.wks               | 0
 meta-selftest/{ => files}/wic/test_gpt_partition_name.wks         | 0
 meta-selftest/{ => files}/wic/test_rawcopy_plugin.wks.in          | 0
 meta-selftest/{ => files}/wic/test_uefikernel.wks                 | 0
 meta-selftest/{ => files}/wic/wictestdisk.wks                     | 0
 9 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-selftest/{ => files}/wic/overlayfs_etc.wks.in (100%)
 rename meta-selftest/{ => files}/wic/test_biosplusefi_plugin.wks (100%)
 rename meta-selftest/{ => files}/wic/test_efi_plugin.wks (100%)
 rename meta-selftest/{ => files}/wic/test_efi_plugin_plain_systemd-boot.wks (100%)
 rename meta-selftest/{ => files}/wic/test_empty_plugin.wks (100%)
 rename meta-selftest/{ => files}/wic/test_gpt_partition_name.wks (100%)
 rename meta-selftest/{ => files}/wic/test_rawcopy_plugin.wks.in (100%)
 rename meta-selftest/{ => files}/wic/test_uefikernel.wks (100%)
 rename meta-selftest/{ => files}/wic/wictestdisk.wks (100%)

diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/files/wic/overlayfs_etc.wks.in
similarity index 100%
rename from meta-selftest/wic/overlayfs_etc.wks.in
rename to meta-selftest/files/wic/overlayfs_etc.wks.in
diff --git a/meta-selftest/wic/test_biosplusefi_plugin.wks b/meta-selftest/files/wic/test_biosplusefi_plugin.wks
similarity index 100%
rename from meta-selftest/wic/test_biosplusefi_plugin.wks
rename to meta-selftest/files/wic/test_biosplusefi_plugin.wks
diff --git a/meta-selftest/wic/test_efi_plugin.wks b/meta-selftest/files/wic/test_efi_plugin.wks
similarity index 100%
rename from meta-selftest/wic/test_efi_plugin.wks
rename to meta-selftest/files/wic/test_efi_plugin.wks
diff --git a/meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks b/meta-selftest/files/wic/test_efi_plugin_plain_systemd-boot.wks
similarity index 100%
rename from meta-selftest/wic/test_efi_plugin_plain_systemd-boot.wks
rename to meta-selftest/files/wic/test_efi_plugin_plain_systemd-boot.wks
diff --git a/meta-selftest/wic/test_empty_plugin.wks b/meta-selftest/files/wic/test_empty_plugin.wks
similarity index 100%
rename from meta-selftest/wic/test_empty_plugin.wks
rename to meta-selftest/files/wic/test_empty_plugin.wks
diff --git a/meta-selftest/wic/test_gpt_partition_name.wks b/meta-selftest/files/wic/test_gpt_partition_name.wks
similarity index 100%
rename from meta-selftest/wic/test_gpt_partition_name.wks
rename to meta-selftest/files/wic/test_gpt_partition_name.wks
diff --git a/meta-selftest/wic/test_rawcopy_plugin.wks.in b/meta-selftest/files/wic/test_rawcopy_plugin.wks.in
similarity index 100%
rename from meta-selftest/wic/test_rawcopy_plugin.wks.in
rename to meta-selftest/files/wic/test_rawcopy_plugin.wks.in
diff --git a/meta-selftest/wic/test_uefikernel.wks b/meta-selftest/files/wic/test_uefikernel.wks
similarity index 100%
rename from meta-selftest/wic/test_uefikernel.wks
rename to meta-selftest/files/wic/test_uefikernel.wks
diff --git a/meta-selftest/wic/wictestdisk.wks b/meta-selftest/files/wic/wictestdisk.wks
similarity index 100%
rename from meta-selftest/wic/wictestdisk.wks
rename to meta-selftest/files/wic/wictestdisk.wks

