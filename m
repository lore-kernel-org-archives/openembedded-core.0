Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQFmH-0002Vo-N6
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 13:35:05 +0200
Received: by mail-we0-f171.google.com with SMTP id d46so1163696wer.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2013 04:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=nQ1lztica260yS0imLi2Vb8gWKRTq+Zc3LQUxaC/t24=;
	b=Lya3iHjr8f8JoyLFto1dD+7J5OUQ5KxLV83IcZE1xgQE2JJmp+rqLdGTXcVvcTwt6l
	c+urnAnALmFmErJIwPWJySS0LLzVF8N/pS6w1bk8r3JZq93dfWnR+44atM8CGYyOGAlB
	2h/1pzKXGtp9VC+NHI5/N/LOaIzM+Fns07IJyHIKXKsTgCMCt6yLr9HqS6SdRFG87ncg
	/Y8AiK+rPXnfaHw8IoOlPtUYTyQlfCSQ0/tmDtX8rA4/9X5uvyC+xi8yGcgdx55op35E
	uNAv6BUIlUvBtzJa0lUy4c6EL83Lc8Xxh1UnCXon5znBuDIp4d4OyexuR6MUQQXbGmbZ
	LMUg==
X-Received: by 10.194.88.138 with SMTP id bg10mr10017405wjb.13.1365679050781; 
	Thu, 11 Apr 2013 04:17:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ed6sm2748767wib.9.2013.04.11.04.17.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 04:17:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:14:43 +0100
Message-Id: <1365678883-32138-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlC8aqCtEeYIS0ruNb6O+9R4yprjNYYvPH0I+ddc8B5lxgIx9WqDB9ElTrSjhoWHWzPVflC
Subject: [PATCH] pulseaudio: remove spurious cd in do_compile_prepend
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 11:35:20 -0000

This prepend was cding to ${S}, which then breaks base_do_compile as it assumes
it's in ${B}.  The cd is pointless as all of the operations use absolute paths,
so remove it.

The result of this was that base_do_compile was failing to find the makefiles,
so the compilation happened in do_install.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
index 71c3c05..3621452 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_3.0.bb
@@ -13,7 +13,6 @@ SRC_URI[md5sum] = "47fd7eca8479c757822bee68a1feef25"
 SRC_URI[sha256sum] = "c90bfda29605942d08e3e218ef10e3c660506a06651a616bfbb6a6df8392836d"
 
 do_compile_prepend() {
-    cd ${S}
     mkdir -p ${S}/libltdl
     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
 }
-- 
1.7.10.4



