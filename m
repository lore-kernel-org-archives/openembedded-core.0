Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id D808160703
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 21:21:26 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id oz11so2904812veb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=SytJoXTgpMsLwoRRY3hrpSgTCIM2nT8T6JEFj5EMNck=;
	b=F9zYCbxOMqD8R6dZtB4Nh3uQHCEFtVf+XmNO9cMh7ajxjj2bktTnvONL6x4Ougybck
	ckI5JxY+Vz28d5rjT/575mzi1u7hKwU2pZvg9VFKP6JPEm6JojI8FbyMItyPZN1fo79g
	cV0spTn2DcW4CVQruDZr7GE4UyXCrgzp4WkJ7clpezRBhrpuSGYpGNfp8NxBccdJkzN4
	WShmbz8O0zKwYyqKDOteWSmtk93Ewgip7kQ497pWO8dc50jHJ7Zp1RQLo2XsQjLTgmOT
	Ox8pwY4z5F+opqIt9HdZBDnY+tj0s2vaao4rSeRzh7INJsWHll2RqECaTwFyg5LgzWip
	r6XQ==
X-Received: by 10.58.201.5 with SMTP id jw5mr5159097vec.6.1398892887424; Wed,
	30 Apr 2014 14:21:27 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.221.5.133 with HTTP; Wed, 30 Apr 2014 14:20:47 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 30 Apr 2014 22:20:47 +0100
X-Google-Sender-Auth: 7IFFDRkYdrmY_YE-rW5Avpp1pyM
Message-ID: <CANyK_8eXUQ5OVgCWR_JEPf8y00L4yjtLk10_U9xEAEqiers=tQ@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: archiver.bbclass: gitAUTOINC, gcc and archive duplication
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
X-List-Received-Date: Wed, 30 Apr 2014 21:21:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm giving the archiver class a try, following the instructions in the Yocto
Project Development manual (section 5.20.1) and the comments in
oe-core/meta/conf/local.conf.sample.extended. I'm seeing a few things which
aren't really working how I would expect. I've not dug into the source of
archiver.bbclass yet, so some of these may just be places where the
documentation I've followed isn't quite right. I know the archiver refactor was
fairly recent.

I think the direction the archiver class is going in is excellent, definitely
looks like it will be an improvement over my old practice of just mirroring the
relevant files from the downloads directory!

I'm happy to file some/all of these as bugs if needed but it may be good to get
some discussion on here first.

1) Recipes using 'git${SRCPV}' in PV get that expanded to 'gitAUTOINC' in the
resulting source. Eg I have 'opkg-utils-0.1.8+gitAUTOINC+c33b217016-r0' as a
directory in the archived sources tree. I think it would make more sense for
this to be expanded with the version number given to the generated package,
which is '0.1.8+git0+c33b217016-r0.0'. Ignoring the final '.0' for now, I think
having the version numbers match what is in the package feed would make it a lot
easier for users or scripts to find the relevant sources.

2) Noticing that the final '.0' added to the version by prserv was missing from
the archived source directory name, I made a minor change to the recipe.
Rebuilding the image created a package file with version
'0.1.8+git0+c33b217016-r0.1'. The file
'opkg-utils-0.1.8+gitAUTOINC+c33b217016-r0-recipe.tar.gz' was overwritten to
contain the modified recipe. This could be misleading for a user who has the
original '.0' package and is looking for the source and build scripts used to
create it.

3) I can't find any gcc sources in the archived sources. I'm not building gcc
for the target but obviously a cross-compiler is being built. The comments in
local.conf.sample.extended say:

    # 9) Config the recipe type that will be archived, the type can be target,
    # native, nativesdk, cross, crosssdk and cross-canadian, you can set one or
    # more types. Archive all types by default.
    #COPYLEFT_RECIPE_TYPES = 'target'

So I'm not setting COPYLEFT_RECIPE_TYPES and I'm expecting all types to be
archived. The files I am getting in the archived sources directory are:

    work-shared/gcc-cross-4.8.2-r0-recipe.tar.gz
    work-shared/gcc-cross-initial-4.8.2-r0-recipe.tar.gz
    work-shared/gcc-runtime-4.8.2-r0-recipe.tar.gz
    work-shared/libgcc-4.8.2-r0-recipe.tar.gz

But I'm not actually getting source archives for those.

4) Source archives are duplicated when they are used for both native and target
builds, for example I end up with:

    arm-mmmpi-linux-gnueabi/python-2.7.3-r0.3/Python-2.7.3.tar.bz2
    x86_64-linux/python-native-2.7.3-r0.1/Python-2.7.3.tar.bz2

Each of these files has a different inode number. I'd really love for these two
to be combined, either via symbolic or hard links, I don't mind myself.

I hope this feedback is useful, I'll carry on having a play with the archiver
and see what I get.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

