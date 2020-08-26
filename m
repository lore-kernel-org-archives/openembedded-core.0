Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.10939.1598444049733582225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 05:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07QCE57J018606
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 26 Aug 2020 07:14:06 -0500
Subject: Re: [OE-core] [master][PATCH v2 0/6] Allow PR Service and hash equiv togther
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
 <f5e8f15912143ac89e3361f63cb504a290d427c6.camel@linuxfoundation.org>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Message-ID: <c9d88407-a2ee-38f8-17e2-6a79f627ca57@kernel.crashing.org>
Date: Wed, 26 Aug 2020 07:14:05 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f5e8f15912143ac89e3361f63cb504a290d427c6.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/26/20 6:48 AM, Richard Purdie wrote:
> On Wed, 2020-08-26 at 06:27 -0500, Mark Hatle wrote:
>> v2:
>>
>> Most comments have been addressed to create a v2 version.  I've refactored
>> the commits to make a few things more clear, basically moving code around
>> and fixing minor issues BEFORE the big patch.
>>
>> Before there were two patches that together implemented the PR Serv/Hash
>> work.  This has been combined into a single patch and the oe_nohash stuff
>> has simply been removed as no longer applicable.
>>
>> The only comment that was NOT addressed in this was the suggestion to
>> sed the pkgdata files in do_packagedata.  I'm hesitent to do this as
>> sed with ${...} in them has proven to be fragile for me in the past.  If
>> we decide that is necessary, I'd suggest we start with this set and then
>> make that change after this proves to work (or not).
> 
> Sorry to keep on about this but I am worried about code readability and
> trying not to let the code get too unreadable (we have to try).
> 
> Your shell expansion issue is a very valid concern. How about setting
> the variables we expand late to "@XXXX@" and then using that as the
> expression to sed later?

This was actually the first thing I tried, and it was a complete failure.  The
problem is that all of the variables that we play with (not just PKGV/PKGR, as
this impacts the RRECOMMENDS, RDEPENDS, etc..) all need this replacement done.

Then they reference PKGR, which references EXTENDPRAUTO, which is a python
variable which references PRAUTO which is what we actually care about.

So really what we should be doing is putting in 'PRAUTO' (@PRAUTO@) as the
replacement value and then replacing that later -- but we can't just do that
since if it's blank then EXTENDPRAUTO works differently then if it's set.

So we would need to wrap @EXTENDPRAUTO@, which "works".. but then we have to be
able to expand it on the reading of the data as well.  Which means modifications
of every routine that reads the variables from the pkgdata store.  But the
various places where the variables are read in don't have access to the list of
variables to expand -- so we might have to assume @...@ is used, which may work
but I'm still worried about how complicated it gets.

With the current usage, the only place I've seen issues (buildhistory) is where
they read the pkgdata directly and it never ends up in a datastore.  Assuming it
goes into a datastore then it's automatically expanded.  (Other then
buildhistory, I think all of the reader routines are located in
lib/oe/packagedata.py -- so we should be able to scan for this stuff in the
general case.)

(I also don't want to move EXTENDPRAUTO into say do_package, because I believe
the implementation of this is going to need to change in the future to support
the use-case where a standard distribution is produced, a user consumes it --
modifies a package and provides a variant of a few patches and just wants to
extend the EXTENDPRAUTO with additional release information.  I.e. initial
version of EXTENDPRAUTO is .1, where the user's customization makes it .1.1...)

> I'm also wondering if we should just inject the @XXXX@ change (instead
> of the delVar) into d directly at the start of do_package itself, where
> the existing     bb.build.exec_func("package_get_auto_pr", d) call is?
> 
> That would then remove all the confusing localdata changes?

Part of the reason I moved the change to a function as I thought it made it
easier to read and understand the why.

--Mark

> Cheers,
> 
> Richard
> 
