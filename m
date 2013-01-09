Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TsrBk-0000xe-WB
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 09:39:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r098NtHU006648
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2013 00:23:55 -0800 (PST)
Received: from [128.224.162.131] (128.224.162.131) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 9 Jan 2013 00:23:54 -0800
Message-ID: <50ED2918.1070005@windriver.com>
Date: Wed, 9 Jan 2013 16:23:52 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>, Robert Yang <liezhi.yang@windriver.com>
References: <cover.1357354330.git.hongxu.jia@windriver.com>
	<2f2c14ff5bbe6619fd7ac1649f5f985604bd6941.1357354330.git.hongxu.jia@windriver.com>
	<1357496896.8239.0.camel@localhost>
In-Reply-To: <1357496896.8239.0.camel@localhost>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0-native:add option march to BUILD_CFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 08:39:10 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2013 02:28 AM, Colin Walters wrote:
> On Sun, 2013-01-06 at 16:34 +0800, Hongxu Jia wrote:
>
>> +# Add option -march to BUILD_CFLAGS in order to let the atomic operations
>> +# ("lock free") be available while using old version GCC on x86 host to
>> +# compile glib-2.0-native
>> +BUILD_CFLAGS += "-march=${@'${BUILD_ARCH}'.replace('_','-')}"
> Shouldn't this be handled more generically for all native recipes?
>
>
Hi Colin,

I have a fully test and the qemu-native has the similar problem, and I will
resend the patch.

It's a bad idea to modify bitbake.conf to add option -march to BUILD_CFLAGS,
because it's global and its side effect is unknown, such as beecrypt-native
do_compile will fail if we do that.

So it's best to test most of the native recipes to have a check about 
the similar
problem and fix them separately, and the packagegroup-toolset-native.bb
could work for that.

Regards,
Hongxu


