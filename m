Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30CDB6D598
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:02:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAEI2JOM024429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 10:02:19 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 10:02:18 -0800
Message-ID: <5285102A.7050709@windriver.com>
Date: Thu, 14 Nov 2013 12:02:18 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1384433183.git.Qi.Chen@windriver.com>		<a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>		<5284CFAD.2060903@mlbassoc.com>	
	<1384436557.17320.62.camel@phil-desktop.brightsign>	
	<5284F119.8010903@windriver.com>
	<1384445052.17320.76.camel@phil-desktop.brightsign>
In-Reply-To: <1384445052.17320.76.camel@phil-desktop.brightsign>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 18:02:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/13, 10:04 AM, Phil Blundell wrote:
> On Thu, 2013-11-14 at 09:49 -0600, Mark Hatle wrote:
>> On 11/14/13, 7:42 AM, Phil Blundell wrote:
>>> On Thu, 2013-11-14 at 06:27 -0700, Gary Thomas wrote:
>>>> Also, is "-" actually valid?  I seem to recall having problems when my build
>>>> tree had the hyphen ("-") in the path.
>>>
>>> Paths with "-" in certainly work for me.  If there are any recipes which
>>> break in that situation then we should just fix them.
>>
>> We found an issue with paths that -start- with a '-', there are apparently many
>> places where paths are passed into various shell, and the initial '-' can be
>> read as an argument identifier.
>
> Right, I can imagine that this would break fairly badly.  But if we're
> going to require TMPDIR to be an absolute path (which seems perfectly
> reasonable) then by definition it can't start with - so this will
> presumably become a non-issue.

Except there are a number of packages that try to parse pieces of strings 
derived from TMPDIR.

Set your TMPDIR path to include "-Dmypath" some time.  SVN will blow up.. :P

>> I don't believe Qi Chen sent it to the list, but we built path names with all of
>> the special characters and tried to run builds.  The specific list is based on
>> the results of those tests.  The other items are already broken, and we're
>> trying to be explicit with this for end users.  (Note, it's really the TMPDIR
>> that matters.. the 'build' directory is a lot more flexible.)
>
> Yeah, I saw the results of those tests.  My slight reservation with that
> methodology is that, if any single recipe fails with a given character
> in TMPDIR, no matter how obscure that recipe might be, it seems that
> this is enough to make that character verboten.  For example, the
> rationale for excluding "+" seems to be that it breaks tcl; if this is
> the only recipe that fails then it seems like it might be worth at least
> trying to fix tcl rather than excluding "+" from TMPDIRs for ever more.

I agree, in the case above, the SVN example I've asked our engineers to look 
into trying to fix that case.  But what they're finding is that once you fix one 
case, then the next breaks.. and the next breaks.

> But, clearly, there are some characters in the list that are "just
> silly" to have in pathnames.  I don't think anybody would be surprised
> to learn that "*" and "$" cause problems and blacklisting those ones
> does seem quite reasonable.

:)

I'd like to see us blacklist the bunch, and then turn around and start opening 
the set backup.  But I don't know how practical this actually is -- unless we 
can get automated test machines running each odd-ball combination on a nightly 
basis.

--Mark

> p.
>
>


