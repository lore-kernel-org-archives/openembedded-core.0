Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id D9DD072FF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 11:46:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170223114627879_0485
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 11:46:27 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=31279 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cgrqn-00039u-Cx for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2017 06:46:21 -0500
Date: Thu, 23 Feb 2017 06:46:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702230630240.8798@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: adding recipes to a layer.conf file to simulate(?) an extensible SDK?
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
X-List-Received-Date: Thu, 23 Feb 2017 11:46:32 -0000
Content-Type: text/plain; charset=US-ASCII


  caveat: i'm not sure this question is even going to make sense but
i'm going to give it a shot.

  acquaintances have in-house BSP layer for small number of target
boards, and build using OE (actually, wind river linux, but that
distinction doesn't seem relevant). so basic BSP image and *some* user
space apps are incorporated into existing layers and build a number of
working images just fine.

  OTOH, there are some app developers who also need to build for the
same target boards and images, but are *not* using OE/WRL, so they've
been given an appropriate SDK against which to compile their source.
so far, so good, but these developers regularly request more content
in the SDK as they extend their code and need additional shared libs
and header files. fair enough.

  in some cases, they apparently need the developer content related to
things like apache2 and minicom and strace and mtd-utils, and a bunch
of other stuff i find a little puzzling. and the solution until now
(that i was unaware of until recently) has been to add a massive
"IMAGE_INSTALL_append = ..." directive to the layer.conf file, so that
when one runs (and this is the WRL command to generate the SDK):

  $ make export-sdk

one gets an SDK with the developer-related content from all of those
recipes.

  this kind of threw me the first time i saw it. my instant reaction
was, "pretty sure what you want is the WRL version of the extensible
SDK," based on whatever "make" target that corresponds to.

  thoughts? apparently, the above strategy is, technically, working,
but of course it requires a total rebuild of the SDK every time a
developers needs something added. and the idea of adding image recipes
in the layer.conf file seems pretty clearly like a bad idea but, as i
said, it apparently works.

  am i missing something here? as i see it, the obvious (first)
solution is to have the app developers use OE/WRL in the first place,
but that is apparently not an option. so, barring that, the next
solution is to set up an extensible SDK, and extend it as needed.

  i'm just looking for others' opinions on what seems to me to be a
really weird solution to a standard problem.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


