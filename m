Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D397673169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:13:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7OED8qw023413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2016 07:13:08 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 24 Aug 2016 07:13:07 -0700
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
	<ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
	<17a87fc8-1cae-2393-ca91-67aa82b2e200@smile.fr>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <0d5d7656-0bdb-faac-17ca-f156f3654e81@windriver.com>
Date: Wed, 24 Aug 2016 09:13:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <17a87fc8-1cae-2393-ca91-67aa82b2e200@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] [rpm] force a configure before make distclean
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
X-List-Received-Date: Wed, 24 Aug 2016 14:13:10 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/24/16 2:44 AM, Jérémy Rosen wrote:
> 
> 
> On 23/08/2016 19:16, Mark Hatle wrote:
>> On 8/23/16 11:54 AM, Burton, Ross wrote:
>>> On 23 August 2016 at 08:25, Jérémy Rosen <jeremy.rosen@smile.fr
>>> <mailto:jeremy.rosen@smile.fr>> wrote:
>>>
>>>      -       ( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
>>>      +       ( cd ${S}/syck ; set +e ; rm -- -l* ; ./configure ; make distclean )
>>>      || :
>>>
>>>
>>> Running configure without all the options it needs to actually work just so that
>>> distclean works in a subbuild that shouldn't be breaking on rebuilds because we
>>> have out of tree builds scares me a little.
>>>
>>> Mark, you added this line, can you remember what it was for?
>> The syck version can be preconfigured, and if it is -- it's wrong.
>>
>> The 'set +e' is specifically in there to ALLOW it to fail.
>>
>> If it is configured, we much remove the junk and clean it.. if it's not been
>> configured, we ignore the make distclean failure.
>>
>> So I'm not sure why it is necessary to make the change.  'Failure is permitted',
>> and make distclean shouldn't be using any 'BUILD_CC' values from prior builds...
>> since it's only wiping everything that MAY have been previously built and leaked
>> into the release archive.
> I havn't dived deeply on the whole chain of event, I have to admit that 
> autotools scares me...
> 
> This particular line does work as expected. the set +e does indeed allow 
> the make distclean to fail.
> 
> The problem is that if that distclean is not failing because nothing 
> needs to be done it is failing because it can't find gcc. The junk isn't 
> clean and the build of rpm will fail later complaining that the syck 
> subdir is
> already configured.
> 
> This is probably why you run the make distclean in the first place.
> 
> The need for gcc is weird... the error message I get is that no working 
> version of gcc could be found, but the trace itself looks more like a 
> call to configure (as if make distclean did some configuration check)
> 
> Again, I have not dug deeply enough in here to completely understand 
> what's going on. I'd gladly take any clues you might have for a better fix.

Make often has a rule looking at the time stamp of specific files and re-running
specific autotools if they are 'out of date'.  That COULD be the cause of the
errant call to gcc?

I have not observed the above occurring -- but the key thing is that syck needs
to be cleaned of the generated files.  We don't want to run any host commands
other then clean it.

If you have to replace it with something else, you will need to identify all of
the files that need to be cleaned and manually remove them avoiding the
distclean call.

Easiest way to do that.... extract the source for syck, back it up, run the make
distclean.. compare the difference and use that list as a replacement 'cleanup'
command.

--Mark

>>
>> --Mark
>>
>>> Ross
>>
> 


