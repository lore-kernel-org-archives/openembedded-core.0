Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 812376E5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 10:19:29 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161101101929504_0485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2016 10:19:29 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=35714 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c1WA7-0002H0-G1 for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2016 06:19:23 -0400
Date: Tue, 1 Nov 2016 06:18:22 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1611010604480.25706@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: curious about inherent value of dynamic layers
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
X-List-Received-Date: Tue, 01 Nov 2016 10:19:29 -0000
Content-Type: text/plain; charset=US-ASCII


  more pedantry: i notice that a small number of layers (eg,
meta-freescale, meta-mentor) include "dynamic" layers, so that some
sublayers are included only conditionally if others layers are
included. from meta-freescale's layer.conf:

///// start

  # The dynamic-layers directory hosts the extensions and layer specific
  # modifications related to Freescale products.
  #
  # The .bbappend and .bb files are included if the respective layer
  # collection is available.
  BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bbappend' % layer \
               for layer in BBFILE_COLLECTIONS.split())}"
  BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb' % layer \
               for layer in BBFILE_COLLECTIONS.split())}"

///// end

where the "dynamic-layers" directory in that layer contains further
recipe directories with .bbappend files related to other layers:

  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 browser-layer
  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 efl-layer
  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 filesystem-layer
  drwxrwxr-x. 4 rpjday rpjday 4096 Jun 26 06:36 networking-layer
  drwxrwxr-x. 6 rpjday rpjday 4096 Jun 26 06:36 openembedded-layer
  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 qt4-layer
  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 qt5-layer
  drwxrwxr-x. 3 rpjday rpjday 4096 Jun 26 06:36 virtualization-layer

seems like an interesting idea ... opinions on whether this is a
useful approach? or possibly overly confusing? is this approach
mentioned in any OE/YP doc?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


