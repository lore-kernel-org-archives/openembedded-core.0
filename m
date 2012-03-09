Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1S60A0-0007sI-OU
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 14:47:08 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S601e-0007uH-DA for openembedded-core@lists.openembedded.org;
	Fri, 09 Mar 2012 08:38:30 -0500
Date: Fri, 9 Mar 2012 08:38:25 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1203090830180.22520@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: IMAGE_FEATURES vs EXTRA_IMAGE_FEATURES?
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
X-List-Received-Date: Fri, 09 Mar 2012 13:47:08 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  again, reading the poky ref manual over at yocto, and here's the
explanation of EXTRA_IMAGE_FEATURES:

  "Allows extra packages to be added to the generated images. You set
this variable in the local.conf configuration file. Note that some
image features are also added using the IMAGE_FEATURES variable
generally configured in image recipes. You can use this variable to
add more features in addition to those."

  now that *sounds* like you would just *assign* that in your
local.conf file to add some features, as in:

EXTRA_IMAGE_FEATURES = "fubar snafu"

or something similar.

  but first, how is that different from:

IMAGE_FEATURES += "fubar snafu"

after all, bitbake.conf contains:

IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"

  also, i notice this in core-image-rt-sdk.bb:

IMAGE_FEATURES += "dev-pkgs tools-sdk"
EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"

what is the point of those features being broken over those two
variables?  and wouldn't that cause trouble if someone starts with a
base of core-image-rt-sdk, then *assigns* to EXTRA_IMAGE_FEATURES in
their local.conf, would that not override that setting in the .bb
file?  isn't that a bit confusing?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



