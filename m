Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 090B4736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 17:13:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2UHDCcO008945
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 10:13:12 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 10:13:11 -0700
Message-ID: <55198427.4030507@windriver.com>
Date: Mon, 30 Mar 2015 12:13:11 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1427532627.14020.217.camel@linuxfoundation.org>	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>	<1427727523.14020.306.camel@linuxfoundation.org>	<CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>	<1427731374.14020.307.camel@linuxfoundation.org>	<CAP9ODKrPtAMqpsWE2t65tiWhLNhZ52bKSJxWG0qN-ae1ZTHNYA@mail.gmail.com>
	<55197BCC.40100@windriver.com>
In-Reply-To: <55197BCC.40100@windriver.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 17:13:12 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/30/15 11:37 AM, Mark Hatle wrote:
> On 3/30/15 11:21 AM, Otavio Salvador wrote:
>> On Mon, Mar 30, 2015 at 1:02 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2015-03-30 at 12:02 -0300, Otavio Salvador wrote:
>>>> +When running do_package_write_deb, we have trees of symlinked files
>>>> +such as the dbg source files in ${PN}-dbg. If something makes another
>>>> +copy of one of those files (or deletes one), the number of links a file
>>>> +has changes and tar can notice this, e.g.:
>>>> +
>>>> +| DEBUG: Executing python function do_package_deb
>>>> +| dpkg-deb: building package `sed-ptest' in
>>>> `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
>>>> +| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
>>>> +| dpkg-deb: error: subprocess tar -cf returned error exit status 1
>>>> +
>>>> +Tar returns an error of 1 when files 'change' and other errors codes
>>>> +in other error cases. We tweak dpkg-deb here so that it ignores an exit
>>>> +code of 1 from tar. The files don't really change (and we have locking in
>>>> +place to avoid that kind of issue).
>>>>
>>>> This is exactly what I would expect for the long commit log. Sorry but
>>>> I strongly disagrese with you as the commit log in the patch does
>>>> connect with the short log so I still believe the commit log could be
>>>> improved.
>>>
>>> Well, I strong disagree with that, I don't believe it makes sense to cut
>>> and paste the same information into both places, sorry.
>>
>> I disagree someone should go into a patch header to understand it.
>>
> 
> I agree with Otavio here.  When generating both short and long changelogs, I
> always use the commit messages.  I don't inspect the contents of the changes to
> understand what happened.  Having to inspect means that I can't automate the
> process using the git commands.

Someone pointed out I might not have been as clear as I intended here.  I was
not saying I thought the commit and patch log need to match.  What I meant was
that I don't like seeing "See the patch header for details." in the commit
message, because it causes me problems with git generated changelogs.  (I have
developers/customers who then come back to me asking why I didn't include the
contents of the patch header in my generated changelogs.)

As for the content, the easiest is likely to duplicate the patch header into the
commit message... but of course that isn't required.

--Mark

> --Mark
> 


