X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: Fix some NPM related problems
Date: Fri, 13 May 2022 15:48:27 +0200
Message-Id: <20220513134829.1895574-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>


When trying to create recipes for Angular so that "ng build"
can be run, I ran into some problems. Two of them I was able fix.

The first two problems are in the same class and boil down to
the fact that some node module archives are created by an idiotic
tar client (probably on Windows) and contain wrong permissions.

Problem 1) Directories have no "x" permission bit

This cannot be worked around as tar creates the directory as is
but creating the first file in the directory will fail.

tar exits with an error and there is no option for it to
override directory permissions.

license-webpack-plugin 2.3.1, a dependency for Angular 11 is
such a contender.

Problem 2) package.json have no "w" permission bit

This can be worked around with
[PATCH 1/2] npm.bbclass: Fix file permissions before opening it for writing

Problem 3) Recipes with "inherit npm" install the /usr/lib/node symlink

I needed to create a complete set of Angular recipes where "ng build"
can run. But when trying to use them in DEPENDS for an Angular based
project, this error kicked in from staging.bbclass:

bb.fatal("The file %s is installed by both %s and %s, aborting" % (dest, c, fileset[hashname]))

This is fixed by ignoring the sole /usr/lib/node symlink in staging.bbclass
when checking for identical files with

[PATCH 2/2] staging.bbclass: Ignore installing multiple symlinks of the same name

I discovered this issue in Yocto 3.3.

I cc-ed relevant parties who edited either bbclass around where
I just modified them.

Best regards,
Zoltán Böszörményi

