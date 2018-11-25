Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7F77260720
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 19:46:02 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id z28so14040253edi.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Nov 2018 11:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z5TXY23oUjjAdoQU6SSh+DgkxD2k+ygsY3DE39j8luc=;
	b=hTJG3jxpsCphaKOUmMa6x7HEUfczbg3fIz+GFVM2iXWVHhu9LVT4A88kq82mIH3WAP
	FiO8WHqiWha33Xl0N5FykbbxU+gQXrF6vT49hP+xGrawUXrWcQu1EB5s5vXK01xhYn/6
	6ahSN53QFFcuxwYBycbOueZ7hmpWqD8NlV1QC4wurGQg0hFxBh7k/CxhnnQK+HsValqd
	t8QC5UaAAFkTqFHte+RUUD9W62U65I02lB4kfqmO/tz1HlAy/NCCULmeSpH3MBwFGjIk
	E8Mp5cEkOUrGSTpOj3X6/G8RgL+PuBej012KrD9Em3uefOjVgcx8SbssEBkBRy4nJ1Fh
	VEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Z5TXY23oUjjAdoQU6SSh+DgkxD2k+ygsY3DE39j8luc=;
	b=IbN4y6kBq2l6NNpoKO605HAkxUtSomxtsqgsCn2aaR3mYPSUDtQG3lNh5kSh8SI+cn
	ENbOrZYjB24u8JfRUmL3PFj6+pxTlob0tm3BWeISjHwD0Vm08MUnbqFJ/4HjqxQvB9+U
	5uy+NG9XudN96fh0hhDyD1afl8x2Rlny/d6OuXLlJQi+7nmHh1OerpEJMRDe6tkDvO6x
	GN9Gd7ExVJQTGt7EsRSMKhfCR/++aCZ4pp4VhpsRlEYO/8L3SjiEl/Pg1lllWy81qr9H
	cVyCxbnX1LT/5eK6RB17UemGEb1eJW75ZMm72XuvRkqWy2rfSAK0DePwOcfK0HOUATQc
	Rsww==
X-Gm-Message-State: AGRZ1gKRWM1Oa6hy8owePvTb7t+XZG3KKkSDdBnEGUSUGm83lA+ZL8T9
	PxRRk8Npezpn5hsAXYWAsdfM99h4
X-Google-Smtp-Source: AJdET5dxaP8jPFeAIK90Qu8fqNepASeygsUEhI/G7ht0RLher62N4ZiK2+vdij/bgJQUBZXVJL8YrQ==
X-Received: by 2002:a17:906:5c45:: with SMTP id
	c5-v6mr17945954ejr.83.1543175162556; 
	Sun, 25 Nov 2018 11:46:02 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id b2sm7879750ede.30.2018.11.25.11.46.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 25 Nov 2018 11:46:01 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Nov 2018 20:45:02 +0100
Message-Id: <20181125194503.24555-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 0/1] systemd: fix PN-container package splitting
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
X-List-Received-Date: Sun, 25 Nov 2018 19:46:02 -0000
Content-Transfer-Encoding: 8bit

Changes from v1
  RDEPENDS_${PN}-container += "${PN}-journal-upload...
to
  RRECOMMENDS_${PN}-container += "${PN}-journal-upload...
to handle the case where journal-upload is not built

Tested with
  local.conf:
    DISTRO_FEATURES_append = ' systemd'
    VIRTUAL-RUNTIME_init_manager = 'systemd'
    TEST_SUITES_append = ' systemd'
  command:
    bitbake core-image-sato -c testimage


Adrian Freihofer (1):
  systemd: fix PN-container package splitting

 meta/recipes-core/systemd/systemd_239.bb | 61 ++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

-- 
2.19.1


