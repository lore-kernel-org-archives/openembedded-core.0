Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6116D78844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 08:55:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S8toPY026346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 Feb 2018 00:55:50 -0800 (PST)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 28 Feb 2018 00:55:24 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
	<c3450d9b913dd74b47d5a6b68518d3d06802d7a8.1519797175.git.Qi.Chen@windriver.com>
	<CAMKF1sosH7NOrugAEOMyRd_p+nFa8Wpjc-cvWK2eSRX6T1bEWQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <0fc088d9-ca1b-5d50-7d0c-dca1fdd1d36c@windriver.com>
Date: Wed, 28 Feb 2018 16:55:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sosH7NOrugAEOMyRd_p+nFa8Wpjc-cvWK2eSRX6T1bEWQ@mail.gmail.com>
X-Originating-IP: [128.224.162.197]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] meson.bbclass: fix to build for more projects
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
X-List-Received-Date: Wed, 28 Feb 2018 08:55:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2018 04:25 PM, Khem Raj wrote:
> On Tue, Feb 27, 2018 at 9:56 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> We should use the value of CC for the c compiler setting in cross
>> compilation configuration file for meson. For example, if we only
>> use ${HOST_PREFIX}gcc instead of ${CC}, we would meet the following
>> do_compile failure for systemd.
>>
>>    cc1: fatal error: linux/capability.h: No such file or directory
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/classes/meson.bbclass | 13 ++++---------
>>   1 file changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
>> index 31d32a5..97dcf81 100644
>> --- a/meta/classes/meson.bbclass
>> +++ b/meta/classes/meson.bbclass
>> @@ -41,24 +41,19 @@ MESON_CROSS_FILE = ""
>>   MESON_CROSS_FILE_class-target = "--cross-file ${WORKDIR}/meson.cross"
>>   MESON_CROSS_FILE_class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
>>
>> -CCOMPILER ?= "gcc"
>> -CXXCOMPILER ?= "g++"
>> -CCOMPILER_toolchain-clang = "clang"
>> -CXXCOMPILER_toolchain-clang = "clang++"
>> -
>>   def meson_array(var, d):
>>       return "', '".join(d.getVar(var).split()).join(("'", "'"))
>>
>>   addtask write_config before do_configure
>> -do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS"
>> +do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS CC CXX LD"
>>   do_write_config() {
>>       # This needs to be Py to split the args into single-element lists
>>       cat >${WORKDIR}/meson.cross <<EOF
>>   [binaries]
>> -c = '${HOST_PREFIX}${CCOMPILER}'
>> -cpp = '${HOST_PREFIX}${CXXCOMPILER}'
>> +c = [${@meson_array('CC', d)}]
>> +cpp = [${@meson_array('CXX', d)}]
>>   ar = '${HOST_PREFIX}ar'
>> -ld = '${HOST_PREFIX}ld'
>> +ld = [${@meson_array('LD', d)}]
>
> we should do same for ar and nm atleast.
>

Hi Khem,

As AR is set to be "${HOST_PREFIX}ar" and NM is set to be 
"${HOST_PREFIX}nm" in bitbake.conf, I chose not to change it.

Given it a second thinking, considering the meta-clang layer, I think 
you are right.

I'll fix it in V2.

Best Regards,
Chen Qi

>>   strip = '${HOST_PREFIX}strip'
>>   readelf = '${HOST_PREFIX}readelf'
>>   pkgconfig = 'pkg-config'
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core



