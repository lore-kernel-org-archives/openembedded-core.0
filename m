Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66D6C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 13:44:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.5929.1660139043070762724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 06:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tim/LYkx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z12so17799126wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=R+1YcaYwgvxisBPXnPiRnPcAD47dGU/dpi/9yEDF1Po=;
        b=Tim/LYkxYZ5AOoo4rURYo3bDvNQoOq4Yhr+2M/Sx0JT8Xtb+k3eRt4M8Hl8ntRFKme
         THRngLIY78Aa4adhW86vMUt52U5QtKjesaELxhRwSX7IsGf1pXc/c0hhx733kS/XBEiQ
         n6xMxpPQNmMJ3VJUXsgLHsv9pYAwyIO1i2lJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=R+1YcaYwgvxisBPXnPiRnPcAD47dGU/dpi/9yEDF1Po=;
        b=uB5ATT2BGhfrRpfqNa05wGTA46oIakJ75LRfRCrBpTA29Q2NPdN64n9uSzGXcFnj22
         4M7N1ZbyjbQgXNzFunJRC4T8XOLeN+VbjU27RpDhwS7PzDaLUE9ii4J/Q5VdQ9WYTenc
         4jaqvu5eYMRv+X23aFoRPf9Tbq6EXSmc8ylfY4Gcj0lltZzbkdxGv7az7r347Zqapgrj
         4oRhoLiiUrc9r65Li7+iSyZrHm1A2LkWizYfcLWLGCErxOI4d29VOSxBQwRu6P8h8DHD
         DJ9PdSgTh3JFUmG8kctrgl+fg9gceBvafsT6CU7H/jhgR3yS33JF7RWG673+Muq6m1q/
         jKvA==
X-Gm-Message-State: ACgBeo0mJlgVCeb2aP6DBr0m9zCVJjjfT3iLMas1C/gZlLw5repn+rhk
	tDB76c6BKU7tty48iRs2AiltUlhXq49OgQ==
X-Google-Smtp-Source: 
 AA6agR61CsJsTj6YvFAEQHuJ7krijEgFqZA5tiqs1YUlchmIZfFy8mhjrLVF+wM5i05BJgD884Imow==
X-Received: by 2002:adf:fe0d:0:b0:220:5f88:ebef with SMTP id
 n13-20020adffe0d000000b002205f88ebefmr16448198wrr.349.1660139040803;
        Wed, 10 Aug 2022 06:44:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:54f2:80ed:9b2b:a32b])
        by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b00220606afdf4sm16565973wro.43.2022.08.10.06.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:44:00 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: Update classes to match new bitbake class scope
 functionality
Date: Wed, 10 Aug 2022 14:43:59 +0100
Message-Id: <20220810134359.420208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 13:44:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169190

Move classes to classes-global or classes-recipe as approproate to take
advantage of new bitbake functionality to check class scope/usage.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/{classes => classes-global}/base.bbclass                     | 0
 meta/{classes => classes-global}/buildstats.bbclass               | 0
 meta/{classes => classes-global}/debian.bbclass                   | 0
 meta/{classes => classes-global}/devshell.bbclass                 | 0
 meta/{classes => classes-global}/license.bbclass                  | 0
 meta/{classes => classes-global}/package.bbclass                  | 0
 meta/{classes => classes-global}/package_deb.bbclass              | 0
 meta/{classes => classes-global}/package_ipk.bbclass              | 0
 meta/{classes => classes-global}/package_pkgdata.bbclass          | 0
 meta/{classes => classes-global}/package_rpm.bbclass              | 0
 meta/{classes => classes-global}/package_tar.bbclass              | 0
 meta/{classes => classes-global}/packagedata.bbclass              | 0
 meta/{classes => classes-global}/patch.bbclass                    | 0
 meta/{classes => classes-global}/remove-libtool.bbclass           | 0
 meta/{classes => classes-global}/sanity.bbclass                   | 0
 meta/{classes => classes-global}/sstate.bbclass                   | 0
 meta/{classes => classes-global}/staging.bbclass                  | 0
 meta/{classes => classes-global}/uninative.bbclass                | 0
 meta/{classes => classes-global}/utility-tasks.bbclass            | 0
 meta/{classes => classes-global}/utils.bbclass                    | 0
 meta/{classes => classes-recipe}/allarch.bbclass                  | 0
 meta/{classes => classes-recipe}/autotools-brokensep.bbclass      | 0
 meta/{classes => classes-recipe}/autotools.bbclass                | 0
 meta/{classes => classes-recipe}/baremetal-image.bbclass          | 0
 meta/{classes => classes-recipe}/bash-completion.bbclass          | 0
 meta/{classes => classes-recipe}/bin_package.bbclass              | 0
 meta/{classes => classes-recipe}/binconfig-disabled.bbclass       | 0
 meta/{classes => classes-recipe}/binconfig.bbclass                | 0
 meta/{classes => classes-recipe}/cargo.bbclass                    | 0
 meta/{classes => classes-recipe}/cargo_common.bbclass             | 0
 meta/{classes => classes-recipe}/cmake.bbclass                    | 0
 meta/{classes => classes-recipe}/cml1.bbclass                     | 0
 meta/{classes => classes-recipe}/compress_doc.bbclass             | 0
 meta/{classes => classes-recipe}/cpan-base.bbclass                | 0
 meta/{classes => classes-recipe}/cpan.bbclass                     | 0
 meta/{classes => classes-recipe}/cpan_build.bbclass               | 0
 meta/{classes => classes-recipe}/deploy.bbclass                   | 0
 meta/{classes => classes-recipe}/dos2unix.bbclass                 | 0
 meta/{classes => classes-recipe}/externalsrc.bbclass              | 0
 meta/{classes => classes-recipe}/fontcache.bbclass                | 0
 meta/{classes => classes-recipe}/gconf.bbclass                    | 0
 meta/{classes => classes-recipe}/gettext.bbclass                  | 0
 meta/{classes => classes-recipe}/image-artifact-names.bbclass     | 0
 meta/{classes => classes-recipe}/populate_sdk.bbclass             | 0
 meta/{classes => classes-recipe}/populate_sdk_base.bbclass        | 0
 meta/{classes => classes-recipe}/populate_sdk_ext.bbclass         | 0
 meta/{classes => classes-recipe}/ptest-gnome.bbclass              | 0
 meta/{classes => classes-recipe}/ptest-perl.bbclass               | 0
 meta/{classes => classes-recipe}/ptest.bbclass                    | 0
 meta/{classes => classes-recipe}/pypi.bbclass                     | 0
 meta/{classes => classes-recipe}/python3-dir.bbclass              | 0
 meta/{classes => classes-recipe}/python3native.bbclass            | 0
 meta/{classes => classes-recipe}/python3targetconfig.bbclass      | 0
 meta/{classes => classes-recipe}/python_flit_core.bbclass         | 0
 meta/{classes => classes-recipe}/python_hatchling.bbclass         | 0
 meta/{classes => classes-recipe}/python_pep517.bbclass            | 0
 meta/{classes => classes-recipe}/python_poetry_core.bbclass       | 0
 meta/{classes => classes-recipe}/python_pyo3.bbclass              | 0
 meta/{classes => classes-recipe}/python_setuptools3_rust.bbclass  | 0
 .../python_setuptools_build_meta.bbclass                          | 0
 meta/{classes => classes-recipe}/qemu.bbclass                     | 0
 meta/{classes => classes-recipe}/qemuboot.bbclass                 | 0
 meta/{classes => classes-recipe}/rootfs-postcommands.bbclass      | 0
 meta/{classes => classes-recipe}/rootfs_deb.bbclass               | 0
 meta/{classes => classes-recipe}/rootfs_ipk.bbclass               | 0
 meta/{classes => classes-recipe}/rootfs_rpm.bbclass               | 0
 meta/{classes => classes-recipe}/rootfsdebugfiles.bbclass         | 0
 meta/{classes => classes-recipe}/rust-bin.bbclass                 | 0
 meta/{classes => classes-recipe}/rust-common.bbclass              | 0
 meta/{classes => classes-recipe}/rust-target-config.bbclass       | 0
 meta/{classes => classes-recipe}/rust.bbclass                     | 0
 meta/{classes => classes-recipe}/siteinfo.bbclass                 | 0
 meta/{classes => classes-recipe}/testimage.bbclass                | 0
 meta/{classes => classes-recipe}/testsdk.bbclass                  | 0
 meta/{classes => classes-recipe}/texinfo.bbclass                  | 0
 meta/{classes => classes-recipe}/toolchain-scripts-base.bbclass   | 0
 meta/{classes => classes-recipe}/toolchain-scripts.bbclass        | 0
 meta/{classes => classes-recipe}/uboot-config.bbclass             | 0
 meta/{classes => classes-recipe}/uboot-extlinux-config.bbclass    | 0
 meta/{classes => classes-recipe}/uboot-sign.bbclass               | 0
 meta/{classes => classes-recipe}/update-alternatives.bbclass      | 0
 meta/{classes => classes-recipe}/update-rc.d.bbclass              | 0
 meta/{classes => classes-recipe}/useradd.bbclass                  | 0
 meta/{classes => classes-recipe}/useradd_base.bbclass             | 0
 meta/{classes => classes-recipe}/vala.bbclass                     | 0
 meta/{classes => classes-recipe}/waf.bbclass                      | 0
 meta/{classes => classes-recipe}/xmlcatalog.bbclass               | 0
 87 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/{classes => classes-global}/base.bbclass (100%)
 rename meta/{classes => classes-global}/buildstats.bbclass (100%)
 rename meta/{classes => classes-global}/debian.bbclass (100%)
 rename meta/{classes => classes-global}/devshell.bbclass (100%)
 rename meta/{classes => classes-global}/license.bbclass (100%)
 rename meta/{classes => classes-global}/package.bbclass (100%)
 rename meta/{classes => classes-global}/package_deb.bbclass (100%)
 rename meta/{classes => classes-global}/package_ipk.bbclass (100%)
 rename meta/{classes => classes-global}/package_pkgdata.bbclass (100%)
 rename meta/{classes => classes-global}/package_rpm.bbclass (100%)
 rename meta/{classes => classes-global}/package_tar.bbclass (100%)
 rename meta/{classes => classes-global}/packagedata.bbclass (100%)
 rename meta/{classes => classes-global}/patch.bbclass (100%)
 rename meta/{classes => classes-global}/remove-libtool.bbclass (100%)
 rename meta/{classes => classes-global}/sanity.bbclass (100%)
 rename meta/{classes => classes-global}/sstate.bbclass (100%)
 rename meta/{classes => classes-global}/staging.bbclass (100%)
 rename meta/{classes => classes-global}/uninative.bbclass (100%)
 rename meta/{classes => classes-global}/utility-tasks.bbclass (100%)
 rename meta/{classes => classes-global}/utils.bbclass (100%)
 rename meta/{classes => classes-recipe}/allarch.bbclass (100%)
 rename meta/{classes => classes-recipe}/autotools-brokensep.bbclass (100%)
 rename meta/{classes => classes-recipe}/autotools.bbclass (100%)
 rename meta/{classes => classes-recipe}/baremetal-image.bbclass (100%)
 rename meta/{classes => classes-recipe}/bash-completion.bbclass (100%)
 rename meta/{classes => classes-recipe}/bin_package.bbclass (100%)
 rename meta/{classes => classes-recipe}/binconfig-disabled.bbclass (100%)
 rename meta/{classes => classes-recipe}/binconfig.bbclass (100%)
 rename meta/{classes => classes-recipe}/cargo.bbclass (100%)
 rename meta/{classes => classes-recipe}/cargo_common.bbclass (100%)
 rename meta/{classes => classes-recipe}/cmake.bbclass (100%)
 rename meta/{classes => classes-recipe}/cml1.bbclass (100%)
 rename meta/{classes => classes-recipe}/compress_doc.bbclass (100%)
 rename meta/{classes => classes-recipe}/cpan-base.bbclass (100%)
 rename meta/{classes => classes-recipe}/cpan.bbclass (100%)
 rename meta/{classes => classes-recipe}/cpan_build.bbclass (100%)
 rename meta/{classes => classes-recipe}/deploy.bbclass (100%)
 rename meta/{classes => classes-recipe}/dos2unix.bbclass (100%)
 rename meta/{classes => classes-recipe}/externalsrc.bbclass (100%)
 rename meta/{classes => classes-recipe}/fontcache.bbclass (100%)
 rename meta/{classes => classes-recipe}/gconf.bbclass (100%)
 rename meta/{classes => classes-recipe}/gettext.bbclass (100%)
 rename meta/{classes => classes-recipe}/image-artifact-names.bbclass (100%)
 rename meta/{classes => classes-recipe}/populate_sdk.bbclass (100%)
 rename meta/{classes => classes-recipe}/populate_sdk_base.bbclass (100%)
 rename meta/{classes => classes-recipe}/populate_sdk_ext.bbclass (100%)
 rename meta/{classes => classes-recipe}/ptest-gnome.bbclass (100%)
 rename meta/{classes => classes-recipe}/ptest-perl.bbclass (100%)
 rename meta/{classes => classes-recipe}/ptest.bbclass (100%)
 rename meta/{classes => classes-recipe}/pypi.bbclass (100%)
 rename meta/{classes => classes-recipe}/python3-dir.bbclass (100%)
 rename meta/{classes => classes-recipe}/python3native.bbclass (100%)
 rename meta/{classes => classes-recipe}/python3targetconfig.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_flit_core.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_hatchling.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_pep517.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_poetry_core.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_pyo3.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_setuptools3_rust.bbclass (100%)
 rename meta/{classes => classes-recipe}/python_setuptools_build_meta.bbclass (100%)
 rename meta/{classes => classes-recipe}/qemu.bbclass (100%)
 rename meta/{classes => classes-recipe}/qemuboot.bbclass (100%)
 rename meta/{classes => classes-recipe}/rootfs-postcommands.bbclass (100%)
 rename meta/{classes => classes-recipe}/rootfs_deb.bbclass (100%)
 rename meta/{classes => classes-recipe}/rootfs_ipk.bbclass (100%)
 rename meta/{classes => classes-recipe}/rootfs_rpm.bbclass (100%)
 rename meta/{classes => classes-recipe}/rootfsdebugfiles.bbclass (100%)
 rename meta/{classes => classes-recipe}/rust-bin.bbclass (100%)
 rename meta/{classes => classes-recipe}/rust-common.bbclass (100%)
 rename meta/{classes => classes-recipe}/rust-target-config.bbclass (100%)
 rename meta/{classes => classes-recipe}/rust.bbclass (100%)
 rename meta/{classes => classes-recipe}/siteinfo.bbclass (100%)
 rename meta/{classes => classes-recipe}/testimage.bbclass (100%)
 rename meta/{classes => classes-recipe}/testsdk.bbclass (100%)
 rename meta/{classes => classes-recipe}/texinfo.bbclass (100%)
 rename meta/{classes => classes-recipe}/toolchain-scripts-base.bbclass (100%)
 rename meta/{classes => classes-recipe}/toolchain-scripts.bbclass (100%)
 rename meta/{classes => classes-recipe}/uboot-config.bbclass (100%)
 rename meta/{classes => classes-recipe}/uboot-extlinux-config.bbclass (100%)
 rename meta/{classes => classes-recipe}/uboot-sign.bbclass (100%)
 rename meta/{classes => classes-recipe}/update-alternatives.bbclass (100%)
 rename meta/{classes => classes-recipe}/update-rc.d.bbclass (100%)
 rename meta/{classes => classes-recipe}/useradd.bbclass (100%)
 rename meta/{classes => classes-recipe}/useradd_base.bbclass (100%)
 rename meta/{classes => classes-recipe}/vala.bbclass (100%)
 rename meta/{classes => classes-recipe}/waf.bbclass (100%)
 rename meta/{classes => classes-recipe}/xmlcatalog.bbclass (100%)

diff --git a/meta/classes/base.bbclass b/meta/classes-global/base.bbclass
similarity index 100%
rename from meta/classes/base.bbclass
rename to meta/classes-global/base.bbclass
diff --git a/meta/classes/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
similarity index 100%
rename from meta/classes/buildstats.bbclass
rename to meta/classes-global/buildstats.bbclass
diff --git a/meta/classes/debian.bbclass b/meta/classes-global/debian.bbclass
similarity index 100%
rename from meta/classes/debian.bbclass
rename to meta/classes-global/debian.bbclass
diff --git a/meta/classes/devshell.bbclass b/meta/classes-global/devshell.bbclass
similarity index 100%
rename from meta/classes/devshell.bbclass
rename to meta/classes-global/devshell.bbclass
diff --git a/meta/classes/license.bbclass b/meta/classes-global/license.bbclass
similarity index 100%
rename from meta/classes/license.bbclass
rename to meta/classes-global/license.bbclass
diff --git a/meta/classes/package.bbclass b/meta/classes-global/package.bbclass
similarity index 100%
rename from meta/classes/package.bbclass
rename to meta/classes-global/package.bbclass
diff --git a/meta/classes/package_deb.bbclass b/meta/classes-global/package_deb.bbclass
similarity index 100%
rename from meta/classes/package_deb.bbclass
rename to meta/classes-global/package_deb.bbclass
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
similarity index 100%
rename from meta/classes/package_ipk.bbclass
rename to meta/classes-global/package_ipk.bbclass
diff --git a/meta/classes/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
similarity index 100%
rename from meta/classes/package_pkgdata.bbclass
rename to meta/classes-global/package_pkgdata.bbclass
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
similarity index 100%
rename from meta/classes/package_rpm.bbclass
rename to meta/classes-global/package_rpm.bbclass
diff --git a/meta/classes/package_tar.bbclass b/meta/classes-global/package_tar.bbclass
similarity index 100%
rename from meta/classes/package_tar.bbclass
rename to meta/classes-global/package_tar.bbclass
diff --git a/meta/classes/packagedata.bbclass b/meta/classes-global/packagedata.bbclass
similarity index 100%
rename from meta/classes/packagedata.bbclass
rename to meta/classes-global/packagedata.bbclass
diff --git a/meta/classes/patch.bbclass b/meta/classes-global/patch.bbclass
similarity index 100%
rename from meta/classes/patch.bbclass
rename to meta/classes-global/patch.bbclass
diff --git a/meta/classes/remove-libtool.bbclass b/meta/classes-global/remove-libtool.bbclass
similarity index 100%
rename from meta/classes/remove-libtool.bbclass
rename to meta/classes-global/remove-libtool.bbclass
diff --git a/meta/classes/sanity.bbclass b/meta/classes-global/sanity.bbclass
similarity index 100%
rename from meta/classes/sanity.bbclass
rename to meta/classes-global/sanity.bbclass
diff --git a/meta/classes/sstate.bbclass b/meta/classes-global/sstate.bbclass
similarity index 100%
rename from meta/classes/sstate.bbclass
rename to meta/classes-global/sstate.bbclass
diff --git a/meta/classes/staging.bbclass b/meta/classes-global/staging.bbclass
similarity index 100%
rename from meta/classes/staging.bbclass
rename to meta/classes-global/staging.bbclass
diff --git a/meta/classes/uninative.bbclass b/meta/classes-global/uninative.bbclass
similarity index 100%
rename from meta/classes/uninative.bbclass
rename to meta/classes-global/uninative.bbclass
diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes-global/utility-tasks.bbclass
similarity index 100%
rename from meta/classes/utility-tasks.bbclass
rename to meta/classes-global/utility-tasks.bbclass
diff --git a/meta/classes/utils.bbclass b/meta/classes-global/utils.bbclass
similarity index 100%
rename from meta/classes/utils.bbclass
rename to meta/classes-global/utils.bbclass
diff --git a/meta/classes/allarch.bbclass b/meta/classes-recipe/allarch.bbclass
similarity index 100%
rename from meta/classes/allarch.bbclass
rename to meta/classes-recipe/allarch.bbclass
diff --git a/meta/classes/autotools-brokensep.bbclass b/meta/classes-recipe/autotools-brokensep.bbclass
similarity index 100%
rename from meta/classes/autotools-brokensep.bbclass
rename to meta/classes-recipe/autotools-brokensep.bbclass
diff --git a/meta/classes/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
similarity index 100%
rename from meta/classes/autotools.bbclass
rename to meta/classes-recipe/autotools.bbclass
diff --git a/meta/classes/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
similarity index 100%
rename from meta/classes/baremetal-image.bbclass
rename to meta/classes-recipe/baremetal-image.bbclass
diff --git a/meta/classes/bash-completion.bbclass b/meta/classes-recipe/bash-completion.bbclass
similarity index 100%
rename from meta/classes/bash-completion.bbclass
rename to meta/classes-recipe/bash-completion.bbclass
diff --git a/meta/classes/bin_package.bbclass b/meta/classes-recipe/bin_package.bbclass
similarity index 100%
rename from meta/classes/bin_package.bbclass
rename to meta/classes-recipe/bin_package.bbclass
diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes-recipe/binconfig-disabled.bbclass
similarity index 100%
rename from meta/classes/binconfig-disabled.bbclass
rename to meta/classes-recipe/binconfig-disabled.bbclass
diff --git a/meta/classes/binconfig.bbclass b/meta/classes-recipe/binconfig.bbclass
similarity index 100%
rename from meta/classes/binconfig.bbclass
rename to meta/classes-recipe/binconfig.bbclass
diff --git a/meta/classes/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
similarity index 100%
rename from meta/classes/cargo.bbclass
rename to meta/classes-recipe/cargo.bbclass
diff --git a/meta/classes/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
similarity index 100%
rename from meta/classes/cargo_common.bbclass
rename to meta/classes-recipe/cargo_common.bbclass
diff --git a/meta/classes/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
similarity index 100%
rename from meta/classes/cmake.bbclass
rename to meta/classes-recipe/cmake.bbclass
diff --git a/meta/classes/cml1.bbclass b/meta/classes-recipe/cml1.bbclass
similarity index 100%
rename from meta/classes/cml1.bbclass
rename to meta/classes-recipe/cml1.bbclass
diff --git a/meta/classes/compress_doc.bbclass b/meta/classes-recipe/compress_doc.bbclass
similarity index 100%
rename from meta/classes/compress_doc.bbclass
rename to meta/classes-recipe/compress_doc.bbclass
diff --git a/meta/classes/cpan-base.bbclass b/meta/classes-recipe/cpan-base.bbclass
similarity index 100%
rename from meta/classes/cpan-base.bbclass
rename to meta/classes-recipe/cpan-base.bbclass
diff --git a/meta/classes/cpan.bbclass b/meta/classes-recipe/cpan.bbclass
similarity index 100%
rename from meta/classes/cpan.bbclass
rename to meta/classes-recipe/cpan.bbclass
diff --git a/meta/classes/cpan_build.bbclass b/meta/classes-recipe/cpan_build.bbclass
similarity index 100%
rename from meta/classes/cpan_build.bbclass
rename to meta/classes-recipe/cpan_build.bbclass
diff --git a/meta/classes/deploy.bbclass b/meta/classes-recipe/deploy.bbclass
similarity index 100%
rename from meta/classes/deploy.bbclass
rename to meta/classes-recipe/deploy.bbclass
diff --git a/meta/classes/dos2unix.bbclass b/meta/classes-recipe/dos2unix.bbclass
similarity index 100%
rename from meta/classes/dos2unix.bbclass
rename to meta/classes-recipe/dos2unix.bbclass
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes-recipe/externalsrc.bbclass
similarity index 100%
rename from meta/classes/externalsrc.bbclass
rename to meta/classes-recipe/externalsrc.bbclass
diff --git a/meta/classes/fontcache.bbclass b/meta/classes-recipe/fontcache.bbclass
similarity index 100%
rename from meta/classes/fontcache.bbclass
rename to meta/classes-recipe/fontcache.bbclass
diff --git a/meta/classes/gconf.bbclass b/meta/classes-recipe/gconf.bbclass
similarity index 100%
rename from meta/classes/gconf.bbclass
rename to meta/classes-recipe/gconf.bbclass
diff --git a/meta/classes/gettext.bbclass b/meta/classes-recipe/gettext.bbclass
similarity index 100%
rename from meta/classes/gettext.bbclass
rename to meta/classes-recipe/gettext.bbclass
diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes-recipe/image-artifact-names.bbclass
similarity index 100%
rename from meta/classes/image-artifact-names.bbclass
rename to meta/classes-recipe/image-artifact-names.bbclass
diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes-recipe/populate_sdk.bbclass
similarity index 100%
rename from meta/classes/populate_sdk.bbclass
rename to meta/classes-recipe/populate_sdk.bbclass
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
similarity index 100%
rename from meta/classes/populate_sdk_base.bbclass
rename to meta/classes-recipe/populate_sdk_base.bbclass
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
similarity index 100%
rename from meta/classes/populate_sdk_ext.bbclass
rename to meta/classes-recipe/populate_sdk_ext.bbclass
diff --git a/meta/classes/ptest-gnome.bbclass b/meta/classes-recipe/ptest-gnome.bbclass
similarity index 100%
rename from meta/classes/ptest-gnome.bbclass
rename to meta/classes-recipe/ptest-gnome.bbclass
diff --git a/meta/classes/ptest-perl.bbclass b/meta/classes-recipe/ptest-perl.bbclass
similarity index 100%
rename from meta/classes/ptest-perl.bbclass
rename to meta/classes-recipe/ptest-perl.bbclass
diff --git a/meta/classes/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
similarity index 100%
rename from meta/classes/ptest.bbclass
rename to meta/classes-recipe/ptest.bbclass
diff --git a/meta/classes/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
similarity index 100%
rename from meta/classes/pypi.bbclass
rename to meta/classes-recipe/pypi.bbclass
diff --git a/meta/classes/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
similarity index 100%
rename from meta/classes/python3-dir.bbclass
rename to meta/classes-recipe/python3-dir.bbclass
diff --git a/meta/classes/python3native.bbclass b/meta/classes-recipe/python3native.bbclass
similarity index 100%
rename from meta/classes/python3native.bbclass
rename to meta/classes-recipe/python3native.bbclass
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes-recipe/python3targetconfig.bbclass
similarity index 100%
rename from meta/classes/python3targetconfig.bbclass
rename to meta/classes-recipe/python3targetconfig.bbclass
diff --git a/meta/classes/python_flit_core.bbclass b/meta/classes-recipe/python_flit_core.bbclass
similarity index 100%
rename from meta/classes/python_flit_core.bbclass
rename to meta/classes-recipe/python_flit_core.bbclass
diff --git a/meta/classes/python_hatchling.bbclass b/meta/classes-recipe/python_hatchling.bbclass
similarity index 100%
rename from meta/classes/python_hatchling.bbclass
rename to meta/classes-recipe/python_hatchling.bbclass
diff --git a/meta/classes/python_pep517.bbclass b/meta/classes-recipe/python_pep517.bbclass
similarity index 100%
rename from meta/classes/python_pep517.bbclass
rename to meta/classes-recipe/python_pep517.bbclass
diff --git a/meta/classes/python_poetry_core.bbclass b/meta/classes-recipe/python_poetry_core.bbclass
similarity index 100%
rename from meta/classes/python_poetry_core.bbclass
rename to meta/classes-recipe/python_poetry_core.bbclass
diff --git a/meta/classes/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
similarity index 100%
rename from meta/classes/python_pyo3.bbclass
rename to meta/classes-recipe/python_pyo3.bbclass
diff --git a/meta/classes/python_setuptools3_rust.bbclass b/meta/classes-recipe/python_setuptools3_rust.bbclass
similarity index 100%
rename from meta/classes/python_setuptools3_rust.bbclass
rename to meta/classes-recipe/python_setuptools3_rust.bbclass
diff --git a/meta/classes/python_setuptools_build_meta.bbclass b/meta/classes-recipe/python_setuptools_build_meta.bbclass
similarity index 100%
rename from meta/classes/python_setuptools_build_meta.bbclass
rename to meta/classes-recipe/python_setuptools_build_meta.bbclass
diff --git a/meta/classes/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
similarity index 100%
rename from meta/classes/qemu.bbclass
rename to meta/classes-recipe/qemu.bbclass
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
similarity index 100%
rename from meta/classes/qemuboot.bbclass
rename to meta/classes-recipe/qemuboot.bbclass
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
similarity index 100%
rename from meta/classes/rootfs-postcommands.bbclass
rename to meta/classes-recipe/rootfs-postcommands.bbclass
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes-recipe/rootfs_deb.bbclass
similarity index 100%
rename from meta/classes/rootfs_deb.bbclass
rename to meta/classes-recipe/rootfs_deb.bbclass
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes-recipe/rootfs_ipk.bbclass
similarity index 100%
rename from meta/classes/rootfs_ipk.bbclass
rename to meta/classes-recipe/rootfs_ipk.bbclass
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes-recipe/rootfs_rpm.bbclass
similarity index 100%
rename from meta/classes/rootfs_rpm.bbclass
rename to meta/classes-recipe/rootfs_rpm.bbclass
diff --git a/meta/classes/rootfsdebugfiles.bbclass b/meta/classes-recipe/rootfsdebugfiles.bbclass
similarity index 100%
rename from meta/classes/rootfsdebugfiles.bbclass
rename to meta/classes-recipe/rootfsdebugfiles.bbclass
diff --git a/meta/classes/rust-bin.bbclass b/meta/classes-recipe/rust-bin.bbclass
similarity index 100%
rename from meta/classes/rust-bin.bbclass
rename to meta/classes-recipe/rust-bin.bbclass
diff --git a/meta/classes/rust-common.bbclass b/meta/classes-recipe/rust-common.bbclass
similarity index 100%
rename from meta/classes/rust-common.bbclass
rename to meta/classes-recipe/rust-common.bbclass
diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
similarity index 100%
rename from meta/classes/rust-target-config.bbclass
rename to meta/classes-recipe/rust-target-config.bbclass
diff --git a/meta/classes/rust.bbclass b/meta/classes-recipe/rust.bbclass
similarity index 100%
rename from meta/classes/rust.bbclass
rename to meta/classes-recipe/rust.bbclass
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
similarity index 100%
rename from meta/classes/siteinfo.bbclass
rename to meta/classes-recipe/siteinfo.bbclass
diff --git a/meta/classes/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
similarity index 100%
rename from meta/classes/testimage.bbclass
rename to meta/classes-recipe/testimage.bbclass
diff --git a/meta/classes/testsdk.bbclass b/meta/classes-recipe/testsdk.bbclass
similarity index 100%
rename from meta/classes/testsdk.bbclass
rename to meta/classes-recipe/testsdk.bbclass
diff --git a/meta/classes/texinfo.bbclass b/meta/classes-recipe/texinfo.bbclass
similarity index 100%
rename from meta/classes/texinfo.bbclass
rename to meta/classes-recipe/texinfo.bbclass
diff --git a/meta/classes/toolchain-scripts-base.bbclass b/meta/classes-recipe/toolchain-scripts-base.bbclass
similarity index 100%
rename from meta/classes/toolchain-scripts-base.bbclass
rename to meta/classes-recipe/toolchain-scripts-base.bbclass
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
similarity index 100%
rename from meta/classes/toolchain-scripts.bbclass
rename to meta/classes-recipe/toolchain-scripts.bbclass
diff --git a/meta/classes/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
similarity index 100%
rename from meta/classes/uboot-config.bbclass
rename to meta/classes-recipe/uboot-config.bbclass
diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes-recipe/uboot-extlinux-config.bbclass
similarity index 100%
rename from meta/classes/uboot-extlinux-config.bbclass
rename to meta/classes-recipe/uboot-extlinux-config.bbclass
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
similarity index 100%
rename from meta/classes/uboot-sign.bbclass
rename to meta/classes-recipe/uboot-sign.bbclass
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes-recipe/update-alternatives.bbclass
similarity index 100%
rename from meta/classes/update-alternatives.bbclass
rename to meta/classes-recipe/update-alternatives.bbclass
diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes-recipe/update-rc.d.bbclass
similarity index 100%
rename from meta/classes/update-rc.d.bbclass
rename to meta/classes-recipe/update-rc.d.bbclass
diff --git a/meta/classes/useradd.bbclass b/meta/classes-recipe/useradd.bbclass
similarity index 100%
rename from meta/classes/useradd.bbclass
rename to meta/classes-recipe/useradd.bbclass
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes-recipe/useradd_base.bbclass
similarity index 100%
rename from meta/classes/useradd_base.bbclass
rename to meta/classes-recipe/useradd_base.bbclass
diff --git a/meta/classes/vala.bbclass b/meta/classes-recipe/vala.bbclass
similarity index 100%
rename from meta/classes/vala.bbclass
rename to meta/classes-recipe/vala.bbclass
diff --git a/meta/classes/waf.bbclass b/meta/classes-recipe/waf.bbclass
similarity index 100%
rename from meta/classes/waf.bbclass
rename to meta/classes-recipe/waf.bbclass
diff --git a/meta/classes/xmlcatalog.bbclass b/meta/classes-recipe/xmlcatalog.bbclass
similarity index 100%
rename from meta/classes/xmlcatalog.bbclass
rename to meta/classes-recipe/xmlcatalog.bbclass
-- 
2.34.1


