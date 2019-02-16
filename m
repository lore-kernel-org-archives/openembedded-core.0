Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 54BE77C7A4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:44 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l5so12971400wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0IRqwR98/h78CODP1NcobL9B8Pp2H1Xsx/BzHcz323k=;
	b=Upe2syjS8DxuSTJu3Djv4SgnCurPccZpIqnGcLmTIDUyLIKJ8QXz1ujOrMXE7vInvN
	MLN8C9Z9kY71Ho1qs0grLodzcaBYahOjT30h5HvsK0VJFHYK9dFIZ1RNf0JD8Tn7dtmO
	9xlLFrrkDgl/U6Jrz6UnpCCx/JEdYfY0WpNeU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0IRqwR98/h78CODP1NcobL9B8Pp2H1Xsx/BzHcz323k=;
	b=XLnCiWo02jkiyYHNAjdqoTQKj2S0EhYfPZy/d5HwuVqnnwhprzsJvgHjTTXHAnLyy1
	cjYtTc2P2EZUOuFANSaaQBNK/usEXWeXDOxwjPXI0QC60Z7G0Z5oBSnKu5btk62lratH
	6aba0Rq1FCkP9gziGnQLKaZbAVNxufd+sfWvOvwWxm90timvikvIbXGfLhU5RrMkZk/V
	zSa0za73XpnIVaAzyecSMZT8sewiNCPQyrYfMw+5Pzx1BOa18QW9Aft47ZKeXNYMfdyH
	2rarBw876M1N8XYVByOEn0Cr3YaQmBwnOb6Qz5FF2uuC8kX4lp/mcbyZvV+faF6Qs+mY
	CfgQ==
X-Gm-Message-State: AHQUAuYw/WnrbRIBSj3QyQRIroYU2Z5pv+IMVpYZzXMarzeUp0SAn4Eo
	aRl0KBkx0kVJLyMDwuZT15lVEx4Yao0=
X-Google-Smtp-Source: AHgI3IZibj1unnZy+BJoO8m2SF1DqDQiUYoMxgJAbsNoIOMQVGbRxrNEFdYwN4zKcEQbE5Li+cdh6A==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr10775972wrq.90.1550353604706; 
	Sat, 16 Feb 2019 13:46:44 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:43 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:35 +0000
Message-Id: <20190216214638.11456-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/7] glib-2.0-native: Break circular dependency on shared-mime-utils
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:44 -0000
Content-Transfer-Encoding: 8bit

If we fix native RDEPENDS handling, it exposes a problem where there
is a circular dependency between shared-mime-utils and glib-2.0-native.

Break this dependency in the -native case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c9093cee866..7e2847d4b22 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -80,6 +80,7 @@ FILES_${PN}-utils = "${bindir}/*"
 RRECOMMENDS_${PN} += "shared-mime-info"
 # When cross compiling for Windows we don't want to include this
 RRECOMMENDS_${PN}_remove_mingw32 = "shared-mime-info"
+RRECOMMENDS_${PN}_class-native = ""
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
-- 
2.20.1


