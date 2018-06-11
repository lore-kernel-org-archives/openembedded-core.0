Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7BC789C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 08:05:06 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id i83-v6so29107414lfh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=U/4ciDyl4Q0iJbIdkhCzoroKV5ZYrLyr408FBzmEwY4=;
	b=FHwIbvCYb+uBT3qZeaaXUl5ot7HSpvuqvtoe7v4BaQJFK4+3i2wqnm+siaejIhzEXf
	NVMftiYpW5euJvDpNMmkFywaT8ums68wu0XOCHhypN8GeAM62f3QN0v+cdEnAJ8IRt7k
	c+ENhtfVyZL3QJRAE4og6R+xDbzrRYZgqhn4Qd7cIDD4FgaMO0g9p4+6UU9LBbY3JJJf
	/vPkc5lFI1LGmFtTLjVBUjIQqZHZNMfrUf42LT3xyzb2wOaY9oOm3WycWOcuSMDxPFDo
	MvFOH4jzPydWmxPeD3v+/Y09Lf9hemNKYStH1xHZ5PUmBCVmFIeFYtCt1cNWodmg23v+
	tISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=U/4ciDyl4Q0iJbIdkhCzoroKV5ZYrLyr408FBzmEwY4=;
	b=P6vjHwBYD0y2xAvDtBKjCxl4Ch/FD3EmpsFPcNeGd4orCZe3D1+t3XJ0qz67j+FGt3
	vPjruGGvv57v8kVlunP6TDMs90mngc3Q2b//lCX+x/Y4ridQnhpgDtA4JeGjmW35tj/g
	mLLt6UkIWKegxPwqLd/Z5Tm8iDJOQ4uu32ou6p3LQgtRVCeQbG+wwg7SVKJ7PzkzQTSp
	2Mwko0ljR7GU3nwTb9K5gsSxvi8J9KoJj76F1eNVrvX5o7+9XGlQ4HOb0aHwkXydWnQV
	PgSuntQBNej0VEWAqFp5vIbrNp0pJzvvmduGiGAApBDQSnT0UFs1jwIKjb+OJoUxv26+
	jGcg==
X-Gm-Message-State: APt69E3mDkZKno7B1WayqG+EoJMcsibpnzUq25r5T2jOCvbuoYDlZbVv
	SjL1a7TArUzKhOJXZiDY1VGkO1Xq
X-Google-Smtp-Source: ADUXVKL0pUIKPCSejA8TiF34WTFvRprxtrT1fQ4uIysgywpF9pU7SjbLJ6+faxR0ZhLmmykttxDmuA==
X-Received: by 2002:a19:e9d3:: with SMTP id
	j80-v6mr10208378lfk.129.1528704307278; 
	Mon, 11 Jun 2018 01:05:07 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm7787074lfy.53.2018.06.11.01.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 01:05:06 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Chong.Lu@windriver.com
Date: Mon, 11 Jun 2018 10:05:04 +0200
Message-Id: <20180611080504.16006-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] xinetd: Fix systemd service for systemd>237
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
X-List-Received-Date: Mon, 11 Jun 2018 08:05:07 -0000

SystemD 237 implements a stricted PIDfile handling that breaks several
daemons [1].

Change the way we start xinetd, mimicing other distros [2].

Fixes:
root@qt5122:~# journalctl -u xinetd
-- Logs begin at Fri 2018-05-25 14:33:29 UTC, end at Mon 2018-06-11 07:33:08 UTC. --
May 25 14:33:31 qt5122 systemd[1]: Starting Xinetd A Powerful Replacement For Inetd...
May 25 14:33:31 qt5122 systemd[1]: xinetd.service: Permission denied while opening PID file or unsafe symlink chain: /var/run/xinetd.pid
Jun 11 07:27:24 qt5122 systemd[1]: xinetd.service: Start operation timed out. Terminating.
Jun 11 07:27:24 qt5122 systemd[1]: xinetd.service: Failed with result 'timeout'.
Jun 11 07:27:24 qt5122 systemd[1]: Failed to start Xinetd A Powerful Replacement For Inetd.
Jun 11 07:31:38 qt5122 systemd[1]: Starting Xinetd A Powerful Replacement For Inetd...
Jun 11 07:31:38 qt5122 systemd[1]: xinetd.service: Permission denied while opening PID file or unsafe symlink chain: /var/run/xinetd.pid
Jun 11 07:33:08 qt5122 systemd[1]: xinetd.service: Start operation timed out. Terminating.
Jun 11 07:33:08 qt5122 systemd[1]: xinetd.service: Failed with result 'timeout'.
Jun 11 07:33:08 qt5122 systemd[1]: Failed to start Xinetd A Powerful Replacement For Inetd.

[1]: https://github.com/systemd/systemd/issues/8085
[2]: https://github.com/felixonmars/archlinux-community/commit/e49040636737fdb09031e75ec4d73a580f80676b

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd/xinetd.service | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.service b/meta/recipes-extended/xinetd/xinetd/xinetd.service
index d5fdc5bc29..6da92f2bf5 100644
--- a/meta/recipes-extended/xinetd/xinetd/xinetd.service
+++ b/meta/recipes-extended/xinetd/xinetd/xinetd.service
@@ -3,11 +3,8 @@ Description=Xinetd A Powerful Replacement For Inetd
 After=syslog.target network.target
 
 [Service]
-Type=forking
-PIDFile=/var/run/xinetd.pid
 EnvironmentFile=-/etc/sysconfig/xinetd
-ExecStart=@SBINDIR@/xinetd -stayalive -pidfile /var/run/xinetd.pid "$EXTRAOPTIONS"
-ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
+ExecStart=@SBINDIR@/xinetd -dontfork "$EXTRAOPTIONS"
 
 [Install]
 WantedBy=multi-user.target
-- 
2.17.1


