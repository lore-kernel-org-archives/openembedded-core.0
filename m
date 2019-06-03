Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 141127E382
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:18 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e6so7193956pgd.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YaBNKN5iYfZLnMO3rjbxRFRW76EYXRUdj2UmcDci6MQ=;
	b=mll+sMAqsI0pFEjbGlWxweSljAf/4CnQQ1wwj/m2mSheUHV1vgSwUb/df/ln+Z0Wqc
	8wKv2ktEXYLLPv83aVUjJazSD10coo+iucnOgj7It2XsT4L2CondzZj75883VlwD85cS
	bM3/uV39UzqM7aaJpymXbfNqHx8OqZyo1RHBRuy9cjDw0sPhvi3YE0t5L85E+wakVZmP
	yIcDI/p8KYG9oqTlWeUnESqRO8XEzmb9wY00ql5nDoVdDshGBFpTKvmfMKd7nEh8395Z
	X+0anwNaa6uVGQZqVkoFEbm4F+eX0wZxbCMQUCSRFAvYpvaIQ461UhHgbSJnj+d2AYQU
	u5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YaBNKN5iYfZLnMO3rjbxRFRW76EYXRUdj2UmcDci6MQ=;
	b=IzqYOZWEKpzy0omXEiWewvm26opWld2IdJ5sZm594UdSttrmV3f8Vvyo0E8Yud57ku
	c8gbYspgvQWetPphHLaWIUf00vmtVC3N+mqB+BZGKDJ82ygD7RApQ6yLiUaH5Gb2xecc
	HfJRuFlZolA+NUZUM7qQnPjsJiFIlS/1DdE8KAFU+9Ip1kwNfsa7g8/ZQ/0nA5Uyv0F9
	5NV5zpsNu4dy9T8QEhZdMrranEkzZRrV/G7j/50v/HA9bTpEYHkvnr/WlNXEL2yjj7oa
	Z0f9AY8tRCmHlhjkdx91crxLp5ojQAMmXbRIHrIzQlqXzDS8ul/8Z2O6cjh1DV9tBEs7
	fHkg==
X-Gm-Message-State: APjAAAX8332a3BPvLAAFnDXk6fv3d/iVwd0QSNhiyGlcUSPD538Wp6uD
	szLxl/Hx4JFPPctLaT8Ict50i+d9
X-Google-Smtp-Source: APXvYqwn7sDCrl+NK5FzRLY6j0VB1YZfiAADHH7LCwGTzwFP5p4CGFEK1asQBRkolSOmStMkpmHaEQ==
X-Received: by 2002:a63:c744:: with SMTP id v4mr28840234pgg.370.1559574440056; 
	Mon, 03 Jun 2019 08:07:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:56 -0700
Message-Id: <b03743b0f843736c6ebe8077e1e03bc03ac39410.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 13/21] npm: remove some temporary build files
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:19 -0000

From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>

Fixes [YOCTO #11028]

When dealing with node modules which use "node-gyp" [1] to build native
addons to node. Some temporary build files stay in the image: object
files, static library files, dependency files, ...

This commit does not keep only the required files, but remove the files
which can leads to QA issues (staticdev with static library files).

[1]: https://github.com/nodejs/node-gyp

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/npm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 9703f4c..4b1f0a3 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -56,6 +56,7 @@ npm_do_install() {
 	local NPM_PACKFILE=$(npm pack .)
 	npm install --prefix ${D}${prefix} -g --arch=${NPM_ARCH} --target_arch=${NPM_ARCH} --production --no-registry ${NPM_PACKFILE}
 	ln -fs node_modules ${D}${libdir}/node
+	find ${D}${NPM_INSTALLDIR} -type f \( -name "*.a" -o -name "*.d" -o -name "*.o" \) -delete
 	if [ -d ${D}${prefix}/etc ] ; then
 		# This will be empty
 		rmdir ${D}${prefix}/etc
-- 
2.7.4


