Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-05.prod.phx3.secureserver.net
	(p3plsmtpa06-05.prod.phx3.secureserver.net [173.201.192.106])
	by mail.openembedded.org (Postfix) with ESMTP id 9340965CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 19:02:41 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-05.prod.phx3.secureserver.net with 
	id dX2f1o00c1mTNtu01X2gGw; Mon, 11 Aug 2014 12:02:41 -0700
Message-ID: <53E9134F.7040108@pabigot.com>
Date: Mon, 11 Aug 2014 14:02:39 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Yocto development with C++11 threads and gcc
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
X-List-Received-Date: Mon, 11 Aug 2014 19:02:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

The program below built on the target with the MACHINE=beaglebone 
gcc-4.9.1 compiler from Yocto/OpenEmbedded poky master produces this error:

beaglebone[52]$ g++ -std=c++1y -pthread test.cc && ./a.out
starting
joining
pure virtual method called
terminate called without an active exception
Aborted (core dumped)

When the program is recompiled with the defines for 
__GCC_HAVE_SYNC_COMPARE_AND_SWAP_X enabled as suggested at 
https://groups.google.com/d/msg/automatak-dnp3/Jisp_zGhd5I/ck_Cj6nO8joJ 
it works:

beaglebone[53]$ g++ -std=c++1y -pthread test.cc && ./a.out
starting
joining
doit
done

Preliminary analysis confirms that the built-ins for those defines are 
not being added by the compiler because it thinks the target doesn't 
support those operations.  Nonetheless, it doesn't use the substitutes 
that are obviously available.

Can anybody recall anything about the way GCC is built under OE that 
would explain this?

Peter

/* g++ -std=c++1y -pthread test.cc && ./a.out */
#if 0
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4
#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8
#endif

#include <iostream>
#include <thread>

void
doit ()
{
   std::cerr << "doit\n";
}

int main (int argc,
           char * argv [])
{
   std::cerr << "starting\n";
   std::thread thr{doit};
   std::cerr << "joining\n";
   thr.join();
   std::cerr << "done\n";
   return 0;
}


