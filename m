Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id B96A970A8B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 13:40:51 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id q5so9299641wiv.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Nov 2014 05:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rq8+2+9aq0qE0lFyXV1CzHApq1koLbv8I0xmH4bi/jE=;
	b=JG4o/xWR8XGQFE42y66EX1MbZhpIY8LV6Z2AClp0+y2n0zaum8aqAOvky3IN/jv4pK
	XzihbKusc/5ZPHbi2Rotad1NTfwUHTHaTyVItnOFFOxaL7RQQ6AxcRxzeKAYeNLc52kC
	L6XBAsy80rc4ivKrfDki8yVVpdCE9IEbkGW1wdIxntxK0jU08ES+xc/foxxEDef4wJ+A
	azhb66j0gjfc2q1JeeI90AdqkIG5s2jtyzI719JG4MpqMJGrYJsfz3YUarxk4b3SZbnu
	Fkx06HYZBpDFj3y/Negfz9BSj2acc/6jwXrCdlGRlNrgLvlpQFT+9Jl97+EZzMGyJ16U
	rOWQ==
X-Gm-Message-State: ALoCoQm+xhd5nxB9oLqZmqBSNDQltcmOA4dESShfbGFC0uoJF0QwQz3ECY00pMLioVJwk1fvsbMq
X-Received: by 10.194.237.162 with SMTP id vd2mr56655090wjc.52.1415108451922; 
	Tue, 04 Nov 2014 05:40:51 -0800 (PST)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id 4sm552583wjx.39.2014.11.04.05.40.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Nov 2014 05:40:51 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 14:40:45 +0100
Message-Id: <1415108447-16821-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH 1/3] lsb 4.1: Deal with "make clean" breakage
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
X-List-Received-Date: Tue, 04 Nov 2014 13:40:58 -0000

LSB can't cope with a "make clean" so disable that
newly enabled functionality.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-extended/lsb/lsb_4.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index d265731..34a70d0 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -21,6 +21,12 @@ SRC_URI[md5sum] = "30537ef5a01e0ca94b7b8eb6a36bb1e4"
 SRC_URI[sha256sum] = "99321288f8d62e7a1d485b7c6bdccf06766fb8ca603c6195806e4457fdf17172"
 S = "${WORKDIR}/lsb-release-1.4"
 
+# 'make clean' isn't supported
+
+do_configure() {
+	:
+}
+
 do_install(){
 	oe_runmake install prefix=${D}  mandir=${D}/${datadir}/man/ DESTDIR=${D}
 
-- 
1.9.3


