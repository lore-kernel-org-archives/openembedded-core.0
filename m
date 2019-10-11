Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7398E6BC19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 08:16:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 5so9458728wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 01:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfA3vdEWHYJQqigo86cDvG2OHYL2Z908RY1GZWPybbc=;
	b=ATb6kJ1tKakKd4taTo62jwmGvJzib/Y52Z+qEOQAe0wkdexU+WC6jTj8fDX8/N0Rp4
	0GaDBCc7k5vlNMyzWUaG0IU2N/AD1TnvWWKVsrKzErgQ05n5MZBxbTVOxReHLnEUj0HM
	HZubyjx3nYVV3vubX5nbzdT59Qxt/UryRM1qRfbwkE3Mpj2x5fvwH9Uuw9vzcaM7mgNe
	zjhImhfvStuPkASQlQI5NoycbU7KVY5lwN6snoGTm8MMzJk1/uynpPmZholfDbvTO99K
	KVHpF3XIeXl/sPSMqjIdGeKC+PYMYYIHB4JbWac8p3S4ZFvGvxzbsceaywlz9kPKxqvm
	DAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nfA3vdEWHYJQqigo86cDvG2OHYL2Z908RY1GZWPybbc=;
	b=m6AMv+Q75Sz0pxj+cQauC0qgDZHZeiIObY9etd/O3gyBay5YTwgMYPsbe658bApZTB
	votbruu1GikCI2OUSEEyR14iFU2MBiL+k+XcONAvdOE1sCxzVEWQ4AkbKnKrzuYomv6w
	IsUmJrapTLuUg/k4LaMnRQB+anKRUeiHjrs/mkSVRa49uSvu5yjKfAeL5wBHWBr7iWIZ
	9N+DA+pKl5jLiLj9SaV+3tmAXfhPpUOPncILClcf9hkGe1V0I0DUJeX/OsKCegtzxlvF
	f1PfOQkSHlbzBs0moMe/COnAWB219xBKM1yKRmegontoVLOq7DG6AJRxT8LWDUFDbcBx
	y54g==
X-Gm-Message-State: APjAAAWCmRL3qPbyuIvwBXpfriQggcip/jUqlVo6xub7Pb9DHrWKfqNJ
	/WlbvGYv9MLBRRNFkQZ7xg5nnA==
X-Google-Smtp-Source: APXvYqyN8SDlANjFT7qaS7hxQnDu/ooHg+403TmdUeyiAcvGcEecU+3SZ19l5QQiLyYbvstLjbu6og==
X-Received: by 2002:a1c:9d4a:: with SMTP id g71mr2303561wme.26.1570781772845; 
	Fri, 11 Oct 2019 01:16:12 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8])
	by smtp.gmail.com with ESMTPSA id z22sm7914799wmf.2.2019.10.11.01.16.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 01:16:11 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 10:15:52 +0200
Message-Id: <20191011081552.17148-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [thud][PATCH] kernel.bbclass: fix installation of modules signing certificates
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
X-List-Received-Date: Fri, 11 Oct 2019 08:16:12 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

If one has provided external key/certificate for modules signing, Kbuild
will skip creating signing_key.pem and will write only signing_key.x509
certificate. Thus we have to check for .x509 file existence rather than
.pem one.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2527e731eba43bd36d0ea268aca6b03155376134)
Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bd185e258e..c72d1fe78a 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -451,7 +451,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-	if [ -e certs/signing_key.pem ]; then
+	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
 		mkdir -p $kerneldir/certs
-- 
2.20.1


