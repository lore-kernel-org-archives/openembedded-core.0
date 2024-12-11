Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0400E77183
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 02:35:21 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.1956.1733884518864803607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 18:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 11 Dec
 2024 10:35:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 11 Dec 2024 10:35:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 2/3] uboot-sign: support to add users specific image tree source
Date: Wed, 11 Dec 2024 10:35:14 +0800
Message-ID: <20241211023515.2108415-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
References: <20241211023515.2108415-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 02:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208570

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
index f1b3470127..4a2dc99037 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -100,6 +100,13 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
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
@@ -366,6 +373,15 @@ EOF
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


