Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2872C71A23
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:10:46 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f82so212300041wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=DF5LC6vAXzThYXD3Lufx/OtO9zcxBKiguTAnRBBliBw=;
	b=aM5I32irpgGpb+gBK4ZWcykGmtrC3Jrzd0lk32+3wNO7awW3RAQniCR8CDMpPeS893
	yTOzObFToaAVr14ntEA+ko54/VO3koIeRA/K8tbXEmdoIJI5yAS20dGhOdJa1DeRWj0w
	VzVUTrLO6FdGHeQmCOe4lbeJOXQ4mrdRlgEIBhDUMYSGPbJoD/bMAR9HSBcFjbLzIYPD
	bY/oHXpeqV5xYktQ/V0E3DAMJtN7BVdg/tFEKnuhxVz8R6bwM500zH66a7QNHqwrwW/o
	6PWBItzVWxzCIaD0NIYagQbF+96ROBdo16ZFJm+rvFAAQ1wT8oO3oVlAX/++7iSz11GY
	zFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DF5LC6vAXzThYXD3Lufx/OtO9zcxBKiguTAnRBBliBw=;
	b=LSHqMgPNyShOzMHkYm1CdeHgiUEYQWyvZeiYiuVvzBbJ2f/n68l5g8CWehQq7FziNe
	fl/eFdhK/t+8REbUFReMoqskakpCiJSDKeHwUtxHvM9qQWrHE/BhHyiK1swdx1FLwqc3
	UHM/aYBxpQBv8sUycbOhz9s7DXCwDtsEi/Osf5eanrIlB1THik1xhzRBsG6yWBv1svt+
	Vkun2z1aDm5lkZq54FmZIVuuCL0NyZdgNut+L81xcOgaWJFH/Ib1tKGljBmqW7sAyqfx
	9DY38ZrPtHvFUw1tEkkG0CcOslMmx+Lw+oBQy+UaOndJoRyvxq7a/LkB6rzvguzsz3Yh
	R7aQ==
X-Gm-Message-State: ABUngvdks79imBoGxTXWCnjUg+1lgh1IBNydxkEJN1oHk9Y6SfrPS/tA7ax2Z4AtemXLUZBs
X-Received: by 10.194.23.67 with SMTP id k3mr12748238wjf.103.1478650247580;
	Tue, 08 Nov 2016 16:10:47 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 18sm22330985wmr.6.2016.11.08.16.10.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Nov 2016 16:10:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 00:10:43 +0000
Message-Id: <1478650244-7002-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] systemtap: remove explicit msgfmt check
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
X-List-Received-Date: Wed, 09 Nov 2016 00:10:48 -0000

Passing --disable-nls should be enough to disable the requirement for a full
gettext to be present, but the upstream configure explicitly checks for msgfmt
even if it isn't going to be used.  To avoid having to depend on gettext-native,
patch this check out.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemtap/systemtap/no-msgfmt-check.patch             | 15 +++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc           |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
new file mode 100644
index 0000000..471e62c
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
@@ -0,0 +1,15 @@
+There is no need to explicitly check that msgfmt was found as the gettext macros
+handle this for us if NLS is enabled.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index e56079a..284bbe0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,4 +38,0 @@ AM_GNU_GETTEXT_VERSION([0.19.4])
+-if test "x$GMSGFMT" = "x:"; then
+-   AC_MSG_ERROR([missing gnu /usr/bin/msgfmt])
+-fi
+-
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 304eb99..34cf227 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -9,6 +9,7 @@ SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
            file://x32_abi_time.patch \
            file://monitor-option.patch \
+           file://no-msgfmt-check.patch \
           "
 
 # systemtap doesn't support mips
-- 
2.8.1


