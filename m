Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2686C6057A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 16:42:56 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id n5so85781559pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vHmS5RfVY788A79fG3zOGDhlazyW2faSiuIwVCKJXPk=;
	b=ByQCrUMS3LAFJu5sSk2sZEXFL4INd/cviYlAWlmBJ92/DOoZrxvKIVXF3qV/kqRLJE
	kImS8cYjDtgm5INnuFmblTSUsM5HaKMJFjWXvX1jdv+39nGwP0J7kWM1nMuPZdhAbVp9
	+bFgHraMpW2WCrrH57dUvKO3Mholy448SyxDuRP5Of5C0/qn8v5Ok5GB7HmR5yhK+btA
	owbS2q/c0iiwkSMgwiup+kxdAuVIqYRGCtqfKM85l36xr7YUoJ+rDL3Hcnpq8xyGbBx0
	c0AWnXZuhyc+9YiE/jXUT79It0thPGuCVY3+Cb3Yta/+8cw/p9OBpXH3E1leF6nFXOkM
	1DQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vHmS5RfVY788A79fG3zOGDhlazyW2faSiuIwVCKJXPk=;
	b=gicvYasuVtpw/zCvQIbWsJoes4/OnwuNkDAXSfmTYkCL+byfBf2GXSz/BCh52CKcen
	6iEuGWOTpcwXxKKd/MAsgZJALeJNdFUhfeTLWPKeNYr2qQm2d4qrG+YZqeuyWbwCuCo1
	fZFRb8XsF9410fsnHt6SoQG8bQ8SftXzOqzalRJaTfH6WKSFadEII8y7ngGEYIpfJi/S
	7H8Dukto2jREAlXAqnFXwlcaqj/OM2cQq+v7sbbv7rhCzu57VzL6l7sxMq88pWUmH7Fr
	6ypukyy0YgZIjEGFm3ms2N60xUEaxeCSuNsT1u30xUtgS3i/Na9IdRvAQSuACopKiaM5
	YsPw==
X-Gm-Message-State: AD7BkJLh79CKzW65WWUU/pQybkSRXihW2hK8mW6I6sgHX30tG6/AxhfqPEnQyUu4WNl79A==
X-Received: by 10.98.10.29 with SMTP id s29mr22670279pfi.166.1458924177333;
	Fri, 25 Mar 2016 09:42:57 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8800:5a9a:e493:6aff:fe07:db7a])
	by smtp.gmail.com with ESMTPSA id
	g6sm17551833pfg.15.2016.03.25.09.42.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Mar 2016 09:42:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 09:42:50 -0700
Message-Id: <1458924170-8851-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] site: Cache config vars for ccache
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
X-List-Received-Date: Fri, 25 Mar 2016 16:42:59 -0000

ccache's configure tries to do a runtime test to
determine hw_cv_func_snprintf_c99 and hw_cv_func_vsnprintf_c99
which wont work in OE.

c99 versions of these functions are provided on all
supported libc implementations in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-linux | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 21fcac1..0a752a4 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -42,6 +42,10 @@ bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
 bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
 bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
+# ccache
+hw_cv_func_snprintf_c99=${hw_cv_func_snprintf_c99=yes}
+hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
+
 # coreutils
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
 
-- 
2.7.4


