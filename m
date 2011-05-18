Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMkQi-0005dY-W1
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:21:05 +0200
Received: by pwj9 with SMTP id 9so878170pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=9/6FfoikerVDR2ZcejNqwiHGayjvNVdqI+zwE56BQI8=;
	b=V1dLK9rk13UdbU0q5t6WIeesoTbfQKzYEuSV013BSwbTZWwDl2nXk4P+Ugic6Af7lh
	lWZn4EDTUzIminPwjZ9ygs/uSjcMsSp3WHdM5riVuQP4qyWoUGt/YSlpxqahh1u8X76F
	Qcqk5ZAKHp6Om6AWYqFJL3KMZbY/ZhH+VaENs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=mGofSEnPgim7wOeXwEogVJj+GKXlrpBca1lJyqQpv5d/KQOyy5RPXBOgghLz77d2jT
	YVp8LhK05tIsGtjJp/hxFLTnpUteRt5El/e2PZn8FM1vnvquruyAJTTx5hoTteABjxWO
	XSFWTRqf4zQvHmkOyVNtVLjEHl8h4F2nw9pDA=
Received: by 10.143.21.34 with SMTP id y34mr1162493wfi.395.1305739089208;
	Wed, 18 May 2011 10:18:09 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id 25sm1550869wfb.10.2011.05.18.10.18.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 10:18:08 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:17:58 -0700
Message-Id: <cover.1305737923.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH (v2,resend) 0/3] Rework the devshell
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 17:21:05 -0000

From: Chris Larson <chris_larson@mentor.com>

- Adds a utility metaclass for maintaining class registries
- Shifts the handling of spawning a terminal into a new 'terminal' python
 module
- Automatically selects an appropriate terminal based on what you have
 available on your machine
- Still allows manual selection, but in a more convenient way, and falls back
 to auto if you select an invalid or unavailable (not installed) terminal
- Improves how we spawn screen:

 - Shows a warning when spawning it, so do_devshell doesn't appear to hang
 - Spawns a named screen session 'devshell', to avoid confusion when the user
   already has other screen sessions running

Example usage of the new API for others (e.g. patch resolver) to use:

    import oe.terminal
    oe.terminal.run(command, terminal_title, d)

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kergoth/devshell
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kergoth/devshell

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (3):
  oe.classutils: add module
  Rework how the devshell functions
  oe.terminal: improve how we spawn screen

 meta/classes/devshell.bbclass |   25 ++------
 meta/conf/bitbake.conf        |    9 +++
 meta/lib/oe/classutils.py     |   45 ++++++++++++++
 meta/lib/oe/terminal.py       |  131 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 191 insertions(+), 19 deletions(-)
 create mode 100644 meta/lib/oe/classutils.py
 create mode 100644 meta/lib/oe/terminal.py



