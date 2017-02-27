Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 498756FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:08:06 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170227110806455_0684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:08:06 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=12551 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciJ9s-0006aQ-In for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 06:08:00 -0500
Date: Mon, 27 Feb 2017 06:07:54 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702270559150.22784@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: style suggestions for that whole "_append" and leading space thing
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
X-List-Received-Date: Mon, 27 Feb 2017 11:08:08 -0000
Content-Type: text/plain; charset=US-ASCII


  getting pedantic (as i am wont to do), occasionally i run across
things like this, from meta/conf/distro/include/no-static-libs.inc:

  EXTRA_OECONF_append = "${DISABLE_STATIC}"

which, at first glance, simply seems wrong given the lack of a leading
space, until one looks higher up in that same file to read:

  DISABLE_STATIC = " --disable-static"

where one finds the leading space as part of the variable itself. i
find this potentially *really* confusing; consistent style suggests
variables should be assigned their values without regard as to how
they might be used later. subsequent references or usages of those
variables should be responsible for making sure they're included
properly, no?

  and the last line in that same file also suggests potential misuse:

  EXTRA_OECMAKE_append_pn-libical = "-DSHARED_ONLY=True"

rday

p.s. would the same logic hold with lines like this?

meta/conf/machine/include/tune-ppce6500.inc:

  MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
     "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"

would it not be clearer if one were to write:

  MACHINE_FEATURES_BACKFILL_CONSIDERED_append =
     " ${@bb.utils.contains('TUNE_FEATURES', 'e6500', 'qemu-usermode', '', d)}"



