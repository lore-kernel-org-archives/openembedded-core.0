Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5170BC4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 18:13:38 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.2990.1714155212563598069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 11:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U1K9HoNx;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: erik.schilling@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51bafbe7509so3495394e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714155211; x=1714760011; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYRCFyYU5wqZkPkKMH4VdhaAPsohJ+E+BbJEonY0ct0=;
        b=U1K9HoNxRmekIi0YXtF2VpyX/i75yOZxMrq1brgjlF9AhoHM/snSJoLHzo4Jm9kqBs
         1g1QDR3Y6OfMmCBwCwTqk7a+AymgA0pH+f9WoyCRtDMI+dWcIhu1+7iuo3DreF2+ydsr
         NjX7HKExPW/dGCpfXjt5YD1cHLu7myQuppQCvvjizGH1UtLirz8qWGaLPFdXvs6oPjJF
         1tzx9ROkdYe5+A/uxvpvAEBSzArs/JwYjVS8wu8CzcMZE3x/3GhqZAmjJugV4K5z2y5Q
         +0Nn5GLz65AhpGwqLZm4De40xoUWjGqUvb1oIfJRq1WdIQQLJJsES+Rg4r4wqrxbODJj
         kdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714155211; x=1714760011;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYRCFyYU5wqZkPkKMH4VdhaAPsohJ+E+BbJEonY0ct0=;
        b=e4kQrauUNyW7DCwXlle63TBMvTE2+nQjdMKRbHs0JUTMBayi6UoAQVeaB9QEC5eL4v
         NChhAuBfD21aoGiyaz5gQWDsdn8v/DBb3HmSHOBb0obJCjvvBoyTrQ5TAOTtx8qCjC3Z
         9zgU7+lxKxoy63FgjPkvKuDhkRY69PaHRFjzqFFGD9Zk+r7a5WqP4T7/osIKSWVgBcrX
         QOXZzwwPY9fnZcwDOOvvOkaiMM8pGn4IRmgBDz1kd336LQrDn85Ona4preJPTfhhnVcS
         +pJ8OWTrhfZX+4uhbGQNqwpjyMxNq10u4E9p+W7aJYoutLQ6BaASub+0JB9wKxFBT9F6
         NYrw==
X-Gm-Message-State: AOJu0YwFDK6Wyk5ZE0NSHh57WIz49JMKCfoHR1UDW/Ufl7/Y/nErswHL
	A9G47p1/KLsuiRUdhPxlYVu4BSLPgcTD2bMTkkZfns2vw7R0y0yo9zuC7CST1ntfzprdDoQxkhd
	O
X-Google-Smtp-Source: AGHT+IFJ2bIP4+l1UeOT4fF33NUfHOKkNdTJibpIJ8yLALUQ3mRQi8wWZ45/aEMOF61iEYJxx4qEsQ==
X-Received: by 2002:a05:6512:1081:b0:518:c69b:3a04 with SMTP id j1-20020a056512108100b00518c69b3a04mr3654519lfg.0.1714155210514;
        Fri, 26 Apr 2024 11:13:30 -0700 (PDT)
Received: from [192.168.1.149] ([2001:9e8:d584:1500::f39])
        by smtp.gmail.com with ESMTPSA id u4-20020a5d6ac4000000b0034c3d1e1391sm2908865wrw.42.2024.04.26.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:13:30 -0700 (PDT)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Fri, 26 Apr 2024 20:13:22 +0200
Subject: [PATCH RFC] systemd-repart.bbclass: provide build-time
 partitioning helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-systemd-repart-v1-1-a6a710a14a8c@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMHuK2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDEyMz3eLK4pLU3BTdotSCxKISXUvL1BQL8yRTgySzRCWgpoKi1LTMCrC
 B0UpBbs5KsbW1AA2YnjRlAAAA
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714155209; l=3361;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=LIQe2rqmXESdwTeeDR4T6oC3iJoM4gKxlTtiXdYklRo=;
 b=B2lbnKRgHxZcVkS3YDmi3l1VlfgSwDL95LrQPZO6YvKkd2eexEzjqpsZ5odOHw5WxpC95C47m
 kokPWYVgsJJCR4UgpY335Jm0DymW2I+ql27Tq8XGv5cf7RwyNOA2EdR
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 18:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198724

systemd-repart can not only do repartitioning at runtime. It can also
create GPT partition images from scratch.

This is especially useful when building non-trivial images that follow
uapi-group's discoverable partition specification [1].

Creating these images using wic becomes cumbersome with dm-verity needing
a lot of careful dependency ordering and non-trivial splitting into
partitions. systemd-repart makes this very simple with just a few config
files.

Example:

This builds an image that splits out /usr into a dm-verity guarded
partition while creating the necessary metadata to auto-discover it.

  01-esp.conf:
    [Partition]
    Type=esp
    CopyFiles=/boot/:/
    Minimize=guess

  02-usr.conf:
    [Partition]
    Type=usr
    CopyFiles=/usr/:/
    Verity=data
    VerityMatchKey=usr
    Minimize=guess

  03-usr-verity.conf:
    [Partition]
    Type=usr-verity
    Verity=hash
    VerityMatchKey=usr
    Minimize=guess

  04-usr-verity-sig.conf:
    [Partition]
    Type=usr-verity-sig
    Verity=signature
    VerityMatchKey=usr

[1] https://uapi-group.org/specifications/specs/discoverable_partitions_specification/

Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
I had this sitting on my disk for quite a while since I hacked this up
for a prototype.

Posting to see if there is any interest into something like this.
---
 meta/classes-recipe/systemd-repart.bbclass | 47 ++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/classes-recipe/systemd-repart.bbclass b/meta/classes-recipe/systemd-repart.bbclass
new file mode 100644
index 0000000000..83f9b65bf3
--- /dev/null
+++ b/meta/classes-recipe/systemd-repart.bbclass
@@ -0,0 +1,47 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+DEPENDS += "systemd-native"
+DEPENDS += "strace-native"
+DEPENDS += "dosfstools-native"
+DEPENDS += "mtools-native"
+
+oe_image_systemd_repart() {
+    local additional_args=""
+
+    if [[ -n "${REPART_PRIVATE_KEY}" ]]
+    then
+        additional_args="$additional_args --private-key=${REPART_PRIVATE_KEY}"
+    fi
+
+    if [[ -n "${REPART_CERTIFICATE}" ]]
+    then
+        additional_args="$additional_args --certificate=${REPART_CERTIFICATE}"
+    fi
+
+    # map architectures to systemd's expected values
+    local systemd_arch="${TARGET_ARCH}"
+    case "${systemd_arch}" in
+        aarch64)
+        systemd_arch=arm64
+        ;;
+    esac
+
+    local image_name="${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.img"
+    systemd-repart --root="${IMAGE_ROOTFS}" \
+        --definitions="${REPART_DEFINITION_DIR}" \
+        --empty=create --size=auto --dry-run=no --offline=yes \
+        --architecture="${systemd_arch}" \
+        --json=pretty --no-pager $additional_args \
+        "${image_name}"
+    if [[ -n "${IMAGE_LINK_NAME}" ]]
+    then
+        ln -f -s "${image_name}" "${IMAGE_LINK_NAME}.img"
+    fi
+}
+
+IMAGE_CMD:systemd-repart = "oe_image_systemd_repart"
+do_image_systemd_repart[deptask] += "do_unpack"

---
base-commit: 9ecb97083efa1b632ce9827ed1201cc1484fcd71
change-id: 20240426-systemd-repart-99ed87b50b6a

Best regards,
-- 
Erik Schilling <erik.schilling@linaro.org>


