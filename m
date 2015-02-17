Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB6D73578
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 11:21:30 +0000 (UTC)
Received: from [99.240.204.5] (port=38036 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1YNgDY-0006o7-HK for openembedded-core@lists.openembedded.org;
	Tue, 17 Feb 2015 06:21:28 -0500
Date: Tue, 17 Feb 2015 06:21:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1502170611270.21712@localhost>
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
Subject: "--disable-werror" versus "--disable-Werror"?
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
X-List-Received-Date: Tue, 17 Feb 2015 11:21:33 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  apparently another gcc-5.0.0 issue(or maybe not), but my build of
core-image-minimal for qemux86 now fails thusly trying to build
elfutils-native:

|
/home/rpjday/oe/builds/qemux86/tmp/work/x86_64-linux/elfutils-native/0.161-r0/elfutils-0.161/libebl/eblsectiontypename.c:111:28:
error: format '%x' expects argument of type 'unsigned int', but
argument 4 has type 'int' [-Werror=format=]
|         snprintf (buf, len, "SHT_LOOS+%x", section - SHT_LOOS);
|                             ^
|
/home/rpjday/oe/builds/qemux86/tmp/work/x86_64-linux/elfutils-native/0.161-r0/elfutils-0.161/libebl/eblsectiontypename.c:111:28:
error: format '%x' expects argument of type 'unsigned int', but
argument 4 has type 'int' [-Werror=format=]
|
/home/rpjday/oe/builds/qemux86/tmp/work/x86_64-linux/elfutils-native/0.161-r0/elfutils-0.161/libebl/eblsectiontypename.c:114:28:
error: format '%x' expects argument of type 'unsigned int', but
argument 4 has type 'int' [-Werror=format=]
|         snprintf (buf, len, "SHT_LOPROC+%x", section - SHT_LOPROC);
|                             ^
|
/home/rpjday/oe/builds/qemux86/tmp/work/x86_64-linux/elfutils-native/0.161-r0/elfutils-0.161/libebl/eblsectiontypename.c:114:28:
error: format '%x' expects argument of type 'unsigned int', but
argument 4 has type 'int' [-Werror=format=]
| cc1: all warnings being treated as errors

  since all warnings are being treated as errors, i did a quick check
to see how to disable that option on a per-recipe basis and *thought*
i could just add the following line to local.conf:

EXTRA_OECONF_pn-elfutils-native = "--disable-Werror"

but that didn't do it.  but there's more.

  i did a "grep" just to see how other recipes were doing it, and i
saw a mixture of "--disable-werror" versus "--disable-Werror", and
this web page which suggests that only one of those forms is correct:

http://patchwork.openembedded.org/patch/23361/

but feel free to search for yourself to see.

  in any event, what *is* the proper local.conf fix to disable this
option on a per-recipe basis?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

