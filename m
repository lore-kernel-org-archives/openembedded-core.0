Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 12E9B7F302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n9so41266152wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ugJNuXYzjpVaOXI8dIuq1pQ7K+xeVxX7QO708h8mpTc=;
	b=RJfNKdj3bJ2A9zTpEH77o1bs0SMWxhWu7OYYdOnM5IoT2M0JnvpdflxxX5lzFTr91+
	Btv9i6HSG25kNXTbDVoTqzX31txZ6oD8QLdl5/oPtAfMPGk/KSzH9LpXHu/hQdA46QkA
	AISXnuR+9NShyuKJ/3dXBfA4Qrwy3CjzWBo7ihjzrEA9BB0eX0LCXiPbd60PjXtvgGVO
	gyy41jvujsMrHJpip/gkDyTi7k5bOgIpmko6+xK9BzmFe61t2gDXx758AA6erZCiH2TI
	aYwlPGLHDHb6vG7gVC6kRDwasihKcb0MWMAvBE3v143aAWFuJt/lCjDQSvRZwRO1xKHP
	GCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ugJNuXYzjpVaOXI8dIuq1pQ7K+xeVxX7QO708h8mpTc=;
	b=jQ3gmlApAwPiPWAmFf/8WWL6DclKlL2bYrJUq0oUjg3MB8kKAZ99AC/gGTHPocMyJA
	vGGChYFrb7jlV1a2c8oiIIxlXwbPyKwd6xAd6/98a0WXoE+ZgC/tnAMktD/06CbT8q8O
	ghC8mwwgBs+wChqbLxIYF1YXdloSM+HEWJU+NY0w6+RaMnmkO6iOSwNsCCfXGk+iBWwG
	KYq+OnzzY3ZlpISdDCzkKu133o1DQAmKmEd19HcfHc1uhD08zJhqCMuqJaZ8gviQbKHY
	QSNyvEt5vDFtFtwyAVNjLkPm0q5cfT4HzArvpN/WUD+pbJqh+wdV5NU8utzbV3dmhB9u
	8Ncw==
X-Gm-Message-State: APjAAAWLQna9/ZkLUIS0SeAeef3/ugShQRGHUkxSk8o8OyB496KDELGO
	6WgBenrKw1d578Nqk8r6c9NMpgj6eKA=
X-Google-Smtp-Source: APXvYqx3cZSP2uUHwZEqmEIBUUBtjbxmpITtXAIJjsEiw7Jw7GDKYRu936LnzlqKhzcTftHJTTj6JA==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr103000534wru.297.1564502081639;
	Tue, 30 Jul 2019 08:54:41 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:26 +0200
Message-Id: <20190730155432.96611-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/8] meson.bbclass: do not pass native compiler/linker flags via command line
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:41 -0000

With 0.51.0 version these command line options override what is in the cross file (e.g.
the cross-flags). I could not determine what is the scenario when the native flags are
needed (this would be building a native binary in the context of cross build).
If we find such a scenario we would need to find a way to pass native flags
through some other channel.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/meson.bbclass | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 626b0e789b4..dafdd18bf41 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -24,11 +24,7 @@ MESONOPTS = " --prefix ${prefix} \
               --infodir ${@noprefix('infodir', d)} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir} \
-              -Dc_args='${BUILD_CPPFLAGS} ${BUILD_CFLAGS}' \
-              -Dc_link_args='${BUILD_LDFLAGS}' \
-              -Dcpp_args='${BUILD_CPPFLAGS} ${BUILD_CXXFLAGS}' \
-              -Dcpp_link_args='${BUILD_LDFLAGS}'"
+              --sharedstatedir ${sharedstatedir} "
 
 EXTRA_OEMESON_append = " ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.17.1


