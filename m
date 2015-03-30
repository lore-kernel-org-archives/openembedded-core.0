Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id D120773C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 15:02:01 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so75286231igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rrSEdFFAfQBy1k+L9EW2hyup4YJtsS4khsF9o1/O5L8=;
	b=jtZ3ONkCzIL+BcoxujUX62pCSqkAFLGVnRir/pNnowrjOp8j3WlVEtv3jR4vpfgsj5
	1kVwxilfJ9aCEcaUUwsf+cyA85lsMuEJAssYTlirlTi6MM2xX/a/zTPs6irCyIGKqTvc
	bj7lZKQAD4lp9ZUg64Y5s0eaLBGv08V+JHhAulJmgHX/fwFYyEhSz3UY84SxqWqQWxAc
	2D0yPugzu1zXBT+yoR98gjTEQNSKecSxcuQ4pyPw4cvfneeVrHHA8Q+LcsUBIGCr/6ew
	7MV+eZ+0HK+T/YTIn8T+i8ES2tHQPlRsvpWk0VKkxwuI8eKVgseyK7gUMQmpNSy1JZO+
	TEjw==
MIME-Version: 1.0
X-Received: by 10.50.66.37 with SMTP id c5mr18236547igt.26.1427727723077; Mon,
	30 Mar 2015 08:02:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Mon, 30 Mar 2015 08:02:03 -0700 (PDT)
In-Reply-To: <1427727523.14020.306.camel@linuxfoundation.org>
References: <1427532627.14020.217.camel@linuxfoundation.org>
	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>
	<1427727523.14020.306.camel@linuxfoundation.org>
Date: Mon, 30 Mar 2015 12:02:03 -0300
X-Google-Sender-Auth: 6QbJIyZWLoBw3k6ziyrf97gIJzw
Message-ID: <CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 15:02:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 30, 2015 at 11:58 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2015-03-30 at 10:52 -0300, Otavio Salvador wrote:
>> On Sat, Mar 28, 2015 at 5:50 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > See the patch header for details. Hardlink count duing do_package_write_deb
>> > can change causing dpkg-deb failures. We don't care about this error
>> > case so avoid it by checking the tar exit code.
>> >
>> > [YOCTO #7529]
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Please don't ask someone to see the patch header for information. This
>> should be in the commit log and not necessarily read the diff to find
>> this information.
>>
>> Please send a v2 adding this information in the commit log.
>
> Just referring someone to the patch header would be incorrect and I
> agree a summary of the problem is needed. The commit message in question
> does have this. I don't see the point of cut and pasting all the details
> from the header into the commit message. The correct place for the
> details in a situation like this is the patch header so that someone has
> full details of the patch without having to look at the repo history.

+When running do_package_write_deb, we have trees of symlinked files
+such as the dbg source files in ${PN}-dbg. If something makes another
+copy of one of those files (or deletes one), the number of links a file
+has changes and tar can notice this, e.g.:
+
+| DEBUG: Executing python function do_package_deb
+| dpkg-deb: building package `sed-ptest' in
`/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
+| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
+| dpkg-deb: error: subprocess tar -cf returned error exit status 1
+
+Tar returns an error of 1 when files 'change' and other errors codes
+in other error cases. We tweak dpkg-deb here so that it ignores an exit
+code of 1 from tar. The files don't really change (and we have locking in
+place to avoid that kind of issue).

This is exactly what I would expect for the long commit log. Sorry but
I strongly disagrese with you as the commit log in the patch does
connect with the short log so I still believe the commit log could be
improved.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

