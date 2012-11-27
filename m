Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec13@gmail.com>) id 1TdOh4-0005qm-Hz
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 18:11:34 +0100
Received: by mail-qa0-f47.google.com with SMTP id t11so4986001qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=zm5E8aDVeD+qerKjRKwq4J7wUGXGROopFhzWOv7nILQ=;
	b=Ug7/JIVoioz56PGBqjN/8D8rJjcKIrQt27THWG0MEQ3EIam1UuHbO8/44TiJ01gr+h
	m+fpYgg+dvs+hEyIkKd2YLpAeiLNx7byzvjqcnAl3CctWeiFlcthlndPb6FUreV0ZF3h
	OEAfL7qytZrBRUdUtwFwhMt2ITYtEicol3qJO3/3swuop7lCUjOtRuFmDyZSDCYv70hU
	78vgF5TyY05HJnO0bj863NjM3g2Z+LiPO+cQ61IQbkkIgvcpce5d/x6gNMYWdA4+yct1
	erZZg2XwNhMU3gcMhiDZPW0ZYBqlqpJr2azxkq5wc9a6GBT8fwqivGgz9YvNyheEtfPh
	c1hg==
Received: by 10.224.109.199 with SMTP id k7mr16830455qap.66.1354035441031;
	Tue, 27 Nov 2012 08:57:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.121.161 with HTTP; Tue, 27 Nov 2012 08:57:00 -0800 (PST)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Tue, 27 Nov 2012 17:57:00 +0100
Message-ID: <CAOT3miKfftRKyBbPZCSmq=jKVx=pqRVLQtn-4azH_FbrmOqE4A@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Perl 'native' path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 17:11:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

hi,

i am getting the following build error:

ERROR: Function failed: do_rootfs (see
/data/ubuntu-omap/jenkins/jobs/yocto-meta-ti-danny/workspace/mybuild/tmp/work/pandaboard-poky-linux-gnueabi/core-image-x11-1.0-r0/temp/log.do_rootfs.28213
for further information)
ERROR: Logfile of failure stored in:
/data/ubuntu-omap/jenkins/jobs/yocto-meta-ti-danny/workspace/mybuild/tmp/work/pandaboard-poky-linux-gnueabi/core-image-x11-1.0-r0/temp/log.do_rootfs.28213
Log data follows:
| DEBUG: Executing shell function do_rootfs
| Can't locate Dpkg.pm in @INC (@INC contains:
/apps/perl/5.8.3/lib/5.8.3/x86_64-linux-thread-multi
/apps/perl/5.8.3/lib/5.8.3
/apps/perl/5.8.3/lib/site_perl/5.8.3/x86_64-linux-thread-multi
/apps/perl/5.8.3/lib/site_perl/5.8.3 /apps/perl/5.8.3/lib/site_perl .)
at /data/ubuntu-omap/jenkins/jobs/yocto-meta-ti-danny/workspace/mybuild/tmp/sysroots/x86_64-linux/usr/bin/dpkg-scanpackages
line 27.

i am trying to setup some daily builds on some corporate administrated
machines... and what happens is that dpkg-scanpackage perl script has
this:

$ more sysroots/x86_64-linux/usr/bin/dpkg-scanpackages
#!/usr/local/bin/perl

So in turns my build will attempt to use whatever I have in
/usr/local/bin (AFAIU), which is problematic in my case as this points
to a corporate version (/apps/perl), which then leads to build
failure.

I would expect all scripts to use the perl-native binary, instead, and
search for Perl modules in the sysroot folder.

does that make any sense? is there something wrong with what I am
doing (beyond using a corporate server which I can't administrate ;-)

thx


