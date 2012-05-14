Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SU3qU-0005t8-Vy
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:34:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4EMOQu0014546
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 May 2012 15:24:26 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 15:24:25 -0700
Message-ID: <4FB18618.60604@windriver.com>
Date: Mon, 14 May 2012 17:24:24 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
	<CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
	<4FB17205.3000207@windriver.com>
	<CAF6bG8dfHW9S4onZTEeWqHFT_sqpbpjJTSYZpOXZA+BsKQOq3Q@mail.gmail.com>
In-Reply-To: <CAF6bG8dfHW9S4onZTEeWqHFT_sqpbpjJTSYZpOXZA+BsKQOq3Q@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: gracefully work with ccache environment variables
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
X-List-Received-Date: Mon, 14 May 2012 22:34:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/14/2012 05:00 PM, Marko Lindqvist wrote:
> As you can see from my answer to last part I quote, I'm not against
> your patch, so don't read first parts of this email with that mindset.
> They are more generic discussion about ccache caches.


No worries.

> 
> On 14 May 2012 23:58, Jason Wessel <jason.wessel@windriver.com> wrote:
>>
>> This is only an issue if the compiler has changed.  In my case it is
>> not changing, or at least it should be the same each time.
> 
>  Several years back ccache detected if compiler is the same by binary
> size and timestamp, so compiler rebuild (with new timestamp) resulted
> contents of the cache getting invalidated. They talked about changing
> it to check md5sum of the compiler binary instead, but I haven't
> followed if that's implemented already.


I am not exactly sure if ccache is invaliding based on the compiler or
not.  It is entirely possible the cache is completely invalid for that
case.  For my local use case this is not an issue because the compiler
is _always_ use the same pre-built version.

A modern ccache does have some extra configuration for doing "wild"
things like relative locations (from ccache docs see CCACHE_BASEDIR)
where you can literally share the cache across multiple build
directories.  I have no idea if this feature actually works though.  I
tend to only use basic features of the ccache and build in the same
set of directories every time.

>>
>> Right now with the external ccache my kernel compiles alone go from >
>> 6 min down to < 30 seconds, so there is a definite desire on my side
>> to have this work.
> 
>  Yes, I just wanted to make sure it works best way possible in every
> possible use-case.
> 
>  Optimal results would come from using external (what I refer here as
> my "normal" cache) cache for anything outside OpenEmbedded scope, and
> for initial cross-compiler builds of OpenEmbedded (as that is done
> with external compiler that will remain the same even when one does
> complete rebuild), and second ("internal") cache for the rest of
> OpenEmbedded build. Contents of latter gets invalid when one does full
> rebuild, so it can be removed before one.
>  I don't know, but assume that it would be a bit hard to select
> correct one from two caches in OpenEmbedded builds (external one for
> some builds, internal for others) so optimal realistic setup is that
> user's normal external cache is not used at all inside OpenEmbedded.
> Now, if user wants to override cache location (and thus create what
> one may consider "external" cache) he should be allowed to do so, but
> thing here is that the cache one uses normally does not get polluted
> accidentally.


It appears that the default way the ccache is setup, it is already
doing the right thing, meaning the defaults for bitbake are fine.

For me, there are two basic cases.

 1) create a "project" directory make a ccache dir in there and then
    set CCACHE_DIR in the local.conf
 2) Use an external shared directory for the ccache with a deeper
    than the default hash and size

Both these configurations greatly speed up the incremental rebuilds
and build from scratch cases.

Jason.


