Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 88FDE7BDA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 22:59:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 239D4220479;
	Thu, 20 Dec 2018 11:59:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 11:59:43 +1300
Message-Id: <20181219225948.30700-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/5] icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
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
X-List-Received-Date: Wed, 19 Dec 2018 23:00:00 -0000

The python function icecc_path() was being invoked inline by set_icecc_env(),
meaning that it was being invoked at recipe-parsing time.
As a side-effect, icecc_path() was creating the recipe-sysroot directory and
symlinking icecc into it. Because this was done at parsing time (rather than
configure time), we were generating otherwise-empty WORKDIRs for *all* parsed
recipes, and for all virtual classes (-native, -nativesdk).
In my build, this generated more than 800 of these otherwise-empty WORKDIRs.

Because we are now finding the host icecc at do_configure time, icecc needs to
be in the HOSTTOOLS. I have made this non-fatal, so that we can still inherit
icecc without icecc installed. Likewise, although we could potentially build
patchelf and all its dependencies, they would all have to be blacklisted to
avoid trying to build them with icecc. We use the host patchelf instead.
You will only receive (the flood of) warnings about the absence of build host
icecc and patchelf if you both inherit icecc and have ICECC_DISABLED = "".
I have borrowed the patchelf-uninative bit from OE's modified icecc-create-env
script, but I haven't tested it on a uninative build.

If two bitbake processes try to generate the ICECC_VERSION tarball at the same
time, the thread that fails to get the lock will wait 30 sec for the first to
finish. A syntax error meant that this was not happening and in particular, if
tarball generation failed (eg. for lack of patchelf), it did so silently.

Douglas Royds (5):
  icecc: readlink -f on the recipe-sysroot gcc/g++
  icecc: Trivial simplification
  icecc: Syntax error meant that we weren't waiting for tarball
    generation
  icecc: Don't generate recipe-sysroot symlinks at recipe-parsing time
  icecc: patchelf is needed by icecc-create-env

 meta/classes/icecc.bbclass | 72 +++++++++++++++++---------------------
 1 file changed, 32 insertions(+), 40 deletions(-)

-- 
2.17.1


