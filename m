Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 671D06CF24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 20:10:17 +0000 (UTC)
Received: from [173.34.6.101] (port=59675 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VVoT4-0005yW-EK for openembedded-core@lists.openembedded.org;
	Mon, 14 Oct 2013 16:10:18 -0400
Date: Mon, 14 Oct 2013 16:10:06 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.DEB.2.02.1310141602380.18511@oneiric>
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
Subject: FILESPATH has unnecessary null element appended to FILESOVERRIDES
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
X-List-Received-Date: Mon, 14 Oct 2013 20:10:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  puttering around with FILESEXTRAPATHS and generated the following
output to demonstrate how FILESPATH is created:

$ bb show -r jpeg FILESPATH | tr ':' '\n'
Parsing recipes..done.
# FILESPATH=${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}
FILESPATH="/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg-8d/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg-8d/armv7a
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg-8d/beagleboard
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg-8d/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg-8d/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg/armv7a
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg/beagleboard
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/jpeg/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/files/arm
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/files/armv7a
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/files/beagleboard
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/files/
/home/rpjday/oe/dist/layers/oe-core/meta/recipes-core/jpeg/files/"
$

  as you can see, each base filespath generates *two* identical empty
overrides simply because, first:

$ bb show -r jpeg FILESOVERRIDES
Parsing recipes..done.
# FILESOVERRIDES=${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}
FILESOVERRIDES="arm:armv7a:beagleboard:"
$

note the *already* empty override at the end because of empty
DISTROOVERRIDES. at which point, in utils.bbclass, there's this:

def base_set_filespath(path, d):
    filespath = []
    extrapaths = (d.getVar("FILESEXTRAPATHS", True) or "")
    # Don't prepend empty strings to the path list
    if extrapaths != "":
        path = extrapaths.split(":") + path
    # The ":" ensures we have an 'empty' override    <---- THERE
    overrides = ((d.getVar("FILESOVERRIDES", True) or "") + ":").split(":")
    for p in path:
        if p != "":
            for o in overrides:
                filespath.append(os.path.join(p, o))
    return ":".join(filespath)

which adds *another* empty override even when one is already there.

  doesn't hurt, of course, just superfluous. i'll leave it to someone
else to decide if it's worth adjusting.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

