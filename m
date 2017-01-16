Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2864D71AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:51 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 75so5491413pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=PoSGkWUcc466mawsftEAiKWxstF1p8qq5SzfO+/fg6I=;
	b=Cw6QuPnvcda7tnbplugF1aD9cmJy1rCLkaJ0jccUU3FV9hraLKLWieEjjEuFdHZZJj
	B7LB4+cvITas/im9XPpnKVT3v13osDoJIxPtVymNQ7QNtu7iNjOtHGOvs6Kj6zWB8XZX
	8d8zlba3lUDSN2ZVbZ0K150UGujxPKdumJOExPYtK+pNkuIBd6BCoa2fBnh9GwtrMgx/
	YX6ZUY2eIkwPSAxmUUqendGbQYpe+J4YeWmXo6IIC+m8ejUNa8cgTbcpmE2gy+ol0HMD
	UqC2JkCfB6yVq1qGpXXzUu8BtPNd1jrKqpEhxLiQCV5+7TvzmJDoyxDq6v2M+8Li81vj
	7ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=PoSGkWUcc466mawsftEAiKWxstF1p8qq5SzfO+/fg6I=;
	b=Ed7e5C08/hcDp7XaephqHCQvCQAp3sQHxQf5SQJj93Zx8ASmMSVdB4cKmL0BVwWKFo
	O8Tu/17rorV6cLyxFjZUU7hg7Nz32zRtv7/n2drCgxHaiPS/NqkmxkQqB7GcBgrFegh+
	mrKhdv4A3UXOI1Fr7uMgBkp02TsPOCmmpoKx/FT1vwFtUDdpntnQdXZhZD0D2KGZr1pO
	mMQNUKqX995rppBKnPpR8UrIPy9sBhMcWzkyh1ij82GsYXGXp6nOT+1R9wv0YHUxOIHh
	3i63q3WIX52gvpmqA71dMtEvD6C1XirG21SUns1ziraWbRozXhHOOidJS+0OkqXFERLh
	iPcw==
X-Gm-Message-State: AIkVDXK6h4wD0TsJx2g7S4T6WioMQDoW4TZvqX48zhaDmJxeW3Fiuud2hnp4oay5WtNvjw==
X-Received: by 10.84.212.2 with SMTP id d2mr51624089pli.24.1484576212638;
	Mon, 16 Jan 2017 06:16:52 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185])
	by smtp.gmail.com with ESMTPSA id 66sm6890341pgg.47.2017.01.16.06.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:51 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-15-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 15/30] glib-2.0/glib.inc: If 'charset.alias' exists drop it
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Delete the 'charset.alias' file during the do_install task if it exists.
This file is not shipped in any packages and on the targets that it is
generated (musl and mingw32) it is undesired.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index b892989b87..24b31a7f9f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -99,6 +99,10 @@ do_install_append () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+
+	if [ -e ${D}${libdir}/charset.alias ]; then
+		rm -f ${D}${libdir}/charset.alias
+	fi
 }
 
 do_install_append_class-target () {
@@ -108,10 +112,6 @@ do_install_append_class-target () {
 	fi
 }
 
-do_install_append_libc-musl () {
-	rm -f ${D}${libdir}/charset.alias
-}
-
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
2.11.0


