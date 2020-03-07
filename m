Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D1D496026D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 22:37:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t11so6540274wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ad18k8j9yuBpPqub041vDW0r6p4W06wf9p971142HLk=;
	b=Q9QZqfjS0SMxV1u7YGWZ6KdOLy5/UisTLKysMVeUnnLfMPHm1Ilx54Bee44XTeFcmc
	h2f8PLf1L1jZLqXw2/q/0TIkfthlNq3w8rw+U0rLIYKwNA4Xw2J/J+T+B2h3HJkLJkOW
	4QCXYaL7hzcbvEhz7qIBOe743S0yp5/nxdjtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ad18k8j9yuBpPqub041vDW0r6p4W06wf9p971142HLk=;
	b=WTYR7LdBGQzDh45w1PhayjRuNqksSSzLlp6xm+QOaNmYlGmjhRilQHvtc2Jiezk6nj
	qDjO25xZ7G30Fv0wOgU1oHOALWOJkkgXAC7D9IRslZQxlxpZ/zY8pzbiKaB0AFRw5vgn
	R5K5t/vAK6D2fHKf9S0+g4eaURp9jAUXxnxnl1V83peGzYczB98AQzEgqK+Uy5z2N3Fr
	61KIJoN8Z9oDtfsSVz3DFD7966O0riU4guwlgVAF/siLzl/BGsLp4d7593x6PFMNaWia
	2AN1dUCJkcG/zLgEhFgI0f7CosGHuKWYS5oREeCAMBWgQw5QF2bYqJEePDYIC1u+t/M3
	LtUQ==
X-Gm-Message-State: ANhLgQ1Zt1JSbERbsU5QtGxW5m9Fs+yHgqNRmrykbVeiXDWXk1iHQ+zR
	afT0+9r9LubVnSP++D4YHn4B1blZhAY=
X-Google-Smtp-Source: ADFU+vvz3Usc+TJBfmH0O/uwfYndu+z26hv1BSfwpFK0gbVaEUa3k4fbjAM6k1pBK5Ss73fnqJUwCg==
X-Received: by 2002:adf:aa0e:: with SMTP id p14mr11532279wrd.399.1583620670219;
	Sat, 07 Mar 2020 14:37:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q3sm18459574wmj.38.2020.03.07.14.37.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 14:37:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 22:37:47 +0000
Message-Id: <20200307223748.1178851-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 1/2] glibc: Explicitly disable msgfmt
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
X-List-Received-Date: Sat, 07 Mar 2020 22:37:50 -0000
Content-Transfer-Encoding: 8bit

If configure is rerun it finds msgfmt from gettext-native which is installed
during package_write_ipk|deb and means builds are not determinisic.

Whether msgfmt is needed is debatable (libc.mo files arne't generated without
it) however we should at least be consistent which this patch ensures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 58d2ba7bc44..23a6ca99ae0 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -9,8 +9,11 @@ inherit autotools texinfo features_check systemd
 
 LEAD_SONAME = "libc.so"
 
+# msgfmt could come from gettext-native but we don't depend on that and
+# disable for reproducibility
 CACHED_CONFIGUREVARS += " \
   ac_cv_path_BASH_SHELL=${base_bindir}/bash \
+  ac_cv_prog_MSGFMT= \
   libc_cv_slibdir=${base_libdir} \
   libc_cv_rootsbindir=${base_sbindir} \
   libc_cv_localedir=${localedir} \
-- 
2.25.0


