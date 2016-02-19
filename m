Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id EDB3877059
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 01:31:02 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id gc3so92712439obb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 17:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hLCwK1HmRnii75Jc7aBP5i7oRJscDXd2JgGqWmt68Vc=;
	b=Y0QGP+7ICmUTVyAcU2zYrwWyWsYCI8Yj5mFGSAUoZ6xMfmxxqvag+6pNmUetH8vOzT
	E/+c18VHfy6pJDAnASGVv9oR47ZTi4xYQnNLYR1thFdRIwo9DXoA5EVZ3ItgMxzzmq7b
	DP6uciwFscoayDpkkTQwWvxcUvIa8PbSyPD0HYs4FXBupyAoh41wFMx1xh/Mgtp9X4ll
	EKCQi/n/nXYiwMkeMkVyfOMXWHjIbXA1rlRDb3oLdCrnhIwPY/IJZWwhzaDNtHPKPXqv
	xwpXG8c5tYJg2WrzbJDaucQGIE1CigmmhwRSGwiK8Qza8kLeo4/GrCxQ2EXLGNjht3Sr
	ZuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hLCwK1HmRnii75Jc7aBP5i7oRJscDXd2JgGqWmt68Vc=;
	b=Mq3ID8sBj//oEAzJqnR3+bL+2B6grvvOhJLXxy/76g8qKmxXtxNEjMeoAT1iY0a/Ds
	aR57Kl1cmwTLzBywh7GFh3gQtH81dFLyOOrGuW8yCd7YjxJ4WzRIjQ3c7NBwe1DTTNYE
	UCfG/Sub50WQXgaAb/yaZaoSinEolX7k5Prk3iOfIZm0edt7dHkFgeWB6WpJ95MfaySg
	0du7k+uiNM5mcGpIA4hKaZhh9zzdhlHHbAaap+y6z0oDz42SJJ5OH6QQrCxfXvm9/UUJ
	l1pPzjpeEzoCqz1X5dt6LgXng1N53QY6wotp1O32ye0P1JzC34nZPnXcIev7zfJtRaB+
	lWMg==
X-Gm-Message-State: AG10YORBeREcOcyKwl8VayuUPaHEViOPUbvy7fdVC33QDM7IkMTAiSXf0BVnV98eKbwQRg==
X-Received: by 10.60.54.232 with SMTP id m8mr9154067oep.34.1455845463605;
	Thu, 18 Feb 2016 17:31:03 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id wa8sm5566371obc.7.2016.02.18.17.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 17:31:02 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 17:30:50 -0800
Message-Id: <1455845451-25185-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
References: <1455845451-25185-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 2/3] libsoup-2.4: prevent PACKAGECONFIG dependant package renaming
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
X-List-Received-Date: Fri, 19 Feb 2016 01:31:03 -0000

When built without gnome support, libsoup-2.4 will contain only one
shared lib and will therefore become subject to renaming by
debian.bbclass.

Prevent renaming in order to keep the package name consistent
regardless of whether gnome support is enabled or disabled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
index 865c1d7..a9d8050 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb
@@ -25,5 +25,11 @@ PACKAGECONFIG[gnome] = "--with-gnome,--without-gnome"
 
 EXTRA_OECONF = "--disable-vala"
 
+# When built without gnome support, libsoup-2.4 will contain only one shared lib
+# and will therefore become subject to renaming by debian.bbclass. Prevent
+# renaming in order to keep the package name consistent regardless of whether
+# gnome support is enabled or disabled.
+DEBIAN_NOAUTONAME_${PN} = "1"
+
 # glib-networking is needed for SSL, proxies, etc.
 RRECOMMENDS_${PN} = "glib-networking"
-- 
1.9.1


