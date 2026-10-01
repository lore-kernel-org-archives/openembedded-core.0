Return-Path: <luciano.dittgen@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C7CA5FCE
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 19:54:17 +0000 (UTC)
Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20162.1790884452266278540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 12:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=b7jSF9UL;
 spf=pass (domain: ossystems.com.br, ip: 74.125.229.168, mailfrom: luciano.dittgen@ossystems.com.br)
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14f381f0424so141255c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1790884452; x=1791489252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SI3FxsZQUtugO7PAIumJXyeiNISxt+FmMwEnUwmINaI=;
        b=b7jSF9ULjKTXPVq3TxAE23S/aFaX1jpvhTohYUDErXtvC8jXPz6PjuGHnEu69ePwXe
         z9W+oizs1fAdxcA2+abYqHF0nkRJ6JwyypZEVwCTifC676LGoqlPxU+adakcNa/RiJjl
         sg/znPpIk2kPcE7piDc+sCZhnCyRtOGu32vtwdfdR8v3fcDQJFvm0ev8oD+hcmntm7iT
         QAMGe1+95Mlwmy9JlxtGUM9VT9M7aG27frV0q8E5GvF51cQYm/C7WmEU/UDs2XnpjaX1
         iyBeERaoznISujMGygeby3agU8L95OUJD3J1giNhhsu6/6H20M7BKfjstFdxg4yOtuO+
         u1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790884452; x=1791489252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SI3FxsZQUtugO7PAIumJXyeiNISxt+FmMwEnUwmINaI=;
        b=bAVNeJeoDDbV1hO7ithhVe0IR/uz19J/1LRmEDhN/baa2glJMgL03Qz1htbIFvVmu8
         oC+n5lNeWHbkHJdampI3wqfTZ2nGMKfZDnYqz+C+M8wjSGx/okDiSq6jreiD72Bd6Qmn
         7ZADbNlWuFI3qi2xwSm9yseuU41yWHljxNbGxOH87bhSnkmiELrlRDCmaoaowXCOwcjF
         +tgYtU1dVMmxsdolNv3jiBkNI1pp9Sw2l4DqOvTKfjO+euWcZDfgFU2RYDSRQ7FIsw4f
         fM02cI/SvxtDJA/v/yC1PirrXHPcpWUENgp7sacM4uE/eAltZP5j1RN/pEaOnHVN7Ofc
         VFGw==
X-Gm-Message-State: AFuF++lrshoHdM35jStzkiIfwu8974EmlpWVRk1d3Iit0ihkGksGJ0EJ
	GwNkih2nJnwYLhEuvMaMqJQjwcrY7B79ElM6fx6fnK1rvugU727sfG9Aqc+cgn/FniFLHPNxDQT
	0Nxxl
X-Gm-Gg: AYBFou2OZZhBmbJgHucQ8FHhHk5PCJremVtY0JGiJuJG5R+KtdZm6WStpESuhGtWI8D
	KJ66nWnLRhuoBWdF/tw4AthHw8bWJurR9zE1zxMW4SOYDOTjh3lqevUjl11xArtajIp4MjkbYw1
	wmM1NgAR2tWm60KRtYfSBrSB1/b10FzdLDZ/79zDXT92z7+imvGXdyi2qo/+VmOP6aeHrw44NJU
	IiOWWEamUm3iQLUQzTc2duB9Ibsl3HfHVm7v0hL4gcVkPteQeBStRIkqGe7F/fKGbCOH/8DwpUg
	rMvhDtjgYJPQGTxVn9d+AFx8jycpwDwLpIBVjZSj+q7G81zn2Fy2POBjFcguYFd5lgZrWy07bp8
	GS59rQLweyV9/q3JjF0ojIWeR353hl7eDmXhu5S8C2E//b4ru5PPGIIvMEJq07N+TcbOzPiCqBv
	2+FCjlTXvJvgLTMrJ1a42fwb0K7ws04z5o0Js82hRYwTk0Lw/ZUQ1E2U9c46QRC2WNk3Gtk3TQy
	4z1fl7AWIGOGcixgAbLhtEW7alqU+AEbgiVuzCO
X-Received: by 2002:a05:7022:150a:b0:144:eab0:9cbf with SMTP id a92af1059eb24-14f5c2ee28cmr294880c88.19.1790884450303;
        Thu, 01 Oct 2026 12:54:10 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.22.171.68])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f43eba13bsm768934c88.2.2026.10.01.12.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 12:54:09 -0700 (PDT)
From: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
Subject: [PATCH] gstreamer1.0-python: Skip when GI data is not available
Date: Thu,  1 Oct 2026 16:53:45 -0300
Message-ID: <20261001195345.487817-1-luciano.dittgen@ossystems.com.br>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 19:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247053

python3-pygobject skips itself unless GI_DATA_ENABLED, which also needs
qemu-usermode in MACHINE_FEATURES, so on e5500/e6500 machines world has
no provider for this recipe's DEPENDS. Skip on the same condition.
Checked with bitbake -k -S none world for an e5500 machine; task
signatures are unchanged where GI data is available.

Signed-off-by: Luciano Dittgen <luciano.dittgen@ossystems.com.br>
---
 .../gstreamer/gstreamer1.0-python_1.28.7.bb              | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
index 1b17accd41..a33bc0f057 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.7.bb
@@ -23,8 +23,15 @@ EXTRA_OEMESON += "\
     -Dlibpython-dir=${libdir} \
 "
 
-inherit meson pkgconfig setuptools3-base upstream-version-is-even features_check
+inherit meson pkgconfig setuptools3-base upstream-version-is-even features_check gobject-introspection-data
 
 FILES:${PN} += "${libdir}/gstreamer-1.0"
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+
+# python3-pygobject is skipped without GI data, which also depends on
+# qemu-usermode in MACHINE_FEATURES, so skip along with it.
+python() {
+    if not bb.utils.to_boolean(d.getVar("GI_DATA_ENABLED")):
+        raise bb.parse.SkipRecipe("GI not available")
+}
-- 
2.54.0


