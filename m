Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 81E147DFE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 11:30:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so3039403wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 03:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mBLqm/fF5wJ3T389CP4nruV8pem5IhjOn3LHrzml7yI=;
	b=eyMtvY1FG//J+gaLpn9Nni7c9rx0pzVbD6+8vGLpvd2FQj7PeMriRsvHDPH3TQWyUM
	nAlb5GJ4ASKh8O+yhU+G65RAfT14gFLXeVsMtUcNPjY9Q4Of6xroQEzr4CFr6VivkX/U
	ejHGw0rakVXKH4pJb2yWYb3t5GkGs7UfWUkPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=mBLqm/fF5wJ3T389CP4nruV8pem5IhjOn3LHrzml7yI=;
	b=NBVFxen24IeMqbcjAjXpWBZjSsM9n/Aqt/HOVxlwFqAVcMDHxFaFeXgWrQhkJaUpqH
	mkNC/TscCZh1hX8jl+9FEOzboRXmhs+m6aJMd7Vm8UETNcl6gLSoA4ymRZQCCOT9nkyo
	YUZCfV3E/uNA6g8weB3ucOnPenPo1AAdfVGpv9J2cIa66McCwrD6U4zfBWSXYz2BEoLw
	up5BaWy0VOw81kFLFPj14BwEvn6I2kUGcsyfrx9JMy1jsVdnvhJT3BRZeIESX8aXvMPI
	PHAO9G6L2DDOLb3Qffb3PpZdQoNgRO3ru6HLDNHL7yaq10kLEqHHC+ApuZgLqq1gJvMt
	8HZQ==
X-Gm-Message-State: APjAAAW0KCG3rrfj3/kd9gvhgkbXbYyerl1MueoxEuPgyZLeIHLci593
	SldtgfdD76bbY6dJLoacmhMUNAO2jgQ=
X-Google-Smtp-Source: APXvYqyz8rNDzNvdBSGsu2yqa8QitQ+pUSW75kp7trMr4qp4F7wMIPjaa0JDIdz+ju1R+g0bEWmqHw==
X-Received: by 2002:adf:c74f:: with SMTP id b15mr9493456wrh.272.1575545404671; 
	Thu, 05 Dec 2019 03:30:04 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h8sm12735008wrx.63.2019.12.05.03.30.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 03:30:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 11:30:02 +0000
Message-Id: <20191205113002.27557-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] oeqa/concurrencytest: Optimise for autobuilder/clobberdir
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
X-List-Received-Date: Thu, 05 Dec 2019 11:30:04 -0000
Content-Transfer-Encoding: 8bit

We're seeing huge delays on the autobuilder during oe-selftest builddir
deletion. For example there is a currently running selftest we could do
with the results from and its been going 13 hours, at least 8 of which
was in deletion of the builddirs.

There are a variety of ways we could solve this problem however the
autobuilder has a mechanism for deferred deletion, "clobberdir" which
it already uses for this kind of work.

Whilst in general hardcoding things like this is horrible, I believe
in this case the benefits (and resulting improvements on my sanity
if nothing else) mean this is a case where we should do it.

If/as/when someone can come up with a better solution that is fine
and this can be replaced.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/utils/concurrencytest.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/core/utils/concurrencytest.py b/meta/lib/oeqa/core/utils/concurrencytest.py
index 0f7b3dcc113..71ec0df5fad 100644
--- a/meta/lib/oeqa/core/utils/concurrencytest.py
+++ b/meta/lib/oeqa/core/utils/concurrencytest.py
@@ -221,6 +221,15 @@ def removebuilddir(d):
     while delay and os.path.exists(d + "/bitbake.lock"):
         time.sleep(1)
         delay = delay - 1
+    # Deleting these directories takes a lot of time, use autobuilder
+    # clobberdir if its available
+    clobberdir = os.path.expanduser("~/yocto-autobuilder-helper/janitor/clobberdir")
+    if os.path.exists(clobberdir):
+        try:
+            subprocess.check_call([clobberdir, d])
+            return
+        except subprocess.CalledProcessError:
+            pass
     bb.utils.prunedir(d, ionice=True)
 
 def fork_for_tests(concurrency_num, suite):
-- 
2.20.1


