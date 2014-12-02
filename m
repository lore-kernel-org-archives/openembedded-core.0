Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5526AC19
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 08:16:47 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so27163585wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 00:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=yZZcmKMitsona1coGgdKlSXaKYNMho/Qse/FhD7o+RM=;
	b=nFdAzPJ19bfmLUfsri9hsFzxlvOjj1ygy1HTq+l9h1WbXqXrQLtp+xt3H+AG7IWV/d
	2bQs5HgDmB2HQDgEeveC2Uk6V2U0q3CqlvgE4nbtSnVMLPy7qVuFy47nTJ1FNLO6sUVx
	3HrKHdDBV8YjMGFQXeVO/0MhR1kC+sIvorQbU4RCuEOArTHG7OxK37eh+R9txv73Zy3G
	Lwl1YMjKxz2aosRu8LWLIDx4yMfAdO2+pcaHFvxB+DRcJui/sb8cDx1j1KZT7WwqRFwF
	ATE7WTI+KNbdbwoXV26DPqSyIWb559pwd8M5beJEWLM/k85MlhkyytljIO0zU7ncu00t
	QT+w==
X-Received: by 10.180.9.229 with SMTP id d5mr2725409wib.22.1417508207190;
	Tue, 02 Dec 2014 00:16:47 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	wv8sm30692585wjc.44.2014.12.02.00.16.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 00:16:46 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 09:16:38 +0100
Message-Id: <1417508198-30563-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1417508198-30563-1-git-send-email-schnitzeltony@googlemail.com>
References: <1417508198-30563-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gettext-native: build libintl so that other native recipes can use them
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
X-List-Received-Date: Tue, 02 Dec 2014 08:16:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have a native recipe around which directly compiles/links against libintl.
Gettext contains this code (usually supplied by glibc) as fallback. In native
case this code is used by default because we don't have glibc there. This patch
changes static linking into dynamic linking making libintl code shareable.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/gettext/gettext_0.18.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
index 65d4103..98838d7 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
@@ -39,6 +39,9 @@ EXTRA_OECONF += "--without-lispdir \
                  --with-included-libunistring \
                 "
 
+# we have no glib intl
+EXTRA_OECONF_append_class-native = "--with-included-gettext --enable-shared"
+
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
 
-- 
1.8.3.1


