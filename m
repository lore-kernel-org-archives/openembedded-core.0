Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38A9CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 10:05:32 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32245.1782468328807870412
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 03:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=KVY7evtG;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/5YsTFxo48vqk4NMPa0zNKnEb614AoAPlUar+DwhdiY=; b=KVY7evtGWjBYrjWW6UDEtteiMI
	Nf9qDLwDB7i5hglfxFBpf3Fe8hwLNbYJyxxzuFcZznhcs+jFKG4HAeJ6TqD1sydYC2RaxwX3USTUH
	esDBi8WLiGNgzqO3iKkSbuOeBDx9jplQ0Dy6+drlDCsaBn8zPwJ812i9DlE4HJKnOELxXWpCR2DZ+
	xZ2fNvFogKm0kilRKOLPdW6/uDBYfjkaHBUXso4s2naDNTFz9HYH5eVh+UP5/lbfuoKFtkdNkTQPJ
	uB8LIUdvUipCgRpnikYl+kWeTW8TZlUolKT7tInmckMY8IYnzY2H13UNU0VB1Npp47irLD9Jga4IP
	txCiK0Fg==;
Received: from bras-base-otwaon0916w-grc-51-67-71-147-190.dsl.bell.ca ([67.71.147.190]:46978 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wd3R7-00000002kP0-1HTp
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Jun 2026 06:05:27 -0400
Date: Fri, 26 Jun 2026 06:05:20 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: what is the value of defining "do_install_ptest_base:append() in
 some recipes?
Message-ID: <3e0707ba-90fa-9bdb-7b3a-d70975265362@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 10:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239623


(i asked about this on the docs ML because i wanted to add a note
about this to the documentation, but it's more appropriate here, i
think.)

  after i noticed an OE recipe defining
"do_install_ptest_base:append()", i assumed that this meant that there
was something related to ptest installation that could not be done
with a regular do_install_ptest() function -- that is, for whatever
reason, something had to wait until everything else in
do_install_ptest_base() was run, so i dug into why that might be the
case, and it's a bit confusing.

  first, in all of the layers i have checked out, i found these few
examples (all in the oe-core layer and nowhere else):

$ grep -r "do_install_ptest_base:append" *
meta/recipes-devtools/quilt/quilt.inc:do_install_ptest_base:append()
meta/recipes-core/musl/libc-test_git.bb:do_install_ptest_base:append()
meta/recipes-extended/cpio/cpio_2.15.bb:do_install_ptest_base:append()
$

so obviously this is not a popular feature. so what are those recipes
doing?

  to set the stage, the ptest-runner recipe, for whatever reason,
creates a non-root user, "ptest":

  # Create a non-root user that test suites can use easily
  inherit useradd
  USERADD_PACKAGES = "${PN}"
  USERADD_PARAM:${PN} = "--system --no-create-home --home / --user-group ptest"

first impression is that lots of recipes would take advantage of this
but, no, both the cpio and quilt recipes define that append function
to do nothing more than (this is from cpio recipe):

# ptest.bbclass currently chowns the ptest directory explicitly, so we need to
# change permission after that has happened so the ptest user can write a
# temporary directory.
do_install_ptest_base:append() {
    chgrp -R ptest ${D}${PTEST_PATH}/
    chmod -R g+w ${D}${PTEST_PATH}/
}

same thing for the quilt recipe:

do_install_ptest_base:append() {
    chgrp ptest ${D}${PTEST_PATH}/test
    chmod g+w ${D}${PTEST_PATH}/test
}

it's not clear why these two recipes need to do this, just as it isn't
clear why, if this is a useful feature, these are the *only* recipes
i've run across that do this.

  finally, as for musl/libc-test_git.bb:

do_install_ptest_base:append() {
    install -Dm 0755 ${UNPACKDIR}/run-libc-ptests ${D}${PTEST_PATH}/run-libc-ptests
}

i don't see why that can't be handled with a regular
do_install_ptest() function.

  in short, this feature is used so infrequently that it's not clear
what the point is. is it part of some legacy cruft that is no longer
necessary?

rday



