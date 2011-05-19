Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QN4jY-0006DA-4V
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 17:01:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p4JEwtbo019562
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 07:58:55 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 19 May 2011 07:58:54 -0700
Message-ID: <4DD5302D.5080108@windriver.com>
Date: Thu, 19 May 2011 09:58:53 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1305800693.git.lianhao.lu@intel.com>	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>	<1305804906.3424.480.camel@rex>	<BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>	<1305807748.3424.515.camel@rex>	<BANLkTim6=weFcE9PTyZxOHrdpNZOJuEiug@mail.gmail.com>
	<1305810803.3424.522.camel@rex>
In-Reply-To: <1305810803.3424.522.camel@rex>
Subject: Re: [PATCH 0/5] network based PR service
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 May 2011 15:01:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 5/19/11 8:13 AM, Richard Purdie wrote:
> On Thu, 2011-05-19 at 14:43 +0200, Frans Meulenbroeks wrote:
>> 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>>> On Thu, 2011-05-19 at 14:02 +0200, Frans Meulenbroeks wrote:
>>>> 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>
>>>>> On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
>>> You could use a local PR server. Obviously connecting to one central
>>> server without any network connectivity isn't going to happen so we have
>>> to be realistic about expectations.
>>>
>>> To make a perfect rebuild the local PR server would need a dump of the
>>> database on the central server. There isn't code for that at the moment
>>> and I don't think its the highest priority task out there or the most
>>> important use case but its certainly possible for someone to add.
>>>
>>
>> I'd say it would already be nice if some caching is being done locally (just
>> like is done with e.g. downloads).
> 
> The difference is you need all the data, not just a given value. The
> equivalent in downloads is downloading every possible download version
> in advance just in case so the analogy isn't a good one.  In this case
> it would be possible to do that though as the data is smaller.

I've been thinking about this.  There are really three use-cases that I see.

The first (difficult one) is what is implemented:

Q: I have a group of developers all building software, I want everyone's
packages to get the same version string if the package is the same.

This answers that pretty well, a global server can be enabled for a group of
developers to work with.  Of course the read/write question is "interesting".
One possible solution for the read-only user is to allow for a default version
to be specified.  At a former company, when the users ran their own builds we
simply returned "custom" as the build version string.

Second case, raised by Koen:

Q: I'm building a distribution that I want to share with others, how can they
work with it -- yet make their own changes?

In this case I think it makes sense for the distribution vendor to export their
database of checksums and version values.  Then the end user can use this to
seed their PR server.  (Would be nice if you could look at multiple servers,
starting with an authoritative and working down from there until its found..
assuming R/O means "not found".  If it's not found then writing to a specific
location would make sense to me.)

Third case...

Q: I'm building the software myself and simply want to track versions.

This one to me is likely a common use case.  Pretty similar to the first group
case, but I don't need or want a "network" service.. just a way to manage things
on my local build machines.  So either run it as a local service, or figure out
a way to directly access a database as part of build environment...

[Fourth case]

Q: I don't care about versioning beyond what the recipe contains.

This is the existing case, and certainly needs to continue working....

>>>> For layers, one solution could be to allow variable overriding on the
>>>> overlay level. I can imagine there are more uses for that (and I
>>> understand
>>>> this requires changes to the bitbake machinery).
>>>
>>> There is certainly a use case for something like this. The exact
>>> implementation and workings needs a lot more thought and discussion
>>> though. I believe its at least already possible in anonymous python (and
>>> if not, any extensions needed shouldn't be invasive by comparison).
>>
>> Hm. you consider this PR change to be non-invasive?
> 
> No, this isn't what I said. "allow variable overriding on the
> overlay level" is invasive. Adding functionality to allow this kind of
> thing from anonymous python is by comparison less invasive.
> 
> Its also a tangential issue to the PR part although obviously useful in
> connection with it.
> 
>> BTW I am not saying it is not good, and I understand the problem that you
>> want to solve, but I feel this could require some more thought wrt the
>> issues I raised before in this thread (and some more documentation and usage
>> info).
> 
> At this point, an implementation which we can look at, experiment with
> and document is better than none at all :).
> 
> Ideally some of these issues would have come up at the design stage but
> we'll work through this and I think things area heading the right way.
> Nobody is saying this is 100% complete or solves every problem.
> 
> I don't believe this code needs to solve every problem straight off but
> it does at least need to be extensible to cover them in future by design
> as far as possible.

Ya, I agree.  The problem is fairly well know.. We need a way to track build
changes and share this tracking between builds.  I think this is a reasonable
solution, but we certainly need to find and resolve the various issues that
people will have with it.

I'm certainly in favor of adding this into oe-core, but having it disabled by
default -- for now.  Then those interested can experiment and work on solutions
to the problems they are facing.  (The distribution problem I think will be the
trickiest to resolve.)

--Mark

> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



