Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 37DFE71A5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 12:26:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161030122624480_0684
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 12:26:24 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=44188 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c0pBq-0007LW-PW for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2016 08:26:18 -0400
Date: Sun, 30 Oct 2016 08:25:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610300813220.27025@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: should a "*git.bb" recipe lock that recipe to a fixed version?
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
X-List-Received-Date: Sun, 30 Oct 2016 12:26:26 -0000
Content-Type: text/plain; charset=US-ASCII


  not sure if i should have noticed this before, but i was building a
number of python modules, and my collection of layers gave me two
possibilities for python-django:

  * python-django_git.bb      (meta-openstack)
  * python-django_1.9.7.bb    (meta-python)

  i simply assumed that any "git"-versioned recipe would typically
take precedence over a fixed version recipe, so i was surprised to see
that what was built was python-django-1.8.6. huh?

  then i looked at the recipe from meta-openstack, and it contained
the lines:

  PV = "1.8.6"
  SRCREV = "80b7e9d09f2d23209b591288f9b2cf3eb3d927c8"

  SRC_URI = " \
      git://github.com/django/django.git;branch=stable/1.8.x \
      "

am i right in being a bit confused by that? i checked out the github
repo, and it has branches "stable/1.8.x", and also "stable/1.9.x" and
"stable/1.10.x". so what is that supposed to mean?

  am i right in assuming that a "git" recipe will (in the absence of
any PREFERRED_VERSION settings or other overriding settings) always be
considered before a fixed version recipe? and is that why i got this
(for me) unexpected result?

  i note at least one recipe in oe-core that has that same property:

  libepoxy_git.bb

which contains:

  SRC_URI = " \
    git://github.com/anholt/libepoxy.git \
    file://0001-select-platforms-based-on-configuration-results.patch \
    file://0002-add-an-option-to-disable-glx-support.patch \
    file://no-need-for-python3.patch \
  "
  SRCREV="e2c33af5bfcfc9d168f9e776156dd47c33f428b3"
  PV = "1.3.1"

it is just my responsibility to notice that, and use PREFERRED_VERSION
to make sure i get the version i want?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


