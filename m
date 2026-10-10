Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A83CA9EC1
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 16:05:33 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11992.1791648331475506002
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2026 09:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=di0bmmyk;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-354ba08cfd1so1193971eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791648331; x=1792253131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVbdpGspdN0kPHBoBQUW7LmOR/TzPGaETIPmiLGJzPU=;
        b=di0bmmyksrt8WMHi4WRp2TQhxQJ/gju9r9Fd7TcEBCfIqnu0hrhgKk01AwjAUzojok
         JB/0LiM5ni+OEEjvzLOtkheH/wzdHBBQbntMzGvY9ip6EkPpoEL3pEI9qUUcBJgFow4X
         kP2LAKq/ASnjjVSpSR4JIj37f8+b1CdEb0FAwtkc7OhsgLpY4fw1J2owcD3OdBp+NB0J
         VdqdutygDrQegJedeFCtlHHFszxUVBgxShE7SKEpN+Rspq2HY0iiDubE3WpmTsRF6K7d
         QvqneXmBD9TWTAwLPz1LPMVYwilPKEt09cW8oOz3Vt90gbsj5aMJzkAbM0FT1/77rC6s
         0lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648331; x=1792253131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVbdpGspdN0kPHBoBQUW7LmOR/TzPGaETIPmiLGJzPU=;
        b=eVz7pzvueJATBGX5vJ/Kw2GUG3x/Rxe8l2e4C8T2m6MFkppNaPz7E0rpq6dARCIWRw
         R/J9fCOlCxw0PrintsUZ4tgAh2tmSdXnmDZt9maYfk3N4hLRgyIp8nQnl40xEafsvPJM
         ykd2sdKS1o7k4ffrIRTF/g7Jc7d7L4lRYA3tk0JxflEFI+mut27UBbChaafxuLJUVYFa
         ufJAvErdq8WOY5+fiz74IyEct9zcKKEquL6K/GW8lE8huYCCJfPJ3ovGCrCjmcxoK749
         H6NcPpwxwGJGENJ10EDIRPQjSm6q0tFyCSwgmqaEp0sNRwwLK7W6QNe0jeovQQ4b1EtO
         /K9A==
X-Gm-Message-State: AFq9FYJJMsWjMJfy6kS2AAX+WRJKHEvTwbAremvD/d4Spp2LiHd/+0/L
	3i9cOnB+ynpErtskpkWPqewIijBNE5njp32tUedXdbxUyiWrg6Sze7C3s1Sbpj4l
X-Gm-Gg: AYBFou18w5G4GCWaGQz/FuT5HGWCuyn7uN8hghTjuB8Ldo5DQQ4IHpn/KPU+wV6bt/s
	FNYerxmZcIJFtmJQBUW636CsELHgPm9c0hL107Z9ZsxVQsJEJ2eTd+YikmmgiAvaM38t2KwwCB/
	vEL/qZHXFegk7MQdQOip93q8t+oQ/8gk7KE9A2HwyOl70efv297ya9FjClHEWejcZejRxd9d9xQ
	/12KhfwJMlC2Mhkv9Gy1CRmpahpIyITWC1/4RoMAJccKvrXxnWVGoya3j53kEO6mqUZaKf6494p
	WXD6ht07TaEPlS4j4SHFVdcZx62+gvxhTjTDcIQQBsWd+Iq8L8k/exRdacUI4PjLgkTzTuvioLl
	qd7SlI+KsQ2IejL8crGBQnflQgFS7w2tfvhUqcaKy7KMAmGG943hYStJhrX0B4nJwYTa5SPRUcx
	RJG+/mrgHuoTkmyQNKPm6nVOgJHig+nupctwETvH+BhFWwYmIs3kfEx0izMCOlzxTBKPRnNorxI
	23NDZTBwguTSyTVbrUbD/IbMxYWfiO+4D/zy5tBCmv1PrJzcCAq/QGHqBVA5Fv39O6kukUubIwn
	RrRdZMMEcWLDHCPNegC2tXgm9z25klpcn0wQUt9tYS6Hl5SGgVR79zkJ33kw9Z28m6as8uilxEq
	mq1FGPvmMRpI0BBqaDppv1QPxUE+sZ1Z0YdzqP+oK13u1q3VOoJsHIO0eaO4UFwIiy537QrIKTT
	jVnsj5h3FtCmedwFg9+WhxFJ8afUFAJGP5TSuDrFNBYjgRQqw=
X-Received: by 2002:a05:7300:d10e:b0:34b:401a:4648 with SMTP id 5a478bee46e88-3537e0be3cbmr6504701eec.20.1791648330480;
        Sat, 10 Oct 2026 09:05:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm4242503eec.15.2026.10.10.09.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:05:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH v2] ptest-packagelists: Skip dbus ptest when dbus-broker is the dbus provider
Date: Sat, 10 Oct 2026 09:05:27 -0700
Message-ID: <20261010160527.2676547-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 16:05:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247499

When a distro sets VIRTUAL-RUNTIME_dbus = "dbus-broker", systemd
RDEPENDS on dbus-broker, which RCONFLICTS with dbus. dbus-ptest
RDEPENDS on dbus, so core-image-ptest-dbus fails in do_rootfs:

  package systemd requires dbus-broker, but none of the providers can be installed
  package dbus-broker conflicts with dbus provided by dbus-1
  package dbus-ptest requires dbus, but none of the providers can be installed

Remove dbus from PTESTS_SLOW when dbus-broker is not the dbus provider.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Use remove instead of append to avoid missing-ptest QA warning

 meta/conf/distro/include/ptest-packagelists.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e8c9c18f92..22a2e3c3ad 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -180,6 +180,10 @@ PTESTS_SLOW:remove:libc-musl:qemux86-64 = "perl gnutls"
 PTESTS_FAST:remove:libc-musl:qemux86-64 = "libarchive"
 PTESTS_PROBLEMS:append:libc-musl:qemux86-64 = " perl gnutls libarchive"

+# dbus conflicts with dbus-broker
+PTESTS_SLOW:remove = "${@'dbus' if d.getVar('VIRTUAL-RUNTIME_dbus') == 'dbus-broker' else ''}"
+PTESTS_PROBLEMS:append = "${@' dbus' if d.getVar('VIRTUAL-RUNTIME_dbus') == 'dbus-broker' else ''}"
+
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all
 #    bash \ # Test outcomes are non-deterministic by design

