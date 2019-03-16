Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BBFA860116
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Mar 2019 10:45:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Lzcz2B2tz5m;
	Sat, 16 Mar 2019 11:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1552733155;
	bh=ox8zNoGCSLUIvYVElHjsa6ERNwAgpvL4PETA0ZulBxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DCJPbBNuF9nhnm/Muy5WgMBNxjNKf02D+5bORYjNeKHbzkM9LU+/c1iC2KO5YG80h
	6tyil3H4mSeNAShe3/hbe/5ADh7ioml8/Iq+F0Inow4SinpjgRje/I5dNuTwOdeJ0r
	gpiwNAEpeum7axbZVVnIPAjUVxw2dBObYcYnE6nadJtmKFuuJ7sEjrDwPki0DFbSZU
	MwvLpzlDD5Ujx58gGCUyDJ7zs3P280URK+TrqQDATBe33Wx8tew37tgdPJuaqajQrs
	uz/Fp2aVrUj1p2R/cMaGK/4exE9NZksUtFGIFE7hIqdpbViNX0oESn47qgd5Q9LxEY
	Z7nHKCyjiQFpomIX9gQCfyqeaIGv2WQTYkQUHoXShHLd8T9x7X8gQ+u3P6XMVUGtf6
	kpN7vFgL8NygveIhUu7adC7TpSes2WmMBp6dH/pvwTl23bphjKq6CVfLAkKP1x27oT
	9PHSKEDjbsEXLocAflWOy/KKKjI/q9TfZp84WeqoEAYiQ1Ua0f0DtM0UBsJ34QrAdU
	cUvtpKhNfDxppPQ0zF6ujf6N2pWR2OdlTtDyg81MeTZvsEFKVvELoCsY8TlTVR1RIN
	l09PgS1R/obrQOduxakGVEskAQsUg4JPbwu7okfK6JHv8lbQp/jkc3eWT4lqAsnB3U
	IkRx0v2yIW8289Qsi32Ro1fQ=
Date: Sat, 16 Mar 2019 12:45:52 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20190316104552.GC19622@localhost>
References: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
	<CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
	<56f123443c35462c81076bffe4f7fb5c@XBOX04.axis.com>
	<CAMKF1spb01NPYDa04X30oiVoY_GyrVKcXYyfUWaNkcduTNdr+A@mail.gmail.com>
	<395432d08f074e08aafc06ed5d2e4610@XBOX04.axis.com>
MIME-Version: 1.0
In-Reply-To: <395432d08f074e08aafc06ed5d2e4610@XBOX04.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Sat, 16 Mar 2019 10:45:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Mar 16, 2019 at 09:21:57AM +0000, Peter Kjellerstedt wrote:
> 
> While I agree that your patch will solve the problem with arm926ejs, I 
> believe there are advantages in applying my patches instead. In addition 
> to fixing the problem with arm926ejs, my patches (patch set 4, not patch 
> set 2 that is currently on master-next) also:
> 
> * make it so that there is no change to TUNE_FEATURES,
> * make it explicit whether -mcpu or -march is used, and
> * make the extra arguments added to -mcpu or -march for armv8 explicit.
> 
> That last point was something that confused me when I read the original 
> tune files. I did not realize that those extra features were added to 
> whatever -mcpu or -march happened to be added to TUNE_CCARGS before the 
> arch-armv8a.inc file was included (especially as it was written to make 
> it look as they were only added to the -march option).

For armv8 a larger redesign is actually required - it doesn't scale
to have variables like TUNE_FEATURES_tune-armv8a-crc-crypto with
160k possible combinations[1] in gcc 8.

> //Peter

cu
Adrian

[1] target architectures 8.0-8.4 and 15 feature modifiers

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


