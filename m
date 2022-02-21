Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B392C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:14:52 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.11300.1645452891723294466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mCwVjSYo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id x11so12986533pll.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QUEddwckeYaLeBVtkfXJ9kG3OiQWa1oUsPm3VW7w7Hc=;
        b=mCwVjSYoQMz+VGHPfsjq7Gv5s4UWlZ+YciOdMO80OkiQpbFuPuPCPQmkioVFfH4w51
         OrUyosQz4pI/xTDa/L1eN+Fiz0nLn44W8l6qE/z27+XwwwgcWxybnXxUJ3IBKtMjmYIw
         EkbLKZHGLEq4L0wXPZjckWWett6vlHMhJYtNBPvYdKpxp+krPIqT8F4tKFJ7N77hPDqh
         ewp9B86H1Bx3I5zkOUwTUTao1bcZKbwJQPFGBOKOTF29X2Xmg0fyc4mOXXUWwQd9neGK
         YXtXw4BN+j9tychoKKfX9R+WPJe6VE3CqoC8JXdiB0r50Shj2jo/eNG0HTigtYZgXk6/
         SmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QUEddwckeYaLeBVtkfXJ9kG3OiQWa1oUsPm3VW7w7Hc=;
        b=UPqfGPmqewiG8GtOP66VckspFCbD3pJ0z0NYotWOXnGWk/11/ZLk7GUI9wucta1o9o
         j1zq3cBpa5KfCeA+fwm3ReaWtbk6Nnz4D17+PtRgw+hQjfoJPlcdIeZ7VXMw5n3wWdKp
         wH5Zgvlc0y3exZKsgFat47y1M4b1amwMC7pDRq9pNkDSI5MBvWX6vK4yshE8e+aMOmC7
         v+6nGgyz//0fb1QOtCJGNa3znZwhQXtG3MY3t5fyQ1/wk8ijQQS2LtMf0KmW1FCR9XZr
         Dsz7nUI/WLR6Gr3N+jaJdMAgJzrXH8ysHDNPp8nASkZeukGmDciVGkKHp6RuNY2lzRp0
         mepg==
X-Gm-Message-State: AOAM530H7/klK6lzx67Q7KlRvgdVoAOtEjN3PWNvyEzNPCN9WjZhXRo9
	YToK9oithsz9b7fXpSfBnv8iwWxGagDq9JGE
X-Google-Smtp-Source: 
 ABdhPJzbRZ5sH9aHoHHCLxKPzGeSjlgcOzG29QRfZTX1FbuAUPqhWqC8cuF2PCI/xpbo6f55cOJDyQ==
X-Received: by 2002:a17:903:2289:b0:14f:a64f:2475 with SMTP id
 b9-20020a170903228900b0014fa64f2475mr7828791plh.80.1645452890854;
        Mon, 21 Feb 2022 06:14:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 8sm12919235pfl.164.2022.02.21.06.14.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 06:14:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/20] cve-check: create directory of
 CVE_CHECK_MANIFEST before copy
Date: Mon, 21 Feb 2022 04:14:07 -1000
Message-Id: 
 <ee05539fc6fadff7f14c8609641021fc497cbd8e.1645452535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645452535.git.steve@sakoman.com>
References: <cover.1645452535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:14:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162037

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Create directory of the CVE_CHECK_MANIFEST variable before copy to it,
so that the variable can use an arbitrary directory name.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9829c16301bf2dce39fa046401a984f112fa0322)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6eecbdbf13..6b627464a0 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -143,6 +143,7 @@ python cve_check_write_rootfs_manifest () {
         manifest_name = d.getVar("CVE_CHECK_MANIFEST")
         cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
+        bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
 
         if manifest_name and os.path.exists(manifest_name):
-- 
2.25.1


