Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UXCh5-0005EM-Mf
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 17:42:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3UFOO0B016035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 08:24:24 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 30 Apr 2013 08:24:23 -0700
Message-ID: <517FE230.4070704@windriver.com>
Date: Tue, 30 Apr 2013 10:24:32 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
	<1366888374.14512.78.camel@phil-desktop.brightsign>
	<CABcZAN=jXZYpA4bt=RjvtK+ihusFe8birGaTC7z8FiRu+np2aQ@mail.gmail.com>
	<1367266208.5379.46.camel@ted>
In-Reply-To: <1367266208.5379.46.camel@ted>
Subject: Re: Debug Packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 15:42:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/13 3:10 PM, Richard Purdie wrote:
> On Sat, 2013-04-27 at 17:15 -0400, Chris Larson wrote:
>
>> On Thu, Apr 25, 2013 at 7:12 AM, Phil Blundell <pb@pbcl.net> wrote:
>
>>          I'm not quite sure what the right way to fix (2) is.  I
>>          suppose in an
>>          ideal world the -dbg packages would be separated in the same
>>          way the
>>          parent binary packages are, but that doesn't look entirely
>>          straightforward to arrange.
>>
>> I had implemented something along these lines back in oe classic, when
>> I was at MontaVista.  See
>> http://git.openembedded.org/openembedded/tree/classes/package_dbg.bbclass for that implementation. I haven't touched it or tried using it in some time, however.
>
> I have to admit I've been wondering if we shouldn't overhaul the -dbg
> part of the system a bit. There are a few things I've been wondering
> about:
>
> a) Should we ditch FILES_${PN}-dbg and have it auto constructed from
> any .debug directories? This would be a rather nice automation/cleanup.
> I can't see a pressing reason not to do this.
>
> b) Consider splitting it to a -dbg package per package where there are
> debug files as per above. There are pros and cons to this and I'm torn,
> see c).
>
> c) Consider splitting the debug source into a separate package. If we
> did do b), the question is where should the sources go?

I think that the proposal for automatically generating a -dbg per regular 
package is a good one.  Then the sources can go into -dbg-source or something 
similar.. (source-dbg so it still ends in dbg).

This will give us the most flexibility to limit the amount of code that HAS to 
be installed onto a target to do basic crash dumping, if not full debug on the 
target.

> In the bigger picture we have various dependency chain issues as the
> -dbg and -dev dependency changes are horrible. The question has always
> been whether X-dbg or X-dev should be usable to pull in sensible
> dependencies.
>
> Thinking about the scenarios you might use these in:
>
> a) A binary from package X segfaults. You want to get good gdb data for
> why. You therefore install X-dbg. X links against Y. You therefore want
> the symbols/code for Y too so you can trace into the problem which may
> be in Y.

This is the one that is sketchy to me.  I think the rrecommend is a good idea 
here.  If you recommend everything that the main package (that you based on) 
needs that you should be able to do this.  By splitting the size of the -dbg 
into smaller units then the -dbg recommends should be limited as well.  I say 
recommend vs depend simply because the there are cases where I only want the 
symbols for one binary, I don't care about it's dependencies.

The question though is should the source also be a recommend or suggest?

> b) You want to compile against X, you install X-dev. You expect anything
> X needs to link with (e.g. through any .pc file) to also be present.
>
> c) You want to rebuild X and hence install X-dev to ensure the build
> dependencies are present.

I think this very much reasonable on the -dev front.  If I install a -dev 
package, I expect the system to be able to compile software without additional 
manual steps.

> d) There was once an idea that you could do something like install
> core-image-minimal-dev to get the equivalent of core-image-minimal with
> dev-pkgs. I think we've found better ways to do this kind of thing now?
>
> In a/b/c, the usability fail is if you try to gdb/compile, find a
> dependency missing, install it and repeat this cycle several times over.

Ya, the issue though is there are more use cases for debug then for the -dev 
case.  So I'm comfortable with slight differences in behavior between the two.

--Mark

> Given d) is dead, thankfully, does that let us rip some code out and
> improve the dependencies?
>
> Cheers,
>
> Richard
>
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



