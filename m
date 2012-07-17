Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAnf-0002Um-Jk
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:39:04 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jul 2012 09:27:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193992884"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jul 2012 09:27:43 -0700
Message-ID: <5005927E.6000509@linux.intel.com>
Date: Tue, 17 Jul 2012 09:27:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342116650.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342116650.git.andrei@gherzan.ro>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
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
X-List-Received-Date: Tue, 17 Jul 2012 16:39:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/12/2012 11:13 AM, Andrei Gherzan wrote:
> Koen suggested to add -T to xz commands. We have this option implemented in our current version .1alpha.
>
> -T threads, --threads=threads
>                Specify the number of worker threads to use.  Setting threads to
>                a special value 0 makes xz use as many threads as there are  CPU
>                cores  on  the system.  The actual number of threads can be less
>                than threads if the input file is not big enough  for  threading
>                with  the  given  settings or if using more threads would exceed
>                the memory usage limit.
>
> -------------------
>
> Memory: 7.8 GiB
> Processor:: Intel® Core™ i5-2540M CPU @ 2.60GHz × 4
>
> File to compress: 1.9G
>
> xz -f -k -e -9 --check=crc32 (current configuration)
> Memory: 673Mb
> real    6m37.170s
> user    6m35.389s
> sys     0m0.884s
> Compressed file size: 3.4Mb
>
> xz -f -k -e -9 -T 4 --check=crc32
> Memory: Cannot allocate memory
>
> xz -f -k -e -8 -T 4 --check=crc32
> Memory: 1.8G
> real    3m24.462s
> user    12m8.502s
> sys     0m2.180s
> Compressed file size: 3.4Mb
>
> xz -f -k -T 4 --check=crc32 (-e defaults to -6)
> Memory: 471Mb
> real    1m9.265s
> user    4m8.972s
> sys     0m0.944s
> Compressed file size: 3.4Mb
>
> So my conclusion would be to use the default -e -6 with -T 0.
>
> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
>
>    upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/xz
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/xz
>
> Andrei Gherzan (3):
>    image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>      data to file
>    image_types.bbclass: Add XZ variable to set number of threads to be
>      used while compressing
>    image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>
>   meta/classes/image_types.bbclass |    5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!




