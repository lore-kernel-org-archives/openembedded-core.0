Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 81E3E601AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:31:22 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id m1so3218494ves.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=qtD0JYny2t2VQiUGDDk6wJiUsZ5YP07ZJ247c3LIuPg=;
	b=hGNtejtUVyB8dqfgdSfNnwsWX3j+ScyqFXZfcnsWSxs4HQXbK5+PBkCkhiFnsZ5hzz
	y74CHnie3NOHgUq0s1UOv7W3S4o1zWxn0cxnore3aPkft8Z+xAvDeZgORH8po7Re08v/
	C2RYDx9Sg0H5TzS2/VDZgmYJL8+aIB4If/mqPU2d9deNptqO/COepgAeUlvW3tsyFcnx
	ZaL/QPmTIVz6lQyvKknUczXSU5MnUg2ITmRQPEw8XN5FYBxL2du+ePYsV5oE3TSbOU0J
	F7bsHM66XAgLptSpcX5aqaksNwC4l6B+1NEyOxURfRH2w3MFeHHN7vaMybBddGxShmuL
	lPLg==
X-Received: by 10.52.29.106 with SMTP id j10mr1568287vdh.77.1371565883361;
	Tue, 18 Jun 2013 07:31:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 07:31:03 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 15:31:03 +0100
Message-ID: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmKqRcAyf5DjGF8u/LX/EBL8mCV0HjLEC5M8QGzTJMXCVXiOo0mCqtPFg/sEJ5pJgQTZHYg
Subject: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 14:31:23 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Looking at another recipe that deletes .la files reminded me that
every six months or so I look at this and never actually get anything
done.  Let's try attempt three!

My proposal is that we integrate .la-removal into a core class.
autotools.bbclass should cover 99% of instances as libtool is normally
used in conjunction with auto*.  Have a variable, REMOVE_LIBTOOL_LA,
which controls the behaviour post-install.

"none".  For this recipe, don't remove any .la files.

"libdir".  For this recipe, remove .la files in $base_libdir and
$libdir non-recursively, keeping the .la files in any subdirectories.
This is for packages that use libltdt to load modules, which I believe
needs .la files to work.

"all".  For this recipe, remove all .la files.

I've not written any code yet, but it shouldn't be hard.  Any thoughts?

Ross

