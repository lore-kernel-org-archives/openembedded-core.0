Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3B1C021A0
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 08:52:48 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.47204.1739782356887101503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 00:52:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Feb
 2025 16:52:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Feb 2025 16:52:33 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<vince_chang@aspeedtech.com>
Subject: [PATCH v6 2/3] uboot-sign: support to add users specific image tree source
Date: Mon, 17 Feb 2025 16:52:32 +0800
Message-ID: <20250217085233.2201043-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217085233.2201043-1-jamin_lin@aspeedtech.com>
References: <20250217085233.2201043-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 08:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211533

Currently, uboot-sign.bbclass only supports to create Image Tree Source(ITS=
)
for "u-boot" and "flat_dt". However, users may want to add their private
images into u-boot FIT image for specific application and purpose.

To make this bbclass more flexible and support to add users specific snippe=
t
ITS, creates a new "UBOOT_FIT_USER_SETTINGS" variable. Users can add their
specific snippet ITS into this variable.

Example:

```
UBOOT_FIT_MY_ITS =3D '\
       myfw {\n\
            description =3D \"MY Firmware\";\n\
            data =3D /incbin/(\"myfw.bin\");\n\
            type =3D \"mytype\";\n\
            arch =3D \"myarch\";\n\
            os =3D \"myos\";\n\
            load =3D <0xb2000000>;\n\
            entry =3D <0xb2000000>;\n\
            compression =3D \"none\";\n\
        };\n\
'

UBOOT_FIT_USER_SETTINGS =3D "${UBOOT_FIT_MY_ITS}"
```

The generated ITS

```
       myfw {
            description =3D "My Firmware";
            data =3D /incbin/("myfw.bin");
            type =3D "mytype";
            arch =3D "myarch";
            os =3D "myos";
            load =3D <0xb2000000>;
            entry =3D <0xb2000000>;
            compression =3D "none";
       };
```

Add a variable "UBOOT_FIT_CONF_USER_LOADABLES" to load users specific image=
s
and it is an empty by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 5c198324ee..c1fc89a05a 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -98,6 +98,13 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
 UBOOT_FIT_TEE ?=3D "0"
 UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
=20
+# User specific settings
+UBOOT_FIT_USER_SETTINGS ?=3D ""
+
+# Unit name containing a list of users additional binaries to be loaded.
+# It is a comma-separated list of strings.
+UBOOT_FIT_CONF_USER_LOADABLES ?=3D ''
+
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
@@ -372,6 +379,15 @@ EOF
 		conf_loadables=3D"\"atf\", ${conf_loadables}"
 		uboot_fitimage_atf
 	fi
+
+	if [ -n "${UBOOT_FIT_USER_SETTINGS}" ] ; then
+		echo -e "${UBOOT_FIT_USER_SETTINGS}" >> ${UBOOT_ITS}
+	fi
+
+	if [ -n "${UBOOT_FIT_CONF_USER_LOADABLES}" ] ; then
+		conf_loadables=3D"${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
+	fi
+
 	cat << EOF >> ${UBOOT_ITS}
     };
=20
--=20
2.25.1


