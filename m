Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6650ECAAD8
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3748.1661806965557683592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wr8XDKko;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 h13-20020a17090a648d00b001fdb9003787so4525134pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=680VjxsmYxuIKU8FQabaOIIwB8rkGSRtilleAGNdUak=;
        b=wr8XDKkouFDb+t0mDnDPEeKgyx8miRxAHWBXCoOSEMFwe5yPlkOtMi5+0l7dgEHDOe
         Wi0B8JKYKs2IdpVeziSx6jlTzkjuDyzUyNK8EVQ4+AjrOoFEBf20CQGMaSqjxJu2ONC7
         zqHTwiBjTbgwklqy3vEkZX1mhtm3vg3NmSFrEnzJv9wkM9hn0UmHH224srwp6c+CtXmR
         HkQqreLhELJJXktZNRYmpAjmrOlryXz79RJf0uygCpKj5t3wOI7ZbTieiw5nNKTXAzmC
         jgm37RfmbeQUTIiwn8H//B/VlKthltC0FJzcpL/3rx0xmJB8sY2T4BJraRNNif/Vd9hk
         bDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=680VjxsmYxuIKU8FQabaOIIwB8rkGSRtilleAGNdUak=;
        b=3KIgCs2kpAanHDOICqvqjcRmAxdrreR1BbiP/3HmPz9bUK8+VdnC/ChBa+7pWBPUlJ
         B9v6lLs8Ix/cleLPknqAEHfsu/1YDzCOdxTjly5DsaTy8zNUb4hWU7rWvtIth3n6VOqh
         nwIbaV5WZ11u324PbKM5cJxbRoWjhhxCzcFRD5NM0Dg1oR2xFPEtgSdWVnC/25nUR/lC
         zMP+pkUDItU17W934Cm9AOuSi2NiI7rA9zqL6/eYXKfqBKovbWUbeLkdwCJfLNamNKVm
         DkRRzDG3e8g06Mbf0nh1O55mPDFlRb9TlAvuV+9D+p2dkefPX2RWNjjMKm/ieu9SWJe+
         g+Cw==
X-Gm-Message-State: ACgBeo2zmyS4z+lqmBHx9bEN/DXueGBVid/CKb4fLesILNw9iNcjzFHE
	MHZhSfmwpFSWxxxZKqLohidUUt8hgkxBTWGd
X-Google-Smtp-Source: 
 AA6agR4yfjCya+rbKUNj/2aOMQFPh2BwzRzGSiurCTKXyaShFYMPEWmkZQAL+YbjMtSRHf4hoxNy/A==
X-Received: by 2002:a17:90a:4a91:b0:1fd:64ce:f8d5 with SMTP id
 f17-20020a17090a4a9100b001fd64cef8d5mr18378521pjh.40.1661806988479;
        Mon, 29 Aug 2022 14:03:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] wireless-regdb: upgrade 2022.06.06 ->
 2022.08.12
Date: Mon, 29 Aug 2022 11:02:30 -1000
Message-Id: 
 <8b69eafa5c624dfc169ee11ced685847332437fa.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170036

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 75386480abd1660a50c79d5987b77ccc43295511)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.06.06.bb => wireless-regdb_2022.08.12.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
index 91775bce5c..7165a9f9b3 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.06.06.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2022.08.12.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "ac00f97efecce5046ed069d1d93f3365fdf994c7c7854a8fc50831e959537230"
+SRC_URI[sha256sum] = "59c8f7d17966db71b27f90e735ee8f5b42ca3527694a8c5e6e9b56bd379c3b84"
 
 inherit bin_package allarch
 
-- 
2.25.1


