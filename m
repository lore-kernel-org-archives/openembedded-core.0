Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 980AB77B42
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:20:40 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170328141942271_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 07:19:42 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=58831 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csry5-0004d2-Sg for openembedded-core@lists.openembedded.org;
	Tue, 28 Mar 2017 10:19:29 -0400
Date: Tue, 28 Mar 2017 10:19:28 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703281010420.3894@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to specify *just* the KERNEL_IMAGETYPES i want?
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
X-List-Received-Date: Tue, 28 Mar 2017 14:20:42 -0000
Content-Type: text/plain; charset=US-ASCII


  playing with building fit images, and i started with mpc8315e-rdb,
built virtual/kernel using all defaults, and got this in images/:

modules--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315e-rdb-20170315095945.tgz
uImage--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315e-rdb-20170315095945.bin
uImage--4.9.8+git0+b65e9b6153_6b67f448d6-r0-mpc8315erdb-20170315095945.dtb

which is perfectly fine, since the machine conf file for that target
includes the line:

  KERNEL_IMAGETYPE = "uImage"

now i start another (fresh) build, and add to local.conf the lines:

  KERNEL_CLASSES = "kernel-fitimage"
  KERNEL_IMAGETYPES = "fitImage"

now my use of the above is my (alleged) way of saying, "i only want a
fitImage", but given this snippet from kernel.bbclass:

    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
    type = d.getVar('KERNEL_IMAGETYPE') or ""
    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
    types = d.getVar('KERNEL_IMAGETYPES') or ""
    if type not in types.split():
        types = (type + ' ' + types).strip()

i apparently get both the default as specified in the machine .conf
file, *as well as* the fitImage i ask for. and, sure enough, in my
images/ directory, i have uImages and fitImages (and zImages, but i
believe that's because fitImages require them, so no big deal).

  i suspect i could prevent the generation of uImages by using:

  KERNEL_IMAGETYPE_mpc8315e-rdb = "fitImage"

but from a clarity point of view, would it not make more sense that if
someone had a line:

  KERNEL_IMAGETYPES = " ... list of types ..."

that should override whatever KERNEL_IMAGETYPE is in the machine conf
file and generate *just* those images? or am i missing something here?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



