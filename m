Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id E8C0F73C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 16:21:16 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so79977849igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 09:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=NrkdCqUQ6SkhZgRFmZyjDnO2rNPTIsJIFDMXMa5QF64=;
	b=u23kjlGVk03qvW/rn16EeiNDjeHkqDXJi/T3flTmRUsP+dD4ytAqH2BBdzXtExcU0e
	Y3xrS355To7eiGsHPAMKlYewBg6sHiKeobDWhFkWGm1KdrAXYpQbVbHJ3/Q8XBFVQnTJ
	q5k8dayvTkpfoafU2M/glG6nff/xPKpIBrby93uA9qUc73aSjsve0+lrrbxs0a9NCUNq
	VR9ONFHXpGHXAIlGnAQ9lK3qhUzCacx2P9pBY54iFx50y2wwyViZQwLOeMYj3qh5NGae
	+rIIx7Ut83x/MBvcttkul0FMbjTP+SobmYlo4j4+bzNVRv5RXhVpmBTW6wcP+Fks4Hsa
	ftXg==
MIME-Version: 1.0
X-Received: by 10.107.134.219 with SMTP id q88mr48810776ioi.27.1427732477683; 
	Mon, 30 Mar 2015 09:21:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 09:21:17 -0700 (PDT)
In-Reply-To: <1427731374.14020.307.camel@linuxfoundation.org>
References: <1427532627.14020.217.camel@linuxfoundation.org>
	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
	<1427727523.14020.306.camel@linuxfoundation.org>
	<CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>
	<1427731374.14020.307.camel@linuxfoundation.org>
Date: Mon, 30 Mar 2015 13:21:17 -0300
X-Google-Sender-Auth: -dMowYVtNSwo_UqGY0I7mOaFIXQ
Message-ID: <CAP9ODKrPtAMqpsWE2t65tiWhLNhZ52bKSJxWG0qN-ae1ZTHNYA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg-native: Avoid 'file changed' errors from tar
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
X-List-Received-Date: Mon, 30 Mar 2015 16:21:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 1:02 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-03-30 at 12:02 -0300, Otavio Salvador wrote:
>> +When running do_package_write_deb, we have trees of symlinked files
>> +such as the dbg source files in ${PN}-dbg. If something makes another
>> +copy of one of those files (or deletes one), the number of links a file
>> +has changes and tar can notice this, e.g.:
>> +
>> +| DEBUG: Executing python function do_package_deb
>> +| dpkg-deb: building package `sed-ptest' in
>> `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
>> +| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
>> +| dpkg-deb: error: subprocess tar -cf returned error exit status 1
>> +
>> +Tar returns an error of 1 when files 'change' and other errors codes
>> +in other error cases. We tweak dpkg-deb here so that it ignores an exit
>> +code of 1 from tar. The files don't really change (and we have locking in
>> +place to avoid that kind of issue).
>>
>> This is exactly what I would expect for the long commit log. Sorry but
>> I strongly disagrese with you as the commit log in the patch does
>> connect with the short log so I still believe the commit log could be
>> improved.
>
> Well, I strong disagree with that, I don't believe it makes sense to cut
> and paste the same information into both places, sorry.

I disagree someone should go into a patch header to understand it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

