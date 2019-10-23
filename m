Return-Path: <nick.owens@eero.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 807A67F82B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 18:00:48 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s17so10446132plp.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2019 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IK4Qn9Ef9Vyf312rJAySiolgrM7vhwjkYpVjrx+IvfI=;
	b=RSjVG6+ZqxYD2QblGeOFPCRiJF9qArMo7GgIARXynN2cNmAVcLp5l3ohNf8D1pOQiG
	jzeVXS9x1oZOLu1VjDFBnaA5j54Ldr95j96EnNVwPuROLrqiUBSEvY5/KGBkuCPzzfvW
	OgPyyVBjk2ynNBOR4hnhFoO/Vf+0T3r+b8ILk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IK4Qn9Ef9Vyf312rJAySiolgrM7vhwjkYpVjrx+IvfI=;
	b=CKtWeKjiy01Mqzr6ruy9qCd4Kph++3hFUu8+/y0TUsKeXB9D5i7sVnQFOlD6MmYwj0
	q2aOKxtT+gIRw6wceQkNDZnJo0gxnNJSg19lzLIh2AviCRsODGPXtoN//SUTrcaxvv3s
	cK0tawcs2j9jvKOOtSesdM0I9JimKiPathtF81qhX3C/CmTEq2V9lKX8Gm9eQx2uihNO
	dxHzR1Jk/fKcHmLxhujuROvdbf58f9LUPN46LWxrZwXaRebU3BIRNVext/uPllTHCwxT
	dLyJhQxgh6RMRn/1uI6Sacb8W4VykqBhdxyr8eHc62ESFphVRr240wsj9VWhaeiS+AfV
	2Fsw==
X-Gm-Message-State: APjAAAUbM7OSrTSS/BG2uVA3neauUeHCp1PWr/X8gbaXBWDqFQ89rDu4
	RJsQld7bj+5IQWguuq0R17QH3O8Le2E=
X-Google-Smtp-Source: APXvYqzlPmwkZJntoAeWjSKS3cpNTghTNXk7S+N6VAkoNWqgOFFPgKYGVlQCGc/dXGZ8vuz8EYKUJg==
X-Received: by 2002:a17:902:b687:: with SMTP id
	c7mr11264221pls.214.1571853649157; 
	Wed, 23 Oct 2019 11:00:49 -0700 (PDT)
Received: from ufdc85a1e077f5b.ant.amazon.com
	(c-73-92-46-121.hsd1.ca.comcast.net. [73.92.46.121])
	by smtp.googlemail.com with ESMTPSA id
	c19sm3678133pfn.44.2019.10.23.11.00.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 23 Oct 2019 11:00:48 -0700 (PDT)
From: Nick Owens <nick.owens@eero.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2019 10:59:39 -0700
Message-Id: <20191023175939.14612-2-nick.owens@eero.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023175939.14612-1-nick.owens@eero.com>
References: <20191022235935.19461-1-nick.owens@eero.com>
	<20191023175939.14612-1-nick.owens@eero.com>
Subject: [PATCH] distutils: pass along parallel make flags to setup.py build
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
X-List-Received-Date: Wed, 23 Oct 2019 18:00:48 -0000

parallel builds for native code in python modules was added about 5
years ago. distutils understands '-j N', so just pass along
the right argument to setup.py build.

Signed-off-by: Nick Owens <nick.owens@eero.com>
---
 meta/classes/distutils.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index b5c9c2fbbd..ea479f552e 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -23,7 +23,7 @@ distutils_do_compile() {
          NO_FETCH_BUILD=1 \
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
-         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${@oe.utils.parallel_make_argument(d, "-j %d")} ${DISTUTILS_BUILD_ARGS} || \
          bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
 }
 
-- 
2.17.1


