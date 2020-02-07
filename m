Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F01660B85
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 14:40:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t3so2968892wru.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 06:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=03CENgVFYcDocIeH+aNBvvXA8pZmQyfqJ58NNjC2Whk=;
	b=QE0T8dIJ/WWQM/5d2U2FEs+tCxku2C9L/cBAoEpzvl1W9p2rl9UH3uHcAr1GAeYifV
	ZsXu6sEje4GQ7qc9gTP36QYBarr5gTBOsLXS3Q1G6hhi9nQoLlvy6+lOlvejjJBXLBdl
	5F7EOusjwguNjncJuwfclBcD6ZRknwM2cLK/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=03CENgVFYcDocIeH+aNBvvXA8pZmQyfqJ58NNjC2Whk=;
	b=Z8eEUxHTgA0qeTV4Z3MKivCbie2Um1Zks+/j7nEY5sA5N66sX5afl40uQayvq0ke2d
	9P9YIRAwUVEpKZPTjQ7T9XnRT1aqe6F+kFW+0UAXSshMljX9nKz1RDh0oUQ8dRvwai1j
	/BjelJ0OEuQO3ytYZNaIhO5e1CjYjYPajMVOqvyJqt+X2YAwJ9XTdKMWoflSLuiPRMSW
	C6VP63Giqiimvt8HRVMaoQnjBtcn0F5XeXSsexy9gm5FwMh6N55lUu9VGuhllXgnd16D
	aEmOqSXwy6elNnf/6eqajWiQweBYeVqctqTThLI24LlPxHj0NO16lzsnoFKYIVbsN/SY
	v94g==
X-Gm-Message-State: APjAAAWITUJF5/HoCv4fmNqI5MQrtFT98d6r2O9vlV848cv2ENpCRhEl
	XXTtTQSjOQrjdaskgRENerAbVf/KrZI=
X-Google-Smtp-Source: APXvYqwYhO1FJoRHKOuMRK7JBR39mvG9YMGVzShgVFMF51bGOHJdlghU2iOJXOFnTXfXd30Us96N5g==
X-Received: by 2002:adf:f491:: with SMTP id l17mr5425098wro.149.1581086459169; 
	Fri, 07 Feb 2020 06:40:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a16sm3526412wrx.87.2020.02.07.06.40.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 06:40:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Feb 2020 14:40:55 +0000
Message-Id: <20200207144057.6121-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] sysvinit: Fix Reproducibility issue
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
X-List-Received-Date: Fri, 07 Feb 2020 14:40:59 -0000
Content-Transfer-Encoding: 8bit

With a sequence like:

bitbake sysvinit
bitbake sysvinit -c clean
bitbake sysvinit -c package_write_ipk -f

then the resulting package has two files with group "root/70" rather
than "root/shutdown". The issue is that of do_package is a setscene
task, base-passwd isn't present. This patch fixes that dependency
but there may be other cases of this problem around.

[YOCTO #13776]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index 2b146b1ef8f..349ea71837d 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -29,6 +29,7 @@ B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
+do_package_setscene[depends] = "base-passwd:do_populate_sysroot"
 
 REQUIRED_DISTRO_FEATURES = "sysvinit"
 
-- 
2.20.1


