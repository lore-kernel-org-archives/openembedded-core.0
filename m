Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1STtS0-00084p-JK
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 13:28:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4EBISHm004488
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 May 2012 04:18:28 -0700 (PDT)
Received: from [172.25.32.41] (172.25.32.41) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 04:18:27 -0700
Message-ID: <4FB0EA03.4040406@windriver.com>
Date: Mon, 14 May 2012 06:18:27 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1336962502-7271-1-git-send-email-jason.wessel@windriver.com>
	<CABcZANnvJHzuTb7UTXAXvFzbHjWxAzoJNwvWp_zaeoNK3-z07Q@mail.gmail.com>
In-Reply-To: <CABcZANnvJHzuTb7UTXAXvFzbHjWxAzoJNwvWp_zaeoNK3-z07Q@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 0/2] RFC - CCACHE_DIR to not impact sstate
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
X-List-Received-Date: Mon, 14 May 2012 11:28:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 05/13/2012 09:47 PM, Chris Larson wrote:
> On Sun, May 13, 2012 at 7:28 PM, Jason Wessel
> <jason.wessel@windriver.com> wrote:
>> I am not exactly sure how to fix this, so I thought I might ask in the
>> form of a working patch.  The problem is that I want to use an
>> external CCACHE_DIR on some build servers, but use the defaults on
>> others.  Ultimately the sstate sums should be the same in either case,
>> but they are not due to the way that bitbake tracks the "export"
>> variables for inclusion i the sum dependencies.  My example test is to
>> simply set CCACHE_DIR = "/tmp/ccache" in the local.conf and recompile
>> the quilt-native package.
>>
>> I ended up adding another check to the dependency generator because
>> simply trying to use "unexport" had undesired effects.  If there is a
>> better or correct way of fixing this such that CCACHE_DIR will not
>> impact the sstate sum, I would really like to know how to do this. :-)
> 
> Add it to BB_HASHBASE_WHITELIST next to other variables like TMPDIR,
> FILE, and BBPATH.


Many thanks for the response, this definitely works for the CCACHE_DIR case.

I do have a question however.  With the patch I had created I was also able to add new exported variables to the local.conf like CCACHE_DISABLE on demand  Example:

export CCACHE_DISABLE = "1"
CCACHE_DISABLE[undep] = "1"

I would like to be able to do the same thing with the BB_HASHBASE_WHITELIST, like:

export CCACHE_DISABLE = "1"
BB_HASHBASE_WHITELIST += "CCACHE_DISABLE"

My question is if it would be ok to move the hashbase setup above all the requires *.conf lines such that this possible?

Thanks,
Jason.


