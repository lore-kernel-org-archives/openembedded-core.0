Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id EFD17731D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 11:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id D278E1EE0AD0;
	Wed, 24 Aug 2016 13:05:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id pRpg2c2YW2el; Wed, 24 Aug 2016 13:05:03 +0200 (CEST)
Received: from [10.9.18.210] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id 862011EE0ACE;
	Wed, 24 Aug 2016 13:05:03 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
	<9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <0c795b84-5305-072b-4540-8a3e3049d5b2@smile.fr>
Date: Wed, 24 Aug 2016 13:05:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/8] [autotools] export CCLD_FOR_BUILD
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
X-List-Received-Date: Wed, 24 Aug 2016 11:05:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/08/2016 02:50, Khem Raj wrote:
>> On Aug 23, 2016, at 12:25 AM, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
>>
>> The autotools class already export most *_FOR_BUILD from bitbake's
>> BUILD_* variables. Somehow the variable CCLD_FOR_BUILD was missing
>>
>> At least libpcre uses that variable and will use gcc instead of BUILD_CCLD
>> to link binaries
>>
>> Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
>> ---
>> meta/classes/autotools.bbclass | 2 ++
>> 1 file changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
>> index 076899c..9041021 100644
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -49,6 +49,8 @@ export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
>> export LD_FOR_BUILD = "${BUILD_LD}"
>> export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
>>
>> +export CCLD_FOR_BUILD = "${BUILD_CCLD}”
> if its used by just one recipe then its not worth abstracting it out. Perhaps
> fixing
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-support/libpcre/libpcre/pcre-cross.patch
> is another option ?
I'll have a look, I have been looking around and i'm not even sure if 
CC_FOR_BUILD is an autoconf thing... CCLD seems to be unique to that 
recipe. i'll look at the patch

>> +
>> def append_libtool_sysroot(d):
>>      # Only supply libtool sysroot option for non-native packages
>>      if not bb.data.inherits_class('native', d):
>> --
>> git-series 0.8.9
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


