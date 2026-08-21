Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF48C5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:10:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3647.1787303409878915025
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K+Kmkl+h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-476a130c138so888287f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787303408; x=1787908208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NL1aOhblz4aZJZOL+XUl/XBDOWueFdtf2zQ0SfA9wSE=;
        b=K+Kmkl+h2xFPZqNWVCW2q1RAVS+cEQ+C1XVjx3BIIVLfRyUHmg6VatKmcKyL6e+Hor
         iupmS3Web4kEmP7uayokppAhV7YBokVVWVdrAh2lDRIFZZnvt8rPNxE/iPdp0S3ZrxMp
         GTohEgj8yfMR8zZnzVQLlE5bkEiqtvr6pFJGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787303408; x=1787908208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NL1aOhblz4aZJZOL+XUl/XBDOWueFdtf2zQ0SfA9wSE=;
        b=sDlJysESHZ3vN4nHU7HKC/YFZ5ctMqH3ZqbltnmJ5ulWJRTEBtrRVPDh19rG6Vpvkp
         SEQs99hl5/xPZnzSb+lpZe4ioR/or22+rVn57um3lkYQNGKKQwIJYMPb1ImM+gMaBquW
         ufFFzKyEkwXBajA48uyb6DWIy75z4yYenlgHts08SW0GlDRjzOP/cSgzmK4qzDfl7nLT
         Oq/SR442Vb2D45OW4RyH0txshfAbbBZum5FGvzG1gFMvi0J7KIocCapKDY01a24SIey6
         OovdAjnJLTCbLLezLr9JvgVhw1JSZb/Alhp/He9wRQgPO7vYp6w0wgpWmgj1qWizWvRI
         u4fA==
X-Gm-Message-State: AFuF++nGsRki9sXhVAMdcrPz+jRsx9rwR3SIj83NV4ClGHaNzemLClBT
	pQRhljhy9hLpSpn/F0Sjhnb7VkpP7K1RjPwjRhENmpzIUsG1GU2pcXFK8ZVKcWsg/aY8CNIOtsA
	E6UfQk2A=
X-Gm-Gg: AR+sD13M9YlBJ6ddI7qsTogUI7C9gr8NGDt1kItPn3xBWW+5mlPC4W+fNIUuD7NUkF+
	mqZWug0ilG9aoJiw25uNDom6pdHFv5e6INaw1YAdYfOFm4B618PmOYrjDkNFPi6HCH7ASQbpgrD
	e9GF29mBiGNZJzHqbRAQCL95j9lBNMxQyRbEtPshSui1T4HiIuJqMdeu0W3caYRnETSUITMf2g5
	69z2S6Z0QBbPUTdDItXvvL1oRjfL83l411gWd3LpHsoX3645EgaK3FTBOywkb7tQCPj54KnmmeY
	nDSRB3lJ2dRtqmyoXEmskFLzWrcYHuBC0/sV32vhKi80PSA+K8Vze0rx283Rhz4uzjyuvCafC1o
	MTrEu5DBHItNr7u/+NxzGI7etBUzt84X+jEVlJH9ENY9Wg3LxkS626Dvcfn0jMWAKkDXebPQaQE
	PT/4rvKGwC9cT4fkYctcQuP2lGPkvYeNxusg4Fcg+UyAVdHZK4LgeeF078v8HFzuQ3qYff9YD9w
	is0ZYT0o6M5CiVkGw==
X-Received: by 2002:a05:6000:2f84:b0:482:bf78:300a with SMTP id ffacd0b85a97d-482c0ba4732mr6801216f8f.17.1787303408029;
        Fri, 21 Aug 2026 02:10:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b7d23sm17049620f8f.22.2026.08.21.02.10.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:10:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] python3-lxml: upgrade 6.1.1 -> 6.1.2
Date: Fri, 21 Aug 2026 10:09:57 +0100
Message-ID: <20260821090959.3859632-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
References: <20260821090959.3859632-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 09:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243913

Bugs fixed

    GH#526: Some build files were missing in the sdist. Patch by Nicola Soranzo.
    Some minor corrections for error handling cases.

Other changes

    Built with Cython 3.2.9.

License-Update: New code using PSF-2.0 is documented but the license is already listed. Also
binary wheel related licenses are documented which we don't use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-lxml_6.1.1.bb => python3-lxml_6.1.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-lxml_6.1.1.bb => python3-lxml_6.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb b/meta/recipes-devtools/python/python3-lxml_6.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-lxml_6.1.1.bb
rename to meta/recipes-devtools/python/python3-lxml_6.1.2.bb
index 4ca7f08b39c..13e33d14fc1 100644
--- a/meta/recipes-devtools/python/python3-lxml_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-lxml_6.1.2.bb
@@ -7,7 +7,7 @@ C14N and much more."
 HOMEPAGE = "https://lxml.de/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause AND GPL-2.0-only AND MIT AND PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
+LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=d1118b9913749904166e8726c5331c11 \
                     file://doc/licenses/elementtree.txt;md5=eb34d036a6e3d56314ee49a6852ac891 \
                     file://doc/licenses/BSD.txt;md5=700a1fc17f4797d4f2d34970c8ee694b \
                     file://doc/licenses/GPL.txt;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "ba96ae44888e0185281e937633a743ea90d5a196c6000f82565ebb0580012d40"
+SRC_URI[sha256sum] = "1055241852f2b02068af4a625a5d32c087db193c12251928af2562ecd2239f18"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3

