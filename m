Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id DD7C860B3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:26:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id f7so22479189wml.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SV6sd0BXf0YPNi9Fr0dRENuVntSZdmIsrdHtbGWYCNE=;
	b=G/XO3D9xAYqDkRtKyPnj5Uk3zaLs8UZX9MB6WuS0VX7bVFqGyZM4zu98ci26ddI6xy
	J88Ih8uMoxv4GR6E4EX5Q/vfD2j5dDHIHSsxtdj9OthxaCV848dRgo8ZvTzK746BQcqx
	qr1WTkVzFe0setyHkeqRZmyOpaF8vA1k/9ClACT5RRhR8TVTs7jvVq53bLDZfgnSDp5L
	yQ895PF4u8IMO50hvFFv0dYEeprUx5N02gQS+vLxJ9TZ1rXwXtZzNj0BEYnJdera//zP
	8C+LTDgznHOHv1psj8t/2AfrNa2FF4HMF0IlXln9qfuYGjuKopo2dn2eFLO6Z7n3moSY
	ttmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SV6sd0BXf0YPNi9Fr0dRENuVntSZdmIsrdHtbGWYCNE=;
	b=C2g2YBvUJ1ZrIpQ9g4j0UcCcAnoSbzAdMsooFu0evn0s7PtUGZFQNnfSb41txTf7LO
	MoyLR9rd/KRGsZpvCRcUV7+J8lPjwTGIcOsFSml5CYPd/owtGmuHk3ji6ngzFmcSPOE8
	2tCceaBLj7tmF/RqEsISz4K28lEFuLwkpnpiYIm2SroBvubTsZGalwuzKUj9Xn98VUB1
	zF7HEV4MjvfyAYA1RmAxsaB4AeyBS61HZreYfgZnmK5r0maRZWt19nVnS7fUMO3wUXdc
	In6A3XivC/tHyVM6dkpEOsw+D4UmThG6Tz6+33l86hRVJQa6os1MaXttwbl1xmO34Hi5
	oOpg==
X-Gm-Message-State: ANhLgQ2snmsjlMvJB4ZzUpMJ0ZdIC++of3XlIQgPenARV437fGRUG/GM
	kGbgBETI1J6jvpnF62CGddRZxKBD
X-Google-Smtp-Source: ADFU+vv2dMctOsf+YJln8nlkjsBQj91AAUpmEyC5rTQsIul449QwZFF6mnSnzkxmKLWGKPR+1WvfTg==
X-Received: by 2002:a1c:ba85:: with SMTP id k127mr5511386wmf.63.1584458819210; 
	Tue, 17 Mar 2020 08:26:59 -0700 (PDT)
Received: from wsadrian2.lan.ffah.ch (c-82-192-240-69.customer.ggaweb.ch.
	[82.192.240.69])
	by smtp.gmail.com with ESMTPSA id q8sm371249wrc.8.2020.03.17.08.26.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:26:58 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 16:26:49 +0100
Message-Id: <20200317152650.2131885-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH v4 0/1] runqemu: support multiple NICs
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
X-List-Received-Date: Tue, 17 Mar 2020 15:26:59 -0000
Content-Transfer-Encoding: 8bit

It's a re-write in comparison to v3.

Two new QB_ parameters are introduced: QB_CMDLINE_IP_SLIRP and
QB_CMDLINE_IP_TAP. These parameters are by default the ip= parameters
as they were previously hard-coded in runqemu. However, if, for
example, more than one network interface is added to
QB_NETWORK_DEVICE, the corresponding kernel parameters need to be
configured accordingly.

Adrian Freihofer (1):
  runqemu: support multiple NICs

 meta/classes/qemuboot.bbclass | 14 ++++++++++++++
 scripts/runqemu               | 16 ++++++++++++----
 2 files changed, 26 insertions(+), 4 deletions(-)

-- 
2.25.1


