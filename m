Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA207D5A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 May 2019 19:41:08 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id y8so3082884ljd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2019 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Gz89A9AGeEDnWo/vTttensu/p0jIuP1EXSMrecljRSY=;
	b=Sod0jRkhxN4Ulvp6VB98of1hMJ/kghZEYuX4HLP2axY7cn1xyJAEgF+tM2mtlDQti6
	Rk/MelJArlhMfQRMhutJdEwwWUOymnMUyvJ0OgE8k7yyRBw/8RwwCtzG4Vc22Qk52lT5
	qMORdm1nMID3iC7DGpkpclX57f7jbJCqZ1VfTrNARp7XfrUoHsA9TdBvHLHGfBAUtYtH
	PMr6SCn1tOLqrhcCizBDTxi7JdLg8U6wM/aijJWVbu7KlqPQHMizutzfIOi5j/MxbPLX
	kjZJsNYIjZKHj3m1OW8KoI/iChBa+8tQV6FFg27TABG+tr5tY1znpWw+ySy4bCsWZ9cn
	l3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gz89A9AGeEDnWo/vTttensu/p0jIuP1EXSMrecljRSY=;
	b=gkoZUlSkE5zZyWpjr8cgT8zGH7bOkmc9xs5a4vkK+idT/PbsCxigf2Z8CqdN/0Duab
	52WxvOAPu3IGcVw9pMHQs1E/CFem6nr1ZYCLheblIi+elaXVshk1jwWHuRTnJ8rtww/q
	iw5trQP4YjT+7U45SE+URybFiLGfXadAXVd5KCW6iylav0/Hu5R0SUviIi4LQ0kWqlQT
	WnGI3X2B6kl2NGkxxwegxoHmFYWW+RA42nt0SSBuKbipHV62Q2hLpNIpvBJBTvGS+R/L
	uIl11DnUncf2KrU21mmnSDa7zk+R9A3o0i0riZZDysZsc+HZcv8HK1qXgz1F5DoUHQet
	4hWA==
X-Gm-Message-State: APjAAAU1rPsW/oGQsnWrQ7JiDKWfZRKVoSwEKGWoIZ8lH27dkLsDfKMY
	ljy5K8nDD3CPdm2rl3W2mTLNF3tCMsg=
X-Google-Smtp-Source: APXvYqy4Rdq5ZMOZavyYxvFUsX1e4vKY768cLToWbbigow8BG8nev4Cde6AIDFiAeuQ9m0wxiEQEZQ==
X-Received: by 2002:a2e:9812:: with SMTP id a18mr3109876ljj.146.1556826068558; 
	Thu, 02 May 2019 12:41:08 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan
	(c-b09ee253.022-417-73746f13.bbcust.telenor.se. [83.226.158.176])
	by smtp.gmail.com with ESMTPSA id
	s26sm8968996ljj.52.2019.05.02.12.41.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 02 May 2019 12:41:07 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 May 2019 21:40:53 +0200
Message-Id: <1556826055-7896-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: gerard.salvatella@toradex.com, luka.pivk@toradex.com,
	stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH 0/2] Fix a libxkbcommon runtime error
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
X-List-Received-Date: Thu, 02 May 2019 19:41:08 -0000

From: Ming Liu <liu.ming50@gmail.com>

We had observed a runtime error when we run a QT application on weston
compositor, as follows:
| xkbcommon: ERROR: couldn't find a Compose file for locale "C"

after some investigation, we found the libx11-locale is being required
by libxkbcommon at runtime, or else we get the above error and the QT
widgets could not get the keyboard events.

To fix the issue, I think there might be two ways:

1 Allow the libx11 to be built without the requirement for x11 being in
  DISTRO_FEATURES, as this patch series are trying to do.
2 Create another libx11-data recipe to provide the locales of libx11.

I would like to get your input about this fix, please kindly help me
review it.

Ming Liu (2):
  meta: unset REQUIRED_DISTRO_FEATURES for libx11 and its dependents
  libxkbcommon: RDEPENDS on libx11-locale

 meta/recipes-graphics/xorg-lib/libx11_1.6.7.bb       | 2 ++
 meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb       | 2 ++
 meta/recipes-graphics/xorg-lib/libxcb_1.13.1.bb      | 4 ----
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb     | 2 ++
 meta/recipes-graphics/xorg-lib/libxkbcommon_0.8.4.bb | 4 ++++
 meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb       | 2 ++
 6 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.7.4


