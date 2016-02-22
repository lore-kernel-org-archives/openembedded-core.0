Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 81595770EF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 06:51:10 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id y9so106204968qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 22:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xAV1zVECqsIwL92f+3AlTCzEvnVcwPB2qSFf7z/0ENE=;
	b=xdxZ9XMeCn66blPBftaDMSQRyXyRml/HEXGq/EmuyKyYpEenCxWeKCt/C70ryHbdJ8
	0EJ0cm7IRGoz+TOn/H+W9LM4Cc+USjk3aNqL+x9eWSAMJBl+kguVRYYWFrzzyKo3P8aA
	7G86EcbYEu3zCnRP/noSDEfGNQ7Y+adRWrkJaot8sO/3nbjh9oocs+fq1OK41fIZDfpq
	j3pFiUrIpyVaEzUdavERvMRO+bRNX8CUpJB0FoKuBiys35voPCwd+UVjTl4g9yCmmWuj
	qNRUMrU3fIiBP0jg4ffmP853TQAg7fvDn7TcQ5EvV/QposB8fTMIoP7lBL2b6LojmrbV
	rTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xAV1zVECqsIwL92f+3AlTCzEvnVcwPB2qSFf7z/0ENE=;
	b=beEFsWsalgxC8lD7Pv2nzTRIC21iwolLWLy6VImXb/z7a7MWxsEGhNLmC2xEEEHt1z
	RfJZHx9Jep4zSUEYI2booV0N2DxFax5GO0uD8gUSLGSj/eRzarTNutkHFOEbND99Ombl
	K4r5WMDkIy66uv42uXv/+/J03nUoHVbMUhEk++DJJQJetOo7ixxhUXxlHf1xmu6id3O+
	/62Yv+34K+W9kBHAi7hK3jat649boXgD25Ob4VdoNB6Sc7hdcfo/YJ8ovEfarTSFdSIZ
	DrV3Ug2LAEUNt09MWMbk46MzzQLepB/qs7NoWzE4W7U104ooI6zMTzd8AuWBhwTZm9Rx
	CLpg==
X-Gm-Message-State: AG10YORv/P06FyBDstfq4x7athTAdTg4eb2eihZX8JgCvBaPfxaZTuJbSig+iKGLEgFGpg==
X-Received: by 10.140.234.16 with SMTP id f16mr33129596qhc.41.1456123871125;
	Sun, 21 Feb 2016 22:51:11 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135])
	by smtp.gmail.com with ESMTPSA id f30sm6114265qga.6.2016.02.21.22.51.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Feb 2016 22:51:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 06:50:57 +0000
Message-Id: <1456123857-8502-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
References: <1456123857-8502-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 4/4] uclibc: Do not use immediate expansion operator
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
X-List-Received-Date: Mon, 22 Feb 2016 06:51:11 -0000

:= causes none of _remove flags to work with uclibc
e.g. security flags where we remove ssp options for libcs
but it does not become effective for uclibc and hence
the build fails

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index b63158a..1d42284 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -63,7 +63,7 @@ export V="2"
 # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44860
 #
 CFLAGS_remove_arm = "-fno-omit-frame-pointer"
-UCLIBC_EXTRA_CFLAGS  := "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
+UCLIBC_EXTRA_CFLAGS  = "${@oe_filter_out('(-I\S+|-i\S+)', '${CFLAGS}', d)}"
 
 configmangle = '/^KERNEL_HEADERS/d; \
                 /^RUNTIME_PREFIX/d; \
@@ -82,8 +82,8 @@ configmangle = '/^KERNEL_HEADERS/d; \
                 /HAS_FPU/d; \
                 ${@["","s,.*MULTILIB_DIR.*,MULTILIB_DIR=\"${baselib}\",;"][d.getVar("baselib", True) != "lib"]} \
                '
-OE_FEATURES := "${@features_to_uclibc_conf(d)}"
-OE_DEL      := "${@features_to_uclibc_del(d)}"
+OE_FEATURES = "${@features_to_uclibc_conf(d)}"
+OE_DEL      = "${@features_to_uclibc_del(d)}"
 python () {
     if "${OE_DEL}":
         d.setVar('configmangle_append', "${OE_DEL}" + "\n")
-- 
1.8.3.1


