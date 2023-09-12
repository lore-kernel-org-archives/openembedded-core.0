Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44425CA0ECA
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:44:48 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.25433.1694526286469345617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:44:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Q/VhcHQD;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: sweng5080@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a9f88b663cso4075679b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694526285; x=1695131085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y851bnEUWtDC2IlEsDuFYhpisCDrzQGaui+bhqOL1TA=;
        b=Q/VhcHQDq/NB0YTmFeGkh3vFwM9oFRzR0+ENvkt8dkC22pp7Iwm/BgBnLLMsbZQ5fv
         8/bOqzdPBrqfK1sL4A5Jcy8CvPYQze1I4ODCm/tbDf9ugZNPViFYLeH/Vztnwk0xGrdI
         u+UTfx5U67gPgoep3sp4d857RA6DB7/qKXKP0OV64FHIr3o6rUNu77MZWaMyUXaQdGwo
         h86PIoQRtBeEEa+vhf1Rvm8wftrUlfvhlrlCRlWWpxTg8dvSX7ZCv+kTbCYdNrcuTuuh
         /siTMtKFZ+zxASndLxIxMIPzp1hwlVV09kNEPoScG6eWY2KNRnxvQg0sDZKvrH0vHpNR
         RTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526285; x=1695131085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y851bnEUWtDC2IlEsDuFYhpisCDrzQGaui+bhqOL1TA=;
        b=lO5VWGVNf4MdjBfaZw0o04a7EJYJlOYilwqxLxB/bSWmKqEcAvjvfYy3oAatEH7ZMY
         4fzm8oBg45IRyCYw2UqCpHaqczX80aGw3dCKmya89vMz8q+vgweOEr6PcX8O2vd67nLn
         lDqJd2fonob/ipMcTJZbprlGkMos2NOCqZsqsaXGslcObyUAGztizXhqJYezTltWQLIv
         R3jT8trWi9YaNFuVgPQvEKRyVoUw8HP7RKmm59+OLKTCgch3X8Z2dp0BaZVi4/iwNx4b
         hJqFAaaYIuM4ZTplpi7ZlkfR/AXeunCu9nEs47lQMTDV+qphN6/IV4J4VDa4UCKhZc0d
         o4iQ==
X-Gm-Message-State: AOJu0YzcvVN5c2Sfz4Txk+s6IeV4aze+REExi43UFLo1vEp09HXeRl51
	j5l3WHahKVDVayJrFIdjFyHO5GRo/Go=
X-Google-Smtp-Source: AGHT+IGKDBQH9UbaoepfHW0nhyZ/0i2/7DgpxcAN8YkTXKtmSVQo0FL0BcghBzs1RPrQbzEWz+sS3A==
X-Received: by 2002:a05:6808:8a:b0:3a7:9e5d:4c with SMTP id s10-20020a056808008a00b003a79e5d004cmr12292279oic.37.1694526285431;
        Tue, 12 Sep 2023 06:44:45 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 22-20020aca1216000000b003aa191afcc3sm4181934ois.50.2023.09.12.06.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:44:45 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [PATCH 3/3] ppp-dialin: Fix groupname gid change warning
Date: Tue, 12 Sep 2023 08:43:47 -0500
Message-Id: <20230912134347.3355-3-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20230912134347.3355-1-sweng5080@gmail.com>
References: <20230912134347.3355-1-sweng5080@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187514

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
ppp-dialin: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
index 8a6c297cb0..a7b566515e 100644
--- a/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
+++ b/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1.bb
@@ -23,6 +23,7 @@ do_install() {
 }
 
 USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM:${PN} = "--system nogroup"
 USERADD_PARAM:${PN} = "--system --home /dev/null \
                        --no-create-home --shell ${sbindir}/ppp-dialin \
                        --no-user-group --gid nogroup ppp"
-- 
2.37.0


