Return-Path: <kristian.amlie@mender.io>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5F56D72F62
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 07:16:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 70so35553269wmq.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 00:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=kgCDwWQKG+GZ4C3f93RrIboYk11ovScz74QLG6mPpTc=;
	b=ccUn0wk8ABOaMt6vNVSpPElCdP1STHq+fxIVrK/GJjB3kOk35lI+YSvPRDD9N/arYH
	tn2dXPuTIqTrAW6ln4kaL1tpFW/i/iEWkR9VrQi2zIzHAPgVifrbpPUKzStMzE6Na11v
	VrlCZoV0foYupo++qFd1LhayfJ6g11TegZZh0lBtalivtLR8rAq9XLD4JHgQr/WvspJU
	wGneXQzSmsH2XwZhdgg9N56ojvJpMOzdl5ukH8FDvP5afXvaCB0wlOrpzvg5UmtZtGmn
	9m0uHYGrXw+lU5oOd8E8sRKuv9HxMn3nglZntT0m9NiYAOcwLrR3md3czYja71f5z3tj
	k11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=kgCDwWQKG+GZ4C3f93RrIboYk11ovScz74QLG6mPpTc=;
	b=mmjo8EoT2V3xZGZrQPb8uC8L6HfsiwH9piM51ii1S6E6i8s4Fst4MYpYE8BuXJVABc
	qjtWSXg4w3q1Q086zgmfzmU/xQRkiNJdNKP7E5OTz642bgji7A30+HotwgZBIvg2mBXP
	rreLGbe0SUpE+W20PGgmRDy8dDX1l/S95sDm1oeEUn2UqSs2xjQDc1Ns0Wspk+OQmxgh
	P0XNF3nGLi0+TE7ZtzZWrj/mQz2zrh94wEfqYLHXdrrQoDAKBe2VxOG10nBjJ738jggl
	DYSSUHkI6XdZxhnCFSGASG438KWjMqjoAeJBIlYArx3VxI1xMMU98OGOPMib/KCBzuXK
	AbVQ==
X-Gm-Message-State: AODbwcA/mm7PeqQ7lOe4Jvy65sUDTYpi+zZn00NW6Zmezt5PWIjmNb86
	d9Xut0BUOxgeVxoA
X-Received: by 10.80.188.1 with SMTP id j1mr2207113edh.100.1495091779924;
	Thu, 18 May 2017 00:16:19 -0700 (PDT)
Received: from [192.168.1.29] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	h29sm2117840eda.45.2017.05.18.00.16.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 May 2017 00:16:18 -0700 (PDT)
To: OE-core <Openembedded-core@lists.openembedded.org>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <d84852f6-9ce4-3f9a-cb7f-fa92c6a74462@mender.io>
Date: Thu, 18 May 2017 09:16:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Cc: Joe Slater <jslater@windriver.com>
Subject: volatile-binds and DNS
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
X-List-Received-Date: Thu, 18 May 2017 07:16:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

We've discovered that one of the recent commits to poky has broken DNS
resolution in our image. The commit in questions is this one:

-------------------
commit fcd48092d7bcab0cad2606e65332da62420935ad
Author: Joe Slater <jslater@windriver.com>
Date:   Fri Mar 31 03:06:33 2017

    volatile-binds: correct some errors reported by systemd

    systemd-tmpfiles-setup will fail at boot, so we suppress
    the default versions of etc.conf and home.conf.

    We also make sure that /var/{cache,spool} and /srv are writeable
    if they exist.
...
-------------------

The problem is that this suppresses the creation of a /etc/resolv.conf
file, and without that DNS does not work.

The file is a symlink to the resolv.conf that systemd provides in
/run/systemd/resolve/resolv.conf, so it could potentially be
prepopulated, but I admit I don't fully understand how this fits together.

Any advice?

-- 
Kristian

