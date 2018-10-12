Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87F126E616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 07:54:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9C7sp4r016984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 00:54:51 -0700 (PDT)
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 12 Oct 2018 00:54:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20181011095511.5509-1-hongxu.jia@windriver.com>
	<e8b42506cdaf9437f715100f0ff6541d5ed3c894.camel@linuxfoundation.org>
	<8fe4eb7c-a838-e1da-a1a2-7acd201d9977@windriver.com>
Message-ID: <3012dac0-ec3a-bfd8-fb58-27be91642b4d@windriver.com>
Date: Fri, 12 Oct 2018 15:54:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8fe4eb7c-a838-e1da-a1a2-7acd201d9977@windriver.com>
Subject: Re: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Fri, 12 Oct 2018 07:54:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年10月11日 22:58, Hongxu Jia wrote:
> On 2018年10月11日 20:00, richard.purdie@linuxfoundation.org wrote:
>> On Thu, 2018-10-11 at 02:55 -0700, Hongxu Jia wrote:
>>> If host perl is old version (such as perl v5.16.3 on CentOS-7.5),
>>> the openssl-native failed at do_install, the reason is its Makefile
>>> is not correct which is generated at do_configure by perl script.
>>>
>>> Use nativeperl to assure latest perl on host for openssl build.
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>> I think this will have a noticeable effect on built times unfortunately
>> since it means openssl-native would then depend upon perl-native...
Hi RP,

With some digging on upstream, more than perl version,
the building also requires to install perl Text::Template module
which does not exist in core perl, I think we have to add the recipe

[snip]
  Notes on Perl modules we use
  ----------------------------
  We make increasing use of Perl modules, and do our best to limit
  ourselves to core Perl modules to keep the requirements down. There
  are just a few exceptions:
  Test::More         We require the minimum version to be 0.96, which
                     appeared in Perl 5.13.4, because that version was
                     the first to have all the features we're using.
                     This module is required for testing only!  If you
                     don't plan on running the tests, you don't need to
                     bother with this one.

  Text::Template     This module is not part of the core Perl modules.
                     As a matter of fact, the core Perl modules do not
                     include any templating module to date.
                     This module is absolutely needed, configuration
depends on it.
[snip]

https://github.com/openssl/openssl/blob/master/NOTES.PERL
https://github.com/openssl/openssl/commit/4e351ca92e3a1f447cef3d2e330f13941f9412c6

//Hongxu



> Hi RP,
>
> Yes, I do the test to build openssl-native from scratch, it requires 
> extra 4 minutes
>
> 1. Use host perl
> 18 task
> real    1m33.978s
> user    0m0.728s
> sys     0m0.080s
>
> 2. Use nativeperl
> 114 tasks
> real    5m49.911s
> user    0m1.372s
> sys     0m0.140s
>
> But for a image build, the cost is not much
> (To exclude network affect, we assure all tarball/git exist in downloads)
> But build a image from scratch:
>
> time bitbake core-image-minimal
>
> 1. Use host perl
> NOTE: Tasks Summary: Attempted 1655 tasks of which 5 didn't need to be 
> rerun and all succeeded.
>
> real    28m29.625s
> user    0m7.296s
> sys     0m0.988s
>
> 2. Use native perl
> NOTE: Tasks Summary: Attempted 1655 tasks of which 5 didn't need to be 
> rerun and all succeeded.
>
> real    28m42.619s
> user    0m7.496s
> sys     0m0.952s
>
>
> As upstream said, it indeed require specific PERL version
>
> `If you are building OpenSSL 1.1.0 and above, then you will also need 
> PERL 5.10 or high'
>
> https://wiki.openssl.org/index.php/Compilation_and_Installation
>
> And I found at least PERL 5.16.3 not work for OpenSSL 1.1.1
>
> Or add a perl version detecting in insane check? We should report a 
> lowest
> workable perl version number when detect failed. But we may update the 
> version
> number in insane check when openssl is upgraded.
>
> //Hongxu
>
>> Cheers,
>>
>> Richard
>>
>


