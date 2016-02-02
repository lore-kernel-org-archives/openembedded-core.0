Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id CA5E260107
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 12:51:10 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 128so116552717wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 04:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=xC/LHTnUEAzCQEo+VG8p0t1uBVZopVpqQrKXFiXkyUc=;
	b=oxu1jRXHshCpIb23UkP85BxRgPIWQbq88TZYDDyWc8vPMI/6Wl82uQjLUAmopsGR2D
	+U/6tSD/J+lhpxN9ctN6m5pBg/1QGdA390qAVoHLO/7kXmsFMiuVfJnrgZpszrCj0/qv
	H1uMhNGKxg6xlSgUrtohP8aTRbnki3IG8Xb9xBYn8fMQWoL31gMU8NpTQzZui0fQHYf0
	9FTacxzyZJn7sVdw8YwERncSMVjS+qtbaJyeUNMog+fWlYLjxVtS6zBtS0Ul24f/VIpD
	Tqkv75BpKkk2z5krB8buOYwETwrfTFL42Aex1Nt4zTZorVwWXAhVGXdr8Y+BmdR1YFZ5
	9HWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xC/LHTnUEAzCQEo+VG8p0t1uBVZopVpqQrKXFiXkyUc=;
	b=bzi039kSq1+N/vsMmf559ikL+c6JK++NkOgxiPi8sItoRMwTjcAB1Mwcs3xRQ2mxgr
	juxt8OQgJUwOajjf5+xPmM7I1Da9q8HgS1tTRCJUaf88AO6S8ASVGOFqlCQ7Nlvzux7X
	72z7YcchEeGaKgy7lVFOXUI9e+g01NTPP4ZK65OdMElYen0fO5EOMpqYM9Kj81AURecc
	AOC4gpvVfTydSM8/eRdBbNHwRaQ14q4WCu3IDCMS+vR9ntoo1rMn/BR78Lr62EkNo28g
	J8141JCh2k2s3eAbARYl733tc05IXDIFvHGeXBeJwXydfTydKqiF0zptzRiyapqlAMgU
	9wrg==
X-Gm-Message-State: AG10YORTrwqNXaf0oshPUHxaHEYKekj/9hu0RxewuTW65F76eXhA450zp9qqpX4KrVDBDSkh
X-Received: by 10.194.123.167 with SMTP id mb7mr33850380wjb.0.1454417470659;
	Tue, 02 Feb 2016 04:51:10 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	hm9sm1350889wjb.34.2016.02.02.04.51.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 04:51:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 12:51:02 +0000
Message-Id: <1454417462-26169-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][jethro] uClibc: enable utmp for shadow compatibility
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
X-List-Received-Date: Tue, 02 Feb 2016 12:51:11 -0000

From: Bogdan-Alexandru Voiculescu <bogdanx.a.voiculescu@intel.com>

with the enabling of utmpx in busybox and uClibc it was noted that shadow
support for utmpx also needs utmp explicitly enabled in uclibc. this is
a workaround that might be removed once shadow properly supports
--enable-utmpx to check for utmpx configuration instead of utmp like
it does now

[YOCTO #8243, #8971]

Signed-off-by: Bogdan-Alexandru Voiculescu <bogdanx.a.voiculescu@intel.com>
Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
index 6575482..3827b66 100644
--- a/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
+++ b/meta/recipes-core/uclibc/uclibc-git/uClibc.distro
@@ -182,6 +182,8 @@ UCLIBC_HAS_FLOATS=y
 
 # COMPILE_IN_THUMB_MODE is not set
 
+# needed by shadow
+UCLIBC_HAS_UTMP=y
 # needed by systemd
 UCLIBC_HAS_UTMPX=y
 UCLIBC_LINUX_MODULE_26=y
-- 
2.6.4


