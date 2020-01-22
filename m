Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id C86BB7FF33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:30:50 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f129so5365092wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=8RAmRII2PzFKlIZmG7goDJ/1NacHLQt4qxRdmiblg/c=;
	b=YPu7S2uQNpZfb9KhO84QM8eXFHkTo7p8FjS+288I33HLtfjCEzCUbtM1wz5L1vA3cG
	NRC29GSeBrGuqJIFA/m215thZmJ5j1nBV+GXyMVxysoL0oTdsIYCRdYl1jq3KOUAz0b/
	DWzw24+0xzz8H1oq3IRjV7jCDBuVTl+WETINE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8RAmRII2PzFKlIZmG7goDJ/1NacHLQt4qxRdmiblg/c=;
	b=IY+oza8v6zl5ZJB5YZsg3OvJ4qM8kOwIm1NaJxlJsFbelnE/c5Yx/z7/8WNvJRmaK8
	MLP5n6Uz2CQOnCOcK0BxFhLPgkoXPscKJrw/0atl4KEQgVmGlvGg64u04XOhcL5+MUlf
	FbRjpVH6oiuCDI4N5Ze8QPzfoCKNivpyJyelyZkBwgd3Sleqk9S3BXfZdQ/kLjny4CuI
	gt+z2V/T3zYPtqbAmyBj6Uxszv+48f8+gYMeIW8mIdDcnGAUfPd1A2OkFpSEFYXzrYg/
	XOfXWRmGzDo7f7O94uEsoRdLhEOTgwe72pxucq0iLEhWh1eCx6KE27jVOAzqfUF7ceJf
	Sklg==
X-Gm-Message-State: APjAAAVL2YFdSYZlSINaL93HaOfnEOgFgM9IZJE5D+/tkAUruyJx8+Ki
	apAqLgEkrgXa0te34ffMlWtitjN5uUg=
X-Google-Smtp-Source: APXvYqyWgtR2eq8j6lLfekpmYfZrF9Y9jTsuSauumWko9YKmaaLxhMGjJYF5L/irgB61Q+kR8rkmdw==
X-Received: by 2002:a05:600c:224d:: with SMTP id
	a13mr860180wmm.57.1579653051326; 
	Tue, 21 Jan 2020 16:30:51 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x10sm53211685wrv.60.2020.01.21.16.30.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:30:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 00:30:47 +0000
Message-Id: <20200122003047.9889-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122003047.9889-1-richard.purdie@linuxfoundation.org>
References: <20200122003047.9889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] buildtools-tarball: Add an ld.so.conf for nativesdk-binutils
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
X-List-Received-Date: Wed, 22 Jan 2020 00:30:51 -0000
Content-Transfer-Encoding: 8bit

We need to search our own libdirs, then fall back to the system ones as our
customised dynamic loader will. Have ld.so.conf reflect that.

This ensures that binutils finds libraries here when linking too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9c5c2cc8d6e..95ebda7fa15 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -74,6 +74,10 @@ create_sdk_files_append () {
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
+	mkdir -p ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/
+	echo '${SDKPATHNATIVE}${libdir}
+${SDKPATHNATIVE}${base_libdir}
+include /etc/ld.so.conf' > ${SDK_OUTPUT}/${SDKPATHNATIVE}${sysconfdir}/ld.so.conf
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
 		echo 'echo "$BB_ENV_EXTRAWHITE" | grep -q "NO32LIBS"' >>$script
-- 
2.20.1


