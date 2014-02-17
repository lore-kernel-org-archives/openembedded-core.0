Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id A345F6EFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:08:41 +0000 (UTC)
Message-ID: <5301EDB4.4040804@communistcode.co.uk>
Date: Mon, 17 Feb 2014 11:08:36 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5301E81D.3070204@communistcode.co.uk>
	<1392634148.14081.163.camel@ted>
In-Reply-To: <1392634148.14081.163.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK Issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 11:08:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/14 10:49, Richard Purdie wrote:
> On Mon, 2014-02-17 at 10:44 +0000, Jack Mitchell wrote:
>> I recently did a new build of my images and SDKs under master
>> (b188bda18690dc1af) refreshing a 3 month old build. Now everything
>> builds fine, but when trying to build our in house software with the
>> SDK, the new SDK falls over citing issues failing to link with libdl. If
>> I think switch back to using the old SDK, everything builds without
>> issue. Can anybody think of anything which might have altered the SDK in
>> the past few months in order to cause this to break? I have done a quick
>> directory diff of the 2 SDKs and nothing radically different. GCC 4.81
>> -> 4.82 and autotools 1.13  -> 1.14 are probably the big changes. From
>> what I can see the command to build the application is linking with all
>> the correct libraries and as it builds with previous versions I would be
>> surprised if this was wrong. It also seems to be struggling with the
>> -lcrypto libraries, but it hits the libdl issue first so it may just be
>> a domino effect, or there could be a significant issue with the SDK
>> generation.
>>
>> i586-oe-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
>> --sysroot=/scratch/jmitchell/oecore-sdk/1/sysroots/core2-32-oe-linux -I.
>> -I/scratch/jmitchell/code.git/net-snmp/../include -Wall -pipe  -rdynamic
>> -g -Wall -Wextra -Wl,--build-id -O2 -Wall -Wstrict-prototypes
>> -Wwrite-strings -Wcast-qual -Wno-char-subscripts -Dlinux -o .libs/snmpd
>> snmpd.o -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -rdynamic -rdynamic
>>  ./.libs/libucdagent.so ./.libs/libucdmibs.so -lwrap
>> ../snmplib/.libs/libsnmp.so -lcrypto -ldl -lelf -ldl  -Wl,--rpath
>> -Wl,/scratch/jmitchell/code.git/net-snmp/../net-snmp/usr/lib
>> ./.libs/libucdmibs.so: undefined reference to `dlopen'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `EVP_md5'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `EVP_sha1'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `RAND_bytes'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `EVP_DigestInit'
>> ./.libs/libucdmibs.so: undefined reference to `dlclose'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `DES_ncbc_encrypt'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `DES_cbc_encrypt'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `EVP_DigestUpdate'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `HMAC'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `DES_key_sched'
>> ./.libs/libucdmibs.so: undefined reference to `dlerror'
>> ./.libs/libucdmibs.so: undefined reference to `dlsym'
>> ../snmplib/.libs/libsnmp.so: undefined reference to `EVP_DigestFinal'
>>
>> Any light shed would be much appreciated!
> Binutils changed and we did see some occasional link issues with that.
> You could try the command without -Wl,--as-needed. If that helps, you
> have a library ordering issue which the new stricter binutils picked up.
>
> I'm just guessing mind but its worth a try...
>
> Cheers,
>
> Richard
>

Good shout, that seems to allow it to build; I didn't even realise
ordering of linker libs could effect the build. I guess I have some
reading to go do!

Cheers RP.

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 


