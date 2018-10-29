Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id C3FEA60778
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 12:31:39 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 9F61C5C01FD;
	Mon, 29 Oct 2018 13:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1540816299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=HrHRbWsigjmHcrVCgAeP3MHc6AombKqApt59YTIwU7M=;
	b=VXU4o6HL2ZL5FRGbJpq6SgDG2OCQFaYCHoC/uDGlktr08axzCoPJ+hbdQz15uWQnKxf43B
	gzKsNg232XwoGy6p/8ZMehtnDSquB4AjfPaLTUaL3Zcfuv8dl40XjY7NwmqmCUoKuPZWfD
	s0HCM04YkUUlKuDY49WoEyRVvqLaMzI=
MIME-Version: 1.0
Date: Mon, 29 Oct 2018 13:31:38 +0100
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Message-ID: <77e2fb99554339ea31caf60700a1595f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: luka.pivk@gmail.com
Subject: Lock external repository in custom FSTYPE
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
X-List-Received-Date: Mon, 29 Oct 2018 12:31:40 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

We use meta-updater, which has a custom FSTYPE to build a OSTree
repository. We share that repository across multiple bitbake executions.
The underlying OSTree tools lock the OSTree repository before trying to
interact, and if it fails ("error: Locking repo exclusive failed:
Resource temporarily unavailable") then the complete build fails (see
also https://github.com/advancedtelematic/meta-updater/issues/412).

Now I'd rather prefer that two bitbake tasks would serialize the access
to the OSTree repository. Is there a mechanism in bitbake to lock (and
wait) for the repository to be not in use?

We tried using bb.utils.lockfile, but the task is written in shell. Also
inline Python would not work since locking/unlocking need to be done
within one Python script as far as I understand.

--
Stefan

