Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 5988172FE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 10:50:57 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170227105058035_0484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 10:50:58 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=39438 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciItI-0005H7-Dx for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2017 05:50:52 -0500
Date: Mon, 27 Feb 2017 05:50:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702270543380.22510@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what's with "SRC_URI_append +=" in meta/lib/oeqa/selftest/layerappend.py?
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
X-List-Received-Date: Mon, 27 Feb 2017 10:50:58 -0000
Content-Type: text/plain; charset=US-ASCII


  every so often, i run a style-checking script against OE, and i just
noticed this in meta/lib/oeqa/selftest/layerappend.py:


  ... snip ...
  SRC_URI_append = " file://appendtest.txt"       <---

  sysroot_stage_all_append() {
        install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
  }

  """

    append2 = """
  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

  SRC_URI_append += "file://appendtest.txt"       <---
  """
  ... snip ...


i'm not sure what's going on in that file, should that second
instance be written with just "=", or is there something more subtle
happening there such that that construct is deliberate?

rday

p.s. i recall from some time back asking about this and while the
initial reaction to writing "..._append += ..." was, "yes, it's
superfluous, but it doesn't hurt," a later comment suggested it
*might* make a difference, in that (i think) using "_append" would
*not* add that leading space, but "+=" *would* add it, so there might
actually be some weird conflict in trying to mix the two.

  thoughts?


