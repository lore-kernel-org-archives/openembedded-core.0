Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B994C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 09:52:58 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.5197.1686217976637451365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 02:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WRgvIPXd;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: badganchipv@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-54290603887so136018a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686217976; x=1688809976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7XCHdU+jZm3ZbPht48KhW+bjBNV9lwZHcyiCkLUrCoY=;
        b=WRgvIPXdma/isl16sSgMd6hh6Z1H3C0nfY125XL20U3NWOW8JQsGRFzQvE0tqSjnuR
         82biXAztct/Yg6z0a+WkFzyncrapQiCmtN/wIN96dFhi99+Dn7faPlmIPJh0WNAs82dQ
         7wjU7llPeoHRAfCfT/xpJ9oyWzjXSN1999HTO6sfVp4SNuew14ygbjnhaQp2zLIqruQl
         vRCTPLK0HIU+CYjBSW6h17u+5vZtFXJI8mvwkarXnkjQBS7LI/BVXymvdQSA8nGn1Gar
         FYLczfW5POopscuooIxaslSdqV1UfDTikrz87CkZPlNLJib/3+BgWNk3kSjVJua0neUC
         CT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686217976; x=1688809976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7XCHdU+jZm3ZbPht48KhW+bjBNV9lwZHcyiCkLUrCoY=;
        b=R/BlTAmeE3Do3ZGy7LvKQWDeZNaRUezpPD8aRZ509oJDX6USyHRglB17Kdi5KKRhlR
         lRBdNaPMCzzm85ufESdAoisHa+uGjRS0uYXYIpCBDmRMr+dsm5QrWx51/Rc7TuFaUrvy
         jEzsrp8vu9CKS2xy594uXpthDoxn9J2DgUsYisHyElLBYbxNrLaH5xPlfzinieJsX0QJ
         kL101bEdd8MoKqCmIBpvbUNIeBpqFQsyuS8iEsMjbFssq/cRYNUGzkOBG/RjTCTLOLP5
         Qqb6ZWi3LeRzEMblF2f/cluszos2FH10k/kvUBplKsWF5xcnjffmiw1CExnNIG/pANE/
         qQMA==
X-Gm-Message-State: AC+VfDw7VYdJ2BQZE7PHGHWWhH3lfY/iS/7NQDKOoeB0SB6XXcyTAyJ5
	TfLTVIWxqadUCwDXh3i7uF1X1OazXeaczw==
X-Google-Smtp-Source: ACHHUZ664UU7gK8mw+eMDcwHK2ONAEFsAhjrm/Lv4ywYqAsA6wHt1hoFDRmKUE4cDe4WNDvgZsgLSg==
X-Received: by 2002:a17:90a:2b84:b0:259:5c6:39bc with SMTP id u4-20020a17090a2b8400b0025905c639bcmr3474581pjd.33.1686217975518;
        Thu, 08 Jun 2023 02:52:55 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c8f:1608:8a48:2239:9afa:7e73])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a01cf00b00252d960a8dfsm2885963pjd.16.2023.06.08.02.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:52:55 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][dunfell][PATCH 1/2] systemd: implement --initialized-match/nomatch arguments
Date: Thu,  8 Jun 2023 15:22:26 +0530
Message-Id: <20230608095227.34548-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182500

systemd-udev-trigger.service by default triggeres all devices regardless
of whether they were already recognized by systemd-udevd.

There are machines (especially in embedded environments) where
systemd-udev-trigger.service is configured to run at a later stage of
the boot sequence, which can lead to quite a lot of devices being
triggered although they were already recognized by systemd-udevd.

Re-triggering a lot of devices is a relatively expensive operation and
therefore should be avoided if unnecessary.

Therefore this patch introduces --initialized-nomatch, which filters out
devices that are already present in the udev database. For consistance
reasons --initialized-match is implemented as well, which filters out devices
that are *not* already present in the udev database.

Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 ...-initialized-match-nomatch-arguments.patch | 156 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch b/meta/recipes-core/systemd/systemd/0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch
new file mode 100644
index 0000000000..2f7da0aff9
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch
@@ -0,0 +1,156 @@
+From 678f2b16676cd566c50bdec78350f732a9a3ee41 Mon Sep 17 00:00:00 2001
+From: Danilo Krummrich <danilo.krummrich@bmw.de>
+Date: Mon, 14 Jun 2021 17:46:00 +0200
+Subject: [PATCH] udevadm: trigger: implement --initialized-match/nomatch
+ arguments
+
+systemd-udev-trigger.service by default triggeres all devices regardless
+of whether they were already recognized by systemd-udevd.
+
+There are machines (especially in embedded environments) where
+systemd-udev-trigger.service is configured to run at a later stage of
+the boot sequence, which can lead to quite a lot of devices being
+triggered although they were already recognized by systemd-udevd.
+
+Re-triggering a lot of devices is a relatively expensive operation and
+therefore should be avoided if unnecessary.
+
+Therefore this patch introduces --initialized-nomatch, which filters out
+devices that are already present in the udev database. For consistance
+reasons --initialized-match is implemented as well, which filters out devices
+that are *not* already present in the udev database.
+
+Replaces #19949.
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/678f2b16676cd566c50bdec78350f732a9a3ee41.patch]
+Comment: Refreshed hunk from udevadm, _udevadm and udevadm-trigger.c
+Signed-off-by: Pawan Badganchi <pawan.badganchi@kpit.com>
+---
+ man/udevadm.xml               | 29 +++++++++++++++++++++++++++++
+ shell-completion/bash/udevadm |  3 ++-
+ shell-completion/zsh/_udevadm |  2 ++
+ src/udev/udevadm-trigger.c    | 13 +++++++++++++
+ 4 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/man/udevadm.xml b/man/udevadm.xml
+index 24ed4a29c71d..af485711222e 100644
+--- a/man/udevadm.xml
++++ b/man/udevadm.xml
+@@ -395,6 +395,35 @@
+             then each matching result is ORed, that is, all children of each specified device are triggered.</para>
+           </listitem>
+         </varlistentry>
++        <varlistentry>
++          <term><option>--initialized-match</option></term>
++          <term><option>--initialized-nomatch</option></term>
++          <listitem>
++            <para>When <option>--initialized-match</option> is specified, trigger events for devices
++            that are already initialized by <command>systemd-udevd</command>, and skip devices that
++            are not initialized yet.</para>
++            <para>When <option>--initialized-nomatch</option> is specified, trigger events for devices
++            that are not initialized by <command>systemd-udevd</command> yet, and skip devices that
++            are already initialized.</para>
++            <para>Here, initialized devices are those for which at least one udev rule already
++            completed execution – for any action but <literal>remove</literal> — that set a property
++            or other device setting (and thus has an entry in the udev device database). Devices are
++            no longer considered initialized if a <literal>remove</literal> action is seen for them
++            (which removes their entry in the udev device database). Note that devices that have no
++            udev rules are never considered initialized, but might still be announced via the sd-device
++            API (or similar). Typically, it is thus essential that applications which intend to use
++            such a match, make sure a suitable udev rule is installed that sets at least one property
++            on devices that shall be matched.</para>
++            <para>WARNING: <option>--initialized-nomatch</option> can potentially save a significant
++            amount of time compared to re-triggering all devices in the system and e.g. can be used to
++            optimize boot time. However, this is not safe to be used in a boot sequence in general.
++            Especially, when udev rules for a device depend on its parent devices (e.g.
++            <literal>ATTRS</literal> or <literal>IMPORT{parent}</literal> keys, see
++            <citerefentry><refentrytitle>udev</refentrytitle><manvolnum>7</manvolnum></citerefentry>
++            for more details), the final state of the device becomes easily unstable with this option.
++            </para>
++          </listitem>
++        </varlistentry>
+         <varlistentry>
+           <term><option>-w</option></term>
+           <term><option>--settle</option></term>
+diff --git a/shell-completion/bash/udevadm b/shell-completion/bash/udevadm
+index 4d52597cbfdf..23ce02365c7f 100644
+--- a/shell-completion/bash/udevadm
++++ b/shell-completion/bash/udevadm
+@@ -51,7 +51,8 @@
+         [INFO_STANDALONE]='-r --root -a --attribute-walk -x --export -e --export-db -c --cleanup-db
+                            -w --wait-for-initialization'
+         [INFO_ARG]='-q --query -p --path -n --name -P --export-prefix -d --device-id-of-file'
+-        [TRIGGER_STANDALONE]='-v --verbose -n --dry-run -w --settle --wait-daemon'
++        [TRIGGER_STANDALONE]='-v --verbose -n --dry-run -w --settle --wait-daemon
++                              --initialized-match --initialized-nomatch'
+         [TRIGGER_ARG]='-t --type -c --action -s --subsystem-match -S --subsystem-nomatch
+                        -a --attr-match -A --attr-nomatch -p --property-match
+                        -g --tag-match -y --sysname-match --name-match -b --parent-match'
+diff --git a/shell-completion/zsh/_udevadm b/shell-completion/zsh/_udevadm
+index 8a10237e3d66..63df8b7c9ecc 100644
+--- a/shell-completion/zsh/_udevadm
++++ b/shell-completion/zsh/_udevadm
+@@ -30,7 +30,9 @@
+         '--property-match=[Trigger events for devices with a matching property value.]' \
+         '--tag-match=property[Trigger events for devices with a matching tag.]' \
+         '--sysname-match=[Trigger events for devices with a matching sys device name.]' \
+-        '--parent-match=[Trigger events for all children of a given device.]'
++        '--parent-match=[Trigger events for all children of a given device.]' \
++        '--initialized-match[Trigger events for devices that are already initialized.]' \
++        '--initialized-nomatch[Trigger events for devices that are not initialized yet.]'
+ }
+ 
+ (( $+functions[_udevadm_settle] )) ||
+diff --git a/src/udev/udevadm-trigger.c b/src/udev/udevadm-trigger.c
+index e4b3150e6039..56921e2cc62e 100644
+--- a/src/udev/udevadm-trigger.c
++++ b/src/udev/udevadm-trigger.c
+@@ -10,6 +10,7 @@
+ #include "device-private.h"
+ #include "fd-util.h"
+ #include "fileio.h"
++#include "parse-util.h"
+ #include "path-util.h"
+ #include "process-util.h"
+ #include "set.h"
+@@ -130,6 +131,8 @@
+                "  -y --sysname-match=NAME           Trigger devices with this /sys path\n"
+                "     --name-match=NAME              Trigger devices with this /dev name\n"
+                "  -b --parent-match=NAME            Trigger devices with that parent device\n"
++               "     --initialized-match            Trigger devices that are already initialized\n"
++               "     --initialized-nomatch          Trigger devices that are not initialized yet\n"
+                "  -w --settle                       Wait for the triggered events to complete\n"
+                "     --wait-daemon[=SECONDS]        Wait for udevd daemon to be initialized\n"
+                "                                    before triggering uevents\n"
+@@ -142,6 +145,8 @@
+         enum {
+                 ARG_NAME = 0x100,
+                 ARG_PING,
++                ARG_INITIALIZED_MATCH,
++                ARG_INITIALIZED_NOMATCH,
+         };
+ 
+         static const struct option options[] = {
+@@ -158,6 +163,8 @@
+                 { "sysname-match",     required_argument, NULL, 'y'      },
+                 { "name-match",        required_argument, NULL, ARG_NAME },
+                 { "parent-match",      required_argument, NULL, 'b'      },
++                { "initialized-match",     no_argument,       NULL, ARG_INITIALIZED_MATCH     },
++                { "initialized-nomatch",   no_argument,       NULL, ARG_INITIALIZED_NOMATCH   },
+                 { "settle",            no_argument,       NULL, 'w'      },
+                 { "wait-daemon",       optional_argument, NULL, ARG_PING },
+                 { "version",           no_argument,       NULL, 'V'      },
+@@ -301,7 +308,12 @@
+                         }
+                         break;
+                 }
+-
++                case ARG_INITIALIZED_MATCH:
++                case ARG_INITIALIZED_NOMATCH:
++                        r = device_enumerator_add_match_is_initialized(e, c == ARG_INITIALIZED_MATCH ? MATCH_INITIALIZED_YES : MATCH_INITIALIZED_NO);
++                        if (r < 0)
++                                return log_error_errno(r, "Failed to set initialized filter: %m");
++                        break;
+                 case 'V':
+                         return print_version();
+                 case 'h':
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index bd66d82932..a398043308 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -39,6 +39,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2023-26604-2.patch \
            file://CVE-2023-26604-3.patch \
            file://CVE-2023-26604-4.patch \
+           file://0001-udevadm-trigger-implement-initialized-match-nomatch-arguments.patch \
            "
 
 # patches needed by musl
-- 
2.38.1


