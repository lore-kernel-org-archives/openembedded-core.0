Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 752C960670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:55:27 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id 90so48466982qgz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 02:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=WsT3YXGbeEAfR/KLlug04aBRdqbotbeLKh0GEQibBr4=;
	b=Qe6dd6bgXP2mt1zKuThw3wkrZcJSO4qevVVfezEW7XEoB4Q7bttV6u86SyAK3n01nn
	tIuwX80euz5MICkfjRhOImsLKggMP+EigYzsAX6c8twJu7ER4Ye9y2MkkPK8ALex/BZp
	hwcaKgQTT2ZzULMRiG91scDYXPMQEbU62gyMRsJoNzJktNwRJBOQF7aiwF5JDtwlB8k0
	i2gxxp+Kf+unxZXpyzzFQWyW+LJGqPP1s9BMF0Bf7E3zFxW4SNcKQUGDZ6dFQmlBld13
	Lw7ChS7QH166DYD+VIvRCcUSGnX20Q81CDbipuUA8/faspHcqrnc7SvHtIILzxE4W+32
	KXZg==
X-Gm-Message-State: ALyK8tJvAPd3T/O+LFMkUCIHfW3zgJqSWN3sekQ80ZSyfXUkMkEY+5xljGYuT/yjLBvw3A==
X-Received: by 10.140.95.68 with SMTP id h62mr12460811qge.33.1464342927612;
	Fri, 27 May 2016 02:55:27 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c35sm2371160qga.14.2016.05.27.02.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 02:55:26 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 27 May 2016 06:55:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2016 06:55:15 -0300
Message-Id: <20160527095518.21761-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Fri, 27 May 2016 09:55:27 -0000

This patchset leverage the OpenSSL certificate handling so it works
aligned with Debian and other generic distributions regarding where
the certificates are stored and how they are installed.

This all started when debugging why SSL certificates were not working
properly for a customer which was using QtWebEngine. It turned out to
be the integration which was not complete so this patch addresses it.

Changes in v2:
- Add rdepends on openssl

Otavio Salvador (3):
  openssl: Add Shell-Script based c_rehash utility
  ca-certificates: Use c_rehash utility
  openssl: Ensure SSL certificates are stored on sysconfdir

 meta/recipes-connectivity/openssl/openssl.inc      |  26 ++-
 .../openssl/openssl/openssl-c_rehash.sh            | 210 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 ...01-update-ca-certificates-remove-c-rehash.patch |  46 -----
 .../ca-certificates/ca-certificates_20160104.bb    |   3 +-
 5 files changed, 231 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch

-- 
2.8.3


