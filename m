Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B64AA787F9;
	Sun, 21 Jan 2018 11:26:44 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0LBQcaq001820
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 21 Jan 2018 11:26:39 GMT
Message-ID: <1516533998.24502.94.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 21 Jan 2018 11:26:38 +0000
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: "Lock,
 Joshua" <joshua.g.lock@intel.com>
Subject: Autobuilder Changes [SWAT in particular please read]
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
X-List-Received-Date: Sun, 21 Jan 2018 11:26:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

[SWAT please see **** below at the very least]

The Yocto Project "autobuilder" infrastructure is of key importance to
the project. It allows us to test incoming patches against a huge test
matrix and over the years we've incorporated a lot of tips and tricks
into it. It has a lot of inbuilt knowledge about which tests to run
against which versions of the project.

I'm posting this so people are aware of what is happening, why and the
way we're planning to move forward.

The autobuilder has some problems:

* We heavily customised a version of buildbot, upstream took some
different directions and we're "stuck" on an old version. We can't take
advantage of new features and upgrading in the current form is near
impossible.

* Keeping older releases building is hard as any new change to the
autobuilder has to be made with backwards compatibility in mind.

* Its near impossible to fix some bugs we have (like a forced push to
master-next whilst a build is running will break).

* Whenever we need to deploy configuration changes we have to stop and
restart the infrastructure.

* The codebase is a mess, twisted doesn't lend itself to how we grew
into using it and you can't really understand what is going on.

* We can't easily add new buildsteps to the configuration without
making it even more of a twisted maze. This puts of off extending
testing, we don't dare touch pieces of it.

We need a plan to get out of this situation which keeps the autobuilder
running and keeps our test coverage but lets us move on.

With Joshua I have formulated a plan. We've already executed on one
part of it so we at least know we can make some improvements. Much
remains to be done though and I have no idea how I'm going to find the
time but such is life.

Executive Summary
=================

The quick summary is that we're moving large chunks of functionality
out of buildbot/autobuilder code and into its own repo/codebase. If we
can move enough out, it will them make upgrading much simper. It also
resolves some issues we have with older releases.

****
There is one big user visible change. In order to make this work, the
multiple steps in a given "nightly" target are all getting condensed
into one "RunConfig" step. This makes life harder for SWAT and makes
the logs larger and less manageable. At the same time it makes any
change possible and allows us to condense targets for master to make
things more efficient, something we've never been able to do.

The step does clearly show which configuration its using, which command
its running and which ones failed so grep can find that easily.

Ultimately, we can likely do something clever in newer buildbot to
split the logs up again. For now, we'll have to deal with it, it is
what it is and something had to change.
****

Implementation Details
======================

The first step in the transition was to move the configuration file
generation out to a separate conf file and script in its own repo. This
currently has two pieces, a configuration file generator and a target
executor. The configuration looks like this:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/config.json

Its json and contains:

a) a base set of variables
b) overrides of the variables per "target" and per "step"
c) templates which inject patterns into targets (like the nightly-
   'arch' or nightly-*-lsb targets.

A target in this sense is a set of builds like "nightly-arm" or
"nightly-qa-extras".

The script which does this is:

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/setup-config

You can run something like:

./setup-config nightly-arm-lsb <step-number> <builddir> <branch> <repo> <sstatedir> <buildapprev>

e.g.

./setup-config nightly-arm-lsb 0 /tmp/foo/build master poky None None

which would place an auto.conf and sdk-extras.conf into
/tmp/foo/build/conf.

This sounds simple, extracting all the configurations out the current
autobuilder was a nightmare but we have this piece working.

We then have the executor, "run-config":

http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/run-config

This iterates the steps in each target. For each one:

* Adds any special layers
* Genereates the configuration (using setup-config)
* Runs BBTARGETS
* Runs SANITYTARGETS
* Runs any EXTRACMDS
* Removes any added layers

We have this in use on the "old" autobuilder cluster,
autobuilder.yoctoproject.org. I believe master, rocko and pyro are
working, morty is in development to tweak the configuration.

The plan from here is:

* Improve the reporting from run-config so that the steps numbers, 
  number of failed steps etc are reported in a way users can more 
  easily parse.
* Add an additional script to handle "publish artefacts" (another rats 
  nest of code we need to untangle)
* Add something which scripts the checkout and configuration of the 
  needed layers meaning we can step away from 'YoctoGit' in the 
  buildbot codebase
* See if we can get a modern version of buildbot to run the remaining 
  pieces.

I'm conscious the yoctogit replacement has overlap with the layer setup
tool we keep thinking about I will treat this as something which may
help grow into that, certainly there are learnings here which can help
with that.

There are a ton of more minor things which need to be done, e.g. using
argparse in the scripts, cleaning them up in various ways,
documentation and so on. What we have here is something which I'm
giving my best effort into developing to unblock the autobuilder and
let the project scale into the next set of challenges it faces.

I'm also trying to keep this simple and not making it "generic" if that
will add huge complexity costs. I suspect some people would find the
configuration generation useful in other places for example and it
should be generally reusable but I don't want to over complicate it and
make something unmaintainable again.

Cheers,

Richard


