Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefro.net@gmail.com>)
	id 1THlgo-0004IA-1D; Sat, 29 Sep 2012 03:17:54 +0200
Received: by iebc13 with SMTP id c13so8826408ieb.6
	for <multiple recipients>; Fri, 28 Sep 2012 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=R18+TnnIEmytT8scYJoLSZ9ECIoSSLn0tzI/e7fPLAY=;
	b=vktxuJWEmyqvqoSVo/wTQI27P5v3Ug0SyQgCeIGULFStcVy61Q4Tc1lG1IsU/r4o4q
	JuSIYYHyfCyNODBdCK2qwhtuA3y9CJgNR72IHjcY5gxlYD08ra6Zbfz8qsN2tkLrVFsb
	qj1OFTuIlVk5R/GY6DYVTdpm2ojIJLfXLxeOagLfNZXMZ4b6iM2Aqt42QAPUSgnsNCVO
	xHd+PJlJZjWCgaMNvSjK7S2AyOhQrcb12OR9V/ZMaRkvm3yEbix7nNs+2073aj/ZjLUS
	6w8F9GTHa4LPHYnXMUV9xXHSTDJ00y4JMwO9gn+6PIiH3L9dQbMY3Vui/bOXy6Oqby0D
	rLZA==
MIME-Version: 1.0
Received: by 10.50.91.169 with SMTP id cf9mr315146igb.44.1348880699136; Fri,
	28 Sep 2012 18:04:59 -0700 (PDT)
Sender: jefro.net@gmail.com
Received: by 10.64.147.37 with HTTP; Fri, 28 Sep 2012 18:04:59 -0700 (PDT)
Date: Fri, 28 Sep 2012 18:04:59 -0700
X-Google-Sender-Auth: kNgc3Nc4p9hN7eiWd3Ap0qHXnL8
Message-ID: <CA+YB3rayg+4Uzmdo9=_c-jjNiPxF8ENmK-VJ32uticrVn1au7w@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-devel@lists.openembedded.org, tsc <tsc@lists.openembedded.org>
Subject: MINUTES OE-TSC 28 August 2012
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 29 Sep 2012 01:17:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

OpenEmbedded Technical Steering Committee
28 August, 2012

Attending:
  Richard Purdie (RP)
  Koen Kooi (koen)
  Paul Eggleton (bluelightning)
  Khem Raj (khem)

Apologies:
  Mark Hatle (fray)

________________________________________________________________
Agenda & Results

NOTE: this meeting occurred during a busy conference and did not
conform to the standard agenda.

1. nativesdk
  problem summary:
    PACKAGES = "${PN} ${PN}-foo libbar"
	If you append to PN, it gets messay as you end up with
	PN-nativesdk-foo libbar-nativesdk
	There are a small number of nativesdk users.
	  -native is a very different userbase
  RP: patches posted, would like to solicit wider testing
    including from the yocto autobuilder
	looking at merging this week

2. task rework
  ref: http://www.openembedded.org/wiki/OE-Core_Task_Rework
  bluelightning sent out RFC on improving oe-core tasks
  packagegroup or some shortening thereof suggested

3. PR server testing
  discussed possibility of using a database
   All package info would end up in there as well so the PR service,
   buildhistory etc can be simplified to ask bitbake about the info
   and bitbake will do the sql stuff
  discuss further on mailing list

4. plans for kernel.bbclass in meta-oe
  transition when all layers have adapted
  possibly a distro include class instead

5. bluelightning's RFC for qemu-config split
  should do, wait to see if newer qemu released
  should work with linaro first
  recent git works ok in preliminary testing
  discussed alternate machine types: e.g., qemucortex-a9

________________________________________________________________
Raw Transcript:

[17:01] <bluelightning> hi koen, fray, RP__
[17:01] <koen> hey bluelightning
[17:02] <RP__> fray: ping?
[17:02] <RP__> hmm, no khem?
[17:02] <koen> no jefro either
[17:03] <RP__> no.
[17:03] <RP__> koen: are you coming to LinuxCon or not?
[17:03] <bluelightning> just pinged khem
[17:03] <RP__> jefro should already be down here in .ca
[17:04] <RP__> Is there anything major we need to discuss?
[17:04] <RP__> nativesdk is probably one thing we need to touch upon
[17:04] <RP__> anything else?
[17:05] <koen> RP__: only linuxcon eu in november
[17:05] <RP__> koen: fair enough
[17:05] --> khem has joined this channel
(~khem@99-57-140-209.lightspeed.sntcca.sbcglobal.net).
[17:05] *** ChanServ gives khem permission to talk.
[17:05] <RP__> hi khem
[17:05] <khem> good morning
[17:05] <bluelightning> I would like to raise the task rework
[17:05] <koen> I was about to say "khem was driving, he should show up soon"
[17:06] <bluelightning> hi khem
[17:06] <RP__> ok, do we want to go through the usual agenda or just
hit the high spots we're mentioning here?
[17:06] <koen> high spots
[17:06] <RP__> I can chair if that helps
[17:06] <RP__> ?
[17:06] <khem> High spots is better yes
[17:07] <RP__> ok nativesdk
[17:07] --> Jefro has joined this channel (~jefro@38.96.16.75).
[17:07] *** ChanServ gives Jefro permission to talk.
[17:07] <RP__> hi Jefro!
[17:07] <Jefro> hi all, sorry I'm late - hotel wireless didn't like me
[17:07] <RP__> Jefro: We're just going to quickly touch on a few hot topics
[17:08] <koen> my only concern with it was the usual "let's push it
through with lightning speed and deal with the fallout" way of doing
it
[17:08] <koen> not a big concern, though
[17:08] <RP__> koen: Well, its something which has been discussed
several times before
[17:08] <bluelightning> koen: what would be your alternative proposal?
[17:08] <koen> bluelightning: make branch, have people test it, merge it
[17:08] <koen> oh
[17:08] <koen> a branch against oe-core
[17:09] <koen> couldn't test the WIP branch RP posted, it was against poky
[17:09] <bluelightning> you mean, you refuse to test the patches in it...
[17:09] <RP__> koen: I've posted two patches which should apply cleanly
[17:09] <RP__> I've also asked sgw to put those patches through the autobuilder
[17:09] <koen> bluelightning: well, 'git merge' fails
[17:10] <khem> RP__: I am still worried about the inconsistency
[17:11] <RP__> khem: I understand the concern but I don't think its
reasonable to change -native
[17:11] <khem> can you summarize the issue its solving
[17:11] <khem> another question I have is w.r.t sdk
[17:11] <RP__> khem: PACKAGES = "${PN} ${PN}-foo libbar"
[17:11] <khem> if I have an SDK installed and using online package
management to update it
[17:11] <RP__> khem: If you append to PN, it gets messay as you end up
with PN-nativesdk-foo libbar-nativesdk
[17:11] <khem> I guess I need to resprin it right ?
[17:12] <RP__> khem: yes, it won't update well
[17:12] <khem> so from my world its a flag day no matter what I see
[17:13] <RP__> khem: Its a question of impact. There are a small
number of nativesdk users. -native is a very different userbase
[17:13] <RP__> we probably could do something with RPRVIDES if the
upgrade thing bothers you
[17:13] <RP__> but its probably better done by people with that real
world problem
[17:13] <khem> RP__: -nativesdk can it be appended very last and get
PN-foo-nativesdk
[17:13] <khem> or it that too hard
[17:14] <RP__> khem: well, that means you can't change PN
[17:14] <koen> if only to keep up the appearance of supporting package
management ;)
[17:14] <khem> no, I think if I can convice on naming convention
respinning is easier
[17:15] <RP__> I really want to get this done now before the userbase
grows any more
[17:15] <RP__> I've gone around in circles on it, I know bluelightning
has as well
[17:15] <koen> I'd say: go for it
[17:15] <RP__> in some ways I hate the change but from a programatical
perspective, I can't solve the problems with nativesdk any other way.
This was why multilib became a prefix
[17:16] <khem> RP__: and hope that we dont need multilib version of
nativesdk packages now
[17:16] <bluelightning> RP__: that's my assessment as well
[17:16] <RP__> khem: that will work fine if necessary as a prefix
[17:17] <khem> so, will you be change cross'es too sometimes or we say
multilib and nativesdk are prefixed rest are suffixed
[17:17] <bluelightning> RP__: is it completely deterministic which
prefix will go first?
[17:18] <RP__> So the proposal is to solicit wider testing including
from the yocto autobuilder and assuming that works out ok, probably
look at merging towards the end of the week
[17:18] <khem> I would assume problem of appending and prepending are
same if there is contention
[17:18] <RP__> bluelightning: the class extension code would make sure
of the deterministic nature if necessary
[17:18] <bluelightning> RP__: ok, just a thought
[17:19] <RP__> khem: no, that is a different problem really
[17:19] <RP__> khem: cross recipes I don't care too much about one way
or another. They're not packaged
[17:19] <RP__> As long as its not packaged, the suffix works great
[17:20] <khem> ok
[17:20] <khem> also crosssdk ?
[17:20] <RP__> I've sent emails before about the naming issues if
anyone wants the details on both nativesdk and multilibs and why we
needed to do this. I'd look up those discussions if you want the
details
[17:21] <RP__> khem: crosssdk and cross should stay the same. Again,
they're not packaged
[17:21] <khem> no its fine. I just was thinking if we would do it all
in one big sweep
[17:21] <khem> its fine I guess.
[17:21] <khem> nothing is perfect :)
[17:21] <RP__> I don't think I'd want to change everything all at once anyway
[17:22] <RP__> ok, I think we proceed as outlined above and see where
that gets us
[17:22] <RP__> next topic was task reorg?
[17:22] <RP__> bluelightning:
[17:23] <RP__> since more people are here, any other topics btw?
[17:23] <khem> RP__: send an email on what one has to know after this
nativesdk change goes in
[17:23] <khem> like wipe your tmp  or both sstate and tmp and so on
[17:23] <bluelightning> so I sent out an RFC and semi-proposal on
improving the tasks we have in OE-Core
[17:24] <bluelightning> I did get some response but I was hoping for a
little more
[17:24] <RP__> khem: actually, you don't have to do either. Just check
your own recipes for nativesdk references :)
[17:24] <koen> RP__: still testing the PR service, no solid
conclusions yet (as usual, the combination of layers don't build most
of the time)
[17:24] <RP__> koen: ok. I could really use some feedback on it...
[17:24] <khem> bluelightning: I havent looked at your RFC task rework
[17:24] <khem> but I very much would like this too
[17:24] <bluelightning> khem: please do :)
[17:25] <RP__> bluelightning: I have read through bits and didn't see
anything I really hated :)
[17:25] <koen> bluelightning: for me having some patches to look at
for the new tasks would be usefull
[17:25] <RP__> bluelightning: I've lacked time to forumulate a proper
response though
[17:25] <bluelightning> koen: I analysed the tasks in meta-oe in
response to your pointer to task-boot and task-basic; is there hope
that we can merge the functionality there into task-boot and task-base
(or some reworking of the latter)?
[17:26] <bluelightning> koen: I'll be sending out some RFC patches
soon but I was hoping to have a little more to go on
[17:26] <koen> bluelightning: as long as they don't get bloated too much
[17:26] <khem> bluelightning: are you also considering renaming tasks
to something not having task in name
[17:27] <khem> it really is a meta package group
[17:27] <koen> bluelightning: but my biggest beef with the oe-core
tasks is that after half an hour of reading the recipes I still didn't
have a full understanding of them
[17:28] <bluelightning> khem: packagegroup or some shortening thereof
seems to be the suggested change, I'm all for it
[17:28] <khem> koen: someone gave me same feedback and he went along
and designed his own image recipe
[17:28] <koen> RP__: the whole PR service thing does make me realize
that we should switch to a database for everything sooner than later
[17:28] <RP__> I agree that a name change would be benefical here. Its
got an associated impact but would be worthwhile
[17:28] <bluelightning> koen: there's a mess there to be sure, doesn't
help that half of the descriptions/names are useless
[17:28] <bluelightning> just one of the things I'm intending to fix
[17:28] <koen> RP__: things like buildhistory and the license tasks
would benefit as well
[17:29] <koen> bluelightning: and a ton of IMAGE/DISTRO/MACHINE
feature interactions
[17:29] <RP__> koen: I'm torn over that. You can't put a database in
git, or use diff against it easily
[17:29] <koen> RP__: the .bbs would feed the db, it would live outside of git
[17:29] <bluelightning> koen: some of that is difficult to avoid if
you want the task to work, but we do have a few silly indirections
[17:29] <bluelightning> s/work/work for different configurations/
[17:30] <koen> which reminds me, some of the MACHINE_FEATURES are pretty bogus
[17:30] <koen> e.g. 'ext2'
[17:32] <koen> anyway, that's ml talk
[17:33] <bluelightning> yes, could be something to raise there
[17:33] <bluelightning> ok, well if anyone has any thoughts on the
task situation over the next week other than what's mentioned here,
please reply to the thread
[17:33] <-- RP__ has left this server (Ping timeout: 272 seconds).
[17:35] <bluelightning> hmm, guess hotel wifi has got the better of RP
[17:35] <Jefro> it has been rather ugly - took me a while to get on
[17:36] <Jefro> this is the last day of kernel summit
[17:36] <bluelightning> so lots of people pushing patches then :)
[17:36] <Jefro> heh, yes, that must be it
[17:37] --> RP__ has joined this channel
(~richard@0127ahost2.starwoodbroadband.com).
[17:37] <RP__> sorry, lost the connection
[17:38] <RP__> what did I miss?
[17:38] <bluelightning> RP__: mostly just us talking about how your
connection probably went down :)
[17:39] <RP__> RP__: koen: but how do you share that data with others?
[17:39] <RP__> RP__: koen: say someone wants to build angstrom release X?
[17:39] <RP__> RP__: koen: we keep some srcrev stuff inside the
persist_db and its a bit painful from this perspective which is why I
mention it
[17:39] <RP__> RP__: I'm fine with databases but we likely need strong
import/export
[17:39] <RP__> RP__: Also, I do like the current way buildhistory uses
the git repo
[17:39] <RP__> RP__: ok, so conclusions: We probably should rename
tasks -> pkggrp or something
[17:39] <RP__> RP__: there is a huge amount of cleanup needed in OE-Core
[17:39] <RP__> RP__: we thank bluelightning for taking it on and
support him with that :)
[17:39] <RP__> RP__: we all need to try and reply to the discussion
[17:39] <RP__> RP__: anything else?
[17:39] <RP__> RP__: I don't want to stop us talking, just trying to summarise
[17:39] <RP__> I thought it had gone quiet :)
[17:39] <bluelightning> heh that's a lot that got eaten
[17:40] <khem> yes I agree with RP's points
[17:40] <khem> I will read through bluelightning proposal
[17:40] <khem> and provide feedback
[17:40] <koen> RP__: you mirror my thoughts on the db stuff :)
[17:41] <bluelightning> link for reference:
http://www.openembedded.org/wiki/OE-Core_Task_Rework
[17:42] <RP__> bluelightning: thanks
[17:42] <RP__> ok, anything else we need to talk about?
[17:43] <bluelightning> koen: anything from last week that you want to add to?
[17:43] <koen> not that I can remember
[17:43] <Jefro> (minutes from last week are here:
http://lists.linuxtogo.org/pipermail/tsc/2012-August/000353.html)
[17:43] <khem> nothing from me either
[17:44] <bluelightning> nothing here
[17:44] <bluelightning> oh, other than the RFC for the qemu-config split...
[17:44] <khem> a question for koen though on kernel.bbclass in meta-oe
 what are our plans there
[17:44] <khem> how long we wait for transition
[17:45] <koen> when all layers have adapted
[17:45] <RP__> bluelightning: I'm not keen on it but we should do it.
Probably kill anjuta at this point
[17:45] <koen> khem: maybe it should be a distro include class instead
[17:46] <bluelightning> RP__: it's the rest of it that bothers me
too... oprofile, distcc, bash...
[17:46] <khem> koen: yes better
[17:46] <bluelightning> RP__: granted, outside of poky only people who
explicitly request it get those things
[17:46] <khem> koen: I think we should remove it from meta-oe and then
let other layers adapt
[17:46] <RP__> bluelightning: its depend what you view the purposes of
qemu as...
[17:47] <bluelightning> RP__: right, my RFC was aimed at eliciting
response from people who might actually be relying upon those things
in a qemu context
[17:47] <khem> RP__: on qemu, I have sent an update for qemu git
recipes, its not replacing 0.15 since thats the default workhorse
[17:47] <RP__> khem: ok
[17:47] <khem> I will see if 1.2 comes out then we might update to 1.2
and use that as default
[17:48] <khem> but for that we need to get git recipe going so that
can be used as testing recipe for real update
[17:48] <koen> speaking about qemu, we should probably engage with the
linaro people before they go completely berserk in their layer
[17:48] <RP__> khem: is it worth updating to something recent git as
the deafault?
[17:48] <khem> RP__: my testing shows it works all well
[17:49] <khem> but then I dont stress as much as yocto testers
[17:49] <khem> koen: updating to latest git will help linaro ?
[17:49] <RP__> khem: what wasn;t working well out of interest?
[17:50] <khem> RP__: I think linaro is interested in later arm cores
which are not implemented in 0.15 is my guess
[17:50] <khem> I am not fully aware what there issues are
[17:50] <RP__> we need to update, I don't doubt that...
[17:51] <khem> second thing I thought would be interesting is if we
can let mulitple machines be selectable for qemuarm or even other
qemus
[17:51] <khem> like qemucortext-a9 and qemucortex-a15 and so on
[17:51] <RP__> ok, I need to wander off and find a room, as does jefro
[17:52] <RP__> khem: we had qemuarmv6 at one point
[17:52] <khem> yes I see that
[17:52] <khem> thats a starting point may be'
[17:52] <khem> I kind of like to leverage the OE-Core infra for qemu
its quite rich
[17:53] <khem> may be linaro'ites should consider that once we have
newer qemu in there
[17:53] <RP__> yes, agreed
[17:53] <RP__> I need to head off. Thanks all!
[17:53] <khem> ttyl
[17:53] <khem> thanks

-- 
Jeff Osier-Mixon http://jefro.net/blog
Yocto Project Community Manager @Intel http://yoctoproject.org


