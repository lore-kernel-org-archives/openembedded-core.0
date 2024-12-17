Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE89CE7718A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 11:12:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.79052.1734433972000569830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 03:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn-de.20230601.gappssmtp.com header.s=20230601 header.b=UZZ7yx8v;
 spf=none, err=SPF record not found (domain: bisdn.de, ip: 209.85.128.47, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436230de7a3so6001055e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn-de.20230601.gappssmtp.com; s=20230601; t=1734433970; x=1735038770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MCRe266Aw6bhgXJdVLIOt72oGQTnJ+d7cXTnwa4h6w=;
        b=UZZ7yx8vFqgbRRkC8v0XnFpjX7WB8mxMpEUexOVTD8HtKzfo6gDOo7ggNWH3quSFfQ
         aOHlkV6QOLST+qaSyCqkoFQHSCZQNy18oFi94W4YrNNUg93LaxeyRYygpFBmxfbnue1i
         OFXsaYpLj/NtlKKYEcDVn/ZJgnEx0II87cAwsAL7jEImVRutrliIcGlnI9BntWq44+gi
         dXlfF+vimfs5qxckkXKUtFDGj3l2v1n5Ifmr4+cKCpwF6ypTTPu/exGFc9lVrZ7cdl1l
         UyrqwxSKSLMSvXl5Mfm8xV4vCi1luQRrevRysetMdvnPm7yWQzs1fw+NGPvRQsa/XNP9
         GdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734433970; x=1735038770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MCRe266Aw6bhgXJdVLIOt72oGQTnJ+d7cXTnwa4h6w=;
        b=EWlxgw1zooTMBfFnDzT5n3vm/cyMUSfUWal/IXVdmoOFR7cnx2Cmo7MzLYpWX/Ps3u
         NewyIVkxtgyHQgzNP+bQByselIUEdjyLHMngenAjn+hG25Uc7aayghFuwvQydCCld/no
         FlN53vx5AnOCs/ZNcYcRuFohzhaeMDGBD4UWtenWBTPZ2ysAPC99XbSdyZbkN09sGMpL
         1aPhKdmPyoLjqbiS4t2WFECqJGLBrrnjqk1wMHJC/zxmbBY11wICGWTBAAoD1oSAVqev
         45LgC6PaxsO+KP1wUAqcYg2db5FuBVWBxxVMslkUSG9OYlhYpWY427m35aYJytQTdGQ6
         PtHA==
X-Gm-Message-State: AOJu0YzT/gqnLBUL4CCPDk+5ooKMzWZVnC4ieUK/w872bAqOBI5uqH+p
	6QolZ8fppKdjO5EoygOiSnAoJ+nIXymNb/uJchlehBuRxsQx2MiZojDAhxpWj5ThQXRgZ0xMZil
	SKnp0fpgKx2dfaCg+SKo+/Ar5ksCLA/uAyGbeOo7554aOyKpIa9upfx5GDE3vqRDnMzRvBrQxIA
	/beGQE4qc3
X-Gm-Gg: ASbGncv9Nh80Pk8HPQYILkN9Gdf9NLM6D+MtzIld2noPtincHFe89uN5mCHy97oWmNa
	Rs2seI6cV438NWHQ5JbNDG0ijzrMQ33CxlUhIWaQZ0fOAAoJm3dlKOKyZBxduBjoBB7VkEgB+iB
	Un8Je4aVJS68LasQNmfpPVx2aJWYQ7L2UamzxT4Liday56sME9xSzpA4vJBPlurOo9JV/Ak7ham
	Z04SW2WKLSRLT6pTVCwThrQUEIaFs4tzLoJlxh6y6jSslhMMEhs71JL1JYbkbIoxDKw2q7ZFwtf
	AbpX3mxcGd8U33yZpDT7WDxp+Gd4m+a5qg==
X-Google-Smtp-Source: AGHT+IENvpsyrcltmdHwM2uEprrLYslE6prJ2cKeYpo03v4amhF5z4qc8JbnbQzhUR2PbTn1yqkSpA==
X-Received: by 2002:a05:600c:358f:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-4362aaa1c24mr53772795e9.4.1734433970278;
        Tue, 17 Dec 2024 03:12:50 -0800 (PST)
Received: from localhost (dslb-084-060-024-069.084.060.pools.vodafone-ip.de. [84.60.24.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80121d4sm11107512f8f.2.2024.12.17.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 03:12:49 -0800 (PST)
From: Jonas Gorski <jonas.gorski@bisdn.de>
To: openembedded-core@lists.openembedded.org
Cc: Louis Rannou <lrannou@baylibre.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH kirkstone 4/6] base-passwd: add the wheel group
Date: Tue, 17 Dec 2024 12:12:27 +0100
Message-ID: <20241217111229.60698-5-jonas.gorski@bisdn.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217111229.60698-1-jonas.gorski@bisdn.de>
References: <20241217111229.60698-1-jonas.gorski@bisdn.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 11:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208836

From: Louis Rannou <lrannou@baylibre.com>

The wheel group is not declared while it can be used to access the systemd
journal and to configure printers in CUPS. It can also be used for su and s=
udo
permissions.

So far it was created later in the rootfs postcommand systemd_create_users.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bebe52ae9576393ebb9d7405fc77fba21e84ba5b)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
---
 .../base-passwd/0008-Add-wheel-group.patch    | 20 +++++++++++++++++++
 .../base-passwd/base-passwd_3.5.52.bb         |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/0008-Add-whee=
l-group.patch

diff --git a/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group=
.patch b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.pat=
ch
new file mode 100644
index 000000000000..00eaec38a294
--- /dev/null
+++ b/meta/recipes-core/base-passwd/base-passwd/0008-Add-wheel-group.patch
@@ -0,0 +1,20 @@
+
+We need to have a wheel group which has some system privileges to consult =
the
+systemd journal or manage printers with cups.
+
+Upstream status says the group does not exist by default.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Signed-off-by: Louis Rannou <lrannou@baylibre.com>
+Index: base-passwd-3.5.26/group.master
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- base-passwd-3.5.29.orig/group.master
++++ base-passwd-3.5.29/group.master
+@@ -38,5 +38,6 @@
+ staff:*:50:
+ games:*:60:
+ shutdown:*:70:
++wheel:*:80:
+ users:*:100:
+ nogroup:*:65534:
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb b/meta/rec=
ipes-core/base-passwd/base-passwd_3.5.52.bb
index f89752c07710..66b5a0e7dc6a 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/primar=
y/+files/${BPN}_${PV}.tar
            file://0005-Add-kvm-group.patch \
            file://0006-Make-it-possible-to-build-without-debconf-support.p=
atch \
            file://0007-Make-it-possible-to-disable-the-generation-of-the-d=
o.patch \
+           file://0008-Add-wheel-group.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5dfec6556b5a16ecf14dd3f7c95b591d929270289268123f31=
a3d6317f95ccea"
--=20
2.47.1


--=20
BISDN GmbH
K=F6rnerstra=DFe 7-10
10785 Berlin
Germany


Phone:=20
+49-30-6108-1-6100


Managing Directors:=A0
Dr.-Ing. Hagen Woesner, Andreas=20
K=F6psel


Commercial register:=A0
Amtsgericht Berlin-Charlottenburg HRB 141569=20
B
VAT ID No:=A0DE283257294


