Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 19B8561162
	for <openembedded-core@openembedded.org>;
	Tue,  4 Feb 2020 15:06:16 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id b9so9766483pgk.12
	for <openembedded-core@openembedded.org>;
	Tue, 04 Feb 2020 07:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s2ByJdoEyCcbRmcBT2Y8qTCKU58yyNQfhgQRDiOybT0=;
	b=itoxcUjOKlLh8HOIf+hE99lw5yl1GQU+Sk6F0oYj0TuFZWv9AabS3gGm8X215qTBD3
	HlAdXxaau7yVtL27/ZS1+SM+nGUprKzl0tdI/CXtQMD5ewZDAaE9y1H4/cvSeIGMdEmd
	FZ8ZyLz2y3SwbtYkoPUYTDlVzp7RZW7PSG9W674afYxnUsEl0AQkyIMJufZIQbCgKuxc
	wCqWpRtBUsWLYd5MtAmmpFcXYHQQy9FajbPFJxs1/+Kq/NXOXqjMWiUT9eY6NuaT7Cyy
	JSIYv4IogN7y0CsBJf59jKLztePTwxIXIqP3JNUtCfY9mZ64t7M1GAYpvYrCkg32MBjo
	RryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s2ByJdoEyCcbRmcBT2Y8qTCKU58yyNQfhgQRDiOybT0=;
	b=ZmeIG9X2+ozxSa1eyeMbVirR2DJE8xjwXZqQUSr7p+d12UrKJGYBgpDdQ7iAAdNoio
	28tXnIj/jwNNTSreOx4CvTay5bB2quRLIpDzCbucbMh08Vv4BRFBZsvJifBmIWh3OWhB
	AOp5+uHblsKs5qO4w4rWXqOXMwkhIM4G9Izxs55wNCK9yPm3122my02lx3WTzDWyebeQ
	WMieF7oXCAKGJb9hZPP6TtOxgCxYI4t7gTxKGqQlZoCpFaI2g/AeWlDuJTJ6YOdWNOJi
	22pkU3Mg2Y+3oEKzuFvVnOTcwbNu+qObW40u6uTz3hPamqSIAjVsns2ubCYB1azY6djk
	vQ7g==
X-Gm-Message-State: APjAAAV6hKsG7B2zFH6nYThodiLTqncjmi/xNmlYIergZ8bKug/neN5j
	i60I/php7UZpOggKJa9LEBQH5MmS
X-Google-Smtp-Source: APXvYqyz9ErLbLIAj2naKc1euIOGYVrt5nv9qhtXfCKgNnk1aaEBouDLx5gKLpykw8KzNAl/eBWjdw==
X-Received: by 2002:aa7:93a4:: with SMTP id x4mr31226929pff.42.1580828776969; 
	Tue, 04 Feb 2020 07:06:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0::afc]) by smtp.gmail.com with ESMTPSA id
	b98sm4216055pjc.16.2020.02.04.07.06.16
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 04 Feb 2020 07:06:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue,  4 Feb 2020 07:06:04 -0800
Message-Id: <f89bb91cb40922434c331331f039b59900fe9f0c.1580828664.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580828664.git.akuster808@gmail.com>
References: <cover.1580828664.git.akuster808@gmail.com>
Subject: [zeus 4/8] kbd: avoid vlock conflict with busybox
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Feb 2020 15:06:17 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

busybox as well as vlock utility from meta-oe provides vlock utility
which can conflict when with kbd if pam is a enabled distro_feature

Fixes image build errors

update-alternatives: Error: not linking <rootfs>/usr/bin/vlock to /bin/busybox.suid since <rootfs>/usr/bin/vlock exists and is not a link

ERROR: yoe-qt5-wayland-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['busybox'] have failed. If the intention is to defer them to first boot,
then please place them into pkg_postinst_ontarget_${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

Signed-off-by: Khem Raj <raj.khem@gmail.com>

The vlock doesn't exist if PAM isn't enabled.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: De Huo <de.huo@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/kbd/kbd_2.0.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 17ce6e7a9c..47e76da2b4 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -59,7 +59,8 @@ RDEPENDS_${PN}-ptest = "make"
 
 inherit update-alternatives
 
-ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey"
+ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt showkey \
+                     ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'vlock','', d)}"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1


