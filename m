Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 19DD765FDC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:02:03 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	s6SH209a021843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:02:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1406566924;
	bh=oqby51cRQwJI5mt/RQvKsfipScokFK9OOl1c3a9Q7+o=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Sender;
	b=l/ROoNToDrd8gQoNBjkHBZQslveNitWhAPxJiVfYZZ1wzTY95z+EL3xo0llwdn5gt
	HiL9YP1kfpPOwwdFcMHJ0WM0eXyNyB/asGi9Rt7hmRHroJaauONcngwU8KePVqOZXU
	qH7flkECC8DiV+lGZ4Zw9PBxKU6KVplGilNakW4c=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id s6SH1oKh020695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:01:55 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1XBoJ4-0000w4-RY
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jul 2014 19:01:50 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Mon, 28 Jul 2014 19:01:50 +0200
Message-ID: <lymwbtto1t.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Subject: SELinux support
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
X-List-Received-Date: Mon, 28 Jul 2014 17:02:13 -0000
Content-Type: text/plain

[ https://bugzilla.yoctoproject.org/show_bug.cgi?id=6580 ]

Hi,

after upgrade to recent pseudo 1.6+, oe-core stops to build as a
confined SELinux now.  This happens because SELinux provides more
than the xattr file api and 'pseudo' does not intercept e.g. writing
into '/proc/self/attr/fscreate'.

IMO, turning off every SELinux related operation in do_install() (which
is wrapped by 'pseudo') is a clean way to fix and improve building.  If
OE supports SELinux for targets sometime, the file relabeling should be
done in do_rootfs() by using a chroot aware 'restorecon' (e.g. which
reads the file context policy from the chroot but not from system wide
/etc/selinux).

Unfortunately, I do not know a way to make applications think they are
running without SELinux.  But patching 'pseudo' to return faked values
for 'is_selinux_enabled()' seems to be a good solution.

Bug #6580 mentioned at the beginning contains some discussion and a
patch.  What do other people think about it?



Enrico

