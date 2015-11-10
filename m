Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05A6B65CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 16:07:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAAG71QT031976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 Nov 2015 08:07:05 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Tue, 10 Nov 2015 08:07:00 -0800
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <cover.1446595453.git.pkj@axis.com>
	<d2e824d17dae9f9583a11ee2165096e7cff533b0.1446595453.git.pkj@axis.com>
	<5639522B.5050604@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7C6F013F187@xmail3.se.axis.com>
	<563D0A1E.9060601@windriver.com>
	<A612847CFE53224C91B23E3A5B48BAC7C6F0358BFF@xmail3.se.axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <56421624.60201@windriver.com>
Date: Tue, 10 Nov 2015 10:07:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7C6F0358BFF@xmail3.se.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group files before parsing
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
X-List-Received-Date: Tue, 10 Nov 2015 16:07:11 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 11/10/15 9:54 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: den 6 november 2015 21:14
>> To: Peter Kjellerstedt
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read passwd/group
>> files before parsing
>>
>> On 11/6/15 2:09 PM, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>>>> Sent: den 4 november 2015 01:33
>>>> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
>>>> Subject: Re: [PATCH 5/5] useradd-staticids.bbclass: Read
>>>> passwd/group files before parsing
>>>>
>>>> On 11/3/15 6:06 PM, Peter Kjellerstedt wrote:
>>>>> Read and merge the passwd/group files before parsing the user and
>>>>> group definitions. This means they will only be read once per
>>>>> recipe. This solves a problem where if a user was definied in
>>>>> multiple files, it could generate group definitions for groups 
>>>>> that should not be created. E.g., if the first passwd file read 
>>>>> defines a user as:
>>>>>
>>>>> foobar::1234::::
>>>>>
>>>>> and the second passwd file defines it as:
>>>>>
>>>>> foobar:::nogroup:The foobar user:/:/bin/sh
>>>>>
>>>>> then a foobar group would be created even if the user will use the
>>>>> nogroup as its primary group.
>>>>
>>>> One minor thing
>>>>
>>>>> @@ -251,7 +269,7 @@ def update_useradd_static_config(d):
>>>>>
>>>>>              newparams.append(newparam)
>>>>>
>>>>> -        return " ;".join(newparams).strip()
>>>>> +        return ";".join(newparams).strip()
>>>>>
>>>>>      # Load and process the users and groups, rewriting the adduser/addgroup params
>>>>>      useradd_packages = d.getVar('USERADD_PACKAGES', True)
>>>>>
>>>>
>>>> The space was required because you could generate a user/group add
>>>> line that ended with a string.  Without the space, you could end up
>>>> merging two sets of arguments causing a failure condition.
>>>>
>>>> So I think that it should be retained unless there is a specific
>>>> reason you believe it should be removed.
>>>
>>> I cannot see how that space can make any difference. Each set of
>>> useradd/grouppadd options added to newparams has the user/group
>>> name at the end of the string. And if that somehow interferes with
>>> the semicolon, then the code in useradd.bbclass which simply does
>>> "cut -d ';'" to split the useradd/groupadd line would break already.
>>
>> The contents when originally parsed my be run as arguments to a shell
>> script or as parameters to these functions.
>>
>> In the shell script world not have a space can confuse the argument
>> parsing into thinking the ; is part of the argument.
> 
> No shell I have heard of (bash, zsh and dash comes to mind) would be 
> affected by the lack of a space before the semicolon. Moreover, this 
> is never actually parsed by a shell (except as part of a variable value). 
> The semicolon is used by useradd.bbclass to split the variables, after 
> which it lets the shell evaluate the part before the semicolon (which 
> will ignore any trailing whitespace).

I've seen broken shells in the past where you would do something like:

/bin/echo foo;/bin/echo bar

and get:  "/bin echo foo;/bin/echo bar" since it treated the middle item as a
single command.  I'm not saying it wasn't a bug in the shell or system -- just
that I've been burned by it in the past and because of this, I try not to rely
on it.. (when adding a space solves the issue.)

>> You don't have that in the python world with the split behavior.
>>
>>> Actually, now that I think about it, I do wonder why
>>> useradd-staticids.bbclass use this advanced variant to split the
>>> useradd/groupadd lines:
>>>
>>>         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
>>
>> It is perfectly legal to allow a ';' in the middle of a parameter (that
>> allows it), a parameter that is quoted.
> 
> Sure, and the code above handles some cases, but definitely not all. 
> E.g., this would not be parsed as intended by useradd-staticids.bbclass:
> 
> USERADD_PARAMS_${PN} += "-c Comment\ with\ an\ \'\ in\ it oddcomment; \
>                          -c Other\ odd \'\ comment otheruser"
> 
> but it would be handled correctly by useradd.bbclass...

In this case, we need to emulate a reasonable set of argument processing.  If
there is something built into bitbake/oe then we can use it.  The re.split
though was a good approximation of the common configurations I was seeing at the
time.  (Specifically quotes parameters for spaces and ;)

>> Something like:
>>
>> adduser -c "This user;that user;all users" -d /home/allusers alluser
>>
>> it's odd, but I've certainly seen people put ';' in the comment
>> before.. and it is legal in other palces, like the home dir and 
>> such -- just not advised.
> 
> It may be legal, but it has never been supported by the adduser.bbclass. 
> And thus it has never worked in practice to take an existing passwd 
> file that contains a semicolon in the comment field and expect it to 
> work as input to adduser-staticids.bbclass.

Then that is a bug we should fix.  At one time this was working (perhaps not in
OE, but locally?)   Since I did have a customer who had both spaces and ';' in
their comment field.  (This is how I originally found the problem and needed to
figure out a regex that worked in more cases.)

> Moreover, neither adduser.bbclass nor adduser-staticids.bbclass will 
> handle a semicolon correctly in any other field. And let's not get 
> started on other special characters like ", \, $ and > which could 
> wreak havoc on both classes in a correctly crafted passwd file.

I realize there are may corner cases here.  We need to try to support the
reasonable ones and prevent the others.  If that list should be avoided in
certain cases -- then we should enhance the system catch things "not to do".
But using ';' in the comment is fairly common in some environments.

>>> when this would do the job just as well:
>>>
>>>         for param in params.split(';'):
>>>
>>> given that that is what useradd.bbclass does. It looks as if tries
>>> to support something like --comment "something with a ; in it", but
>>> using that would break in useradd.bbclass anyway...
>>
>> Then the useradd class is broken in this case.  The --comment
>> processing needs to work, it's just rarely used in the normal 
>> case, but very much used in the "lets take a previously generated 
>> passwd file and reuse it" case of the adduser-static.
>>
>>> //Peter
> 
> So, from reading the code in both adduser.bbclass and 
> adduser-staticids.bbclass, having spaces or no spaces before the 
> semicolon in the USERADD_PARAM_${PN} variable cannot make any 
> difference to how the users are created in the end. Thus it should 
> be safe to remove them.

The (initial) generated adduser/addgroup/etc command is dumped into the pre/post
install script section of the packages.  So when the package manager runs it
needs to execute the shell script.  This is where I've seen the problem of the
';' in the past...

Adduser and adduser-static should be synced to use the same delimitation
mechanism.  And for things like a ; in the comment, both should equally support
it.  We've got a mismatch and that is definitely a bug.

--Mark

> //Peter
> 


