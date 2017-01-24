Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E23D471AC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 09:08:00 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d140so33189836wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 01:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6QCpbNI1dfVDuObk0azryUH7xYKWfXrNMXi+/B0Wq8s=;
	b=J+zlXwOrF7Wie5MmEACpzH9qhoBwqM6Dd8qweXd824EtjzSQqMSSpIMa+eH/aNdzKV
	0ceLrJ/M4x81C2mfYGcHOrhNP2Di7H8OkBj2+HPR3ugd7WibjZYjUUCI18wHtn8cpaUW
	U0zvCbwqYQC7g5zHlEwG0lM59kff9aCdcEY/h9cAletVkqaUheE1Jdbc3lOBeoXalDjY
	Fe2AL5UxjW7OBpUwTzoh8F8l/mPwbbLmdbpBHQOOxZew6OdbqsoDW43qumOk5rOB5Une
	8rlK6H55DtCvoIa/qdsKgR0mc/WLG7z2v8tKszyrVYelJLc5oOxBy1RnheUsJtVlCwlE
	pR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6QCpbNI1dfVDuObk0azryUH7xYKWfXrNMXi+/B0Wq8s=;
	b=SWpN4Qnr7xpZA8OdocOMtqDoOpPl9pCL1/gfqJK/0WD8+xXqiPQNUjYRtbSYEgTXHk
	vcDtXVjmu5YDdsN+Jc5y6ETQN4ZOvx2/PuRTcfHzf6U1EtJH8so+PER2OWIMCV2hzkLO
	UR2lyKkLFpVxpDtQ9QAWkeuwKnwM0N+M93r3CtIjzXIrrf+NEWeF7xxAQGNgjIuKDabt
	k1r0ISTwGYoe8oVfUSrCIF6c4Fsh4as7qs8kzS81BP1w+1e00zfGs1ucWpEFh1mm7BxB
	ZRHW0bfb09wTf+p2lV/3BnZ5IO+mwsZdwif9aNDfV06dJt0aEMQY07XX2cS1fvp/wWJB
	EgAQ==
X-Gm-Message-State: AIkVDXKS7/BttbEI2QufKjei67ADO9sHesV4y/Sh/S0VExXT8RJju210zbGYRJw3Rw3nKA==
X-Received: by 10.28.54.195 with SMTP id y64mr16011831wmh.10.1485248880683;
	Tue, 24 Jan 2017 01:08:00 -0800 (PST)
Received: from localhost.localdomain ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	w70sm18781208wrc.47.2017.01.24.01.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Jan 2017 01:08:00 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 10:07:12 +0100
Message-Id: <20170124090715.11646-1-freesilicon@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170123145508.9252-1-freesilicon@gmail.com>
References: <20170123145508.9252-1-freesilicon@gmail.com>
Subject: [PATCH v2 0/3] openssh: Make sshd-config a package
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
X-List-Received-Date: Tue, 24 Jan 2017 09:08:01 -0000

This series of patch introduces a new way of modifying OpenSSH sshd
configuration. Instead of modifying the files and launching the server with
custom options, a package which RPROVIDES sshd-config must be installed.

The package to use is selected using a new variable called SSHD_CONFIG which is
used exclusively when selecting ssh-server-openssh in IMAGE_FEATURES.

Changes since v1:
  Remove documentation

David Vincent (3):
  openssh: Package server configuration
  core-image: Set default sshd configuration
  rootfs-postcommands: Modify ssh-related commands

 meta/classes/core-image.bbclass                    |  3 +-
 meta/classes/rootfs-postcommands.bbclass           | 28 ++++---------
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb | 47 ++++++++++++++++++----
 3 files changed, 49 insertions(+), 29 deletions(-)

-- 
2.11.0


