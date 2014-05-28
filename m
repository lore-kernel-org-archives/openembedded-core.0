Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F42B6FBD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 07:28:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S7SRhd006433
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 00:28:27 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 28 May 2014 00:28:27 -0700
Message-ID: <53859017.4020502@windriver.com>
Date: Wed, 28 May 2014 15:28:23 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
	<48d8fbe3035f151a5a98061d507414fbf75f2f23.1401155797.git.hongxu.jia@windriver.com>
	<CAJTo0LY5MeXQFm0_N5uqLGm_f_ZXTZmX9_DtJicjeYhu=4iQ+w@mail.gmail.com>
In-Reply-To: <CAJTo0LY5MeXQFm0_N5uqLGm_f_ZXTZmX9_DtJicjeYhu=4iQ+w@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] socat: upgrade to 1.7.2.4
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
X-List-Received-Date: Wed, 28 May 2014 07:28:28 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/27/2014 07:37 PM, Burton, Ross wrote:
> On 27 May 2014 02:59, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   .../recipes-connectivity/socat/socat/compile.patch | 163 +++++++++++----------
> Oh wow this patch is ... special.
>
> 99% of it is adding the extra arguments to AC_DEFINE so that recent
> autoheader actually works.  This is essential upstream and I'm
> surprised they still don't have it.

I will add the explanation of 'AC_DEFINE' in the patch header.

> Remove all of these and we'll left with these two chunks:
>
>   [AC_TRY_COMPILE([#include <termios.h>],
> -[struct termios t; t.c_ispeed=0;],
> +[struct termios t; t.c_ispeed=ISPEED_OFFSET; t.c_ospeed=OSPEED_OFFSET;],
>
> I can't see a reason why that is obviously wrong but if it's right, it
> needs to be explained in the patch header and pushed upstream.

This 'AC_TRY_COMPILE'  was Okay with 't.c_ispeed=0', so it is no
need to assigned with ISPEED_OFFSET/OSPEED_OFFSET


> -AC_DEFINE_UNQUOTED($1_SHIFT, ${$2})
> +SHIFT_NAME="$1"_SHIFT
> +AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
>
> This introduces a change that is subsequently removed by
> fix-xxx-SHIFT-autoheader.patch, which again is basically fixing the
> AC_DEFINE autoheader use, should be merged with the majority of
> compile.patch, and submitted upstream.

Okay, I will merged these to compile.path.

> Finally there's a do_configure_prepend that does yet more alternations
> to the configure script.  This needs to be a patch instead of a sed.

The 'do_configure_prepend' task was used for 'enable termios',
I will add a new patch to instead of the sed.

>> --- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
>> +++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
>> @@ -8,16 +8,18 @@ SECTION = "console/network"
>>   DEPENDS = "openssl readline"
>>
>>   LICENSE = "GPL-2.0+-with-OpenSSL-exception"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
>> -                    file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    file://README;beginline=257;endline=287;md5=79246f11a1db0b6ccec54d1fb711c01e"
> Please explain why the license checksum changed.

In COPYING, the company address changed:
s/675 Mass Ave, Cambridge, MA 02139/51 Franklin Street, Fifth Floor, 
Boston, MA 02110-1301/

In README, the license has no change, just ajustment the beginline.

It is still GPLV2.

//Hongxu

>
> Ross


