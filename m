Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 97B0C60EB1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 08:16:28 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id c16so1261242ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 00:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zD6mLtba7ito8g9vSWDpz/TSFdgCzlWSSFCbo3miuaI=;
	b=MAxZOTD0w8cked4h2T+1DYivSVFQy6VSWbXQRSX6qss7KmZBo4wQB3vlTMOM1wulEy
	asG3Reu8PTDynELOCcyJ/WMnmwI/rioNxG/uuiqKPYUaFsdkTPDvIxTS2pilsf/pglGT
	hmi4n3OcdT0i7lTK0qJ4JfbmjchtNHYm2tIiSddZlzjeargar+JUg9GGBiQJAtOVoTsX
	+laJDp9cZKWhPWOSlBnX6P25rSXHyy9EmzLJDxmjlXJPiJ0N1BH70Kja0k99RjlzM9zB
	wT+f3EKcu2Iqlg82ZW0Gxrg1IuMLg4Tb8PD4R/80rnchvkz5+OgjlPmkxItGh4ghgp+9
	7vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zD6mLtba7ito8g9vSWDpz/TSFdgCzlWSSFCbo3miuaI=;
	b=brZ8jeBLfC8BociZOCvqW+5H9XDAWUBm6U82R8DUtb/Cf+QuILV2fwkAqonrWQ2wEC
	keREQrQ4eza7sdpxg6gJHeSmpyMW/+kWJNwE5ty9dD/0CwFCZWxt40YHlQyAqKe+5/ND
	02jY4t/hnVyjDQYkoouhIkrZ/0zWQMwgZhZt5ov6GqI1vAkPbZTkpyRFNYtFPX9nDrdL
	1122ktMXXoSSgAP5tI3OIS9SNzdIvv//cnPmtsvYg9VJUIs5XC82iCbYRrHlOhWRtOGf
	4eB7PpT3R0YDhOq510fTmQ7cR5QLTdTzhpyt2QUAMWEZ+iroiFr80qw29yNgQPM3d1FG
	tXLw==
X-Gm-Message-State: APjAAAX7sZR6SDAbN2EamK9Le1XQx2gw+Eraw6pqEre1KFLji7PgMEXi
	pmGXJaCFEOvTNpzgSg7mFfQTC4JtHiIMqVS6j7abB3Tm
X-Google-Smtp-Source: APXvYqya4QmYnI+tNGLWl9H7IDGou0O5UV7Ud37xRHELjyxk0+hk0fdaJuFr0qialL5sDMuRcQpfdVaeCOqrYC6NLSI=
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr2089196ioh.144.1581063389399; 
	Fri, 07 Feb 2020 00:16:29 -0800 (PST)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 7 Feb 2020 08:16:18 +0000
Message-ID: <CAO5Uq5QPxrnkPhjeO3s79AAYF55nPtR3OL0iuL9rqCvN-OmpfA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Cache unihash ... doesn't match BB_UNIHASH ...
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
X-List-Received-Date: Fri, 07 Feb 2020 08:16:28 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

We've got a couple of multiconfig builds with different configurations
in one bitbake run (whether it needs to be like this a different
question - I suspect we had something that worked and stopped there!)

However, for sometime we've been seeing errors like this on master
(the recipes vary):

ERROR: mc:forensic:ca-certificates-20190110-r0
do_deploy_source_date_epoch: Cache unihash
37d2546973a2b7c16fbcb1a8dd4939e4a1bba8c3d6d2dfb6e7204ca08d437ace
doesn't match BB_UNIHASH
09baf78bd9316acdd308980c42ea4ed1eacea61bcc0d840c36293d1a5a22db69

Coupled with deadlock messages:

WARNING: Runqeueue deadlocked on deferred tasks, forcing task
mc:factory:virtual:native:/var/lib/jenkins/workspace/nanohub_master/build/../poky/meta/recipes-support/sqlite/sqlite3_3.31.1.bb:do_populate_sysroot

Any pointers to whereabouts I should be looking for what we've got wrong?

-- 
Alex Kiernan

