Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id BCD0A60761
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 16:43:15 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id p47so3684320qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=5sjv5l78Uui6+qeB6EeXwRP56Mcp+r6tmCZvq2DVNQc=;
	b=eKWFct5v9X6Ad7X+4h4frmMY29zue4xD1rAmGFVy+GUjZlIati4mx5vFNmMkH704zs
	Clu9sGNoix9ENjz5QW2T4WH02yC2DmGWgIEXFm6OJSuE2TwFgHlVzmjZ98PmeKgQUPGk
	sAXW6qY/EGEcDD1qpUukz/bhEFHP4LTPd8mr3nvg9S/jtwx4ASWThNOUOQj4PAL7IRvf
	DAEcrITpNX3KFHtyDwGop+Xaj4l+O62TVe73QjDtazWlzVSpmfjq9ABjcKK9gnS44y1e
	QW13dEDyW6pm8tM2kZDLYV65c/vQ/mZgHl7RtcQALfekyolHOfRV5OPFB5okhHh2dT8q
	Wfbg==
X-Gm-Message-State: AA6/9RmmCrAOU4ymmqUXJT5EsbIdWgf2+V5vKWmxkao240NYTj3GKXwzfh4ZmAVZ0aHGXg==
X-Received: by 10.200.44.189 with SMTP id 58mr8685144qtw.109.1474648996944;
	Fri, 23 Sep 2016 09:43:16 -0700 (PDT)
Received: from localhost ([179.105.252.78])
	by smtp.gmail.com with ESMTPSA id u5sm4237029qtc.44.2016.09.23.09.43.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 09:43:16 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 23 Sep 2016 13:43:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 13:43:00 -0300
Message-Id: <20160923164301.560-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160923164301.560-1-otavio@ossystems.com.br>
References: <20160923164301.560-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] tune-ppc[65]00.inc: Disable QEMU usermode usage
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
X-List-Received-Date: Fri, 23 Sep 2016 16:43:16 -0000

The QEMU usermode fails with invalid instruction error when used with those tunes.

The issue is being tracked in [YOCTO: #10304].

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/conf/machine/include/tune-ppce5500.inc | 3 +++
 meta/conf/machine/include/tune-ppce6500.inc | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
index ace2614..cebb244 100644
--- a/meta/conf/machine/include/tune-ppce5500.inc
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -18,3 +18,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc
 
 # glibc configure options to get e5500 specific library (for sqrt)
 GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
+
+# QEMU usermode fails with invalid instruction error (YOCTO: #10304)
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
index da1e864..5db7e76 100644
--- a/meta/conf/machine/include/tune-ppce6500.inc
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -19,3 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc
 # glibc configure options to get e6500 specific library
 GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
 GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
+
+# QEMU usermode fails with invalid instruction error (YOCTO: #10304)
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
-- 
2.10.0


