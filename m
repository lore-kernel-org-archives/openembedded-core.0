Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1SU2Vc-0005kH-JQ
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 23:08:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4EKwlZG000148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 May 2012 13:58:47 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 13:58:47 -0700
Message-ID: <4FB17205.3000207@windriver.com>
Date: Mon, 14 May 2012 15:58:45 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
	<CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
In-Reply-To: <CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
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
X-List-Received-Date: Mon, 14 May 2012 21:08:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/14/2012 12:18 PM, Marko Lindqvist wrote:
> On 14 May 2012 19:09, Jason Wessel <jason.wessel@windriver.com> wrote:
>> The end user of oe-core should be free to turn off ccache, or use an
>> external ccache without impacting the sstate sums.
> 
>  ...
> 
>  External cache makes sense for anything being built by system
> compiler. Caching results of anything produced by OE-built compilers
> to user's normal cache is problematic. Rebuild of the compiler itself
> will invalidate any such cached files, but caching them in first place
> may push more valid results out from the cache. 

This is only an issue if the compiler has changed.  In my case it is
not changing, or at least it should be the same each time.  I use one
external ccache for all the embedded target work on a per build server
basis and have done so for years for non-bitbake environments.  I
would like the same functionality from bitbake based builds.

Right now with the external ccache my kernel compiles alone go from >
6 min down to < 30 seconds, so there is a definite desire on my side
to have this work.


> So you are proposing that user has to opt-out from that behavior (by
> unsetting his normal CCACHE_DIR before running bitbake) and no
> longer opt-in (by adding CCACHE_DIR to whitelist)

The defaults remain the defaults, I am not changing anything to that
end.  I only aim to have configurability via the local.conf for
various use cases surrounding ccache.  As I mentioned before I'll just
submit a new patch to add CCACHE_DIR to the hash whitelist so it is
not in the ssatate sum.  All the other problems were a result of pilot
error.

Cheers,
Jason.




