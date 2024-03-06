Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DBEC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:31 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.15039.1709739741247284221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdoBRZmV;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56682b85220so11153740a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739740; x=1710344540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoBwVbJm3f8I6xf2OjIObsoKsbssHDUGjQvGJTjxrno=;
        b=LdoBRZmVEcpnYWI3iJTIighgXU3HkeQnKwbeMMDlXrTqTwQu2FdaeUfHFk2YG+UVUl
         2zAN9OXnQgqor8DmfOlqPlAmIH7PQ6T8XDsNmL+1ykDyCAhJah58/zeIi+MwpBBzywzb
         +zLToRoqXyeQP0WL/vfCw5C45nsCdNUU7zMsC2L9WPeiMzDZFRYIVoYnfs8j+zaL6CHI
         S1npTY1rmhvfiPA09IAPIHLB3NcSWc/zuRINmYElBVfI29akdyR5iLk0/MCajcbxAY6Y
         0pj6SMUG6xT1x6Iu4tcys9swXb0GsFp1J+z8jXdXe2O8yHIfK/ioGdSHvAztGe8G8NCX
         CEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739740; x=1710344540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AoBwVbJm3f8I6xf2OjIObsoKsbssHDUGjQvGJTjxrno=;
        b=Ws3Fgw2UtSLeoBbWitNJTyTouLa2O5NsEyCtM8TvTLIIhxVcr7iMa/HKh8cR9vSms3
         8FU1IF/Cjr1YMUWSoJOQUES20zcbsB5t4GPdkF4neQGLIAmSQJUFI0lCYDUj3+bu6ocA
         lkq21BvFojPbAWcsLyC6mDgX0Rj8oPYmqDBuGf6juNDyIepWuv16UJ0Ht8scP1dxOxHX
         bVO10f1+AB/ZKKK3awLFxTnzGIIv4hAO82AxpLpUj9qZMx4QICHLTCrGsOQMl9RTx3Yo
         Qxs98aP7HcyWVU6MXmOrMMpr2iRdGDlciJVzWX2WqUE5oskv+ViuYK5CytXhk2o0X1DY
         CyYg==
X-Gm-Message-State: AOJu0YyZRSoeztjNbLWh7GrDnwio9XadWoPeT+ez4FOIt8RACEUsOw2F
	Yv6wLIzs34caJDID/rgWwYSIITpusx9k2l7r1SQ6toVqy9HdC0FY3myxFYvI
X-Google-Smtp-Source: AGHT+IGJKw/dxJ+qQ5e7pk7HZh7q9oL2xeiitgU5E2wpE/aPYFLs5Tvy3Z8qfLh0QHumwMDhAXuPqQ==
X-Received: by 2002:a17:906:e211:b0:a3e:b407:65ab with SMTP id gf17-20020a170906e21100b00a3eb40765abmr10988443ejb.50.1709739739704;
        Wed, 06 Mar 2024 07:42:19 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/47] python3-jsonschema: upgrade 4.17.3 -> 4.21.1 and add new dependencies
Date: Wed,  6 Mar 2024 16:41:39 +0100
Message-Id: <20240306154151.3741709-35-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196718

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |  3 +
 ...on3-jsonschema-specifications_2023.12.1.bb | 18 +++++
 ...4.17.3.bb => python3-jsonschema_4.21.1.bb} |  4 +-
 .../python/python3-referencing_0.33.0.bb      | 14 ++++
 .../python/python3-rpds-py-crates.inc         | 80 +++++++++++++++++++
 .../python/python3-rpds-py_0.18.0.bb          | 17 ++++
 6 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
 rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb => python3-jsonschema_4.21.1.bb} (88%)
 create mode 100644 meta/recipes-devtools/python/python3-referencing_0.33.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-rpds-py-crates.inc
 create mode 100644 meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3f566eaafca..a44e065d2d9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -650,6 +650,7 @@ RECIPE_MAINTAINER:pn-python3-installer = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-jsonschema-specifications = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-license-expression = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-lxml = "Khem Raj <raj.khem@gmail.com>"
@@ -689,10 +690,12 @@ RECIPE_MAINTAINER:pn-python3-pytest-subtests = "Tim Orling <tim.orling@konsulko.
 RECIPE_MAINTAINER:pn-python3-pytz = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pyyaml = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rdflib = "Wang Mingyu <wangmy@fujitsu.com>"
+RECIPE_MAINTAINER:pn-python3-referencing = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-requests = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3986-validator = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3987 = "Bruce Ashfield <bruce.ashfield@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-rpds-py = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-ruamel-yaml = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-scons = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb b/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
new file mode 100644
index 00000000000..bffd59a719e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "The JSON Schema meta-schemas and vocabularies, exposed as a Registry"
+DESCRIPTION = "JSON support files from the JSON Schema Specifications (metaschemas, \
+vocabularies, etc.), packaged for runtime access from Python as a referencing-based Schema Registry."
+HOMEPAGE = "https://pypi.org/project/jsonschema-specifications/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
+
+SRC_URI[sha256sum] = "48a76787b3e70f5ed53f1160d2b81f586e4ca6d1548c5de7085d1682674764cc"
+
+inherit pypi python_hatchling
+
+DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+
+S = "${WORKDIR}/jsonschema_specifications-${PV}"
+
+PYPI_ARCHIVE_NAME = "jsonschema_specifications-${PV}.${PYPI_PACKAGE_EXT}"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
index be51a158a97..381148f4bb7 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
+SRC_URI[sha256sum] = "85727c00279f5fa6bedbe6238d2aa6403bedd8b4864ab11207d07df3cc1b2ee5"
 
 inherit pypi python_hatchling
 
@@ -36,10 +36,12 @@ RDEPENDS:${PN} += " \
     python3-importlib-metadata \
     python3-io \
     python3-json \
+    python3-jsonschema-specifications \
     python3-netclient \
     python3-numbers \
     python3-pprint \
     python3-pyrsistent \
+    python3-referencing \
     python3-zipp \
 "
 
diff --git a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb b/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
new file mode 100644
index 00000000000..5b509322646
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An implementation-agnostic implementation of JSON reference resolution."
+HOMEPAGE = "https://github.com/python-jsonschema/referencing"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=93eb9740964b59e9ba30281255b044e2"
+
+SRC_URI[sha256sum] = "c775fedf74bc0f9189c2a3be1c12fd03e8c23f4d371dce795df44e06c5b412f7"
+
+inherit pypi python_hatchling
+
+DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+
+RDEPENDS:${PN} += "python3-rpds-py"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
new file mode 100644
index 00000000000..b9048bde51a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -0,0 +1,80 @@
+# Autogenerated with 'bitbake -c update_crates python3-rpds-py'
+
+# from Cargo.lock
+SRC_URI += " \
+    crate://crates.io/archery/1.1.0 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/indoc/2.0.4 \
+    crate://crates.io/libc/0.2.147 \
+    crate://crates.io/lock_api/0.4.10 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/proc-macro2/1.0.66 \
+    crate://crates.io/pyo3/0.20.2 \
+    crate://crates.io/pyo3-build-config/0.20.2 \
+    crate://crates.io/pyo3-ffi/0.20.2 \
+    crate://crates.io/pyo3-macros/0.20.2 \
+    crate://crates.io/pyo3-macros-backend/0.20.2 \
+    crate://crates.io/quote/1.0.31 \
+    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/rpds/1.1.0 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/smallvec/1.11.0 \
+    crate://crates.io/static_assertions/1.1.0 \
+    crate://crates.io/syn/2.0.32 \
+    crate://crates.io/target-lexicon/0.12.9 \
+    crate://crates.io/triomphe/0.1.9 \
+    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/windows-targets/0.48.1 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
+    crate://crates.io/windows_aarch64_msvc/0.48.0 \
+    crate://crates.io/windows_i686_gnu/0.48.0 \
+    crate://crates.io/windows_i686_msvc/0.48.0 \
+    crate://crates.io/windows_x86_64_gnu/0.48.0 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
+    crate://crates.io/windows_x86_64_msvc/0.48.0 \
+"
+
+SRC_URI[archery-1.1.0.sha256sum] = "487955f60962765486ce000015a3492ca45c34a2ebbf12bc0aa2b5110ca6e7d2"
+SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
+SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
+SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
+SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
+SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
+SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
+SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
+SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
+SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
+SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
+SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
+SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
+SRC_URI[smallvec-1.11.0.sha256sum] = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
+SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
+SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
+SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
+SRC_URI[triomphe-0.1.9.sha256sum] = "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
+SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
+SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
+SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
+SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
+SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
+SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
+SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
+SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
new file mode 100644
index 00000000000..01fb3d47ce7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Python bindings to the Rust rpds crate for persistent data structures."
+HOMEPAGE = "https://pypi.org/project/rpds-py/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
+
+SRC_URI[sha256sum] = "42821446ee7a76f5d9f71f9e33a4fb2ffd724bb3e7f93386150b61a43115788d"
+
+require ${BPN}-crates.inc
+
+inherit pypi cargo-update-recipe-crates python_maturin
+
+S = "${WORKDIR}/rpds_py-${PV}"
+
+PYPI_ARCHIVE_NAME = "rpds_py-${PV}.${PYPI_PACKAGE_EXT}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


