Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C754160721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:45:35 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n63so116984772qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:45:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=t7u35p7ZjV5cjhO20kVPsxx83/FQclBVY0zf2DI27gw=;
	b=YFPPc5VgErLn/jtiFOdKtC5b5MsFt9ebcsXW1cCKEUmPJdXfi53cxtDsGRjWdq3VTF
	RzQE7/eEmE/eYeLIfh9/sSnlsXw8YKqFRPNm988koeM4oxw8s/q2Q0C0rxqu4EiNMn5J
	OrnrT6wtPhLs0Eg47L0vQlY8SWwja/HXqvMh/JyFCGsgOeA4ddHLXxFY5Ipo8gJhieMy
	iycX/LqWGBSGCosT1n9as/KDwE4lWftiNuZUcbgyXq0fSF2blxk4+ydNFCdWlQAh71IR
	9O7JnGWjVbe5ftIyP+GxOzKzRbH8CRGU3whHAwvbKPJBZodIMDIBsHWjZZiMDHaWzk1E
	pXQw==
X-Gm-Message-State: ALyK8tIh/9RuYAOmzBXw1YITVmOvv5hmf0t33hYbdP7R841Kip27h2uJTSXHEIO/IL8pXA==
X-Received: by 10.55.156.149 with SMTP id f143mr109237qke.9.1464036336359;
	Mon, 23 May 2016 13:45:36 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id b34sm835030qtd.32.2016.05.23.13.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 13:45:34 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 May 2016 17:45:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 17:45:24 -0300
Message-Id: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Mon, 23 May 2016 20:45:37 -0000

This patchset leverage the OpenSSL certificate handling so it works
aligned with Debian and other generic distributions regarding where
the certificates are stored and how they are installed.

This all started when debugging why SSL certificates were not working
properly for a customer which was using QtWebEngine. It turned out to
be the integration which was not complete so this patch addresses it.


Otavio Salvador (3):
  openssl: Add Shell-Script based c_rehash utility
  ca-certificates: Use c_rehash utility
  openssl: Ensure SSL certificates are stored on sysconfdir

 meta/recipes-connectivity/openssl/openssl.inc      |  26 ++-
 .../openssl/openssl/openssl-c_rehash.sh            | 210 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |   1 +
 ...01-update-ca-certificates-remove-c-rehash.patch |  46 -----
 .../ca-certificates/ca-certificates_20160104.bb    |   1 -
 5 files changed, 229 insertions(+), 55 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-c_rehash.sh
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-update-ca-certificates-remove-c-rehash.patch

-- 
2.8.2


