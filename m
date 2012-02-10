Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rvr5q-0001lA-Aq
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 15:04:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2012 05:56:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="108669662"
Received: from unknown (HELO helios.localnet) ([10.252.122.199])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2012 05:56:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 13:56:44 +0000
Message-ID: <1440799.NqLiKZanR0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<6dd3f664169b2ffd249da4e86f5f16b8c4316c99.1328809777.git.paul.eggleton@linux.intel.com>
	<CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Fri, 10 Feb 2012 14:04:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 February 2012 13:19:22 Khem Raj wrote:
> since there is a namespace conflict that should be fixed IMO removing
> Wrror is not quite the right thing to do here IMO.

So removing -Werror is somewhat heavy-handed, yes; perhaps we can simply
add -Wno-error=c++0x-compat and mark this patch as inappropriate for
upstreaming instead?

> Its a workaround but probably upstream wont
> accept it. So change nullptr here to something like qt_nullptr in source
> tree

What the code is attempting to do is provide its own "nullptr" if it isn't
being provided as part of the language:

------------------------------
#if __has_feature(cxx_nullptr) || (GCC_VERSION_AT_LEAST(4, 6, 0) && defined(__GXX_EXPERIMENTAL_CXX0X__)) || (defined(_MSC_VER) && _MSC_VER >= 1600 && !COMPILER(INTEL))

#define HAVE_NULLPTR 1

#else

namespace std {
    class nullptr_t { };
}

extern std::nullptr_t nullptr;

#endif
------------------------------

gcc 4.6 is preempting this and complaining about the use of the identifier. I
don't think renaming it is going to be acceptable upstream either.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


