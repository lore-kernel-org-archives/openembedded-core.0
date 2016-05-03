Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 539646072C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 17:05:01 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160503170443685_0685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 10:04:43 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=14299 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1axdm4-0003HN-Ma for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2016 13:06:16 -0400
Date: Tue, 3 May 2016 13:04:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 17:05:03 -0000
Content-Type: text/plain; charset=US-ASCII


  oddly, in the current YP kernel dev manual, i don't see the phrase
"is not set" explained anywhere in the entire doc, which is weird
since it seems like it would be important.

  first, just to confirm *i* know what it's used for, it's not just a
comment -- it's used explicitly by the kernel config process to
stipulate that we are aware of a kernel config setting, and we don't
want it. that is, if we have a kernel .config file used as the basis
of a "make *config" command, and there is no mention whatever of a
reachable config variable, the config process will stop and ask us
about it. am i right so far?

  this means that, once the kernel config process completes and the
.config file is generated, every single *available* and *settable*
kernel config option should be listed in the .config file, to avoid
being asked about it the next time we do a kernel configuration.

  oh, and about that "reachable" thing, we don't need a line regarding
every single kernel config setting, just the ones that are available
to be set given the current config settings. how am i doing so far?

  given all that, my understanding is that, when one is writing kernel
config fragments, it is necessary to explicitly deselect ("# ... is
not set") *only* those kernel config options that would be selected
based on other config settings we selected. do i have that right?

  for instance, here's kernel Kbuild file net/Kconfig:


    ...
    menuconfig NETFILTER
        bool "Network packet filtering framework (Netfilter)"
        ... snip ...
    if NETFILTER

    config NETFILTER_DEBUG
        bool "Network packet filtering debugging"
        depends on NETFILTER
        help
          You can say Y here if you want to get additional messages useful in
          debugging the netfilter code.


as a test, i added a single-line frgament file:

  CONFIG_NETFILTER=y

however, even though NETFILTER_DEBUG was then selectable, because it
wasn't *explicitly* selected, what i got in my final .config file was:

    ...
    CONFIG_NETFILTER=y
    # CONFIG_NETFILTER_DEBUG is not set
    ...

however, because the very next Kconfig stanza was "default y":

    config NETFILTER_ADVANCED
        bool "Advanced netfilter configuration"
        depends on NETFILTER
        default y

i *did* get the line in the final .config:

    CONFIG_NETFILTER_ADVANCED=y

does all this sound right? i always thought it was pretty
straightforward, but i'm willing to be convinced i never really
understood it.

  and it does seem odd that it's not described anywhere in the YP
kernel dev manual.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


