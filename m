Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 54A7A6D37F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:09:15 +0000 (UTC)
Received: from [173.34.6.101] (port=33155 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VfpMq-0004N3-6q for openembedded-core@lists.openembedded.org;
	Mon, 11 Nov 2013 06:09:16 -0500
Date: Mon, 11 Nov 2013 06:09:05 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1311110601090.10282@oneiric>
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
Subject: one more question about FILESPATH and eglibc, if i might
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
X-List-Received-Date: Mon, 11 Nov 2013 11:09:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  as one more data point in what looks like weird and sometimes
unnecessary settings of FILESPATH in recipe files, i give you this
from eglibc_2.18.bb:

FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/eglibc-${PV}',
'${FILE_DIRNAME}/eglibc', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}'
], d)}"

  first, it would seem that the first three elements in that list
match *exactly* what you'd get from the default setting of FILESPATH
from base.bbclass, would it not?

FILESPATH = "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",
"${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"

so it's not clear what the point of that explicit setting is.

  in addition, what's with the addition of that fourth list entry:
${FILE_DIRNAME}? all that's going to do is extend FILESPATH with the
OVERRIDES-related directories *immediately* under the eglibc
directory, and i don't see what value that has. here's the final value
of FILESPATH for eglibc as displayed by "bb show":

FILESPATH="/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc-2.18/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc-2.18/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc-2.18/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc-2.18/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc-2.18/
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/eglibc/
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/files/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/files/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/files/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/files/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/files/
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/arm
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/armv7a
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/beagleboard
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/poky
/home/rpjday/oe/dora/poky-dora-10.0.0/meta/recipes-core/eglibc/"

and i don't see the point of those last five entries. is the use of
${FILE_DIRNAME} as a fourth argument to base_set_filespath()
deliberate? and what is it for? thanks for your patience.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

