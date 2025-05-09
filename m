Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86320C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.1423.1746804247694993181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yjfRE5fx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7403f3ece96so3217485b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804247; x=1747409047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m63Vof5V5obDChBb2q6z5RcHudSCDZobec83vydlu5A=;
        b=yjfRE5fxU84/gufjNDXDzH8ikS/5afsBCC3IALjn569hjQEoX1s2ujwhwqJ13c8XCp
         V1G4L6E5+7pYuaZjALyk56mrIYZwPnJQD7cA8zuR7g/W2FwM72+M8Ys00vABB0pHXY8K
         ezSMDkD9cxqw+NmBAoozCZKhyOQYY711cvGmuWQLc9gxhid5uV6Kz7lo+3yQcCsJI0Xm
         slOuKd9h/9RvOy1gVQm2/7nRnj1x5nRbIij0nTRlbLWEUwJmfygwH8ZHO4asZoRgwuM8
         eJwvCtC/eymP/3UxdUt25KIolsLXUhiIAsjdWuu9nTvxIBDKCxGiLZh/wlrTIuPsITca
         uQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804247; x=1747409047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m63Vof5V5obDChBb2q6z5RcHudSCDZobec83vydlu5A=;
        b=QX2OJXnKCgHxCUgtviC3sInTWKy9m4kKNiED3h+iE2G8vLBJyGGOoT2hY+UxvJrZTE
         C0r50pRpl59I3W106W2qURC3eoC7NmaSiEol1x7hPzHBMjXLsgFEAb2159L2tbR2Vii5
         ShyGlhGqopupvfQCtm4GKIB0F64K6qyFEHtfgzFlSSgTM+kdJPafkDKgxV/zjS83c7iY
         nZgDF5DWSuEIyAu3LHnRFT2PChTycCSQjdLSqpm9Y2iywSawykYPtK2Eeraz0CnSmpFk
         0WB/pGWUVdRweLgNRwUBSSThXaYqz6HVZ+v+NE1cXMlf1LPJKq+9h7k2pQ3WUwEZ6FYl
         /qew==
X-Gm-Message-State: AOJu0YzTvebX/BFQC5iZ4OPJFvevArNZkSYN9fsZlQQN3ZrE8o3tZ5lO
	EMQlh3GrjB9XRR9jBvPtnGAbOJgz8bzB0vMc0X3PvG7OY16aC9UpHjkJv++qE79w0CcNko3aNeo
	l
X-Gm-Gg: ASbGncsou8mTOyXiQjUHWXeDXYTKcX/xN8/dHDUBgEzIi5QSDi8otVc/BaeO5IUeZ/j
	WgA7qAwEis6gbbri3yi/pOG8I2UFoeWm4Qf8TVHgu2P04Vm6LuKVmU2Pd+g1+onOk6vGIl+vbnt
	+moPSN1HlOMv+PH45UM2545nmMpvp4DAuWXNziPlgqI0khDCz0VgW5YzXeNbJhy38MPkjDhqjRi
	AuHgsfu4N23c8/bICY2TAQ4Sxar60MezpLPnUeC8I4A5r4SbjtE+6CeswqfRsO+6/uJ7TNx1wyx
	cZFhLXzzS2g358J9X7LlcEs8D5xumqVn
X-Google-Smtp-Source: AGHT+IEiMV2BcXyDVa+2ktPr7SkEgLOUzvlGRIc824dx+ixDHd9evZxsi7LT6l65L49LqQKjlm44fA==
X-Received: by 2002:a05:6a21:1518:b0:20e:4f4b:944a with SMTP id adf61e73a8af0-215abc297ecmr6030477637.32.1746804246919;
        Fri, 09 May 2025 08:24:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/17] initscripts: add function log_success_msg/log_failure_msg/log_warning_msg
Date: Fri,  9 May 2025 08:23:26 -0700
Message-ID: <1956cb8e04c586b555f51bc68b74ad5d5cf1a043.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216218

From: Changqing Li <changqing.li@windriver.com>

* add function log_success_msg/log_failure_msg/log_warning_msg, some
packages still use these functions, like mariadb, refer [1], without
these function, with sysV init manager, mariadb will report error:

root@qemux86-64:~# /etc/init.d/mysqld status
/etc/init.d/mysqld: line 383: log_success_msg: command not found

* remove RCONFLICTS with lsbinitscripts, LSB support already remove in
  [2]

[1] https://github.com/MariaDB/server/blob/main/support-files/mysql.server.sh#L104
[2] https://git.openembedded.org/openembedded-core/commit/?id=fb064356af615d67d85b65942103bf943d84d290
[3] https://refspecs.linuxbase.org/LSB_4.0.0/LSB-Core-generic/LSB-Core-generic/iniscrptfunc.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../initscripts/initscripts-1.0/functions     | 21 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 -
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/functions b/meta/recipes-core/initscripts/initscripts-1.0/functions
index 35aebd4a55..7fc19c808b 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/functions
+++ b/meta/recipes-core/initscripts/initscripts-1.0/functions
@@ -92,3 +92,24 @@ passed() {
     echo -n -e "${BRACKET}[${SUCCESS} PASS ${BRACKET}]${NORMAL}"
     return $rc
 }
+
+log_success_msg()
+{
+    echo -n $@
+    success
+    echo
+}
+
+log_failure_msg()
+{
+    echo -n $@
+    failure
+    echo
+}
+
+log_warning_msg()
+{
+    echo -n $@
+    warning
+    echo
+}
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 98693fa66e..0bc078c5eb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -54,7 +54,6 @@ RDEPENDS:${PN} = "initd-functions \
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS:${PN} = "${PN}-functions"
 RPROVIDES:${PN}-functions = "initd-functions"
-RCONFLICTS:${PN}-functions = "lsbinitscripts"
 FILES:${PN}-functions = "${sysconfdir}/init.d/functions*"
 FILES:${PN}-sushell = "${base_sbindir}/sushell"
 
-- 
2.43.0


