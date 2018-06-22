Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9E575538
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2018 18:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7208A9C316B;
	Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id LETtWvcXgX4F; Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 054419C3356;
	Fri, 22 Jun 2018 14:43:08 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id ngOzu6wfCPCc; Fri, 22 Jun 2018 14:43:07 -0400 (EDT)
Received: from workotop.mtl.sfl (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id D98D79C316B;
	Fri, 22 Jun 2018 14:43:07 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 14:43:01 -0400
Message-Id: <20180622184302.17835-1-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2 0/1] systemd: escape paths
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
X-List-Received-Date: Fri, 22 Jun 2018 18:43:08 -0000

This is the second attempt at escaping properly the paths passed to
various shell scripts in the systemd class.

I tried various approch to this fix but I'm still not sure I have the
cleanest solution:

 - using inline ${@' '.join(shlex.quote(s) for s in d.getVar('SYSTEMD_SERVICE').split()} 
   doesn't work as shlex is not imported
 - creating a `def systemd_escape_paths(d)` function and calling it
   inline through ${@systemd_escape_paths(d)) has issues as well:
    - d.getVar('SYSTEMD_SERVICE') returned None (remember the variable
      is actually SYSTEMD_SERVICE_${PN})
    - d.expand('SYSTEMD_SERVICE') returns 'SYSTEMD_SERVICE'

The solution I came up with and that actually works is to inject
SYSTEMD_SERVICE_ESCAPED in the data store, and use that in the postinst
and prerm scripts.

Damien Riegel (1):
  systemd: escape paths passed to shell

 meta/classes/systemd.bbclass | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.17.1


