Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 8DA4D71C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 14:40:46 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20170220144045698_0484
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 14:40:45 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=56084 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cfp8p-0001Ff-Vg for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2017 09:40:40 -0500
Date: Mon, 20 Feb 2017 09:40:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702200935010.377@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: dbus seems to be given debian naming convention, breaking another recipe
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
X-List-Received-Date: Mon, 20 Feb 2017 14:40:47 -0000
Content-Type: text/plain; charset=US-ASCII


  moving on, i whipped together a recipe for libnet-dbus-perl, tried
to build, and:

  ...
  DBus >= 1.3.0 is required
  ...

which is weird since oe-core contains the recipe:

  meta/recipes-core/dbus/dbus_1.10.14.bb

but when i examined the deployed rpms:

-rw-r--r--. 3 rpjday rpjday  163963 Feb 20 06:04 dbus-1-1.10.14-r0.ppc7400.rpm
-rw-r--r--. 3 rpjday rpjday 1393445 Feb 20 06:04 dbus-dbg-1.10.14-r0.ppc7400.rpm
-rw-r--r--. 3 rpjday rpjday   36372 Feb 20 06:04 dbus-dev-1.10.14-r0.ppc7400.rpm
-rw-r--r--. 3 rpjday rpjday   92124 Feb 20 06:04 dbus-doc-1.10.14-r0.ppc7400.rpm
-rw-r--r--. 3 rpjday rpjday    2960 Feb 20 06:04 dbus-ptest-1.10.14-r0.ppc7400.rpm
-rw-r--r--. 3 rpjday rpjday  135131 Feb 20 06:04 libdbus-1-3-1.10.14-r0.ppc7400.rpm

  uh, what's with the "dbus-1-1.10.14-r0.ppc7400.rpm"?
                           ^^^^
oh, wait, here's a line from the dbus recipe:

  DEBIANNAME_${PN} = "dbus-1"

it would seem that that is getting in the way, or am i doing something
silly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


