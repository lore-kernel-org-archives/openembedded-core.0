Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07588D637BD
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.21872.1731530555317830821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UASWc3ow;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cdb889222so73934025ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530554; x=1732135354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmz60ZlQz+ZifCpMOEILMtIG7xpgeisXQjbAmKWmyJQ=;
        b=UASWc3owt62vZDCcA+tPz4tJT3b9cpctObYy3nN7PaqY+3nO2TD6/u82+0pCQCobjr
         4oZO3mRfNtJfZ/xUsLBHLnL851VOcC2klyRtZpKYYssPOLeR2RKdou7EsJtTVskEXkKp
         OM8/eQGApBmCtv6QRS9XQnJiCIPOX0L84QmDaOeqsqE7sKE7IYBvOwX9NBdsIDM8n8JR
         a6Xe6OVNa4EaBpAF7hyqzR1QiQLgIIXITEBcAcv5MivpnBY+Zk/eJ7XtUAnOo6ZNP5tm
         GuV9EyT8SgBZsNwzjcKCwnM6HiYFQhSgfqJwz4P6boLUiXr84V1dvAt4HWHEpf6MEUfN
         VWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530554; x=1732135354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmz60ZlQz+ZifCpMOEILMtIG7xpgeisXQjbAmKWmyJQ=;
        b=QsXxXR0MYN4Obwh4v3kv+7ziZ3OcTqdPsr3sNJ6qGl1FE0co+sBbMdboIq2FPmui8q
         S3P0xhV3q4YvgJQ4uC1SpQF53aILrzmCHc6t1koIjnl/sYQVMzjhsTShwru2bVolGIQg
         kKEk270LJOuecfmEwwf/XdV/criD338bO14FSkHZeDh7GgRdQZrfuTEJ/HaWeOzYwdBq
         4LvpddT+41WN9X7/mTdxnCuivKCZM+FOd7iVbtcUBigVSATrN/DN/6EiSbr+TbTrz0EO
         pDfrx2WSZjIEtXoa69OSg8swUjnzVO+62wxw3nG5RO97PBLa+BEFtBFeqfdBZRPku5Tv
         hKEw==
X-Gm-Message-State: AOJu0YyKvsltRqatIYYApjiNbFoaOFjQDMWT8ExZVHwzaBkQjkzH2llp
	jzV7o2UGOvmFbFK7GJ8FyXPavWbZqpFttbn1m1xAtBTPe675izlXu+PrgaAXapBW5kTvYjmHxLw
	u
X-Google-Smtp-Source: AGHT+IEl0rgxBUGIauwmEtByKmFso+duc1YKsny7aYF9fzY2qMW0YHbhG3/BlQWOI68azL4w2bwcGA==
X-Received: by 2002:a17:902:ced2:b0:20e:986a:6e72 with SMTP id d9443c01a7336-211b5ca65cdmr51109735ad.30.1731530554620;
        Wed, 13 Nov 2024 12:42:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:34 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/9] gstreamer1.0: set status for CVE-2024-0444
Date: Wed, 13 Nov 2024 12:42:18 -0800
Message-Id: <5ea630617daf0897e5a1edd7482f705e1e7997fe.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207127

From: Peter Marko <peter.marko@siemens.com>

This is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9
via [1].
cpe product is set to gstreamer, they share source git repository.

[1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/394d5066f8a7b728df02fe9084e955b2f7d7f6fe

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
index f4acb0977b..8486e258d5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.12.bb
@@ -71,4 +71,6 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
 
+CVE_STATUS[CVE-2024-0444] = "cpe-incorrect: this is patched in gstreamer1.0-plugins-bad in 1.22 branch since 1.22.9"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.34.1


