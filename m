Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 372D26C102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 21:52:13 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id j42so4367154wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2019 13:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rILSsfxyIcbCoa/bDxAW1wduRoOSEOHut5Oz6opguYI=;
	b=tuThHdbYEsKVuGLa6kKVo02Op0vY6nccO3/N+Bqett0Y1lqgtysrJILVV0bxOKHyll
	M4iilfmuaSUGvoznDlglF3AfYLxOc80q5hqT02XAcTtlD+8EpLaIuICEkR3dANa7G2Qu
	mP6tjyYAIy7+tstSGiiXDFuvAt5FmzQPa8Jdzh9smR7YyBRzIqMJS+Q+fwoblYoSo1CE
	oYH/qjv5bdMDiRQwgxNCUrEctU0rIEwr61w5lCmDZ0oCga+LcdZtz2/J3/r5usxxN8uv
	/JzA+0x2nQSPydK6kUbcVFz+T75HUbsrUENZxpR1fJ8sHYdTRN/c03hmIjpB7C5Ufa6t
	OQMA==
X-Gm-Message-State: APjAAAVYL0Q4IGHYqc9ktXOr5YTwaitvPlIfuJmGNBph0iM8B8O0aes9
	UavdSTlN8dFaW3yFnJR4QwO1EiTp
X-Google-Smtp-Source: APXvYqzk2tHq7IAcrHmj5c8KrgWGgg7Yqx6/fmvElGve/Ju68uCDMfN1CtfTUkJZ9CHJ9avB3C4VNg==
X-Received: by 2002:adf:c746:: with SMTP id b6mr8262958wrh.298.1576187534554; 
	Thu, 12 Dec 2019 13:52:14 -0800 (PST)
Received: from tfsielt31850.fritz.box ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	v188sm7723704wma.10.2019.12.12.13.52.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Dec 2019 13:52:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2019 21:52:08 +0000
Message-Id: <20191212215212.27089-1-git@andred.net>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 0/4] support OEQA inside container
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
X-List-Received-Date: Thu, 12 Dec 2019 21:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

With these patches it is possible to run bitbake inside a docker
container and still successfully execute the OEQA tests that require
the target to talk to a temporary http server spawned on the machine
running bitake, e.g. using crops.

This wasn't possible so far because:
* we need to map a port from outside the container into the container
  for the target to be able to reach the http server
* we need to pass the IP address of the docker host to the target,
  e.g. in the OPKG repository URL, but we can't bind the http server
  to that IP address, as the http server is running inside the container
  with a different IP address - the bind would fail

To make this work, TEST_SERVER_IP needs to be set to the IP address of
the docker host, and the port that is mapped into the container can now
also be specified in TEST_SERVER_IP, similar to TEST_TARGET_IP

Cheers,
Andre'




