Return-Path: <joaohf@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5977362252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 23:09:02 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id u7so9095701qaz.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 15:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=th2zFKnr5SgDbSY3BiF70qBREhzN+H3eLB9+pFhzxBo=;
	b=CsGU8SKL/0gA3h+FHQaRMY+8FDN4OU8ewVhPueZ1g16fCSJ+PyRVSusIHojwDYADj3
	ZNp+t+LdIe5felJNQZeF2sfRKu7R/wLgy07CHrplqgFQ+qXSQhpwE647+5qhOHMFhzKd
	j22VgESavjRfA9ttG/SQPUJwJliMPzijE/IIQzHgkdf2i0AEtBFWAonMba0pyHFlv9F6
	A8oymdRaXzxEHyVDTj9WiNpJXEvKkJ/nT+guMarYHC9bO/ROUaTeESVNsBIgUSn9oSG8
	k7lTFO3zmxc7Y/wP4AYZa7IcWyYA1lNn7q+bQVzvSbMS15PG0pgGGdPNRxrL/EZmbSjM
	Ew9w==
X-Received: by 10.229.79.132 with SMTP id p4mr64721294qck.14.1415833742734;
	Wed, 12 Nov 2014 15:09:02 -0800 (PST)
Received: from localhost.localdomain ([201.53.206.66])
	by mx.google.com with ESMTPSA id
	v37sm22251506qge.29.2014.11.12.15.09.00 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 12 Nov 2014 15:09:02 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Nov 2014 21:08:37 -0200
Message-Id: <1415833719-6255-1-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] reporter-error sending report
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
X-List-Received-Date: Wed, 12 Nov 2014 23:09:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the Error Reporting Tool is enabled and the build fails, then the report-error 
prints an url that the user needs to get and use the send-error-report tool which
will sends the reporter to a public or private reporting server error.

This works very well if the user is sitting in front of the building machine.
There are some cases, like jobs running on Jenkins server, that need to send
reports automatically when a build fails.

This patch set introduces a glue between reporter-error.bbclass and send-error-reporter tool.
So, report erros will be send as soon as an error happens.

Two new variables were added and the user takes the responsible to fill them (conf/site.conf),
for example:

INHERIT += "report-error"
ERR_REPORT_SERVER = "127.0.0.1:8000"
ERR_REPORT_USER = "joaohf"
ERR_REPORT_EMAIL = "joaohf@gmail.com"


João Henrique Ferreira de Freitas (2):
  report-error: sending error report to server without user intervention
  report-error: send report error with username and email

 meta/classes/report-error.bbclass | 15 +++++++++++++
 scripts/send-error-report         | 45 ++++++++++++++++++++++++---------------
 2 files changed, 43 insertions(+), 17 deletions(-)

-- 
1.9.1


