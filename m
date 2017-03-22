Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id DE91877A41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 11:14:52 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170322111452248_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 04:14:52 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=14108 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cqeE2-00051i-6E for openembedded-core@lists.openembedded.org;
	Wed, 22 Mar 2017 07:14:46 -0400
Date: Wed, 22 Mar 2017 07:14:44 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 11:14:53 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm just adding some content to intro OE/YP wiki pages about what
various OE files should contain, and what they shouldn't contain, and
this is the layer.conf file for the meta-openstack layer:

  # We have a conf and classes directory, append to BBPATH
  BBPATH .= ":${LAYERDIR}"

  # We have a recipes directory, add to BBFILES
  BBFILES += "${LAYERDIR}/recipes*/*/*.bb
  ${LAYERDIR}/recipes*/*/*.bbappend"

  BBFILE_COLLECTIONS += "openstack-layer"
  BBFILE_PATTERN_openstack-layer := "^${LAYERDIR}/"
  BBFILE_PRIORITY_openstack-layer = "5"

  BB_DANGLINGAPPENDS_WARNONLY ?= "true"

  # pre 0.4.0 greenlet versions segfault python
  PREFERRED_VERSION_python-greenlet = "0.4.5"
  PREFERRED_VERSION_python-sqlalchemy = "1.0.8"
  PREFERRED_VERSION_python-pexpect = "3.3"
  PREFERRED_VERSION_python-futures = "3.0.3%"
  PREFERRED_VERSION_python-django = "1.8.6"
  PREFERRED_VERSION_python-netaddr = "0.7.19"
  PREFERRED_VERSION_python-sqlalchemy = "1.0.16"
  PREFERRED_VERSION_python-requests = "2.12.0"
  PREFERRED_VERSION_python-amqp = "1.4.9"
  PREFERRED_VERSION_python-kombu = "3.0.%"

so, just to be clear, the simple act of adding that layer to a
project's bblayers.conf file will cause those preferred versions to
be selected, correct?

  is that considered good design? in a perfect world, i've always
believed that you should be able to load up your bblayers.conf file
with as many extraneous layers as you want and (well, with some
exceptions), if you choose not to take advantage of the contents of a
layer, it shouldn't hurt you.

  so doesn't the above lock you into those preferred versions,
regardless of whether you use anything from the meta-openstack layer
or not? wouldn't those selections be properly placed elsewhere in the
layer, and not in layer.conf?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


