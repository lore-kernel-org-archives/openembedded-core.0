Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B372C64EC4
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 20:45:19 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web11.54501.1677012311325267146
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 12:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qT96ej1V;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id x6so2512685ilm.11
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 12:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtiOGJw+jESiIsmF/Aks8A3AUeXSVbMQQyzF0ncVObQ=;
        b=qT96ej1VO37+y7VSJe7p3UEWC8XJwqjqHgZT+x73z9KCMbe6yHrqDStSdCb1gjkmWN
         6IN1smtxvNW1DWz13fFf5huVQ3hLsfHIJdgch51KeXBcNvo/miqJi3+U77cTqGTna90f
         7lYK9XO+yvmlb87WrEoJJV4Pm3Yj3st0TmofIIBaiSCXnoP1BeMFw1IKFa7tzfRxu0El
         iOU82SbideMnjSb6Gn03dqbULft3javTazt2qCMuDNlfFmeAJ55a29j4kDPGX0TDgaM9
         QN0lHI0ZxEF/+F2l9UBy8A5vEMxnWItHrxBHeWwOBZnPxqS+PhqjW384udIfU77vtx+Y
         r47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtiOGJw+jESiIsmF/Aks8A3AUeXSVbMQQyzF0ncVObQ=;
        b=M9ZWNssUwYPLjhDx5u1ic0qnxBhLduG00V+h/qI5eYGLhV6HrzojPO3PC30qka1v8R
         CR8CuZcF+oraVIQrqMz3daWqKO6SDilnMiA+IC+7sPEe94aWtGIHS7uBen8qYBQ+mUUk
         Mwv9pKh9SLyjB6x+9hX2fuzKUBtZliO4XSyAITxc5rjzQnVYKYOpLj58Z/DXgO1OPwVn
         56zvPWc5NrEBN7Cq5aU+VFnpOSD90R7nUYTvz9hUvJshbdywGqKxDUHcUkjvVevhVIhB
         zeKpkcmAc6qbcqWYUQRu3EZHxqeILhR0O1xO4grEZK2s3NWSnu/VJ6ORLgOPMPiPZMyq
         Fv7g==
X-Gm-Message-State: AO0yUKU9vp5C5CtKiYbybq/7RZRutfLnwjnmrC4wwNqeSZscBlhDcAea
	A4vzFQaMUL8PxLFsT3yaUl9tJxZrrC8=
X-Google-Smtp-Source: AK7set8Zek/OYoSQd4kHs/lxOJhUKIvw9I7vpr4oBPHbGBD/+TP0sOwPb5Ge8Y/yTKfsqLqBOg+iqA==
X-Received: by 2002:a05:6e02:1a27:b0:316:e033:86ba with SMTP id g7-20020a056e021a2700b00316e03386bamr2051979ile.31.1677012312916;
        Tue, 21 Feb 2023 12:45:12 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a50b000000b003a58ae912aasm414347jam.28.2023.02.21.12.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:45:12 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/11] build-appliance-image: use a real /tmp
Date: Tue, 21 Feb 2023 15:44:42 -0500
Message-Id: <20230221204445.23931-9-twoerner@gmail.com>
X-Mailer: git-send-email 2.36.0.rc2.17.g4027e30c53
In-Reply-To: <20230221204445.23931-1-twoerner@gmail.com>
References: <20230221204445.23931-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 20:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177546

Make /tmp a real directory in the root filesystem and not a link to an
in-memory tmpfs. Otherwise bitbake will run out of inodes on /tmp very quickly
and stop any build.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 3a84de0a2b43..1f7b96a9fcf4 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -113,6 +113,12 @@ fakeroot do_tweak_image () {
 	# add a /lib64 symlink
 	# this is needed for building rust-native on a 64-bit build appliance
 	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
+
+	# make /tmp a real directory and not a link to an in-memory tmpfs
+	# otherwise /tmp will run out of inodes very quickly when bitbaking
+	sed -i -e 's#l root root 1777 /tmp /var/tmp#d root root 1777 /tmp none#' ${IMAGE_ROOTFS}/etc/default/volatiles/00_core
+	mkdir -p ${IMAGE_ROOTFS}/tmp
+	chmod 1777 ${IMAGE_ROOTFS}/tmp
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; do_tweak_image; "
-- 
2.36.0.rc2.17.g4027e30c53


