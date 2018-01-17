Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B41F78743
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 20:57:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0HKvSaq007047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 17 Jan 2018 12:57:28 -0800
Received: from [128.224.56.212] (128.224.56.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 12:57:27 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Ross Burton
	<ross.burton@intel.com>
References: <20180116132559.27794-1-ross.burton@intel.com>
	<CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <59b242ee-84fa-72b7-6335-5238c6d8b3cd@windriver.com>
Date: Wed, 17 Jan 2018 15:57:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoHLrvk4=wTan8uU8nSTzy2y=uys1g=PKxM_Xn4+R+29g@mail.gmail.com>
X-Originating-IP: [128.224.56.212]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] cmake: use Ninja backend instead of Make
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
X-List-Received-Date: Wed, 17 Jan 2018 20:57:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2018-01-17 11:18 AM, Otavio Salvador wrote:
> On Tue, Jan 16, 2018 at 11:25 AM, Ross Burton <ross.burton@intel.com> wrote:
>> The Ninja backend is faster than Make for large projects (takes three minutes
>> off webkitgtk:do_compile for me), so use it by default.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> I tried to test this but it did not apply in master. Could you rebase it?
> 

On my 64+64 core system that is shared, it reduced a webkit compile
from ~ 17 minutes to ~12 minutes for just the compile stage. YMMV.

$ cat webkit-before-compile.log
3.29user 0.50system 17:39.98elapsed 0%CPU
   (0avgtext+0avgdata 28532maxresident)k
0inputs+176outputs (0major+16335minor)pagefaults 0swaps


$ cat webkit-after-compile.log
2.70user 0.47system 12:09.24elapsed 0%CPU
    (0avgtext+0avgdata 28292maxresident)k
0inputs+160outputs (0major+14634minor)pagefaults 0swaps

I'm going to try to build world (oe-core + meta-oe + ...).


Octavio, it's a two line change! :)
This applied to master for me:

commit 3914c66f6e7123a64ab73e2b6707452bbfd10d02
Author: Ross Burton <ross.burton@intel.com>
Date:   Wed Jan 17 13:09:40 2018 -0500

     cmake: use Ninja backend instead of Make

     The Ninja backend is faster than Make for large projects
     (it takes three minutes off webkitgtk:do_compile for example)
     so use it by default.

     Acked-by: Randy MacLeod <Randy.MacLeod@windriver.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index a4079dab0d..c46117acde 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -1,7 +1,7 @@
  # Path to the CMake file to process.
  OECMAKE_SOURCEPATH ??= "${S}"

-DEPENDS_prepend = "cmake-native "
+DEPENDS_prepend = "cmake-native ninja-native "
  B = "${WORKDIR}/build"

  # We need to unset CCACHE otherwise cmake gets too confused
@@ -117,7 +117,7 @@ cmake_do_configure() {
  		oecmake_sitefile=
  	fi

-	cmake \
+	cmake -GNinja \
  	  $oecmake_sitefile \
  	  ${OECMAKE_SOURCEPATH} \
  	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

