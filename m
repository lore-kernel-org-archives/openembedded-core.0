Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1STZ14-0000zb-OM
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 15:39:18 +0200
Received: by wibhm14 with SMTP id hm14so2351337wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=UyZr3SaBfYLabVDI1Hqx/zaSiUFqYIPgMlXTvIV4X7w=;
	b=W2tuwVlBjmK5FNQq7vJPg++eIAGtduemSwHo5YQbLl1m6znsKZ1mjR9Vf0SYkhQpz0
	wE0F2bVKg2n4jd6VEe4c2xn8F5UTJ7neyvleCMenjtIatdfJr0vdKUGj2k4tYeL1YXu4
	EFmaqbxtcNw1EHaxJppAg75qu6ZrIkrJK+4oLKE+YcelBVdvbU65ACJM37BhZZrw1CPW
	PYsgCptiSLI3uM5SAJc6/a4GsDfKY1qojQLZWmvxVGaIrP6yozBZwwwOA0vfylP3YVP1
	9kemtcKSY0kHqy7Sa2lh8ebYnMU8oJQmxa/+dRIj5tVnzlC7RU0n+u3zB9ln0q4I9rb1
	uNHw==
Received: by 10.216.135.105 with SMTP id t83mr2970827wei.105.1336915761261;
	Sun, 13 May 2012 06:29:21 -0700 (PDT)
Received: from blackbox.local ([178.123.196.33])
	by mx.google.com with ESMTPS id b3sm27447282wib.4.2012.05.13.06.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 May 2012 06:29:20 -0700 (PDT)
From: Leonid Borisenko <ive.found@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 May 2012 16:28:40 +0300
Message-Id: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH 0/3] Support additional user-defined package metadata
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
X-List-Received-Date: Sun, 13 May 2012 13:39:18 -0000

I'm an owner of Kindle Touch. It's basically a computer with ARM
Cortex-A8 based CPU and Linux. There is a [small] community of
enthuasists developing homebrew modifications for stock software. For
distributing of these modifications .ipk package format had been chosen
with OE as build infrastructure.

There are already several firmware versions for device and some more are
expected. Every firmware can introduce unpredictable changes, so
modifications for previous firmware versions could stop working.

Custom metadata field with supported firmware version(s) could be
included into package control file for preventing of installing packaged
modifications onto unsupported firmware.

But OE currently doesn't allow to define additional package metadata in
recipes. Patch fixes it.

There is already RPMSPEC_PREAMBLE variable used in package_rpm.bbclass.
I think, it is still useful for defining custom macros in header of spec
file (while additional user-defined metadata is placed somewhere between
common tags).

I didn't found any way to define newline character inside variable value
and it is needed to allow multiple [one-line] metadata fields/tags. So
I've used ability of OE to split list-typed variables (and re-joined
splitted value with real newline character).

The following changes since commit cab85fd0b481cdbf36477348de75352be3f38ca2:

  gdk-pixbuf: Drop unneeded RPROVIDES (2012-05-12 11:23:27 +0100)

up to 052d78ed7f986e76afb1ce6ef02e94ba1bbc9719:

  package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata (2012-05-13 14:51:26 +0300)

----------------------------------------------------------------
Leonid Borisenko (2):
      package.bbclass: add getter of additional metadata
      package_{ipk, deb, rpm}.bbclass: support additional user-defined metadata

 meta/classes/package.bbclass     |   11 +++++++++++
 meta/classes/package_deb.bbclass |    5 +++++
 meta/classes/package_ipk.bbclass |    5 +++++
 meta/classes/package_rpm.bbclass |    7 +++++++
 4 files changed, 28 insertions(+)



