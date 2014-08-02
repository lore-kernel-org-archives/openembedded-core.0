Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id A107960017
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 16:34:59 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140802163459107
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 16:34:59 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=53930 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XDcGj-00033j-MC for openembedded-core@lists.openembedded.org;
	Sat, 02 Aug 2014 12:34:53 -0400
Date: Sat, 2 Aug 2014 12:34:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408021229180.24061@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Sat, 02 Aug 2014 16:35:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  followup to earlier note, is it true that the pkg_prerm and
pkg_postrm functions cannot be run at all during image creation, but
only on the actual running target? this would seem reasonable as it
doesn't seem to make sense to be running any sort of removal code
during image creation.

  (i'm assuming that it is never the case that any sort of package
removal is done during image creation, and that the creation process
will install *only* those packages that should be part of the final
image, is that correct?)

  however, if the above is correct, then it would make sense that all,
say, pkg_prerm() functions would never be written with respect to the
variable ${D}, which would be relevant only during image creation. but
i can see things like this in sysklogd.inc:

pkg_prerm_${PN} () {
        if test "x$D" = "x"; then
        if test "$1" = "upgrade" -o "$1" = "remove"; then
                /etc/init.d/syslog stop
        fi
        fi
}

so what does that mean?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


