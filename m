Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E8EC021BC
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:40:03 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.11777.1740591601300692863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=c4MFiIP4;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8955479c9so1015666d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740591600; x=1741196400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iglr8IYy5qiB7ehZOXca2l0HpMYZXdXgDCHqpaolc98=;
        b=c4MFiIP4ncXBkNYf/0RA95wZow/p80Gy8QQT8nu0KofKKPAbrv2HLTNrTVnGheINT9
         hkwS8lTDX/Ufwad34lI2tpSiEVWl0jzwBY6Vo72KSwdVlvgGEcKvsNcxjbYLsy/62gSO
         oebY9YMqvodjInkrkQzAWfSCIPgOMi62S2Ge1C0+LrILz2Sml1bsGdIgrOJ/UGKh3scB
         6/t0x6d1FKCJejBvtsZiUJYDa00wtyrgGxBApEvwM7fOFGHCIPbfQYv8uRXZx8FH/HY3
         cpW6m4RWG30ihx3srgQdCliDivqmFmzneXAqi/pzMpIyOhqBL+keHggFh/L12RKxGsze
         L/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591600; x=1741196400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iglr8IYy5qiB7ehZOXca2l0HpMYZXdXgDCHqpaolc98=;
        b=XY2cXxyr5d0T8SBl1liubWZeISaiFq+sUDzYO2eYd0xMhnxVbWvOg087BlgNoWrQ0j
         A4E6n9nyCF2EfGkc8Jz745GNBhpe5T7MDuuuccAIMmx9NpZd3iywgAKrYbQgfCeS3uVf
         dhOU6bhG6CKMHeLzkJWUWwnqIV7J4LWUSDjUVHh7fejqgonYfinTPA4rRmeN+QGm2wsf
         2hCqsu9sCGNICSRsn2GZj6bZX3+IfFiMD6QZNNi3dYVRkgVBnUiQdOuhh3sUfjxu0xJ2
         fuxOWk5FdmAO70eFrMBat+Y6AvgO1/muyzPMdj7kql+beXu1ftKS95DpgZwSl5PKN37L
         NlNw==
X-Gm-Message-State: AOJu0YzrdLrvwUVF5m8lg0C2fAlZhXMOG1h0vtLfP6FkCGgdJys29jtn
	/OFdZzWhIjzuryGfiUqG4Eq0UBB7sZ74fT1eLpiJIpVDdJ5DIUnQ32ua3IEp4MrRsoZBfFg8BDD
	t
X-Gm-Gg: ASbGnctx3YF/mJ2zgDcqcBAiVmt1NMXXXbofBa/hPEbd7LbgLutEUYH5u6F/QyqJ6hp
	IpmEkStrXEGzjpEqd77Pxv7FajVj66hU7t86AfxI4HpVPUR4oiL7Fn/W0X53yd1l5HutiPyYjxZ
	EqMMI0QeQzVJideUUybF+TWjvT4fsldGsQRWQk1jwL1hJu802NTCmqTCsa8sAr6fgdSNC/FvoUB
	eawPQ+BPukHDjLLYzKNQSqDj4N/ltt72jyP96a9cKRGYD1xzX/9Ae2Sk4oso4+9qLCYjHEorP2o
	3uEuP++irQM5OHtVjE9RGgPeFbYzsUECEJyvrKLWnoa8dKxhA7Kib5uXyByVNQ==
X-Google-Smtp-Source: AGHT+IFEn7j4q03Av+GgZsEmMpDTD3d/PCtVPI0vhZsGNRL0/QH7CSr/Jn8+BTSezQko9IcvfVc8YQ==
X-Received: by 2002:ad4:5aa8:0:b0:6d8:848e:76c8 with SMTP id 6a1803df08f44-6e6b01d78ddmr304997716d6.42.1740591599619;
        Wed, 26 Feb 2025 09:39:59 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e87b1737eesm24969236d6.104.2025.02.26.09.39.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:39:59 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] python3-sphinx: upgrade 8.1.3 -> 8.2.1
Date: Wed, 26 Feb 2025 12:39:51 -0500
Message-Id: <20250226173952.2337140-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226173952.2337140-1-tgamblin@baylibre.com>
References: <20250226173952.2337140-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211967

Changelog: https://www.sphinx-doc.org/en/master/changes/8.2.html

License-Update: Update copyright year

Add roman-numerals-py to RDEPENDS to avoid the following error:

|     sphinx.errors.ExtensionError: Could not import extension sphinx.builders.latex (exception: No module named 'roman_numerals')

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-sphinx_8.1.3.bb => python3-sphinx_8.2.1.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.1.3.bb => python3-sphinx_8.2.1.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb b/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
index 38cceb068a8..614566b8f40 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.1.3.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python documentation generator"
 HOMEPAGE = "http://sphinx-doc.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4ab44940eeb9c0ec044da326d904a683"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "43c1911eecb0d3e161ad78611bc905d1ad0e523e4ddc202a58a821773dc4c927"
+SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
 
 inherit python_flit_core pypi
 
@@ -22,6 +22,7 @@ RDEPENDS:${PN} = "\
     python3-packaging \
     python3-pygments \
     python3-requests \
+    python3-roman-numerals-py \
     python3-snowballstemmer \
     python3-sphinxcontrib-applehelp \
     python3-sphinxcontrib-devhelp \
-- 
2.39.5


