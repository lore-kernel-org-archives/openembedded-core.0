Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id C9BD665C91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:33:36 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id x12so8302609qac.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=v5gt+h51hzhESFkFccAkeeEGzXtZrpT4j4I7qxqLsz0=;
	b=mVyXI6Jte5rkl9rZg3wIzAPKxYAEeKnOboIIA2jogCdVJE3GKZQmXxuxgPk6oMjSkN
	rJvk50pyR3qhXrG5b2u0jzmJ6+5ftFH1QD0UX9zmWA7NhZoOy2wWR1CjQ+pfsV9tEueD
	LqenxIjLAGQ9tyUlrWZIacWXI4s/ISV9NxFEd2box+FvFgIUIdsaBqTF5X2zS9H2HD8y
	425KFUIGtskJ1ro9ruBho4Q0m9SC3MfcvLxrfF4En5XR7ubVNVbZJmU0ybjroqlskM9q
	oV4rjAEVYZcisyPaNKYnaUXteyJD3ukcX+Tl8kLkEQ1bgUyRvhdfLQ4JXK1xfs/8ABOA
	VF2A==
X-Received: by 10.224.3.134 with SMTP id 6mr61220900qan.87.1415788417269;
	Wed, 12 Nov 2014 02:33:37 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.193.50])
	by mx.google.com with ESMTPSA id w7sm20638112qge.17.2014.11.12.02.33.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 02:33:34 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 2FF3C1C86BEBA; Wed, 12 Nov 2014 08:33:31 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Nov 2014 08:33:26 -0200
Message-Id: <1415788406-23120-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
References: <1415788406-23120-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 4/4] systemd-serialgetty: Disable the carrier detect requirement for serial consoles
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
X-List-Received-Date: Wed, 12 Nov 2014 10:33:40 -0000

This aligns the params of getty with the ones used in Debian. From the
getty(8) manpage:

,----[ getty(8) manpage ]
|  -L, --local-line
|
|    Force the line to be a local line with no need for carrier
|    detect. This can be useful when you have a locally attached
|    terminal where the serial line does not set the carrier detect
|    signal.
`----

Reported-by: Craig McQueen <craig.mcqueen@beamcommunications.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 6dd335c..182167b 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -21,7 +21,7 @@ IgnoreOnIsolate=yes
 
 [Service]
 Environment="TERM=xterm"
-ExecStart=-/sbin/agetty -8 --keep-baud %I @BAUDRATE@ $TERM
+ExecStart=-/sbin/agetty -8 -L --keep-baud %I @BAUDRATE@ $TERM
 Type=idle
 Restart=always
 RestartSec=0
-- 
2.1.1


