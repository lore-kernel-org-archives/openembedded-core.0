Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 59F6D74197;
	Tue,  1 Sep 2015 00:47:17 +0000 (UTC)
Received: by qkbp67 with SMTP id p67so24286065qkb.3;
	Mon, 31 Aug 2015 17:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=hTtSjXYBQV5bEh2IM2e35DewtGLVvKl8VrgnnIzZOB0=;
	b=nRtiQIuvZp1UHUJHdaEOAIViCASa0Toil3uE9XOvOJ0EZ9cfbDA8l8y3yIO11YBb7P
	k2EVSVe4UkyBWKVuSm6Www6lqHT3keplwUXFom/m57gkx2MT01EP6Xsgp7NA81SRP9sk
	FyedOk+ShWjK9jsQQSKyAaWve02ceVD6o0lzqKEe1fi/Ph3/rijxeLs6g+YTckfLUEnj
	LX3nEEQhUrqhbGe9W6sa5NwUaBqxTvb5HPnyBz9a/9dSTr6yP3ZTN7O37nF38vGGzmDJ
	ppwuTBQH3mBuzJ9GSO9NKeB2w/wt1fHlfOFrIMcHjQg2CYodymBYdvxCJ3MaVbqv4abO
	qMlQ==
MIME-Version: 1.0
X-Received: by 10.13.223.201 with SMTP id i192mr8673000ywe.7.1441068437741;
	Mon, 31 Aug 2015 17:47:17 -0700 (PDT)
Received: by 10.13.192.66 with HTTP; Mon, 31 Aug 2015 17:47:17 -0700 (PDT)
Date: Mon, 31 Aug 2015 17:47:17 -0700
Message-ID: <CAFeBWL5S7zm9mdnwvf_a_q9wYwgUjjO3KrNtXkcmKUhWgttWKw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Subject: Using QT_DIR_NAME; Correct way of flattening QT5 directory structure?
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
X-List-Received-Date: Tue, 01 Sep 2015 00:47:21 -0000
Content-Type: text/plain; charset=UTF-8

My system only runs Qt5. Hence no need to have `qmake` and others in
`/usr/bin/qt5`.
I prefer to have them in `/usr/bin`.

JaMa's comment[1] seems to suggest that all it takes is setting
`QT_DIR_NAME` to an empty string.

With this, I get tonnes of QA errors because `FILES_` paths now
contain `//`, which is the right behavior
as per the manual[2].

For example:

   $ bitbake qttools -e | grep FILES_qttools-mkspecs
   # $FILES_qttools-mkspecs
   FILES_qttools-mkspecs="    /usr/lib//mkspecs "

And the corresponding error being this:

   WARNING: QA Issue: FILES variable for package qttools-mkspecs
   contains '//' which is invalid. Attempting to fix this but you should correct
   the metadata.
   [files-invalid]

The build system [seems to] successfully correct the issue, and I see
the files in the resulting rootfs.
That said, I am either doing something incorrect, or something has to be fixed.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-February/094232.html
[2] http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#qa-issue-files-invalid

