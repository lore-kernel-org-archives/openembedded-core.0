Return-Path: <mario.goulart@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id C8DF473C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 21:01:43 +0000 (UTC)
Received: by qgh3 with SMTP id 3so26370616qgh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 14:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=mXHjvmzvrRIhP37aBgcR8/3N/GWQ6PqzBWyrYBHtcaQ=;
	b=vxEFTR4UABaizBq/OntqvgiRIqhDwGpSD92uJdAH7hWzxBAUVY+pU3UZzAV+pqdzdL
	Aoarrj+x43oYMJa37Ow2VPhr+9n5j0tXzEBNFMTRJAQgFwC79Jg8y8L22/Wueim9dMxx
	eiFBR+nWydFmDdS16PHRlm8bKJ8oKIG12GyeS/tCjrOM+V0/uaxymfPv2IAITauVZWvc
	DveHBuLN26sbET67lVBexSq0+EGGNL4lLcu/RfcwzSAsrWfIVLZHQWrxe0TkzmI1GqkA
	XKgTh+4h99NEcP5C8xgaJH0nuCj7Okwl6RxsvQvdmC4edMec3526GdrIAg7MODGTd7io
	cvPg==
X-Received: by 10.140.17.50 with SMTP id 47mr47517749qgc.55.1427835704313;
	Tue, 31 Mar 2015 14:01:44 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94]) by mx.google.com with ESMTPSA id
	f125sm10635098qhe.47.2015.03.31.14.01.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 31 Mar 2015 14:01:43 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Mark Hatle <mark.hatle@windriver.com>
References: <87d23uibxw.fsf@email.parenteses.org>
	<CAJTo0LYQXRL85iAGW82nATWdZXiCfhCFqQKKd0tC8DBBZvkJew@mail.gmail.com>
	<87wq1xgk2j.fsf@email.parenteses.org> <551AE604.6090804@windriver.com>
	<87oan8hpp6.fsf@email.parenteses.org> <551B08E6.8040906@windriver.com>
Date: Tue, 31 Mar 2015 21:01:41 +0000
In-Reply-To: <551B08E6.8040906@windriver.com> (Mark Hatle's message of "Tue,
	31 Mar 2015 15:51:50 -0500")
Message-ID: <87k2xwhoei.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Ownership issue in package contents
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
X-List-Received-Date: Tue, 31 Mar 2015 21:01:43 -0000
Content-Type: text/plain

On Tue, 31 Mar 2015 15:51:50 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:

> On 3/31/15 3:33 PM, Mario Domenech Goulart wrote:
>> 
>> On Tue, 31 Mar 2015 13:23:00 -0500 Mark Hatle <mark.hatle@windriver.com> wrote:
>> 
>>> On 3/31/15 12:20 PM, Mario Domenech Goulart wrote:
>>>>
>>>> On Tue, 31 Mar 2015 14:50:06 +0100 "Burton, Ross" <ross.burton@intel.com> wrote:
>>>>
>>>>> On 27 March 2015 at 17:31, Mario Domenech Goulart <mario@ossystems.com.br> wrote:
>>>>>
>>>>>     Note that, although I run "chown -R foo:foo ${D}${libdir}/foo" in
>>>>>     the recipe, ./usr/lib/foo/ in the package is owned by root.
>>>>>     However, its content has the right ownership.
>>>>>
>>>>> Looks like a bug in pseudo to me, can you file a bug for that?
>>>>
>>>> Sure.  Filed #7554.
>>>
>>> I'd suggest you look at meta/classes/package.bbclass "fixup_perms" function.
>>>
>>> The ${D}${libdir} (and above) are "corrected" to be 'root:root' by this
>>> function.  I don't know why 'foo' would be, but if it's a standard defined
>>> variable -- or if 'directory walking' is enabled it could end up doing this as well.
>>>
>>> The control file for this is in meta/files/fs-perms.txt (unless otherwise
>>> defined by a distribution or other configuration file.)
>> 
>> Thanks a lot.  You seem to have guided me exactly to what causes the
>> issue.
>> 
>>>
>>> Format of the file is:
>>>
>>> # The format of this file
>>> #
>>> #<path> <mode>  <uid>   <gid>   <walk>  <fmode> <fuid>  <fgid>
>> ...
>>>
>>> The default is:
>> ...
>>> libexecdir	0755 root root false - - -
>> ...
>> 
>> This variable seems to be the cause of problems:
>> 
>> $ bitbake -e foo | grep libexecdir=
>> export libexecdir="/usr/lib/foo"
>> 
>> As far as I understand, package.bbclass may use a user-configured
>> permissions table (via FILESYSTEM_PERMS_TABLES), but I'm not sure if
>> this is the right "fix" for the case in question.  I'd have to hardcode
>> the owner of /usr/lib/foo to be "foo", but foo may not be available when
>> packaging other recipes.
>
> Ok, good this answers the question as to "why" it's happening.  You can easily
> fix this by adding a configuration specific fs-perms.txt file (can name it
> anything) that overrides that setting and add it to the FILESYSTEM_PERMS_TABLES.
>  You can do this globally in a layer, a distribution or even just a recipe.
>
> In your recipe you can likely do something like:
>
> FILESYSTEM_PERMS_TABLES ?= "files/fs-perms.txt"
> FILESYSTEM_PERMS_TABLES += "${THISDIR}/files/recipe-perms.txt"
>
> (Do the ?= first in case it's already set by someone else, then add your recipe
> specific perms later)
>
> Contents of the "${THISDIR}/files/recipe-perms.txt":
>
> ${libexecdir} 0755 myuid mygid true - myuid mygid
>
> Then you can even skip the chown -R, as the system will do it for you.

I actually had tried that, but I got errors -- probably because the
ownership will be set for each package that installs ${libexecdir}, and
which is processed before the recipe that actually creates the
user/group specified for ${libexecdir} in the file pointed by
FILESYSTEM_PERMS_TABLES.

>> Should libexecdir actually be in the `target_path_vars' variable
>> (package.bbclass)?
>
> That is a good question, and something likely worthy of investigating.  Perhaps
> removing it from the default set is the correct general purpose change.
>
> I wouldn't do it on an existing release, but its worth considering at the
> beginning of a new release.

Best wishes.
Mario
-- 
http://www.ossystems.com.br

