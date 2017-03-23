Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 50FB273081
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 21:35:17 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id a5so4747601oth.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 14:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sgCVTl3ua68T8HxLfMYi19L509Jh2XYlHcm8lrpwfZQ=;
	b=V2kXesHOAOm6IWuifGKHr4wy9adsnyi7STi8LQIScWiWcOB+YpeqjLuIfxwBWFiXQd
	9rzqLGJqkmijnKSXetw44CC1a6qUeZD2+lG0i0QxL3fuwBKKO4HqrLH5VIElC7l5bc+Y
	LvrDgFIvLoUna91/WfKz5/mBJ/L6Qe75SNdPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sgCVTl3ua68T8HxLfMYi19L509Jh2XYlHcm8lrpwfZQ=;
	b=fA+lNmHr45PxoEBgP0UdxoQb2OFqE2aet+rIVIkcyPB32c/QyLKv63X9df9vgeIJTv
	4ZjxKKEGHC9nWzs3TIAuqksxs18AqZtF1hmNGC3XTd3ZUXY+y8Tf3xEFU11raksu9M3C
	B/WagCgVPCRORJpgWSxrel0odPZSot3TsC3jPRFX55+lJX5j++lqsWjNBvqnQGocwOV1
	SN4pybIxLDX3cTsJWSW9mV4W2e0QKzBNeq1v1+PSCMIL5vaAfDkYXSaqYXQb30Oq2NPe
	SRmsUO+tZmkHd4dOHNPQbtb0mWDkMRwcgkzHANlzqQxeYQplxwLDQArSCKx/eavCFp/2
	NCJA==
X-Gm-Message-State: AFeK/H0Tx3LI3NEFaYm2D6dugH95/AJX6BCOJRSDeNb9mSDa7K8a8h65SEW12HYuzy7H/zQR
X-Received: by 10.157.54.210 with SMTP id s18mr2833938otd.245.1490304918309;
	Thu, 23 Mar 2017 14:35:18 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink67-82.telefonia.InterCable.net. [201.172.67.82])
	by smtp.googlemail.com with ESMTPSA id
	r130sm142321oif.20.2017.03.23.14.35.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Mar 2017 14:35:17 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 15:34:44 -0600
Message-Id: <1490304884-32402-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH v2] base-files: resize only serial tty's in profile
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
X-List-Received-Date: Thu, 23 Mar 2017 21:35:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
v2: Rationale behind this patch, no functional change.

 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
index 7367fd1..c616616 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -26,7 +26,7 @@ if [ -x /usr/bin/resize ] && termpath="`tty`"; then
   # Make sure we are on a serial console (i.e. the device used starts with /dev/tty),
   # otherwise we confuse e.g. the eclipse launcher which tries do use ssh
   case "$termpath" in
-  /dev/tty*) resize >/dev/null
+  /dev/tty[A-z]*) resize >/dev/null
   esac
 fi
 
-- 
1.9.1


