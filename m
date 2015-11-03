Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6125476104
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 02:04:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA324TLB029003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 2 Nov 2015 18:04:29 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 2 Nov 2015 18:04:29 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1446509230-116578-1-git-send-email-mark.hatle@windriver.com>
	<1446509230-116578-5-git-send-email-mark.hatle@windriver.com>
	<CAMKF1srqHEUBJTxNvsoXyCf5HWPGb4cCxQ1a0cJntLN7_+X2RQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <5638162C.304@windriver.com>
Date: Mon, 2 Nov 2015 20:04:28 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srqHEUBJTxNvsoXyCf5HWPGb4cCxQ1a0cJntLN7_+X2RQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] Revert "local.conf.sample: Disable image-prelink by default"
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
X-List-Received-Date: Tue, 03 Nov 2015 02:04:31 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 11/2/15 6:10 PM, Khem Raj wrote:
> On Mon, Nov 2, 2015 at 4:07 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> This reverts commit 6dd28030f323d7106a02ec54ce4e249561ab0836.
>>
>> Prelink now works properly again.  Re-enable the functionality.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta/conf/local.conf.sample | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
>> index 9d1480e..3ae24ab 100644
>> --- a/meta/conf/local.conf.sample
>> +++ b/meta/conf/local.conf.sample
>> @@ -128,9 +128,7 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>>  #   - 'image-swab' to perform host system intrusion detection
>>  # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
>>  # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
>> -# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
>> -# that you do NOT run the prelinker at this time.
>> -USER_CLASSES ?= "buildstats image-mklibs"
>> +USER_CLASSES ?= "buildstats image-mklibs image-prelink"
> 
> With all the discussions around benefits of it recently, I think its
> better disabled IMO,
> 

I disagree.  I've got rough estimate figures for prelink improvement to the system.

core-image-sato w/ systemd enabled:

MIPS64 - n64 - 1.5MB of ram saved
MIPS64 - n32 - 500KB of ram saved
MIPS32 - n32 - 300KB of ram saved

ARM - 560k of ram saved

PPC - 380k of ram saved

IA32 - forgot to write it down, was around 500k.


Testing also showed sysvinit saves even more memory due to COW pages then
systemd.  (I was a bit surprised by that.)  My testing consisted of building a
filesystem and booting it.  Waiting for everything to 'finish' and then
comparing the output of the 'free' command in KB.


As for startup time savings, I don't have specific figures BUT, for a few key
cases the load time of the executable is up to 50% faster.  For instance busybox
on the qemux86-64.  Keep in mind that busybox is pretty simple and uses only a
few libraries.  The more libraries in use, the more prelink will affect load times.

The busybox binary loading and then exiting (LD_BIND_NOW=1 LD_DEBUG=statistics):

(not prelinked with LD_BIND_NOW defined to simulate worst case, all relocations
needed)

       566:
       566:     runtime linker statistics:
       566:       total startup time in dynamic loader: 182539970 cycles
       566:                 time needed for relocation: 40894259 cycles (22.4%)

       566:                      number of relocations: 443
       566:           number of relocations from cache: 3
       566:             number of relative relocations: 1200
       566:                time needed to load objects: 63004343 cycles (34.5%)

       566:
       566:     runtime linker statistics:
       566:                final number of relocations: 445
       566:     final number of relocations from cache: 3

(prelinked, same LD_BIND_NOW defined)

       524:
       524:     runtime linker statistics:
       524:       total startup time in dynamic loader: 32420607 cycles
       524:                 time needed for relocation: 2812608 cycles (8.6%)
       524:                      number of relocations: 4
       524:           number of relocations from cache: 76
       524:             number of relative relocations: 0
       524:                time needed to load objects: 15549810 cycles (47.9%)

       524:
       524:     runtime linker statistics:
       524:                final number of relocations: 6
       524:     final number of relocations from cache: 76

(both of the above were run with a hot cache, multiple times until the system
stabilized and returned results that were fairly consistent)

So the executable load time dropped to 17% (32420607/182539970) of the original
value due to being prelinked.

