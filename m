Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC25C021B8
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:40:03 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.11774.1740591599470069729
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rnKPBtvM;
 spf=pass (domain: baylibre.com, ip: 209.85.222.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0970e2e79so5038085a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740591598; x=1741196398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5yRPf0CoydfQNE5ZaprnvVi4+glub/PoHwkkKkm0BI=;
        b=rnKPBtvMsJOVtDxlDHgljkZB+4qbpaFZ4vWgUlah5z+BaPnlKBajUCfr/49sxp6hch
         HHYRVWOUTaNMze81BtN5GBPfoYWnP1Xgssh7Auy8dK1jJPPYfRogOjTwhRAerbk46eJW
         AtvUbCJ8S3jjzyoW7g0MazpZSQZ/72vShveB7vDs0Q/MTBw3zuIxHM7AfzAaQZs9kad8
         WSiN0h2W71EJWMPAl7OdtPnqT28ecKsw5rq75jiCaO6C4q8lMVisiZSSwhIMt2z0hcZu
         HVi0vKLKRqsDuy+XJE2nRAKUlS8QYy8YtntI6USAHMGjsFdiVTFqKaFGEuLjwu7VG2XD
         7gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740591598; x=1741196398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5yRPf0CoydfQNE5ZaprnvVi4+glub/PoHwkkKkm0BI=;
        b=ChsGh3+saVqfwBaC0hgF6FQcWtnj4LRpUvXgk1775MikXZlJ912Hf4SCEjJJCgeqgM
         L2iXX8acHOYLKQEBStYuikeAwdjArRMbsmkWLizJhmfbLpR3pVEiBxNY6SRpzQzRen7D
         9GwgRhyPdouMqE8MLjxVfpoR1UXBYCYivbyTzy2/BNmD5yWrhSkG495ag0i/g9/5Cqx1
         DBU/VK+XpT0N+IBxqWn6yD+RtwC0A+PvB3zsjvNC9oMSazpkJPvwXw3p2Ly5S4q7Uujk
         NotrUUC6Eb+lBOsArpxVqwl8dGM2n4kapG1xt8HBnKR8Fl/7+APh9CU4zlxT0lhvYzYa
         q08A==
X-Gm-Message-State: AOJu0YxrIoVtIlt45ekVQu2yEP1+NH6rznBYRBdmFvv0g3NFZB/Wx82d
	I84/NIZUbgT9nzkMETU0RJ+ziCybsEI8PammbGXPBtLl5EDNzzimiguZuomRA8rkanssf7hmkml
	y
X-Gm-Gg: ASbGnctCuHzGm32K18J2EufG9Do4/roXj/pr2DPz7CkKQeizquLIyGoEogrxJGMpwKv
	DtqqJr8COcSaFmjZE1QryL03fmQa0AYMkQ9uBDJaVhTezGwS1SGbIrhv7w9EAbsQCvpOcmLmOQA
	SZdKavzaJibS0BMEJvEwFSvfBZxtQyBV0/nxLL+asrgOPiOK6NmyxRAxBBpMxFXVEemhv7Jt0Bw
	DfVuM8Wx7LB2Q1ZKsqW8rKA1fEV8XPUS6vSeDKgcAwwnAytQq3xi40gwhnmyqsQcS9Na+Bf06Cn
	OBqcrBW+bZtubAN2tSM9BA+M8xCT3h78ocQHBx5Jr61yecEadhrUVoDBdxvBdw==
X-Google-Smtp-Source: AGHT+IH96fPn5qIXkFKaRt3aLEpuv2k/BEUXYnOQbvKv7+18ZPHQ42SOX0GC2RTTUAfsmkbdjeLr3w==
X-Received: by 2002:a05:620a:178a:b0:7c0:b8c7:274c with SMTP id af79cd13be357-7c23c048a58mr1626028285a.54.1740591597967;
        Wed, 26 Feb 2025 09:39:57 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c23c298f41sm275366085a.8.2025.02.26.09.39.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:39:57 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/4] python3-roman-numerals-py: add recipe
Date: Wed, 26 Feb 2025 12:39:50 -0500
Message-Id: <20250226173952.2337140-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226173952.2337140-1-tgamblin@baylibre.com>
References: <20250226173952.2337140-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 17:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211966

roman-numerals-py is a module providing utilities for working with
well-formed Roman numerals. python3-sphinx relies on this now, so add it
as a recipe.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/distro/include/maintainers.inc              |  1 +
 .../python/python3-roman-numerals-py_3.1.0.bb         | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e85a0c95636..ef0f16ea640 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -690,6 +690,7 @@ RECIPE_MAINTAINER:pn-python3-referencing = "Trevor Gamblin <tgamblin@baylibre.co
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-roman-numerals-py = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
new file mode 100644
index 00000000000..2f22f15d698
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Manipulate roman numerals"
+HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
+LICENSE = "0BSD & CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
+
+SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
+PYPI_PACKAGE = "roman_numerals_py"
+
+inherit pypi python_flit_core
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


