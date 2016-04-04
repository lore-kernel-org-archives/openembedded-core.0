Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id C27C473175
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 13:28:57 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id f52so53017697qga.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=4RNvUAxVojBG3i0FhjcJ13eqxshAqMNi76VWQAFzxZ0=;
	b=MbQl2xgYoPwNY5wFwPPhME6TlyC9GhUmCjOIUEJxYv3HedpKKmGgyDxNbwQKWt30rL
	6oTlDlmJNcXzBY8e7H0vcCmi7gJdawWi9cRwYkA49qPUPMXq4CCwueF10wzn07iKe5rA
	ZJPD8zwyKWX3bzLUVtgJDmKvKdyG99JaZCPVBSsNHxmqjuQ4K6Q/Jr0MStmuhtYJKCmh
	TlIpEYC6noVxS4jRwxOhVIZvtOFqNrbEOJYMqv62ho5nMFZYKelJMn3r57xvV7UrqCMb
	nRsk6NCxltg+CkN0dNC/dzFiaqCoOHvQxpVuEylNNnAdwP2+UKv6CEQjEgeAUCnIJ7Qd
	zbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4RNvUAxVojBG3i0FhjcJ13eqxshAqMNi76VWQAFzxZ0=;
	b=Yz5G8KAu9uPT/T6IlDO6JCJp0mWIfqAnpcswubnI4RVG2J7ft/PPTiH8C7Gt2GTx7w
	rTktM0/bEsBMaCa+Esfhbksq7qVnj5iUdmOno4iB1wq+pImzKzSL7fkMdqA89XDj77Az
	LbpSPlxRHl4d28S9Zhh7eNRHbFsPMyGvYj4E7yQ1zwf9PVl3nF5EyG61ylM9i4GVcK0Q
	nCtpEKHpMzUciQ+2lc5UQ3hGTIIeU733foqcN0Gkn2vjCrpRZgmOLWGoRVrR3yoR0ULi
	176StX1OtEsWehRVCexoDexBCfaHSfmpOZVTO2MMsFilz1w8Nc0+GVTrx1QwfwPL4mPx
	j5VQ==
X-Gm-Message-State: AD7BkJLMh6XWnT1YNhPnYCVgzaHuopaVsCbZVTU48cau02B/uWSUKcXxCX0SHlXybRWwxV6u
X-Received: by 10.194.184.139 with SMTP id eu11mr3547766wjc.154.1459776538303; 
	Mon, 04 Apr 2016 06:28:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	c144sm13953260wmd.0.2016.04.04.06.28.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Apr 2016 06:28:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Apr 2016 14:28:55 +0100
Message-Id: <1459776535-13627-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] cogl: fix G-I .typelib installation
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
X-List-Received-Date: Mon, 04 Apr 2016 13:28:59 -0000

By default gobject-introspection puts .typelib files into $PN, but the cogl-1.0
recipe doesn't use PN.  Installing cogl-1.0 is impossible as libcogl
conflicts/replaces with cogl-1.0 due to a previous upgrade.

Fix this by putting the .typelib files into the right subpackages, and
explicitly setting FILES_${PN} to "" so that nothing accidently ends up in PN.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index fc7cffe..690ea3b 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -61,10 +61,11 @@ do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/cogl/.libs"
 }
 
+FILES_${PN} = ""
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
-FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
+FILES_libcogl = "${libdir}/libcogl${SOLIBS} ${libdir}/girepository-1.0/Cogl-*.typelib"
 FILES_libcogl-gles2 = "${libdir}/libcogl-gles2${SOLIBS}"
-FILES_libcogl-pango = "${libdir}/libcogl-pango${SOLIBS}"
+FILES_libcogl-pango = "${libdir}/libcogl-pango${SOLIBS} ${libdir}/girepository-1.0/CoglPango*.typelib"
 
 FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
 
-- 
2.7.0


