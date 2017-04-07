Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id A572477E18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 21:33:06 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id r203so99916050oib.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 14:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qkvqdl4VLaBjVmKgo7vSFa1FjK3UsIYsk2ZsUJQT4lg=;
	b=hgybDYGl/BPqRlLplfpf2Vh/H24o3hV8kfhua3O8VID+nrtT3QZz5jq9yvDXldTea4
	X4QkeJBAHyliJpx7qAFr3f9r//mdcI0TURXdQOR3I25b679GSu0I2DzLaBpTSxnlTm6l
	X+udk33PEJGn3dOA9EQFFRmkgY0BHXUPJBLO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qkvqdl4VLaBjVmKgo7vSFa1FjK3UsIYsk2ZsUJQT4lg=;
	b=E6SsOA7XhrmSq1Da8FZ7mBZMPSJLx5hYvJydQre/QjC9bYwcpQ3fHxGOBIBSP3ue/P
	97MBLhpB7SjceiIE7PJQKENcXQ6KBfyAfYz30afE1nMTqX3yGpALlX3xwUkxPaTR5amP
	6GeoNkP/a+CTivdx2ZmnGg8Sy9/XqPoTbyBTkxRvHLJ/ZMss1hi4Atvz8E1jJBBeZDeO
	72M5VjekKD9j7yhe+giPVcG4WNIhFqNaxEZjVKFGvhgaMliDfvqWc7NSEckGq+WFXb5X
	07y8TSZsU/ilSm3PVufhfF2mA4yYHlCWv2PUAuNJfxCL+iDaWMJlf9HgT/FWUH+4Emsi
	Zv7Q==
X-Gm-Message-State: AN3rC/6lJn0J3oMSM/lbWyBzq06IRd2DrnHLh1jU32IpOFHL+fAuIoRJwWHwOB7uTDlXEAWE
X-Received: by 10.157.3.100 with SMTP id 91mr838016otv.101.1491600787165;
	Fri, 07 Apr 2017 14:33:07 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	90sm2613480otd.50.2017.04.07.14.33.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 14:33:06 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:32:25 -0500
Message-Id: <1491600745-3800-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][krogoth] base-files: resize only serial tty's in profile
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
X-List-Received-Date: Fri, 07 Apr 2017 21:33:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[Backported from master.]

We don't want to run resize on non serial consoles. There's
been an earlier attempt (6557787), so this builds upon that.

The problem we're seeing is that if there is text buffered in
the virtual console (like from a desperate user trying to
enter login details), resize will get stuck while calling
  ioctl(tty, TCSETAW);

Since serial consoles are named (not just numbered), this
change limits resize's reach even further to run only on
/dev/tty[A-z] (thus avoiding /dev/tty[0-9]).

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 1f02e52..e449b15 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -32,7 +32,7 @@ if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
   case "$termpath" in
-  /dev/tty*) resize >/dev/null
+  /dev/tty[A-z]*) resize >/dev/null
   esac
 fi
 
-- 
1.9.1


