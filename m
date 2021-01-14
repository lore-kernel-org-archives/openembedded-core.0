Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.4747.1610608375363214384
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 23:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: kamel.bouhara@bootlin.com)
X-Originating-IP: 78.193.40.249
Received: from localhost (unknown [78.193.40.249])
	(Authenticated sender: kamel.bouhara@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D33A9240008;
	Thu, 14 Jan 2021 07:12:52 +0000 (UTC)
From: kamel.bouhara@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
Date: Thu, 14 Jan 2021 08:12:33 +0100
Message-Id: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all,

This small patch series aims to fix the following build issue faced
with some npm packages:

DEBUG: Executing python function do_fetch
DEBUG: Executing python function base_do_fetch
DEBUG: Python function base_do_fetch finished
DEBUG: Python function do_fetch finished
ERROR: Failure expanding variable TUNE_FEATURES_tune-armv7at-neon, expression was ${TUNE_FEATURES_tune-armv7at} neon which triggered exception RecursionError: maximum recursion depth exceeded while calling a Python object

After struggling a lot, I figured out that this only happen for npm
packages not having dependencies listed in their shrinkwrap file (e.g. bcryptjs).

Yet I still didn't got how is the json parsing impacting
the python context here ?

Please feel free to comment.

Thanks.

Kamel Bouhara (2):
  npm.bbclass: make shrinkwrap file optional
  recipetool: create: only add npmsw url if required

 meta/classes/npm.bbclass             | 31 +++++++++++++++++++++----------
 scripts/lib/recipetool/create_npm.py |  6 +++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

-- 
2.11.0

