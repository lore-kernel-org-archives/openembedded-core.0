Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 042B77017C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2016 19:16:25 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id y89so161127492qge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 12:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=7EIFmHIhKqaShoH4Mq1vC5wx1WPstLJ2/581PZKANJk=;
	b=Lf1S50df5X7to6myK+3l03A17kcKA3H/v3N7lfxlW2+YIrmaLC+mNXIVNstwxwM3S7
	D7YeSMQZThnKpI76IB+NLikztc+IluhbA/tbLIyFtEd1LsN+QtWgqzaROOzaX0cRsFAp
	OnI/pqo4LuyciYobSt56laYEeF0AJXWBLSDM4Tx0VhFEk7aybyPQ/8TfblWJrjO0AFJ1
	phscqjdxA5k5MFM0f2BhdGlnxlsdipJasoPnojluGuMKsVXXW7uH/uohNmpaxa1BE19H
	1UvcM4iKSdXKknmHVyMfkcBeLxIQJHrHFEo7g2ChBKX8rVxp3CgIVumzY8Q1CgssdeYU
	AUhw==
X-Gm-Message-State: AD7BkJItNpahJiOuByjwjljKVNM8RUwgvSA/pcR4SdrXDHJlkoypK2UcR2jAkzZVSmNDSg==
X-Received: by 10.140.27.132 with SMTP id 4mr41981134qgx.6.1459797385962;
	Mon, 04 Apr 2016 12:16:25 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	y16sm12821789qhb.39.2016.04.04.12.16.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Apr 2016 12:16:24 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 04 Apr 2016 16:16:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Apr 2016 16:16:19 -0300
Message-Id: <1459797379-8107-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] scripts/oe-buildenv-internal: Fix regression in BB_ENV_EXTRAWHITE setting
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
X-List-Received-Date: Mon, 04 Apr 2016 19:16:26 -0000

The commit OE-Core:ada4639 (oe-buildenv-internal: simplify derivation
of BB_ENV_EXTRAWHITE) changed the format of BB_ENV_EXTRAWHITE
variable to:

,----
| BB_ENV_EXTRAWHITE='ALL_PROXY
| BB_NO_NETWORK
| BB_NUMBER_THREADS
| ...
| '
`----

Instead of:

,----
| BB_ENV_EXTRAWHITE='ALL_PROXY BB_NO_NETWORK BB_NUMBER_THREADS...'
`----

The old format allow for external script parsing easier and there is
no need to change the format as it has no benefit from usage
perspective.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
index be212f2..e04db03 100755
--- a/scripts/oe-buildenv-internal
+++ b/scripts/oe-buildenv-internal
@@ -116,6 +116,6 @@ all_proxy NO_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY \
 SDKMACHINE BB_NUMBER_THREADS BB_NO_NETWORK PARALLEL_MAKE GIT_PROXY_COMMAND \
 SOCKS5_PASSWD SOCKS5_USER SCREENDIR STAMPS_DIR"
 
-BB_ENV_EXTRAWHITE=$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | sed 's/ /\n/g' | LC_ALL=C sort --unique)
+BB_ENV_EXTRAWHITE="$(echo $BB_ENV_EXTRAWHITE $BB_ENV_EXTRAWHITE_OE | tr ' ' '\n' | LC_ALL=C sort --unique | tr '\n' ' ')"
 
 export BB_ENV_EXTRAWHITE
-- 
2.7.4


