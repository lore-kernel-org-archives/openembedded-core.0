Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2B54D6011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 12:50:40 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id c7so124103648itd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 04:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aZdqQhvBfwecH6Di4deAdaq5LTTYhO9d4pKLWKo+4bI=;
	b=r1YTSyZUawbA55Jfu6IRtYtMROZf+dbaP/gtGQHYXuKSmm9AaoeIF9K+X74NkVJatC
	CbCOB0oUSID49wIqvF9ntgOY/E1qGj8Tp+7nRhGmSUHaqLsDxyJ1K3DyChqAu4b0Gfy6
	F592wxfchKrwqXIpYYVl2dCV35ULeSbNs4psnGnGCG0VK6ZhnEAXPZt1Z3QL1Bp7cAEv
	oidAlMUWJb8S9QpXYJ6bzM+Hi/x3duZlMpttVcwkFRxku6d/Irh6K4dNJLIrAFWxwWqb
	91FXedju3qBM5vWN0EGSRV8JBohxyBXg7dKaljwERiCaGqe1q40j+TbljRMm3DgjRrGz
	4MGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aZdqQhvBfwecH6Di4deAdaq5LTTYhO9d4pKLWKo+4bI=;
	b=ZjAqH/ACbD61tQC+G5EukP0M+Y2YwR9EKelHjZB8q5fbJxIBq1miooAYbIa2rmBSnf
	M6X7BMrdTbmjvywBvxIwCSOHv6wBH4cVqMlthWqeyEdROEuUrDt33DuR725fr5R6Vvgp
	PAYIhCUXA+3ezXNjXFQSOd/vs2V2Xb/MqfCj3gllbpe8LeVsrYv2hSd4LhfiH1D203o6
	XLUjEeOdVQRhLBL//lEh35XevnkaiZtvs8wO12vyounFlhtkvssR8qs2bQ4FnGyzH9wf
	zpjkW5GdV61/Qz/GPysMpootSLlLvLL3fqB8+qW/4gkY27HPG54JkZyUHq9Ip68j3ol0
	xaTw==
X-Gm-Message-State: AIkVDXLW5HGM0XOprboUnnbIJi/ZNvMlZgebfskUcqlecpMKI2XSDF4HaLL8+ljMFtFqbY+e
X-Received: by 10.36.79.13 with SMTP id c13mr19139169itb.103.1485867041269;
	Tue, 31 Jan 2017 04:50:41 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DFEB.dip0.t-ipconnect.de.
	[93.232.223.235]) by smtp.gmail.com with ESMTPSA id
	l31sm10051399iod.17.2017.01.31.04.50.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 31 Jan 2017 04:50:40 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 13:50:25 +0100
Message-Id: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/8] verify-bashisms: fix script and one issue found by it
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
X-List-Received-Date: Tue, 31 Jan 2017 12:50:41 -0000

The script broke when introducing tinfoil2. The patches also include
several usability enhancements, like making the output less redundant
and including information about the actual file and line where the
offending script can be found.

Patrick Ohly (8):
  verify-bashisms: fix typo
  verify-bashisms: point out where to get checkbashisms.pl
  verify-bashisms: explicitly shut down server
  verify-bashisms: fix problems with tinfoil2
  verify-bashisms: revise update-rc.d whitelist entry
  verify-bashisms: check scripts only once, include original file and line
  populate_sdk_ext: fix == bashism
  verify-bashisms: support warnings with more than one line of source code

 meta/classes/populate_sdk_ext.bbclass |   2 +-
 scripts/verify-bashisms               | 100 +++++++++++++++++----------
 2 files changed, 67 insertions(+), 35 deletions(-)

base-commit: 8d955d3486beca27fa23448f930d2c4df94b187a
-- 
git-series 0.9.1

