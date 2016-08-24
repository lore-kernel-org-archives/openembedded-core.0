Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 303426E660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 9AFC01EE0ACB;
	Wed, 24 Aug 2016 09:44:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Y1IuSTDZQ93C; Wed, 24 Aug 2016 09:44:09 +0200 (CEST)
Received: from [10.9.18.210] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id 43B601EE0ACC;
	Wed, 24 Aug 2016 09:44:09 +0200 (CEST)
To: Mark Hatle <mark.hatle@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
	<ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <17a87fc8-1cae-2393-ca91-67aa82b2e200@smile.fr>
Date: Wed, 24 Aug 2016 09:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
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
X-List-Received-Date: Wed, 24 Aug 2016 07:44:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/08/2016 19:16, Mark Hatle wrote:
> On 8/23/16 11:54 AM, Burton, Ross wrote:
>> On 23 August 2016 at 08:25, Jérémy Rosen <jeremy.rosen@smile.fr
>> <mailto:jeremy.rosen@smile.fr>> wrote:
>>
>>      -       ( cd ${S}/syck ; set +e ; rm -- -l* ; make distclean ) || :
>>      +       ( cd ${S}/syck ; set +e ; rm -- -l* ; ./configure ; make distclean )
>>      || :
>>
>>
>> Running configure without all the options it needs to actually work just so that
>> distclean works in a subbuild that shouldn't be breaking on rebuilds because we
>> have out of tree builds scares me a little.
>>
>> Mark, you added this line, can you remember what it was for?
> The syck version can be preconfigured, and if it is -- it's wrong.
>
> The 'set +e' is specifically in there to ALLOW it to fail.
>
> If it is configured, we much remove the junk and clean it.. if it's not been
> configured, we ignore the make distclean failure.
>
> So I'm not sure why it is necessary to make the change.  'Failure is permitted',
> and make distclean shouldn't be using any 'BUILD_CC' values from prior builds...
> since it's only wiping everything that MAY have been previously built and leaked
> into the release archive.
I havn't dived deeply on the whole chain of event, I have to admit that 
autotools scares me...

This particular line does work as expected. the set +e does indeed allow 
the make distclean to fail.

The problem is that if that distclean is not failing because nothing 
needs to be done it is failing because it can't find gcc. The junk isn't 
clean and the build of rpm will fail later complaining that the syck 
subdir is
already configured.

This is probably why you run the make distclean in the first place.

The need for gcc is weird... the error message I get is that no working 
version of gcc could be found, but the trace itself looks more like a 
call to configure (as if make distclean did some configuration check)

Again, I have not dug deeply enough in here to completely understand 
what's going on. I'd gladly take any clues you might have for a better fix.

>
> --Mark
>
>> Ross
>


